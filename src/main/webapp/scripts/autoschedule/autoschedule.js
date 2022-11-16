let calculator = {
    "getHamiltonCircuit": null,
};

// solve hamilton circuit problem
(() => {
    let len;
    let matrix;

    let path;
    let footprint;

    let minimumDuration;
    let optimalPath;

    let isSolvable = () => {
        for (let row of matrix)
            if (row.length != len)
                return false;

        for (let col = 0; col != len; ++col) {
            let flag = false;

            for (let row = 0; row != len; ++row) {
                if (row == col) continue;
                if (!(typeof matrix[row][col] === "number")) continue;
                if (matrix[row][col] >= 0) {
                    flag = true;
                    break;
                }
            }

            if (!flag) return false;
        }

        return true;
    }

    let go = (from, curr, duration, remain) => {
        duration += matrix[from][curr];
        footprint[curr] = true;
        remain -= 1;
        path.push(curr);

        if (duration < minimumDuration) {
            if (!remain) {
                let myDuration = duration + matrix[curr][0];
                if (myDuration < minimumDuration) {
                    minimumDuration = myDuration;
                    optimalPath = Array.from(path);
                }
            } else {
                for (let nextTarget = 0; nextTarget != len; ++nextTarget) {
                    if (footprint[nextTarget]) continue;
                    go(curr, nextTarget, duration, remain);
                }
            }
        }

        footprint[curr] = false;
        path.pop();
    }

    let main = m => {
        len = m.length;
        matrix = m;
        if (len <= 1) return [0];
        if (!isSolvable()) return null;
        path = [0];
        optimalPath = [0];
        minimumDuration = Number.MAX_SAFE_INTEGER;

        let duration = 0;
        let remain = len - 1;
        footprint = new Array(len).fill(false);
        footprint[0] = true;

        for (let nextTarget = 1; nextTarget != len; ++nextTarget)
            go(0, nextTarget, duration, remain);

        optimalPath.push(0);

        return optimalPath;
    };

    calculator.getHamiltonCircuit = main;
})();

(() => {
    const DEBUG_MODE = true;
    const CALENDAR_OFFSET = 36;
    const WATCH_LOCATION_INTERVAL = 500;
    const SHOW_ROOM_INTERVAL_TIME = 300;
    const SHOW_ROOM_DELAY_TIME = 400;
    const ERROR_HANDLE_MSG_TIME = 5000;
    const DELAY_RUN_DELAY_TIME = 200;

    let isDbCtrlShown = false;
    let isSearching = false;
    let dbctrl = doubleCalendarController;
    let rootUrl = window.location.pathname.match(/^\/[^\/]*\//);
    let currUrl = window.location.pathname;
    let latitude = 25.0337297;
    let longitude = 121.5433738;
    let getLocationTimer = 0;
    let map;

    let delayRun = (judge, process) => {
        let timer = setInterval(() => {
            if (judge()) {
                process();
                clearInterval(timer);
            }
        }, DELAY_RUN_DELAY_TIME);
    };

    let debug = msg => {
        if (DEBUG_MODE) console.log(msg);
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

        if (getLocationTimer && latitude && longitude) {
            clearTimeout(getLocationTimer);
            getLocationTimer = 0;
        }
    }

    let geoError = () => {
        alert("Get geo error!");
    }

    let watchLocation = () => {
        navigator.geolocation.watchPosition(getCoordinate, geoError);
        if (!watchLocation) return;
        if (latitude && longitude) {
            clearInterval(getLocationTimer);
            getLocationTimer = 0;
        }
    }

    let dateToString = date => {
        return `${
            date.getFullYear()}-${
            date.getMonth() + 1}-${
            date.getDate()}`;
    }

    let showCalendar = () => {
        let btn = $("button.schedule-controller-upper-input-block");
        let width = btn.width();
        let height = btn.height();
        let top = btn.offset().top;
        let left = btn.offset().left;
        let dbWidth = dbctrl.width();

        dbctrl.move(top + height - $(window).scrollTop(),
            left + width - dbWidth + CALENDAR_OFFSET);

        isDbCtrlShown = true;
    }

    let hideCalendar = () => {
        if (!isDbCtrlShown) return;
        dbctrl.hide();
        isDbCtrlShown = false;
    }

    let getMatrix = (lat, lon, rooms, travelMode) => {
        let coordinateStrs = `${lat},${lon}`;

        for (let room of rooms)
            coordinateStrs += `x${room.latitude},${room.longitude}`;

        let timeMatrix = [];
        let distanceMatrix = [];
        let errFlag = false;

        $.ajax({
            url: `${currUrl}/distancematrix?args=${coordinateStrs}&travelMode=${travelMode}`,
            type: "GET",
            async: false,
            success: response => {
                // debug(response);

                try {
                    let json = null;
                    json = JSON.parse(response);

                    for (let row of json.rows) {
                        let timeRow = [];
                        let disRow = [];

                        for (let elm of row.elements) {
                            timeRow.push(elm.duration.value);
                            disRow.push(elm.distance.value);
                        }

                        timeMatrix.push(timeRow);
                        distanceMatrix.push(disRow);
                    }
                } catch(e) {
                    errFlag = true;
                    return;
                }
            },
            error: () => console.log("startScheduling() function failed")
        });

        if (errFlag) return null;

        return {
            durationMatrix: timeMatrix,
            distanceMatrix: distanceMatrix
        };
    }

    let clearRooms = () => {
        $("div.schedule-rooms").html("");
    }

    let errorHandling = (msg1, msg2) => {
        clearRooms();
        $("div.schedule-rooms").html(
            `<div class="init-img-container">
                <div class="init-img-inner-container">
                    <h1>${msg1}</h1>
                    <h3>${msg2}</h3>
                </div>
            </div>`);
        $("button.schedule-controller-search-btn").attr("disabled", false)
            .css("background-color", "#F00078");

        setTimeout(() => {
            $("div.init-img-inner-container>h1")
                .text("向世界說哈囉！");
            $("div.init-img-inner-container>h3")
                .text("讓 bearbnb 為你規劃行程");
        }, ERROR_HANDLE_MSG_TIME);
    }

    let addLoadingImage = () => {
        $("div.schedule-rooms").html(
            `<div class="init-img-container-transparent">
                <img src="${rootUrl}/images/loading.gif" alt="">
            </div>`);
    }

    let addDays = (day, d) => {
        return new Date(day.getFullYear(), day.getMonth(), day.getDate() + d);
    }

    let dayToString = day =>
        `${day.getFullYear()} 年 ${day.getMonth() + 1} 月 ${day.getDate()} 日`;

    let secondToTimeString = sec => {
        if ((sec = parseInt(sec)) <= 60) return "小於 1 分鐘";
        let secPerHr = 60 * 60;
        let hr = parseInt(sec / secPerHr);
        let min = parseInt(sec % secPerHr / 60);

        if (hr && min)
            return `${hr} 小時 ${min} 分鐘`;
        else if (hr)
            return `${hr} 小時`;
        return `${min} 分鐘`;
    }

    let meterToDistanceString = meter => {
        if ((meter = parseInt(meter)) <= 100) return "小於 100 公尺";
        let mPerKm = 1000;
        let km = parseInt(meter / mPerKm);
        let m = parseInt(meter % mPerKm);

        if (km && m)
            return `${km} 公里 ${m} 公尺`;
        else if (km)
            return `${km} 公里`;
        return `${m} 公尺`;
    }

    let showRooms = (rooms, optPath, durationMatrix, distanceMatrix) => {
        let html = "";
        let startDay = new Date(rooms[0].startDate
            .replaceAll(" ", "")
            .replaceAll("年", "-")
            .replaceAll("月", "-")
            .replaceAll("日", ""));
        let room, from, curr, today, tomorrow, rank;
        for (let i = 0; i != optPath.length; ++i) {
            if (!optPath[i]) continue;
            room = rooms[optPath[i] - 1];
            from = optPath[i - 1];
            curr = optPath[i];
            today = dayToString(addDays(startDay, i - 1));
            tomorrow = dayToString(addDays(startDay, i));
            rank = i + (i == 1 ? "st" : (i == 2 ? "nd" : (i == 3 ? "rd" : "th")));
            html +=
                `<button class="schedule-room-btn" data-r="${room.uuid}">
                    <div class="schedule-btn-filter"></div>
                    <div class="schedule-room-container">
                        <div class="sc-room-info-part">
                            <div class="room-photo-window">
                                <div class="room-photos">
                                    <div class="room-photo-container">
                                        <img class="room-image" src="photo/room/${room.cover}">
                                    </div>
                                </div>
                            </div>
                            <div class="room-info-container">
                                <div class="room-city-info-container room-info-idx-container">
                                    ${room.city}
                                </div>
                                <div class="room-info-idx-container">
                                    車程 ${secondToTimeString(durationMatrix[from][curr])}
                                </div>
                                <div class="room-info-idx-container">
                                    距離 ${meterToDistanceString(distanceMatrix[from][curr])}
                                </div>
                                <div class="room-date-info-container room-info-idx-container">
                                    ${today} - ${tomorrow}
                                </div>
                                <div class="room-info-idx-container">
                                    ${room.price} TWD / 晚
                                </div>
                            </div>
                        </div>
                        <div class="sc-travel-date-blk">
                            <div class="sc-travel-date-container">
                                <span class="data-rank">${rank} Day</span>
                            </div>
                        </div>
                    </div>
                </button>`;
        }

        $("div.schedule-rooms").html(html);

        $("button.schedule-room-btn").each((idx, elm) => {
            setTimeout(() => {
                $(elm).css("left", 0);
                $(elm).find("div.schedule-btn-filter")
                    .css("background-color", "transparent");

                let top = Math.max($(elm).offset().top - 600, 0);
                $(window).scrollTop(top);

                setTimeout(() => {
                    $(elm).find("div.schedule-btn-filter")
                        .css("z-index", -1);
                }, SHOW_ROOM_DELAY_TIME);
            }, idx * SHOW_ROOM_INTERVAL_TIME)
        });

        setTimeout(() => {
            $("button.schedule-controller-search-btn").attr("disabled", false)
                .css("background-color", "#F00078");
        }, SHOW_ROOM_DELAY_TIME * ($("button.schedule-room-btn").length - 1))
    }

    let scheduling = (lat, lon, rooms, travelMode) => {
        let matries = getMatrix(lat, lon, rooms, travelMode);
        if (!matries) {
            errorHandling("Google API 發生了不可預期的錯誤", "請重新嘗試");
            return;
        }
        let distanceMatrix = matries.distanceMatrix;
        let durationMatrix = matries.durationMatrix;
        let optPath = calculator.getHamiltonCircuit(durationMatrix);

        clearRooms();

        showRooms(rooms, optPath, durationMatrix, distanceMatrix);
        // debug(rooms);
        // debug(durationMatrix);
        // debug(optPath);

        let roomPath = [];

        for (let i = 0; i != optPath.length; ++i) {
            if (!optPath[i]) continue;
            roomPath.push(rooms[optPath[i] - 1]);
        }

        let coordinates = [];

        for (let room of roomPath) {
            coordinates.push({
                lat: room.latitude,
                lng: room.longitude
            });
        }

        map = new ScheduleMap($("div.schedule-map")[0], coordinates);
        map.run();
    }

    let startScheduling = () => {

        let args = `startDate=${
            $("div.schedule-controller-start-date-input").text()}&endDate=${
            $("div.schedule-controller-end-date-input").text()}&number=${
            $("input.schedule-controller-people-number-input").val()
            }`;

        let startDate = new Date($("div.schedule-controller-start-date-input").text());
        let endDate = new Date($("div.schedule-controller-end-date-input").text());
        let diff = parseInt(Math.abs(endDate - startDate) / 1000 / 60 / 60 / 24);
        if (diff > 9) {
            errorHandling("輸入的旅行天數請不要超過 9 天", "Google 距離矩陣 API 限定最多 9 個地點");
            return;
        }

        clearRooms();

        addLoadingImage();

        $.ajax({
            url: `${currUrl}/summaries?${args}`,
            type: "GET",
            success: response => {
                if (!response.length) {
                    errorHandling("符合條件的房間數量不足", "");
                    return;
                }

                delayRun(() => latitude && longitude,
                    () => scheduling(latitude, longitude, response,
                        $("input[name=travelMode]:checked").val()));
            },
            error: () => console("startScheduling() function failed")
        });
    }

    $("button.schedule-controller-upper-input-block").click(showCalendar);

    $(window).resize(() => {
        if (isDbCtrlShown) showCalendar();
    });

    (() => {
        let selector = dbctrl.tag + "." + dbctrl.class;

        $("body").click(e => {
            if (!isDbCtrlShown) return;

            let target = $(e.target);
            if (target.is("button.schedule-controller-upper-input-block," +
                    "button.schedule-controller-upper-input-block *"))
                return

            if (!target.is(`${selector},${selector} *`))
                hideCalendar();
        });
    })();

    dbctrl.addClickFunction(() => {
        let startDiv = $("div.schedule-controller-start-date-input")
            .css("color", "#444");
        let endDiv = $("div.schedule-controller-end-date-input")
            .css("color", "#444");

        if (!dbctrl.startDate) {
            startDiv.text("----/--/--");
            endDiv.text("----/--/--");
        } else if (dbctrl.endDate == null) {
            startDiv.text(dateToString(dbctrl.startDate));
            endDiv.text("----/--/--");
        } else {
            startDiv.text(dateToString(dbctrl.startDate));
            endDiv.text(dateToString(dbctrl.endDate));
        }
    });

    $("button.schedule-controller-search-btn").click(e => {
        if (isSearching) return;
        let startDiv = $("div.schedule-controller-start-date-input");
        let endDiv = $("div.schedule-controller-end-date-input");
        let startStr = startDiv.text();
        let endStr = endDiv.text();
        let re = /^\d{4}-\d{1,2}-\d{1,2}$/;

        if (!re.test(startStr)) {
            $("div.schedule-controller-common-date-input")
                .text("請選擇日期")
                .css("color", "red");
            return;
        }

        if (!re.test(endStr)) {
            endDiv.text("請選擇日期").css("color", "red");
            return;
        }

        $(e.currentTarget).attr("disabled", true)
            .css("background-color", "#aaa");

        delayRun(() => latitude && longitude, startScheduling);
    });

    $("div.schedule-rooms").on("click", "button.schedule-room-btn", e => {
        window.open(`${rootUrl}room/detail/room?r=${$(e.currentTarget).attr("data-r")}`);
    });

    $("div.schedule-rooms").on("mouseenter", "button.schedule-room-btn", e => {
        let idx = $("button.schedule-room-btn").index(e.currentTarget);
        // console.log(map.markers[idx], idx)
        // map.markers[idx] = null;
        if (idx >= map.markers.length) return;
        let tmp = map.markers[idx];
        map.markers[idx] = null;
        map.markers[idx] = map.getFocusMarker(tmp);
    }).on("mouseleave", "button.schedule-room-btn", e => {
        let idx = $("button.schedule-room-btn").index(e.currentTarget);
        if (idx >= map.markers.length) return;
        let tmp = map.markers[idx];
        map.markers[idx] = null;
        map.markers[idx] = map.getNormalMarker(idx, tmp);
    });

    getLocation();

    getLocationTimer =
        setInterval(getLocation, WATCH_LOCATION_INTERVAL);

})();