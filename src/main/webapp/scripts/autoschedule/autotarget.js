let calculator = {
    "getHamiltonCircuit": null
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
                for (let nextTarget = 1; nextTarget != len; ++nextTarget) {
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
    const INITAIL_LOADING_DELAY = 200;
    const ERR_MSG_NO_GEO_SRV = "You have no geolocation service";
    const DELAY_RUN_DELAY_TIME = 200;
    const PINK_ERROR_MSG_DELAY = 5000;
    const SCHEDULE_ROOMS_NUMBER_LIMIT = 39;
    const SHOW_ROOM_DELAY_TIME = 400;
    const SHOW_ROOM_INTERVAL_TIME = 300;
    const HIDE_GOOGLE_MAP_CSS_RIGHT = "-39%";

    let rootUrl = window.location.pathname.match(/^\/[^\/]*\//);
    let currUrl = window.location.pathname;

    let latitude = 25.0337297;
    let longitude = 121.5433738;
    let getLocationTimer = 0;
    let pinkMsgTimer = 0;
    let isMapShown = false;
    let googleMap = null;

    let getLocation = () => {
        if (!navigator.geolocation) {
            showErrMsg(ERR_MSG_NO_GEO_SRV);
            return;
        }

        navigator.geolocation.getCurrentPosition(position => {
            latitude = position.coords.latitude;
            longitude = position.coords.longitude;
        });

        if (latitude && longitude && getLocationTimer) {
            clearTimeout(getLocationTimer);
            getLocationTimer = 0;
        }
    };

    let chooseAll = () => {
        $("input.choose-check-box").prop("checked", true);
        changeSubmitButtomRoomsCount($("input.choose-check-box:checked").length);
    };

    let resetChoosen = () => {
        $("input.choose-check-box").prop("checked", false);
        changeSubmitButtomRoomsCount($("input.choose-check-box:checked").length);
    };

    let changeSubmitButtomText = text =>
        $("button.auto-schedule-btn").text(text);
    
    let changeSubmitButtomRoomsCount = num =>
        changeSubmitButtomText(`開始排程 (${num})`);

    let delayRun = (judge, process) => {
        let timer = setInterval(() => {
            if (judge()) {
                process();
                clearInterval(timer);
            }
        }, DELAY_RUN_DELAY_TIME);
    };

    let coordinateToDistance = (lat1, lng1, lat2, lng2) => {
        if ((lat1 == lat2) && (lng1 == lng2))
            return 0;

        let radlat1 = Math.PI * lat1 / 180;
        let radlat2 = Math.PI * lat2 / 180;
        let theta = lng1 - lng2;
        let radtheta = Math.PI * theta / 180;
        let dist = Math.sin(radlat1) * Math.sin(radlat2) +
            Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        dist = dist > 1 ? 1 : dist;
        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515;
        return dist * 1.609344; // unit: km
    };

    let kmToString = dis => {
        if (dis <= 0.1) return "不足 100 公尺";
        let km = parseInt(dis);
        let m = parseInt(dis * 1000) % 1000;
        return (km ? km + " 公里" : "")
            + (km && m ? " " : "")
            + (m ? m + " 公尺" : "");
    };

    let insertJsonInWishList = rooms => {
        let html = ""

        if (!(latitude && longitude))
            return;

        for (let room of rooms) {
            let distance = kmToString(coordinateToDistance(
                latitude, longitude, room.latitude, room.longitude));

            html +=
                `<button class="wish-container" data-r="${room.uuid}" data-lat="${room.latitude}" data-lng="${room.longitude}">
                    <div class="room-photo-container">
                        <img class="room-photo" src="${rootUrl}photo/room/${room.cover}">
                    </div>
                    <div class="room-info-container">
                        <div class="room-city-info room-info-line">${room.city}</div>
                        <div class="room-title-info room-info-line">${room.title}</div>
                        <div class="room-distance-info room-info-line">距離 ${distance}</div>
                        <div class="room-price-info room-info-line">${room.price}TWD / 晚</div>
                    </div>
                    <div class="check-box-blk-container">
                        <div class="check-box-container">
                            <input type="checkbox" class="choose-check-box">
                        </div>
                    </div>
                </button>`;
        }

        $("div.wishes-container").html(html);
    };

    let noWish = () => {
        $("div.wish-list-loading-container").html(`
            <div class="wish-list-loading-container">
                <div class="no-room-in-wish-list">
                    你的心願單中沒有房間
                </div>
            </div>`);
    };

    let updateWishList = () => {
        $.ajax({
            url: `${rootUrl}wish/all.do`,
            type: "GET",
            success: response => {
                response.sort((a, b) => {
                    return coordinateToDistance(
                            latitude, longitude, a.latitude, a.longitude)
                        - coordinateToDistance(
                            latitude, longitude, b.latitude, b.longitude);
                });

                if (response.length)
                    insertJsonInWishList(response);
                else
                    noWish();
            }
        });
    };

    let showLoadingImg = () => {
        $("div.schedule-rooms-container").html(`
            <div class="init-img-container-transparent">
                <img src="${rootUrl}/images/loading.gif" alt="">
            </div>`);
    };
    
    let showPinkMsg = (msg1, msg2) => {
        $("div.schedule-rooms-container").html(`<div class="schedule-rooms-init-inner-container"><div class="schedule-rooms-init-hint"><h1>${msg1}</h1><br><h3>${msg2}</h3></div></div>`);
    };

    let showPinkErrorMsg = (msg1, msg2) => {
        if (pinkMsgTimer) {
            clearTimeout(pinkMsgTimer);
            pinkMsgTimer = 0;
        }

        showPinkMsg(msg1, msg2);

        pinkMsgTimer = setTimeout(() => showPinkMsg(
            "向世界說哈囉！", "讓 bearbnb 為你規劃行程"), PINK_ERROR_MSG_DELAY);
    };

    let getCoordinateListFromCheckedInput = () => {
        let list = [];
        $("input.choose-check-box:checked").each((idx, elm) => {
            let btn = $(elm).closest("button.wish-container");
            list.push({
                uuid: btn.attr("data-r"),
                city: btn.find("div.room-city-info").text(),
                title: btn.find("div.room-title-info").text(),
                price: parseInt(btn.find("div.room-price-info").text()),
                cover: btn.find("img").attr("src"),
                lat: btn.attr("data-lat"),
                lng: btn.attr("data-lng")
            });
        });

        return list;
    };

    let getMatrix = (lat, lon, coordinateList, travelMode) => {
        let coordinateString = `${lat},${lon}`;
        for (let coordinate of coordinateList)
            coordinateString += `x${coordinate.lat},${coordinate.lng}`;
        
        let timeMatrix = [];
        let distanceMatrix = [];
        let errFlag = false;

        $.ajax({
            url: `${rootUrl}autoschedule/distancematrix?args=${coordinateString}&travelMode=${travelMode}`,
            type: "GET",
            async: false,
            success: response => {
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
            error: () => {
                errFlag = true;
                console.log("getMatrix() function failed");
            }
        });

        return errFlag ? null : {
            durationMatrix: timeMatrix,
            distanceMatrix: distanceMatrix
        };
    };

    let getOriMatrix = (coordinateListX, coordinateListY, travelMode) => {
        if (!(coordinateListX.length && coordinateListY.length))
            return { durationMatrix: [[]], distanceMatrix: [[]] };

        let coordinateStringX = `${coordinateListX[0].lat},${coordinateListX[0].lng}`;
        for (let i = 1; i != coordinateListX.length; i += 1)
            coordinateStringX += `x${coordinateListX[i].lat},${coordinateListX[i].lng}`;
        
        let coordinateStringY = `${coordinateListY[0].lat},${coordinateListY[0].lng}`;
        for (let i = 1; i != coordinateListY.length; i += 1)
            coordinateStringY += `x${coordinateListY[i].lat},${coordinateListY[i].lng}`;
        
        let timeMatrix = [];
        let distanceMatrix = [];
        let errFlag = false;

        $.ajax({
            url: `${rootUrl}autoschedule/fulldistancematrix?argsx=${coordinateStringX}&argsy=${coordinateStringY}&travelMode=${travelMode}`,
            type: "GET",
            async: false,
            success: response => {
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
            error: () => {
                errFlag = true;
                console.log("getOriMatrix() function failed");
            }
        });

        return errFlag ? null : {
            durationMatrix: timeMatrix,
            distanceMatrix: distanceMatrix
        };
    }

    let getLargeMatrix = (lat, lng, coordinateList, travelMode) => {
        let getList = () => {
            let list = [ { lat: lat, lng: lng } ];

            for (let coordinate of coordinateList)
                list.push({ lat: parseFloat(coordinate.lat), lng: parseFloat(coordinate.lng) });
            
            return list;
        };

        let getInitStructMatrix = list => {
            let structMatrixLength = parseInt(list.length / 10) + (list.length % 10 ? 1 : 0);
            let structMatrix = [];

            for (let i = 0; i != structMatrixLength; i += 1) {
                let row = [];
                for (let j = 0; j != structMatrixLength; j += 1)
                    row.push([]);
                structMatrix.push(row);
            }

            return structMatrix;
        };

        let getSubMatrix = (list, x, y, travelMode) => {
            let startX = x * 10;
            let endX = Math.min((x + 1) * 10, list.length);
            let startY = y * 10;
            let endY = Math.min((y + 1) * 10, list.length);


            // console.log(list)
            // console.log(startX, endX, startY, endY)
            let coordinateListX = [];
            for (let i = startX; i < endX; i += 1)
                coordinateListX.push(list[i]);
            
            let coordinateListY = [];
            for (let i = startY; i < endY; i += 1) {
                coordinateListY.push(list[i]);
            }
            
            return getOriMatrix(coordinateListX, coordinateListY, travelMode);
        };

        let getResultMatrix = structMatrix => {
            let durationMatrix = [];
            let distanceMatrix = [];
            let size = (structMatrix.length - 1) * 10
                + structMatrix[structMatrix.length - 1][0].durationMatrix.length;
            
            for (let i = 0; i != size; i += 1) {
                let durationRow = [];
                let distanceRow = [];
                for (let j = 0; j != size; j += 1) {
                    durationRow.push(
                        structMatrix[parseInt(i / 10)][parseInt(j / 10)]
                            .durationMatrix[i % 10][j % 10]
                    );
                    distanceRow.push(
                        structMatrix[parseInt(i / 10)][parseInt(j / 10)]
                            .distanceMatrix[i % 10][j % 10]
                    )
                }
                durationMatrix.push(durationRow);
                distanceMatrix.push(distanceRow);
            }

            return {
                durationMatrix: durationMatrix,
                distanceMatrix: distanceMatrix
            };
        };

        let list = getList();
        
        let structMatrix = getInitStructMatrix(list);
        
        for (let row = 0; row != structMatrix.length; row += 1)
            for (let col = 0; col != structMatrix.length; col += 1)
                structMatrix[row][col] = getSubMatrix(list, row, col, travelMode);
        
        return getResultMatrix(structMatrix);
    };

    let clearRooms = () => $("div.schedule-rooms-container").html("");

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

    let showRooms = (coordinateList, optPath, durationMatrix, distanceMatrix) => {
        let html = "";

        let room, from, curr, order;
        for (let i = 0; i != optPath.length; i += 1) {
            if (!optPath[i]) continue;
            room = coordinateList[optPath[i] - 1];
            from = optPath[i - 1];
            curr = optPath[i];
            order = i + (i == 1 ? "st" : (i == 2 ? "nd" : (i == 3 ? "rd" : "th")));
            html +=
                `<button class="schedule-room-container-btn" data-r="${room.uuid}">
                    <div class="schedule-btn-filter"></div>
                    <div class="schedule-room-container">
                        <div class="schedule-room-info-part">
                            <div class="room-photo-container">
                                <img class="room-photo" src="${room.cover}">
                            </div>
                            <div class="schedule-room-info-container">
                                <div class="room-info-idx-container room-info-city-idx-container">
                                    ${room.city}
                                </div>
                                <div class="room-info-idx-container">
                                    ${room.title}
                                </div>
                                <div class="room-info-idx-container room-info-duration-idx-container little-gray">
                                    車程 ${secondToTimeString(durationMatrix[from][curr])}
                                </div>
                                <div class="room-info-idx-container room-info-distance-idx-container little-gray">
                                    距離 ${meterToDistanceString(distanceMatrix[from][curr])}
                                </div>
                                <div class="room-info-idx-container">
                                    ${room.price} TWD / 晚
                                </div>
                            </div>
                        </div>
                        <div class="schedule-room-order-part">
                            <div class="schedule-room-order-container">
                                <span class="room-order-span">${order}<br>Room</span>
                            </div>
                        </div>
                    </div>
                </button>`;
        }

        $("div.schedule-rooms-container").html(html);

        $("button.schedule-room-container-btn").each((idx, elm) => {
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

        if (!isMapShown)
            clickShowMapBtn();
    };

    let showRoomsInMap = (coordinateList, optPath, mapDiv) => {
        let list = [];

        let size = optPath.length;
        for (let i = 0; i != size; i += 1) {
            if (!optPath[i])
                continue;

            list.push({
                lat: coordinateList[optPath[i] - 1].lat,
                lng: coordinateList[optPath[i] - 1].lng
            });
        }

        googleMap = new GoogleMap(list, mapDiv);
        googleMap.show();
        googleMap.addMarkers(SHOW_ROOM_INTERVAL_TIME);
    };

    let preSchedule = () => {
        let coordinateList = getCoordinateListFromCheckedInput();

        // let matries = getMatrix(latitude, longitude, coordinateList, "driving");
        let matries = getLargeMatrix(latitude, longitude, coordinateList, "driving");
        
        if (!matries) {
            showPinkMsg("Google API 發生了不可預期的錯誤", "請重新嘗試");
            return;
        }

        let distanceMatrix = matries.distanceMatrix;
        let durationMatrix = matries.durationMatrix;

        // console.log(distanceMatrix, durationMatrix)

        // let optPath = calculator.getHamiltonCircuit(durationMatrix);
        let optPath = Calculator.getHamiltonCircuit(durationMatrix);

        //________________
        // test block
        // console.log(`new algorithm: ${Calculator.getHamiltonCircuit(durationMatrix)}`);
        // console.log(`old algorithm: ${calculator.getHamiltonCircuit(durationMatrix)}`);
        // console.log(Calculator.getHamiltonCircuit([
        //     [0, 3, 93, 13, 33, 9, 57],
        //     [4, 0, 77, 42, 21, 16, 34],
        //     [45, 17, 0, 36, 16, 28, 25],
        //     [39, 90, 80, 0, 56, 7, 91],
        //     [28, 46, 88, 33, 0, 25, 57],
        //     [3, 88, 18, 46, 92, 0, 7],
        //     [44, 26, 33, 27, 84, 39, 0]
        // ]));
        //________________

        // clearRooms();

        showRooms(coordinateList, optPath, durationMatrix, distanceMatrix);

        showRoomsInMap(coordinateList, optPath, $("div.google-map")[0]);
    };

    let schedule = () => {
        if (!(latitude && longitude)) return;

        if ($("input.choose-check-box:checked").length
                > SCHEDULE_ROOMS_NUMBER_LIMIT) {
            showPinkErrorMsg(
                `選取的房間數請不要超過 ${SCHEDULE_ROOMS_NUMBER_LIMIT} 間`,
                `Google 距離矩陣 API 限定最多 ${SCHEDULE_ROOMS_NUMBER_LIMIT} 個地點`);
            return;
        }

        if ($("input.choose-check-box:checked").length < 1) {
            showPinkErrorMsg(
                `未選取要排程的房間`,
                `請先從右側心願單中選取要用於排程的房間`);
            return;
        }

        clearTimeout(pinkMsgTimer);
        pinkMsgTimer = 0;
        showLoadingImg();

        // preSchedule();
        setTimeout(preSchedule, 1000);
    };

    let clickShowMapBtn = () => {
        if (isMapShown) {
            isMapShown = false;
            $("div.show-map-btn-container")
                .html(`<i class="fa-solid fa-angle-left"></i>`);
            $("div.map-block").css("right", HIDE_GOOGLE_MAP_CSS_RIGHT);
        } else {
            isMapShown = true;
            $("div.show-map-btn-container")
                .html(`<i class="fa-solid fa-angle-right"></i>`);
            $("div.map-block").css("right", 0)
        }
    };

    (() => {
        let outside = "div.check-box-blk-container,"
            + "div.check-box-blk-container *";
        $("div.wishes-container").on("click", "button.wish-container", e => {
            if ($(e.target).is(outside)) return;
            window.open(`${rootUrl}room/detail/room?r=${$(e.currentTarget).attr("data-r")}`);
        });

        $("div.schedule-rooms-container").on("click", "button.schedule-room-container-btn", e => {
            window.open(`${rootUrl}room/detail/room?r=${$(e.currentTarget).attr("data-r")}`);
        });

        $("div.schedule-rooms-container")
            .on("mouseenter", "button.schedule-room-container-btn", e => {
                let idx = $("button.schedule-room-container-btn").index(e.currentTarget);
                googleMap.mouseenterMarker(idx);
            }).on("mouseleave", "button.schedule-room-container-btn", e => {
                let idx = $("button.schedule-room-container-btn").index(e.currentTarget);
                googleMap.mouseleaveMarker(idx);
            });
    })();

    $("div.wishes-container").on("change", "input.choose-check-box", () => {
        changeSubmitButtomRoomsCount($("input.choose-check-box:checked").length);
    });

    $("button.reset-schedule-btn").click(resetChoosen);

    $("button.choose-all-schedule-btn").click(chooseAll);

    $("button.auto-schedule-btn").click(schedule);

    $("div.show-map-btn-container").click(clickShowMapBtn);

    getLocationTimer = setInterval(getLocation, INITAIL_LOADING_DELAY);

    delayRun(() => latitude && longitude, updateWishList);

    showPinkMsg("向世界說哈囉！", "讓 bearbnb 為你規劃行程");

})();