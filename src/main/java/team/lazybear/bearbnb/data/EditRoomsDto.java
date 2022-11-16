package team.lazybear.bearbnb.data;



public class EditRoomsDto {
    
    private Long[] ids = null;
    
    private String uuid =null;
    
    private String title = null;
    
    private String introduction = null;
    
    private String fronCoverUuid;
    
    
    private Integer maxPeopleCapacity = null;
    
    private Integer minPeopleCapacity = null;
    
  
    private Integer status = null;
    
    private String statusTitle = null;
    
    private Integer type = null;
    
    private String typeTitle = null;
        
    private Integer city = null;
    
    private String cityTitle = null;
    
    private String address = null;

    private Double latitude = null;

    private Double longitude = null;
    

    private Integer[] serve = null;
    
    private Integer[] device = null;
    
    
    
    private Integer bedroomCount = null;
    
    private Integer bathroomCount = null;
    
    private Integer singleSizeBedCount = null;
    
    private Integer doubleSizeBedCount = null;
    
    private Integer floorMattressCount = null;
    
    

    private Integer[] restrict = null;

    
    private Integer price = null;
    
    
    
    public EditRoomsDto() {
       
    }
    
  

    public Long[] getIds() {
        return ids;
    }

    public void setIds(Long[] id) {
        this.ids = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getMaxPeopleCapacity() {
        return maxPeopleCapacity;
    }

    public void setMaxPeopleCapacity(Integer maxPeopleCapacity) {
        this.maxPeopleCapacity = maxPeopleCapacity;
    }

    public Integer getMinPeopleCapacity() {
        return minPeopleCapacity;
    }

    public void setMinPeopleCapacity(Integer minPeopleCapacity) {
        this.minPeopleCapacity = minPeopleCapacity;
    }

    public Integer getBedroomCount() {
        return bedroomCount;
    }

    public void setBedroomCount(Integer bedroomCount) {
        this.bedroomCount = bedroomCount;
    }

    public Integer getBathroomCount() {
        return bathroomCount;
    }

    public void setBathroomCount(Integer bathroomCount) {
        this.bathroomCount = bathroomCount;
    }

    public Integer getSingleSizeBedCount() {
        return singleSizeBedCount;
    }

    public void setSingleSizeBedCount(Integer singleSizeBedCount) {
        this.singleSizeBedCount = singleSizeBedCount;
    }

    public Integer getDoubleSizeBedCount() {
        return doubleSizeBedCount;
    }

    public void setDoubleSizeBedCount(Integer doubleSizeBedCount) {
        this.doubleSizeBedCount = doubleSizeBedCount;
    }

    public Integer getFloorMattressCount() {
        return floorMattressCount;
    }

    public void setFloorMattressCount(Integer floorMattressCount) {
        this.floorMattressCount = floorMattressCount;
    }

    public Integer[] getServe() {
        return serve;
    }

    public void setServe(Integer[] serve) {
        this.serve = serve;
    }

    public Integer[] getDevice() {
        return device;
    }

    public void setDevice(Integer[] device) {
        this.device = device;
    }

    public Integer[] getRestrict() {
        return restrict;
    }

    public void setRestrict(Integer[] restrict) {
        this.restrict = restrict;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getStatusTitle() {
        return statusTitle;
    }

    public void setStatusTitle(String statusTitle) {
        this.statusTitle = statusTitle;
    }

    public String getTypeTitle() {
        return typeTitle;
    }

    public void setTypeTitle(String typeTitle) {
        this.typeTitle = typeTitle;
    }

    public String getCityTitle() {
        return cityTitle;
    }

    public void setCityTitle(String cityTitle) {
        this.cityTitle = cityTitle;
    }

    public String getFronCoverUuid() {
        return fronCoverUuid;
    }

    public void setFronCoverUuid(String fronCoverUuid) {
        this.fronCoverUuid = fronCoverUuid;
    }
    
    
    
}
