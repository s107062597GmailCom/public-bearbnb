(() => {
    const ROOM_NUMBER_PER_PAGE = 24;
    const ERR_MSG_NO_XHR_SRV = "Your browser has no XML http service";
    const ERR_MSG_NO_GEO_SRV = "You have no geolocation service";
    const DISTANCE_PRECISION_DIGIT = 2;
    const DISTANCE_UNIT = "km"
    const INITAIL_LOADING_DELAY = 200;
    const IMAGE_MOVING_TIME = 400;
    const MAX_LOADING_TIME = 4000;

    let showErrMsg = msg => alert(msg);
    let showNoXhrErrMsg = () => showErrMsg(ERR_MSG_NO_XHR_SRV);
    let showNoGeoErrMsg = () => showErrMsg(ERR_MSG_NO_GEO_SRV);

    let rootUrl = window.location.pathname.match(/^\/[^\/]*\//);
    let isSignIn = false;
    let isLoading = false;
    let totalPages = 128;
    let currentPage = 0;
    let latitude = 25.0337297;
    let longitude = 121.5433738;
    let isImgMoving = false;
    let distanceMagnification =
        Math.pow(10, DISTANCE_PRECISION_DIGIT);
    
    let unmatchedKeys = [];

    (() => {
        $.ajax({
            url: `${rootUrl}isSignIn.do`,
            type: "GET",
            success: response => {
                isSignIn = response == "true" ? true : false;
            },
            error: () => console("isSignIn() failed")
        })
    })();

    let distance = (lat1, lon1,
            lat2 = latitude, lon2 = longitude, unit = DISTANCE_UNIT) => {
        if ((lat1 == lat2) && (lon1 == lon2))
            return 0;

        let radlat1 = Math.PI * lat1 / 180;
        let radlat2 = Math.PI * lat2 / 180;
        let theta = lon1 - lon2;
        let radtheta = Math.PI * theta / 180;
        let dist = Math.sin(radlat1) * Math.sin(radlat2) +
            Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        dist = dist > 1 ? 1 : dist;
        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515;
        return unit == "km" ? dist * 1.609344 : dist;
    }

    let addLoadingRoomImage = () => {
        if (isLoading) return;
        isLoading = true;

        let url = `/${window.location.pathname.split("/")[1]}`;
        html = "";

        for (let i = 0; i != ROOM_NUMBER_PER_PAGE; i += 1) {
            html +=
                `<button class="room-container room-loading" style="box-shadow=0 0 0" disabled>
                    <img class="loading-img" src="${url}/images/loading.gif"/>
                </button>`;
        }

        $("i.room-container").first().before(html);
    }

    let removeAllLoadingRoomImage = () => {
        $("button.room-container.room-loading").remove();
        setTimeout(() =>
            isLoading = false, INITAIL_LOADING_DELAY);
    }

    let updateWish = idx => {
        let target = $("button.room-container").eq(idx);
        $.ajax({
            type: "GET",
            url: `wish/check.do?uuid=${target.attr("data-r")}`,
            success: response => {
                target.find("div.favourite-btn").html(
                    response == "true" ?
                        `<i class="fa-solid fa-heart"></i>` :
                        `<i class="fa-regular fa-heart">`
                );
            },
            error: err => {
                console.log(err);
            }
        });
    }

    let updateAllWishes = () => {
        let len = $("button.room-container").length;
        for (let i = 0; i != len; i += 1)
            updateWish(i);
    }

    let addRooms = () => {
        let xhr = new XMLHttpRequest();

        if (!xhr) {
            showNoXhrErrMsg();
            return;
        }

        // if (!(latitude && longitude)) {
        //     return;
        // }

        xhr.onreadystatechange = () => {
            if (xhr.readyState != 4 || xhr.status != 200)
                return;

            removeAllLoadingRoomImage();

            let json = JSON.parse(xhr.responseText);
            let html = "";
            let firstDummy = $("i.room-container").first();

            totalPages = json.totalPages;

            if (!json.summaries.length && !totalPages) {
                html = window.location.search ?
                    `<h2 class="room-not-found-hint">找不到符合搜尋條件的房間</h2>`:
                    `<h2 class="room-not-found-hint">尚無開放住宿的房間</h2>`;
                firstDummy.before(html);
            }

            for (let room of json.summaries) {
                let dis = Math.round(distance(room.latitude, room.longitude) *
                    distanceMagnification) / distanceMagnification;
                if (!(latitude && longitude))
                    dis = "距離未知，無法取得目前位址";
                else if (dis < 0.01)
                    dis = "距離 不超過 0.01 公里";
                else
                    dis = `距離 ${dis} 公里`
                html =
                    `<button class="room-container" data-r="${room.uuid}" data-a="${room.address}" data-o="${room.ownerFirstName}" data-t="${room.title}">
                        <div class="room-inner-container">
                            <div class="litter-helper">
                                <div class="litter-helper-inner-container">
                                    <div class="favourite-btn little-btn">
                                        <!--<i class="fa-regular fa-heart"></i>-->
                                        <!--<i class="fa-solid fa-heart"></i>-->
                                    </div>
                                    <div class="show-detail-btn little-btn">
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="room-image-windows">
                                <div class="room-prev-img-btn room-img-btn">
                                    <i class="fa-sharp fa-solid fa-angle-left"></i>
                                </div>
                                <div class="room-next-img-btn room-img-btn">
                                    <i class="fa-sharp fa-solid fa-angle-right"></i>
                                </div>
                                <div class="room-images-container">
                                    <div class="room-image-container">
                                        <img class="room-image" src="photo/room/${room.cover}">
                                    </div>`;

                for (let img of room.images) {
                    html += `
                    <div class="room-image-container">
                        <img class="room-image" src="photo/room/${img}">
                    </div>`;
                }

                html += `</div>
                            </div>
                            <div class="room-text-container">
                                <div class="room-city-text-container room-index-text-container">
                                    ${room.city}
                                </div>
                                <div class="room-distance-text-container room-index-text-container">
                                    ${dis}
                                </div>
                                <div class="room-rent-date-text-container room-index-text-container">
                                    ${room.startDate} - ${room.endDate}
                                </div>
                                <div class="room-price-text-container room-index-text-container">
                                    ${room.price} TWD / 晚
                                </div>
                            </div>
                        </div>
                    </button>`;
                firstDummy.before(html);

                unmatchedKeys.push(room.unmatched);
            }

            for (let room of json.summaries) {
                let cnt = room.images.length;
                if (room.cover) cnt += 1;

                $(`button.room-container[data-r=${room.uuid}]`)
                    .find("div.room-images-container")
                    .css("width", `${cnt * 100}%`)
                    .children("div.room-image-container")
                    .css("width", `${100 / cnt}%`);
            }

            updateAllWishes();

        }

        let search = window.location.search
        xhr.open("GET", search ?
            `summaries${search}&n=${ROOM_NUMBER_PER_PAGE}&p=${currentPage += 1}` :
            `summaries?n=${ROOM_NUMBER_PER_PAGE}&p=${currentPage += 1}`);

        xhr.send();
    }

    let startAddRooms = () => {
        if (!isLoading && currentPage < totalPages)
            addLoadingRoomImage();
        
        let timer = setInterval(() => {
            if (latitude && longitude && timer) {
                getLocation();
                watchLocation();
                clearInterval(timer);
                timer = 0;
                addRooms();
            }
        }, INITAIL_LOADING_DELAY);

        setTimeout(() => {
            if (!timer) return;
            clearInterval(timer);
            timer = 0;
            addRooms();
        }, MAX_LOADING_TIME);
    }

    let getCoordinate = position => {
        latitude = position.coords.latitude;
        longitude = position.coords.longitude;
    }

    let getLocation = () => {
        if (!navigator.geolocation) {
            showNoGeoErrMsg();
            return;
        }

        navigator.geolocation.getCurrentPosition(getCoordinate);
    }

    let geoError = () => {
        alert("Get geo error!");
    }

    let watchLocation = () => {
        watchOne = navigator.geolocation.watchPosition(getCoordinate, geoError);
    }

    let showRoomDetail = btn => {
        let idx = $("div.show-detail-btn").index(btn);

        $("span.detail-information-address-span")
            .text($(btn).closest("button.room-container").attr("data-a"));
        $("span.detail-information-title-span")
            .text($(btn).closest("button.room-container").attr("data-t"));
        $("span.detail-information-owner-span")
            .text($(btn).closest("button.room-container").attr("data-o"));

        if (!unmatchedKeys || !unmatchedKeys[idx] || !unmatchedKeys[idx].length) {
            $("div.unmatched-keyword-container")
                .html("符合所有搜尋條件");
            $("div.detail-information-blk")
                .css("top", $(btn).offset().top - 68)
                .css("left", $(btn).offset().left + 40);
            return;
        }

        let html = "缺少字詞：";
        for (let matched of unmatchedKeys[idx]) {
            html += `<span class="unmatched-keyword-span">${
                matched}</span>&nbsp;`;
        }

        $("div.unmatched-keyword-container").html(html);

        $("div.detail-information-blk")
            .css("top", $(btn).offset().top - 68)
            .css("left", $(btn).offset().left + 40);
    }

    let hideRoomDetail = () => {
        $("div.detail-information-blk").css("top", -8192);
    }

    $(window).scroll(e => {
        if (!currentPage)
            return;
        if (currentPage >= totalPages)
            return;
        if ($(window).scrollTop() + 2 >
                $(document).height() - $(window).height())
        startAddRooms();
    });

    $("div.rooms-container").on("mouseenter", "div.show-detail-btn", e => {
        showRoomDetail(e.currentTarget);
    });

    $("div.rooms-container").on("mouseleave", "div.show-detail-btn", e => {
        hideRoomDetail(e.target);
    });

    $("div.rooms-container").on("click", "button.room-container", e => {
        if ($(e.target).is("div.room-img-btn, div.room-img-btn *"))
            return;
        if ($(e.target).is("div.little-btn, div.little-btn *"))
            return;
        document.location =
            `room/detail/room?r=${$(e.currentTarget).attr("data-r")}`;
    }).on("mouseenter", "div.room-image-windows", e => {
        $(e.currentTarget).find("div.room-img-btn")
            .css("color", "#444")
            .css("background-color", "rgba(255, 255, 255, .8)");
    }).on("mouseleave", "div.room-image-windows", e => {
        $(e.currentTarget).find("div.room-img-btn")
            .css("color", "transparent")
            .css("background-color", "transparent");
    }).on("click", "div.favourite-btn", e => {
        let favBtn = e.currentTarget;
        let uuid = $(favBtn)
            .closest("button.room-container").attr("data-r");
        
        $.ajax({
            type: "GET",
            url: `wish/${
                $(favBtn).find("i").hasClass("fa-solid") ?
                    "delete.do" : "add.do"
            }?uuid=${uuid}`,
            success: response => {
                updateWish($("div.favourite-btn").index(favBtn));
                if (response == "false") {
                    alert("登入後才可使用心願單功能");
                    document.location = "login";
                }
            },
            error: err => {
                console.log(err);
            }
        });

    });

    $("div.rooms-container").on("click", "div.room-next-img-btn", e => {
        if (isImgMoving) return;
        isImgMoving = true;

        let imgsDiv = $(e.currentTarget).nextAll("div.room-images-container");
        let imgDivs = imgsDiv.find("div.room-image-container");
        let imgWidth = imgDivs.width();
        let total = imgDivs.length;
        let currIdx = parseInt(-parseInt(imgsDiv.css("left")) / (imgWidth - 1));

        $(e.currentTarget).prev().css("display", "block");
        if (currIdx >= total - 1)
            return isImgMoving = false;
        if (currIdx + 1 >= total - 1)
            $(e.currentTarget).css("display", "none");

        imgsDiv.css("left", `${(currIdx + 1) * -100}%`);

        setTimeout(() => isImgMoving = false, IMAGE_MOVING_TIME);

    });

    $("div.rooms-container").on("click", "div.room-prev-img-btn", e => {
        if (isImgMoving) return;
        isImgMoving = true;

        let imgsDiv = $(e.currentTarget).nextAll("div.room-images-container");
        let imgDivs = imgsDiv.find("div.room-image-container");
        let imgWidth = imgDivs.width();
        let currIdx = parseInt(-parseInt(imgsDiv.css("left")) / (imgWidth - 1));

        $(e.currentTarget).next().css("display", "block");
        if (!currIdx)
            return isImgMoving = false;
        if (currIdx <= 1)
            $(e.currentTarget).css("display", "none");

        imgsDiv.css("left", `${(currIdx - 1) * -100}%`);

        setTimeout(() => isImgMoving = false, IMAGE_MOVING_TIME);

    });

    $("div.homepage-choose-all-wish-button").click(() => {
        $("div.favourite-btn>i.fa-regular.fa-heart")
            .closest("div.favourite-btn").click();
    });

    $("div.homepage-clear-all-wish-button").click(() => {
        $.ajax({
            type: "GET",
            url: `wish/clearall.do`,
            success: response => {
                console.log(response);
                updateAllWishes();
            },
            error: err => {
                console.log(err);
            }
        });
    });

    setTimeout(() => {
        if (isSignIn)
            $("div.homepage-wish-button").css("left", 0);
    }, 3000);

    getLocation();

    startAddRooms();

    universalHeaderController.autoUpdateSearchBar = true;

})();