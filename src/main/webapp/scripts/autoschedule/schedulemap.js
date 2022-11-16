class ScheduleMap {

    container = null;

    coordinates = [];

    markers = [];

    center = { lat: 0, lng: 0 }
    width = 0;
    height = 0;

    map = null;

    constructor(container, coordinates) {
        this.setContainer(container);
        this.setCoordinates(coordinates);
    };

    setContainer(container) {
        this.container = container;
    }

    setCoordinates(coordinates) {
        this.coordinates = coordinates;
    }

    run() {
        this.findEdge();
        this.loadMap();
        this.insertLabels();
    }

    findEdge() {
        let top = -90;
        let left = 180;
        let right = -180;
        let bottom = 90
        
        for (let coordinate of this.coordinates) {
            if (coordinate.lat > top)
                top = coordinate.lat;
            if (coordinate.lat < bottom)
                bottom = coordinate.lat;
            if (coordinate.lng > right)
                right = coordinate.lng;
            if (coordinate.lng < left)
                left = coordinate.lng;
        }


        this.width = right - left;
        this.height = top - bottom;
        this.center.lat = (top + bottom) / 2;
        this.center.lng = (left + right) / 2;
    }

    loadMap() {
        this.map = new google.maps.Map(this.container, {
            zoom: 7,
            center: this.center
        });
    }

    insertLabels() {
        const SHOW_ROOM_INTERVAL_TIME = 300
        for (let i = 0; i != this.coordinates.length; i += 1) {
            setTimeout(() => {
                this.markers.push(
                    new google.maps.Marker({
                        map: this.map,
                        position: this.coordinates[i],
                        label: {
                            text: (i + 1).toString(),
                            color: "#fff",
                            fontSize: "20px"
                        }
                    })
                );
            }, SHOW_ROOM_INTERVAL_TIME * i);
        }
    }

    getFocusMarker(marker) {
        return new google.maps.Marker({
            map: marker.map,
            position: marker.position,
        });
    }

    getNormalMarker(idx, marker) {
        return new google.maps.Marker({
            map: marker.map,
            position: marker.position,
            label: {
                text: (idx + 1).toString(),
                color: "#fff",
                fontSize: "20px"
            }
        });
    }
    
};