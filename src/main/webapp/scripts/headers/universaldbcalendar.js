/****************************************************************
*                API of doubleCalendarController                *
*****************************************************************/
let doubleCalendarController = {
    // doubleCalendarController's html tag
    "tag": "div",

    // doubleCalendarController's html class
    "class": "universal-double-calendar-container",

    // check-in date of guest
    "startDate": null,

    // check-out date of guest
    "endDate": null,

    // get selector of doubleCalendar
    // USAGE: doubleCalendarController.jQuery();
    "jQuery": null,

    // move the calendar object to the specified position
    // USAGE: doubleCalendarController.move(top, left [, marginLeft]);
    "move": null,

    // move the calendar object to the specified position
    // USAGE: doubleCalendarController.move(top, right [, marginRight]);
    "moveRight": null,

    // move the calendar object to the middle of the screen
    // at the specified heighted
    // USAGE: doubleCalendarController.moveCenter(top);
    "moveCenter": null,
    
    // hide the calendar object
    // USAGE: doubleCalendarController.hide();
    "hide": null,

    // get width of the calendar block
    // USAGE: doubleCalendarController.width();
    "width": null,

    // get height of the calendar block
    // USAGE: doubleCalendarController.height();
    "height": null,

    // get offset object which contain the position of the calendar
    // USAGE: doubleCalendarController.offset();
    "offset": null,
    
    // update calendar date stamp for newest 'startDate' and 'endDate' property
    // USAGE: doubleCalendarController.update();
    "update": null,

    // back to current month
    // USAGE: doubleCalendarController.back();
    "back": null,

    // add functions to be executed after the calendar was clicked
    "addClickFunction": null

};

(() => {
    const FAST_TRANSITION_TIME = 200;
    const MOVING_DELAY = 100;
    const CLIENT_CLICKED_FUNCTION_DELAY = 100;

    let today = new Date();
    let todayYear = today.getFullYear();
    let todayMonth = today.getMonth() + 1;
    let tableYear = new Date().getFullYear();
    let tableMonth = new Date().getMonth() + 1;
    let calendarWidth = $("div.calendar-container").width();
    let calendarHeight = $("div.calendar-container").height();

    let isMoving = false;
    let selectedDate = 0;

    let dateEquals = (date1, date2) => {
        return date1 && date2 ?
            date1.getFullYear() == date2.getFullYear() &&
            date1.getMonth() == date2.getMonth() &&
            date1.getDate() == date2.getDate() : false;
    }

    let getCalendarHtml = (year = 0, month = 0) => {
        let obj = year ?
            new Date(year, month - 1): new Date();
        
        year = obj.getFullYear();
        month = obj.getMonth() + 1;
        
        let lastDate = new Date(year, month, 0).getDate();

        let html = `<div class="calendar">`;
        html += `<div class="calendar-header" data-year="${year}" data-month="${month}">${year} 年 ${month} 月</div><div class="calendar-body"><table class="calendar-table"><thead><tr class="calendar-table-tr"><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody>`;

        let currDate = 1;
        let currDay = new Date(year, month - 1, 1).getDay();

        for (let row = 0; row != 6; row += 1) {
            html += `<tr class="calendar-table-tr">`;

            for (let day = 0; day != 7; day += 1) {
                html += `<td>`;
                if (currDay == day && currDate <= lastDate) {
                    let date = new Date(year, month - 1, currDate);
                    let isStartDate =
                        dateEquals(date, doubleCalendarController.startDate);
                    let isEndDate =
                        dateEquals(date, doubleCalendarController.endDate);
                    let isBetween = isStartDate || isEndDate ||
                        (date > doubleCalendarController.startDate &&
                            date < doubleCalendarController.endDate);

                    html += `<div class="${
                        selectedDate == 2 ?
                        (isStartDate ? "start-date" :
                        (isEndDate ? "end-date" :
                        (isBetween ? "stay-date" : "" ))) : ""
                    }" data-date="${currDate}"><button class="${
                        isStartDate || isEndDate ? "selected" : ""
                    }" ${
                        date < today ? "disabled" : ""
                    }>${currDate}</button></div>`;

                    currDay = (currDay + 1) % 7;
                    currDate += 1;
                }
                html += `</td>`;
            }

            html += `</tr>`;
        }

        html += `</tbody></table></div></div>`;

        return html;
    }

    let updateAllCalendars = (year = 0, month = 0) => {
        let obj = year ?
            new Date(year, month - 1): new Date();
        
        year = obj.getFullYear();
        month = obj.getMonth() + 1;

        $("div.calendar-container").each((idx, elm) => {
            $(elm).html(getCalendarHtml(
                year + (idx / 4) - 1, month + (idx % 4) - 1));
        });
    }

    let updateCalendarTable = () => {
        setTimeout(() => {
            updateAllCalendars(tableYear, tableMonth);

            $("div.all-calendar-list").css("transition", "all 0s");
            $("div.all-calendar-list").css("left", -calendarWidth);
            $("div.all-calendar-list").css("top", -calendarHeight);

            setTimeout(() => {
                $("div.all-calendar-list").css("transition", "all .2s");
                isMoving = false;
            }, MOVING_DELAY);

        }, FAST_TRANSITION_TIME);
    }

    let prevMonth = () => {
        if (isMoving) return;

        isMoving = true;

        $("div.all-calendar-list").css("left", 0);

        date = new Date(tableYear, tableMonth - 1);
        tableYear = date.getFullYear();
        tableMonth = date.getMonth();

        updateCalendarTable();
    }
    
    let nextMonth = () => {
        if (isMoving) return;

        isMoving = true;

        $("div.all-calendar-list").css("left", -calendarWidth * 2);
        
        date = new Date(tableYear, tableMonth + 1);
        tableYear = date.getFullYear();
        tableMonth = date.getMonth();

        updateCalendarTable();
    }
    
    let prevYear = () => {
        if (isMoving) return;

        isMoving = true;

        $("div.all-calendar-list").css("top", 0);

        tableYear -= 1;

        updateCalendarTable();
    }
    
    let nextYear = () => {
        if (isMoving) return;

        isMoving = true;

        $("div.all-calendar-list").css("top", -calendarHeight * 2);
        
        tableYear += 1;

        updateCalendarTable();
    }

    let update = () => {
        let that = doubleCalendarController;

        if (!(that.startDate && that.startDate instanceof Date &&
                (dateEquals(that.startDate, today) ||
                    that.startDate > today))) {
            that.startDate = that.endDate = null;
            selectedDate = 0;
        } else if (!(that.endDate && that.endDate instanceof Date &&
                that.endDate > that.startDate)) {
            that.endDate = null;
            selectedDate = 1;
        } else {
            selectedDate = 2;
        }
        
        updateAllCalendars(tableYear, tableMonth);
    }

    let backToThisMonth = () => {
        tableMonth = todayMonth;
        tableYear = todayYear;
        updateAllCalendars();
    }

    let jQryToDate = jQry => {
        let header = jQry.closest("div.calendar-container")
            .find("div.calendar-header");
        let newYear = parseInt(header.attr("data-year"));
        let newMonth = parseInt(header.attr("data-month"));
        let newDate = parseInt(jQry.text());
        return new Date(newYear, newMonth - 1, newDate);
    }

    (() => {
        let doubleCalendarSelectorParent =
            "div.universal-double-calendar-container";
        
        let doubleCalendarSelectorKey =
            "tr.calendar-table-tr button"
        
        $(doubleCalendarSelectorParent).on("click", "button", e => {
            if (!doubleCalendarController._click)
                return;
            for (let func of doubleCalendarController._click)
                setTimeout(() => func(e), CLIENT_CLICKED_FUNCTION_DELAY);
        });

        $(doubleCalendarSelectorParent).on("click", doubleCalendarSelectorKey,
            e => {
                let target = $(e.target);
                let date = jQryToDate(target);

                if (!selectedDate &&
                        (date > today || dateEquals(date, today))) {
                    doubleCalendarController.startDate = date;
                    target.addClass("selected");
                    selectedDate = 1;
                } else if (selectedDate == 1 &&
                        date > doubleCalendarController.startDate) {
                    doubleCalendarController.endDate = date;
                    target.addClass("selected");
                    selectedDate = 2;
                    updateAllCalendars(tableYear, tableMonth);
                }
            }
        );

        $(doubleCalendarSelectorParent)
            .on("mouseenter", doubleCalendarSelectorKey, e => {
                if (selectedDate != 1) return;

                let target = $(e.target);
                let date = jQryToDate(target);
                let startDate = doubleCalendarController.startDate;
                let currDate;
                let currJQry;
                $(doubleCalendarSelectorKey).each((idx, elm) => {
                    currJQry = $(elm);
                    currDate = jQryToDate(currJQry);

                    let isStartDate = dateEquals(currDate, startDate) &&
                        date > startDate;
                    let isEndDate = dateEquals(currDate, date) &&
                        currDate > startDate;
                    let isBetween = currDate > startDate && currDate < date;

                    if (isStartDate) {
                        currJQry.closest("div").addClass("start-date");
                    } else if (isEndDate) {
                        currJQry.closest("div").addClass("end-date");
                    } else if (isBetween) {
                        currJQry.closest("div").addClass("stay-date");
                    }
                });
            });
        
        $(doubleCalendarSelectorParent)
            .on("mouseleave", doubleCalendarSelectorKey, e => {
                if (selectedDate != 1) return;

                $(doubleCalendarSelectorKey).each((idx, elm) => {
                    currJQry = $(elm);
                    currJQry.closest("div")
                        .removeClass("start-date")
                        .removeClass("end-date")
                        .removeClass("stay-date");
                });
            });
    })();

    $("button.double-calendar-move-up").click(prevYear);

    $("button.double-calendar-move-down").click(nextYear);

    $("button.double-calendar-move-left").click(prevMonth);

    $("button.double-calendar-move-right").click(nextMonth);

    $("button.double-calendar-back-btn").click(backToThisMonth);

    $("button.double-calendar-reset-btn").click(() => {
        doubleCalendarController.startDate
            = doubleCalendarController.endDate
            = null;
        selectedDate = 0;
        updateAllCalendars(tableYear, tableMonth);
    });

    // initialize doubleCalendarController
    (() => {
        let that = doubleCalendarController;

        that.tag = "div";

        that.class = "universal-double-calendar-container";

        that.startDate = null;
        
        that.endDate = null;

        that.jQuery = () => $("div.universal-double-calendar-container");

        that.move = (top, left, marginLeft = 0) =>
            $("div.universal-double-calendar-container")
                .css("top", top)
                .css("left", left)
                .css("right", "")
                .css("margin-left", marginLeft);
        
        that.moveRight = (top, right, marginRight = 0) =>
            $("div.universal-double-calendar-container")
                .css("top", top)
                .css("right", right)
                .css("left", "")
                .css("margin-right", marginRight);

        that.moveCenter = top => that.move(top, "50%", -512);
        
        that.hide = () => that.move(-8192, "50%", -512);

        that.width = () =>
            $("div.universal-double-calendar-container").width();
        
        that.height = () =>
            $("div.universal-double-calendar-container").height();
        
        that.offset = () =>
            $("div.universal-double-calendar-container").offset();

        that.update = update;

        that.back = backToThisMonth;

        that.addClickFunction = func => that._click.push(func);

        that._click = [];

    })();

    updateAllCalendars();

    //________________________________
    // test block
})();