let universalHeaderController = {
    // this mode will pin the universal header to the top of the window
    // Usage: universalHeaderController.residentMode();
    "residentMode": null,

    // this mode will only keep the search bar to the top of the window
    // Usage: universalHeaderController.notchMode();
    "notchMode": null,

    // header and search bar are allowed to scroll out of the window in this mode
    // Usage: universalHeaderController.slidableMode();
    "slidableMode": null,

    // this mode will replace the search bar with a normal menu
    // which contains chat room, room list, etc
    // Usage:
    //         universalHeaderController.rentalMode();
    //
    // it can also coexist with the other modes mentioned above
    // Usage:
    //         universalHeaderController.rentalMode();
    //         universalHeaderController.slidableMode();
    // or:
    //         universalHeaderController.rentalMode().slidableMode();
    "rentalMode": null,

    "autoUpdateSearchBar": null
};

(() => {
    const VIEW_FILTER_SHOWN_ZINDEX = 32768;
    const VIEW_FILTER_HALF_SHOWN_ZINDEX = 32765;
    const VIEW_FILTER_HIDDEN_ZINDEX = -32768;
    const UNIVERSALHEADER_NORMAL_HEIGHT = 68;
    const UNIVERSALHEADER_EXPANSION_HEIGHT = 256;
    const ACCOUNT_MENU_STYLE_SHOWN_INRERVAL = 8;
    const ACCOUNT_MENU_STYLE_HIDDEN_TOP = -8192;
    const HELLO_WORLD_BTN_SHOWN_BOTTOM = "50%";
    const HELLO_WORLD_BTN_HIDDEN_BOTTOM = -512;
    const FAST_TRANSITION_TIME = 200;
    const SEARCH_BAR_FILTER_LUMINANCE = 238;
    const SEARCH_BAR_FILTER_COLOR =
        SEARCH_BAR_FILTER_LUMINANCE + "," +
        SEARCH_BAR_FILTER_LUMINANCE + "," +
        SEARCH_BAR_FILTER_LUMINANCE;

    const NORMAL_MODE = 0;
    const FULL_HEADER_MODE = 1;

    const NORMAL_SEARCH_BAR_TOP = 14;
    const NORMAL_SEARCH_BAR_WIDTH = 320;
    const NORMAL_SEARCH_BAR_HEIGHT = 40;
    const NORMAL_SEARCH_BAR_FONT_SIZE = 14;
    const NORMAL_SEARCH_BAR_ICON_SIZE = 32;
    const NORMAL_SEARCH_BAR_MARGIN = "3px";
    const NORMAL_SEARCH_BAR_LINE_HEIGHT = "30px";
    const NORMAL_SEARCH_BAR_LOCATION_INPUT_WIDTH = "30%";
    const NORMAL_SEARCH_BAR_MIDDLE_INPUT_WIDTH = "29%";
    const NORMAL_SEARCH_BAR_SEARCH_ICON_BTN_WIDTH = "12%";

    const FULL_SEARCH_BAR_TOP = 88;
    const FULL_SEARCH_BAR_WIDTH = 840;
    const FULL_SEARCH_BAR_HEIGHT = 80;
    const FULL_SEARCH_BAR_FONT_SIZE = 18;
    const FULL_SEARCH_BAR_ICON_SIZE = 64;
    const FULL_SEARCH_BAR_MARGIN = "7px 26px";
    const FULL_SEARCH_BAR_LINE_HEIGHT = "60px";
    const FULL_SEARCH_BAR_LEFT_INPUT_LEFT_PADDING = 12;
    const FULL_SEARCH_BAR_LOCATION_INPUT_WIDTH = "38%";
    const FULL_SEARCH_BAR_MIDDLE_INPUT_WIDTH = "25%";
    const FULL_SEARCH_BAR_SEARCH_ICON_BTN_WIDTH = "12%";

    const DOUBLE_CALENDAR_TOP = 174;

    let mode = NORMAL_MODE;
    let isAccountMenuShown = false;
    let isHelloWorldBtnShown = false;
    let rootUrl = window.location.pathname.match(/^\/[^\/]*\//);

    let isRentalModeMenuShown = false;

    let isSignIn = () => {
        $.ajax({
            url: `${rootUrl}isSignIn.do`,
            type: "GET",
            success: response => {
                if (response == "false" && $("button.sign-out-btn").length)
                    history.go(0);
                else if (response == "true" && !($("button.sign-out-btn").length))
                    history.go(0);
            },
            error: () => console("isSignIn() failed")
        })
    }

    let universalheaderShowViewFilter = () => {
        let filter = $("div.universalheader-filter");
        filter.css("z-index", VIEW_FILTER_SHOWN_ZINDEX);
        filter.css("background-color", "rgba(0, 0, 0, 0.2)");
    }

    let universalheaderHalfShowViewFilter = () => {
        let filter = $("div.universalheader-filter");
        filter.css("z-index", VIEW_FILTER_HALF_SHOWN_ZINDEX);
        filter.css("background-color", "rgba(0, 0, 0, 0.2)");
    }

    let universalheaderHideViewFilter = () => {
        let filter = $("div.universalheader-filter");
        filter.css("z-index", VIEW_FILTER_HIDDEN_ZINDEX);
        filter.css("background-color", "transparent");
    }

    let showSearchBarFilter = () => {
        let filter = $("div.search-bar-filter");
        filter.css("z-index", VIEW_FILTER_SHOWN_ZINDEX)
            .css("background-color", `rgba(${SEARCH_BAR_FILTER_COLOR}, 1)`);
        setTimeout(() => {
            filter.css("z-index", VIEW_FILTER_HIDDEN_ZINDEX);
        }, FAST_TRANSITION_TIME);
        setTimeout(() => {
            filter.css("background-color", `rgba(${SEARCH_BAR_FILTER_COLOR}, 0)`);
        }, FAST_TRANSITION_TIME / 2);
    }

    let switchOnLocationSearchInput = () => {
        $("div.location-search-bar-normal-input").css("display", "none");
        setTimeout(() => {
            $("div.location-search-bar-full-input").css("display", "block");
        }, FAST_TRANSITION_TIME / 2);
        $("div.search-bar-left-input")
            .css("padding-left", FULL_SEARCH_BAR_LEFT_INPUT_LEFT_PADDING);
        $("input.location-search-bar-input")
            .css("padding-left", 8)
            .css("text-align", "left");
        $("button.search-bar-left-btn")
            .css("width", FULL_SEARCH_BAR_LOCATION_INPUT_WIDTH);
    }

    let switchOffLocationSearchInput = () => {
        setTimeout(() => {
            $("div.location-search-bar-normal-input").css("display", "block");
        }, FAST_TRANSITION_TIME / 2);
        $("div.location-search-bar-full-input").css("display", "none");
        $("div.search-bar-left-input").css("padding-left", 0);
        $("input.location-search-bar-input")
            .css("padding-left", 0)
            .css("text-align", "center");
        $("button.search-bar-left-btn")
            .css("width", NORMAL_SEARCH_BAR_LOCATION_INPUT_WIDTH);
    }

    let switchOnTimeSearchInput = () => {
        $("div.time-search-bar-normal-input").css("display", "none");
        setTimeout(() => {
            $("div.time-search-bar-full-input").css("display", "block");
        }, FAST_TRANSITION_TIME / 2);
        $("button.search-bar-middle-btn")
            .css("width", FULL_SEARCH_BAR_MIDDLE_INPUT_WIDTH);
    }

    let switchOffTimeSearchInput = () => {
        $("div.time-search-bar-normal-input").css("display", "block");
        $("div.time-search-bar-full-input").css("display", "none");
        $("button.search-bar-middle-btn")
            .css("width", NORMAL_SEARCH_BAR_MIDDLE_INPUT_WIDTH);
    }

    let switchOnPeopleNumberSearchInput = () => {
        $("div.people-number-search-bar-normal-input").css("display", "none");
        setTimeout(() => {
            $("div.people-number-search-bar-full-input").css("display", "block");
        }, FAST_TRANSITION_TIME / 2);
        $("button.search-bar-middle-btn")
            .css("width", FULL_SEARCH_BAR_MIDDLE_INPUT_WIDTH);
    }

    let switchOffPeopleNumberSearchInput = () => {
        $("div.people-number-search-bar-normal-input").css("display", "block");
        $("div.people-number-search-bar-full-input").css("display", "none");
    }

    let switchOnFullUniversalheader = () => {
        switchOnLocationSearchInput();
        switchOnTimeSearchInput();
        switchOnPeopleNumberSearchInput();
    }

    let switchOffFullUniversalheader = () => {
        switchOffLocationSearchInput();
        switchOffTimeSearchInput();
        switchOffPeopleNumberSearchInput();
    }

    let universalheaderExpansion = target => {
        $("header.universalheader")
            .css("height", UNIVERSALHEADER_EXPANSION_HEIGHT);
        $("div.rent-roon-icon-container")
            .css("color", "transparent");
        $("button.rent-room-shortcut-btn")
            .css("visibility", "hidden");
        showSearchBarFilter();

        $("div.bus.search-bar-container, div.search-bar-filter")
            .css("top", FULL_SEARCH_BAR_TOP)
            .css("margin-left", -FULL_SEARCH_BAR_WIDTH / 2)
            .css("width", FULL_SEARCH_BAR_WIDTH)
            .css("height", FULL_SEARCH_BAR_HEIGHT)
            .css("border-radius", FULL_SEARCH_BAR_WIDTH / 2);
        $("button.bus.search-bar-btn")
            .css("border-radius", FULL_SEARCH_BAR_WIDTH / 2);
        $("div.bus.search-bar-input")
            .css("font-size", FULL_SEARCH_BAR_FONT_SIZE);
        $("div.bus.search-icon")
            .css("margin", FULL_SEARCH_BAR_MARGIN)
            .css("line-height", FULL_SEARCH_BAR_LINE_HEIGHT)
            .css("width", FULL_SEARCH_BAR_ICON_SIZE)
            .css("height", FULL_SEARCH_BAR_ICON_SIZE);

        switchOnFullUniversalheader();

        setTimeout(() => doubleCalendarController.moveCenter(
            DOUBLE_CALENDAR_TOP), FAST_TRANSITION_TIME / 2);
    }

    let universalheaderPackUp = () => {
        $("header.universalheader")
            .css("height", UNIVERSALHEADER_NORMAL_HEIGHT);
        $("div.rent-roon-icon-container")
            .css("color", "#444");
        $("button.rent-room-shortcut-btn")
            .css("visibility", "visible");
        showSearchBarFilter();

        $("div.bus.search-bar-container, div.search-bar-filter")
            .css("top", NORMAL_SEARCH_BAR_TOP)
            .css("margin-left", -NORMAL_SEARCH_BAR_WIDTH / 2)
            .css("width", NORMAL_SEARCH_BAR_WIDTH)
            .css("height", NORMAL_SEARCH_BAR_HEIGHT)
            .css("border-radius", NORMAL_SEARCH_BAR_WIDTH / 2);
        $("button.bus.search-bar-btn")
            .css("border-radius", NORMAL_SEARCH_BAR_WIDTH / 2);
        $("div.bus.search-bar-input")
            .css("font-size", NORMAL_SEARCH_BAR_FONT_SIZE);
        $("div.bus.search-icon")
            .css("margin", NORMAL_SEARCH_BAR_MARGIN)
            .css("line-height", NORMAL_SEARCH_BAR_LINE_HEIGHT)
            .css("width", NORMAL_SEARCH_BAR_ICON_SIZE)
            .css("height", NORMAL_SEARCH_BAR_ICON_SIZE);

        switchOffFullUniversalheader();

        doubleCalendarController.hide();
    }

    let universalheaderShowAccountMenu = () => {
        let windowWidth = $(window).width();
        let btnLeft = $("button.account-menu-btn").offset().left;
        let btnWidth = $("button.account-menu-btn").width();
        let btnTop = $("button.account-menu-btn").offset().top;
        let btnHeight = $("button.account-menu-btn").height();
        let menuRight = windowWidth - btnLeft - btnWidth;
        let scrollTop = $(window).scrollTop();
        let menuTop = btnTop + btnHeight + ACCOUNT_MENU_STYLE_SHOWN_INRERVAL - scrollTop;
        $("div.header-account-menu").css("top", menuTop).css("right", menuRight);
        isAccountMenuShown = true;
    }

    let universalheaderHideAccountMenu = () => {
        $("div.header-account-menu")
            .css("top", ACCOUNT_MENU_STYLE_HIDDEN_TOP);
        isAccountMenuShown = false;
    }

    let universalheaderShowHelloWorldBtn = () => {
        $("div.header-hello-world-btn-container")
            .css("bottom", HELLO_WORLD_BTN_SHOWN_BOTTOM);
        isHelloWorldBtnShown = true;
    }

    let universalheaderHideHelloWorldBtn = () => {
        $("div.header-hello-world-btn-container")
            .css("bottom", HELLO_WORLD_BTN_HIDDEN_BOTTOM);
        isHelloWorldBtnShown = false;
    }

    let setMode = (newMode, target = null) => {
        switch (newMode) {
            case NORMAL_MODE:
                universalheaderHideViewFilter();
                universalheaderHideAccountMenu();
                universalheaderHideHelloWorldBtn();
                universalheaderPackUp();
                break;
            case FULL_HEADER_MODE:
                if (mode == FULL_HEADER_MODE)
                    break;
                universalheaderHalfShowViewFilter();
                universalheaderHideAccountMenu();
                universalheaderHideHelloWorldBtn();
                universalheaderExpansion(target);
                break;
        }

        mode = newMode;
    }

    let showRentalModeMenu = () => {
        let btn = $("button.open-rental-header-menu-btn");
        let btnBottom = btn.offset().top + parseInt(btn.css("height"));
        let btnLeft = btn.offset().left;
        $("div.rental-mode-header-menu")
            .css("top", btnBottom + 10 - $(window).scrollTop())
            .css("left", btnLeft);

        isRentalModeMenuShown = true;
    }

    let hideRentalModeMenu = () => {
        $("div.rental-mode-header-menu")
            .css("top", ACCOUNT_MENU_STYLE_HIDDEN_TOP);
        isRentalModeMenuShown = false;
    }

    $(window).resize(() => {
        if (isAccountMenuShown)
            universalheaderShowAccountMenu();
        if (isRentalModeMenuShown)
            showRentalModeMenu();
    });

    (() => {
        let exitAccountMenuSelectorKey =
            "button.account-menu-btn,button.account-menu-btn *," +
            "div.header-account-menu,div.header-account-menu *";

        let exitHelloWorldSelectorKey =
            "div.header-hello-world-btn-container," +
            "div.header-hello-world-btn-container *," +
            "button.regional-setting-btn,button.regional-setting-btn *";

        let exitFullHeaderModeSelectorKey =
            "header.universalheader,header.universalheader *";

        $("body").click(e => {
            let target = $(e.target);

            switch (mode) {
                case NORMAL_MODE:
                    if (isAccountMenuShown) {
                        if (!target.is(exitAccountMenuSelectorKey))
                            universalheaderHideAccountMenu();
                    }

                    if (isHelloWorldBtnShown) {
                        if (!target.is(exitHelloWorldSelectorKey)) {
                            universalheaderHideHelloWorldBtn();
                            setTimeout(universalheaderHideViewFilter,
                                FAST_TRANSITION_TIME / 2)
                        }
                    }

                    break;
                case FULL_HEADER_MODE:
                    if (!target.is(exitFullHeaderModeSelectorKey) &&
                            !target.is("button.selected")) {
                        if (!isHelloWorldBtnShown)
                            setMode(NORMAL_MODE);
                    }

                    if (isAccountMenuShown) {
                        if (!target.is(exitAccountMenuSelectorKey))
                            universalheaderHideAccountMenu();
                    }

                    if (isHelloWorldBtnShown) {
                        if (!target.is(exitHelloWorldSelectorKey)) {
                            universalheaderHideHelloWorldBtn();
                            setTimeout(universalheaderHalfShowViewFilter,
                                FAST_TRANSITION_TIME / 2);
                        }
                    }

                    break;

                default:
            }
        });
    })();

    doubleCalendarController.addClickFunction(e => {
        let startDate = doubleCalendarController.startDate;
        let endDate = doubleCalendarController.endDate;

        $("span.start-date-span").text(startDate ?
            `${
                startDate.getFullYear()
            }-${
                startDate.getMonth() + 1
            }-${startDate.getDate()}` : "----/--/--");
        $("span.end-date-span").text(endDate ?
            `${
                endDate.getFullYear()
            }-${
                endDate.getMonth() + 1
            }-${endDate.getDate()}` : "----/--/--");
    });

    let initialController = () => {
        let that = universalHeaderController;

        that.residentMode = () => {
            $("header.universalheader").css("position", "fixed");
            $("div.search-bar-container").css("position", "fixed");
            return that;
        }

        that.notchMode = () => {
            $("header.universalheader").css("position", "relative");
            $("div.search-bar-container").css("position", "fixed");
            return that;
        }

        that.slidableMode = () => {
            $("header.universalheader").css("position", "relative");
            $("div.search-bar-container").css("position", "absolute");
            $("div.rental-mode-main-menu-container").css("position", "absolute");
            return that;
        }

        that.rentalMode = () => {
            $("div.bus-search-bar-container.bus.search-bar-container")
                .css("display", "none");
            $("div.rental-mode-main-menu-container")
                .css("display", "block");
            $("button.my-management-btn")
                .css("display", "none");
            $("button.goto-guest-mode-page-btn")
                .css("display", "block");
            return that;
        }

        that.autoUpdateSearchBar = false;
    }

    $("button.account-menu-btn").click(() => {
        isAccountMenuShown?
            universalheaderHideAccountMenu():
            universalheaderShowAccountMenu();
    });

    $("button.regional-setting-btn").click(() => {
        universalheaderShowViewFilter();
        universalheaderShowHelloWorldBtn();
    });

    $("div.search-bar-container").on("click", "button", e => {
        setMode(FULL_HEADER_MODE, e.target);
    });

    $("button.execute-search-btn").click(() => {
        if (mode != FULL_HEADER_MODE) return;

        let url = `/${window.location.pathname.split("/")[1]}`;
        let city = $("select#city-select").val();
        let address = $("input#header-address-input").val();
        let checkInDate = $("span.start-date-span").text();
        let checkOutDate = $("span.end-date-span").text();
        let adultNumber = $("input#adult-number-input").val();
        let childNumber = $("input#child-number-input").val();

        url += `?city=${city}`;
        if (address && address.length)
            url += `&address=${address}`;
        if (checkInDate != "----/--/--")
            url += `&check-in-date=${checkInDate}`;
        if (checkOutDate != "----/--/--")
            url += `&check-out-date=${checkOutDate}`;
        url += `&adult-number=${adultNumber}`;
        url += `&child-number=${childNumber}`;

        document.location = url;
    });

    $("button.sign-up-btn.header-accont-menu-option-btn").click(() => {
        // alert("前往註冊頁面");
        document.location = rootUrl + "signup";
    });

    $("button.sign-in-btn.header-accont-menu-option-btn").click(() => {
        // alert("前往登入頁面");
        document.location = rootUrl + "login";
    });

    $("button.sign-out-btn.header-accont-menu-option-btn").click(() => {
        // alert("前往登出頁面");
        document.location = rootUrl + "logout";
    });

    $("button.rent-room-btn.header-accont-menu-option-btn").click(() => {
        // alert("前往出租房源頁面");
        document.location = rootUrl + "room/addRoom";
    });

    $("button.organize-activity-btn.header-accont-menu-option-btn")
        .click(() => {
            alert("前往舉辦活動頁面")
        });

    $("button.give-me-help.header-accont-menu-option-btn").click(() => {
        // alert("前往尋求幫助頁面");
        alert("如需幫助，請撥打 3345678");
    });

    $("button.schedule-my-trip-plan-btn.header-accont-menu-option-btn").click(() => {
        // alert("前往行程規劃頁面");
        document.location = rootUrl + "autotarget";
    });

    $("button.go-backstage-btn.header-accont-menu-option-btn").click(() => {
        // alert("前往後臺管理頁面");
        document.location = rootUrl + "listAccount";
    });

    $("button.header-hello-world-btn").click(() => {
        // alert("前往 hello world 頁面");
        document.location = rootUrl + "autoschedule";
    });

    $("div.header-account-menu-photo-container>img.account-photo-img").click(() => {
        // alert("前往個人資料修改頁面");
        document.location = rootUrl + "setProfile";
    });

    $("span.modify-my-account-info-btn").click(() => {
        // alert("前往個人資料修改頁面");
        document.location = rootUrl + "setProfile";
    });

    $("button.header-go-my-target-btn").click(() => {
        // alert("前往 hello world（已知目標）頁面");
        $.ajax({
            url: `${rootUrl}isSignIn.do`,
            type: "GET",
            success: response => {
                if (response == "false") {
                    alert("自動規劃功能需登入後才可使用");
                    document.location = rootUrl + "login";
                } else if (response == "true")
                    document.location = rootUrl + "autotarget";
            },
            error: () => console("isSignIn() failed")
        })

    });

    $("button.rent-room-shortcut-btn").click(() => {
        // alert("前往出租房源頁面");
        // document.location = rootUrl + "room/addRoom";
        document.location = rootUrl + "hosting/allOrders";
    });

    $("button.sign-in-shortcut-btn").click(() => {
        // alert("前往出租房源頁面");
        document.location = rootUrl + "login";
    });

    $("button.my-trip-btn").click(() => {
        // alert("前往旅程頁面");
        document.location = rootUrl + "member/allOrders";
    });

    $("button.my-management-btn").click(() => {
        // alert("前往管理房源頁面");
        // document.location = rootUrl + "hosting/allOrders";
        document.location = rootUrl + "room/userRooms";
    });

    $("button.my-chat-rooms-btn").click(() => {
        // alert("出租模式：前往我的<收件匣>頁面");
        document.location = rootUrl + "chatroom/toChatRoom";
    });

    $("button.rental-mode-order-btn").click(() => {
        alert("出租模式：前往<預定>頁面");
    });

    $("button.rental-mode-room-src-btn").click(() => {
        // alert("出租模式：前往<房源>頁面");
        document.location = rootUrl + "room/userRooms";
    });

    $("button.rental-mode-transitional-btn").click(() => {
        // alert("出租模式：前往<訂單管理>頁面");
        document.location = rootUrl + "hosting/allOrders";
    });

    $("button.rental-mode-view-rent-src-btn").click(() => {
        alert("出租模式：前往<瀏覽出租資源>頁面");
    });

    $("button.goto-guest-mode-page-btn").click(() => {
        document.location = rootUrl;
    });

    $("button.open-rental-header-menu-btn").click(() => {
        isRentalModeMenuShown ? hideRentalModeMenu() : showRentalModeMenu();
    });

    (() => {
        let closeMenuBlock = "div.rental-mode-header-menu, " +
            "div.rental-mode-header-menu *";
        let bthBlock = "button.open-rental-header-menu-btn, " +
            "button.open-rental-header-menu-btn *";
        $("body").click(e => {
            if (!$(e.target).is(closeMenuBlock) &&
                !$(e.target).is(bthBlock)) {
                hideRentalModeMenu();
            }
        });
    })();

    initialController();

    isSignIn();

    //________________________________
    // Test block

})();

(() => {
    const XHR_READY_STATE_COMPLETE = 4;
    const XHR_STATUS_COMPLETE = 200;
    const CONTROLLER = universalHeaderController;

    let citiesTable = [];

    let setSearchBarLocation = () => {
        let re = /city=\d+/;
        let result = window.location.search.match(re);
        if (!result) return;
        let currCityId = result[0].substring(5);
        let cityTitle = null;

        for (let entry of citiesTable) {
            if (entry[0] != currCityId) continue;
            $("div.location-search-bar-normal-input").text(entry[1]);
            cityTitle = entry[0];
            break;
        }

        if (!cityTitle) return;
        $("select#city-select").val(cityTitle);
    }

    let setSearchBarAddress = () => {
        let re = /address=[^\&]*\&/;
        let result = window.location.search.match(re);
        if (!result) return;
        let address = decodeURI(result[0].substring(8, result[0].length - 1));
        $("input#header-address-input").val(address);
    }

    let setSearchBarTravelDate = () => {
        let args = window.location.search;
        let checkInRe = /check-in-date=\d+-\d+-\d+/;
        let checkInResult = args.match(checkInRe);
        if (!checkInResult) return;
        let checkInDate = new Date(checkInResult[0].substring(14));

        let checkOutRe = /check-out-date=\d+-\d+-\d+/;
        let checkOutResult = args.match(checkOutRe);
        let checkOutDate = checkOutResult ?
            new Date(checkOutResult[0].substring(15)):
            new Date(checkInDate.getFullYear(),
                checkInDate.getMonth(),
                checkInDate.getDate() + 1);

        let checkInDateStr = `${
            checkInDate.getFullYear()}/${
            checkInDate.getMonth() + 1}/${
            checkInDate.getDate()}`;

        let checkOutDateStr = `${
            checkOutDate.getFullYear()}/${
            checkOutDate.getMonth() + 1}/${
            checkOutDate.getDate()}`;

        let str = `${checkInDateStr}\n-${checkOutDateStr}`;

        $("div.time-search-bar-normal-input")
            .text(str)
            .css("font-size", 10)
            .css("line-height", "16px");

        doubleCalendarController.startDate = checkInDate;
        doubleCalendarController.endDate = checkOutDate;
        $("span.start-date-span").text(checkInDateStr.replaceAll("/", "-"));
        $("span.end-date-span").text(checkOutDateStr.replaceAll("/", "-"));
        doubleCalendarController.update();
    }

    let setSearchBarPeopleNumber = () => {
        let args = window.location.search;
        let adultNumberRe = /adult-number=\d+/;
        let adultResult = args.match(adultNumberRe);
        let adultNumber = adultResult ?
            parseInt(adultResult[0].substring(13)): 1;

        let childNumberRe = /child-number=\d+/;
        let childReult = args.match(childNumberRe);
        let childNumber = childReult ?
            parseInt(childReult[0].substring(13)): 0;

        let peopleNumber = adultNumber + childNumber;

        peopleNumber == 1 ?
            $("div.people-number-search-bar-normal-input")
                .text(`單人旅行`):
            $("div.people-number-search-bar-normal-input")
                .text(`${peopleNumber} 人旅行`);

        $("input#adult-number-input").val(adultNumber);
        $("input#child-number-input").val(childNumber);
    }

    let setSearchBarContent = () => {
        setSearchBarLocation();
        setSearchBarAddress();
        setSearchBarTravelDate();
        setSearchBarPeopleNumber();
    }

    let loadCities = () => {
        let xhr = new XMLHttpRequest();
        if (!xhr) return;

        xhr.onreadystatechange = () => {
            if (xhr.readyState != XHR_READY_STATE_COMPLETE ||
                    xhr.status != XHR_STATUS_COMPLETE) return;

            let cities = JSON.parse(xhr.responseText)
                .sort((a, b) => a.id - b.id);

            let html = `<option value="0">任何地點</option>`;
            for (let city of cities) {
                if (city.title == "others") continue;
                html += `<option value="${city.id}">${city.title}</option>`;
                citiesTable.push([`${city.id}`, `${city.title}`]);
            }

            $("select#city-select").html(html);

            if (CONTROLLER.autoUpdateSearchBar) setSearchBarContent();
        }

        let re = /\/[^\/]*\//;
        let url = window.location.pathname.match(re) + "cities";
        xhr.open("GET", url, true);
        xhr.send();
    }

    loadCities();

})();