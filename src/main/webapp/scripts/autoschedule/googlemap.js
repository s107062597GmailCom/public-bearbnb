class GoogleMap {

    #pCoordinates = null;
    #pContainer = null;
    #pMap = null;
    #pMarkers = null;
    #pFocusMarkers = null;

    constructor(coordinates, container) {
        this.setContainer(container);
        this.setCoordinates(coordinates);
    }

    setContainer(container) {
        this.#pContainer = container;
    }

    setCoordinates(coordinates) {
        this.#pCoordinates = JSON.parse(JSON.stringify(coordinates));

        for (let coordinate of this.#pCoordinates) {
            coordinate.lat = parseFloat(coordinate.lat);
            coordinate.lng = parseFloat(coordinate.lng);
        }
    }

    show() {
        let mapInfo = this.#findEdge();
        this.#pMap = this.#loadMap(mapInfo);
    }

    addMarkers(intervalTime = 0) {
        let size = this.#pCoordinates.length;

        this.#pMarkers = [];
        this.#pFocusMarkers = [];
        for (let i = 0; i != size; i += 1) {
            setTimeout(() => {
                this.#pMarkers.push(
                    new google.maps.Marker({
                        map: this.#pMap,
                        position: this.#pCoordinates[i],
                        label: {
                            text: (i + 1).toString(),
                            color: "#fff",
                            fontSize: "20px"
                        }
                    })
                );

                let focusMarker = new google.maps.Marker({
                    map: this.#pMap,
                    position: this.#pCoordinates[i]
                });

                focusMarker.setMap(null);

                this.#pFocusMarkers.push(focusMarker);

            }, intervalTime * i);
        }
    }

    mouseenterMarker(num) {
        if (num >= this.#pFocusMarkers.length || num >= this.#pMarkers.length)
            return;
        this.#pFocusMarkers[num].setMap(this.#pMap);
        this.#pMarkers[num].setMap(null);
    }

    mouseleaveMarker(num) {
        if (num >= this.#pFocusMarkers.length || num >= this.#pMarkers.length)
            return;
        this.#pMarkers[num].setMap(this.#pMap);
        this.#pFocusMarkers[num].setMap(null);
    }

    #loadMap(mapInfo) {
        let width = mapInfo.width;
        let height = mapInfo.height;

        let zoom;
        if (width < 0.027 && height < 0.03)
            zoom = 15;
        else if (width < 0.053 && height < 0.058)
            zoom = 14;
        else if (width < 0.111 && height < 0.114)
            zoom = 13;
        else if (width < 0.218 && height < 0.224)
            zoom = 12;
        else if (width < 0.447 && height < 0.45)
            zoom = 11;
        else if (width < 0.88 && height < 0.935)
            zoom = 10;
        else if (width < 1.794 && height < 1.864)
            zoom = 9;
        else zoom = 8;

        return new google.maps.Map(this.#pContainer, {
            zoom: zoom,
            center: mapInfo.center
        });
    }

    #findEdge() {
        let top = -90;
        let left = 180;
        let right = -180;
        let bottom = 90;

        for (let coordinate of this.#pCoordinates) {
            if (coordinate.lat > top)
                top = coordinate.lat;
            if (coordinate.lat < bottom)
                bottom = coordinate.lat;
            if (coordinate.lng > right)
                right = coordinate.lng;
            if (coordinate.lng < left)
                left = coordinate.lng;
        }

        return {
            center: { lat: (top + bottom) / 2, lng: (left + right) / 2 },
            width: right - left,
            height: top - bottom
        };
    }
}