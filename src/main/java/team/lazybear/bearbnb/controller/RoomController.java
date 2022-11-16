package team.lazybear.bearbnb.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Part;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.data.AccountDto;
import team.lazybear.bearbnb.data.EditRoomDto;
import team.lazybear.bearbnb.data.EditRoomsDto;
import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.City;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomDevice;
import team.lazybear.bearbnb.model.RoomInformation;
import team.lazybear.bearbnb.model.RoomPhoto;
import team.lazybear.bearbnb.model.RoomRestrict;
import team.lazybear.bearbnb.model.RoomServe;
import team.lazybear.bearbnb.model.RoomStatus;
import team.lazybear.bearbnb.model.RoomType;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.CityService;
import team.lazybear.bearbnb.service.FileService;
import team.lazybear.bearbnb.service.RoomDeviceService;
import team.lazybear.bearbnb.service.RoomRestrictService;
import team.lazybear.bearbnb.service.RoomServeService;
import team.lazybear.bearbnb.service.RoomService;
import team.lazybear.bearbnb.service.RoomStatusService;
import team.lazybear.bearbnb.service.RoomTypeService;

@Controller
@RequestMapping("/room")
@SessionAttributes("myaccount")
public class RoomController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private RoomServeService roomServeService;
	@Autowired
	private RoomDeviceService roomDeviceService;
	@Autowired
	private RoomRestrictService roomRestrictService;
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private CityService cityService;
	@Autowired
	private RoomStatusService roomStatusService;
	
	
	@GetMapping("/addRoom")
	public String toAddPage( Model m) {
		Account myaccount = (Account) m.getAttribute("myaccount");
		if(myaccount != null) {
			List<RoomServe> serveList = roomServeService.findAll();
			serveList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("serveList",serveList);
			List<RoomDevice> deviceList = roomDeviceService.findAll();
			deviceList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("deviceList",deviceList);
			List<RoomRestrict> restrictList = roomRestrictService.findAll();
			restrictList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("restrictList",restrictList);
			List<RoomType> typeList = roomTypeService.findAll();
			typeList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("typeList",typeList);
			List<City> cityList = cityService.findAll();
			cityList.sort((o1, o2) -> o1.getId()-o2.getId()	);
			m.addAttribute("cityList",cityList);
			return "pages/room/addRoom2";			
		}
		return "redirect:/login";
	}

	@PostMapping("/insertRoom")
	@Transactional
	public String getInfo(	Model m,
							@RequestParam String title,
							@RequestParam Integer city,
							@RequestParam Integer price,
							@RequestParam Double latitude,
							@RequestParam Double longitude,							
							@RequestParam String address,
							@RequestParam String introduction,
							@RequestParam Integer roomType,
							@RequestParam Part photoFile1,
							@RequestParam Part photoFile2,
							@RequestParam Part photoFile3,
							@RequestParam Part photoFile4,
							@RequestParam Part photoFile5,
							@RequestParam Integer maxPersonCapacity,
							@RequestParam Integer singleSizeBedCount,
							@RequestParam Integer doubleSizeBedCount,
							@RequestParam Integer floorMattressCount,
							@RequestParam Integer bedroomCount,
							@RequestParam Integer bathroomCount,
							@RequestParam Double area,
							@RequestParam(name="roomRestrict",defaultValue ="") List<Integer> roomRestrict,
							@RequestParam(name="roomServe",defaultValue = "") List<Integer> roomServe,
							@RequestParam(name="roomDevice",defaultValue = "") List<Integer> roomDevice
							) {
		Room room = new Room();
		Account myaccount = (Account) m.getAttribute("myaccount");
		Account owner = accountService.findById(myaccount.getId());
		room.setOwner(owner);
		room.setPrice(price);
		roomRestrictService.addRestrictByIdList(room, roomRestrict);
		roomServeService.addServeByIdList(room, roomServe);
		roomDeviceService.addDeviceByIdList(room, roomDevice);
		
		City cityObj = cityService.findById(city);
		room.setCity(cityObj);
		room.getCity().getRooms().add(room);
		address=cityObj.getTitle()+address;
		room.setAddress(address);
		room.setInformation(new RoomInformation());
		RoomInformation roomInfo = room.getInformation();
		roomInfo.setRoom(room);
		roomInfo.setLatitude(latitude);
		roomInfo.setLongitude(longitude);
		RoomStatus preparingStatus = roomStatusService.findById(2);
		preparingStatus.getRooms().add(room);
		room.setStatus(preparingStatus);
	
		roomInfo.setTitle(title);
		roomInfo.setMaxPeopleCapacity(maxPersonCapacity);
		roomInfo.setMinPeopleCapacity(1);
		roomInfo.setSingleSizeBedCount(singleSizeBedCount);
		roomInfo.setDoubleSizeBedCount(doubleSizeBedCount);
		roomInfo.setFloorMattressCount(floorMattressCount);
		roomInfo.setBathroomCount(bathroomCount);
		roomInfo.setBedroomCount(bedroomCount);
		roomInfo.setArea(area);
		roomInfo.setIntroduction(introduction);
		roomTypeService.addTypeById(roomInfo,roomType);


		room.setPhotos(new HashSet<RoomPhoto>());
		Set<RoomPhoto> photos = room.getPhotos();
		RoomPhoto[] arr= new RoomPhoto[5];
		for(int i = 0 ;i<5;i++) {
			RoomPhoto photo = new RoomPhoto();
			photo.setRoom(room);
			photos.add(photo);
			if(i==0) {
				room.setFrontCoverPhoto(photo);
			}
			arr[i]=photo;
		}
		roomService.insert(room);
		String frontCoverId = room.getFrontCoverPhoto().getUuid();
		RoomPhoto[] photoArr= new RoomPhoto[4];
		int index = 0;
		for(int i = 0 ;i<arr.length;i++) {
		    if(!(arr[i].getUuid().equals(frontCoverId))) {
		        photoArr[index++] = arr[i];
		    }
		}
		Arrays.sort(photoArr,new Comparator<RoomPhoto>() {
			public int compare(RoomPhoto o1, RoomPhoto o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});
		

		FileService.uploadPhoto(frontCoverId, photoFile1);
		FileService.uploadPhoto(photoArr[0].getUuid(), photoFile2);
		FileService.uploadPhoto(photoArr[1].getUuid(), photoFile3);
		FileService.uploadPhoto(photoArr[2].getUuid(), photoFile4);
		FileService.uploadPhoto(photoArr[3].getUuid(), photoFile5);

		return "redirect:/";
	}
	@PostMapping("/editRoomPicture")
	public String getInfo(   @RequestParam Long roomId,
	                        @RequestParam(name="frontCoverPhoto", required=false) Part frontCoverPhoto,
	                        @RequestParam(name="photo1", required=false) Part photo1,
	                        @RequestParam(name="photo2", required=false) Part photo2,
	                        @RequestParam(name="photo3", required=false) Part photo3,
	                        @RequestParam(name="photo4", required=false)Part photo4,Model m) {
	    Room room = roomService.findById(roomId);
	    Set<RoomPhoto> photos = room.getPhotos();
        RoomPhoto[] arr= new RoomPhoto[5];
        int arrIndex = 0;
        for(RoomPhoto photo : photos) {
           arr[arrIndex++] = photo;
        }
        String frontCoverId = room.getFrontCoverPhoto().getUuid();
        System.out.println(frontCoverId);
        RoomPhoto[] photoArr= new RoomPhoto[4];
        int index = 0;
        for(int i = 0 ;i<arr.length;i++) {
           if(!(arr[i].getUuid().equals(frontCoverId))) {
                photoArr[index++] = arr[i];
           }
        }
       Arrays.sort(photoArr,new Comparator<RoomPhoto>() {
            public int compare(RoomPhoto o1, RoomPhoto o2) {
               return o1.getId().compareTo(o2.getId());
            }
        });
        System.out.println(photo1.getSize());
        System.out.println(photo2.getSize());
        System.out.println(photo3.getSize());
        System.out.println(photo4.getSize());
        if(frontCoverPhoto.getSize()!=0) {
            FileService.uploadPhoto(frontCoverId, frontCoverPhoto);            
        }
        if(photo1.getSize()!=0) {
            FileService.uploadPhoto(photoArr[0].getUuid(), photo1);            
        }
        if(photo2.getSize()!=0) {
            FileService.uploadPhoto(photoArr[1].getUuid(), photo2);            
        }
        if(photo3.getSize()!=0) {
            FileService.uploadPhoto(photoArr[2].getUuid(), photo3);            
        }
        if(photo4.getSize()!=0) {
            FileService.uploadPhoto(photoArr[3].getUuid(), photo4);            
        }
	    m.addAttribute("imgChangeState","修改成功!");
	    Account myaccount = (Account) m.getAttribute("myaccount");
        if(myaccount !=null) {
            m.addAttribute("room",room);
            
            List<RoomServe> serveList = roomServeService.findAll();
            serveList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("serveList",serveList);

            List<RoomDevice> deviceList = roomDeviceService.findAll();
            deviceList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("deviceList",deviceList);
            
            List<RoomRestrict> restrictList = roomRestrictService.findAll();
            restrictList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("restrictList",restrictList);
            
            List<RoomStatus> statusList = roomStatusService.findAll();
            statusList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("statusList",statusList);
            
            List<RoomType> typeList = roomTypeService.findAll();
            typeList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("typeList",typeList);
            
            List<City> cityList = cityService.findAll();
            cityList.sort((o1, o2) -> o1.getId()-o2.getId() );
            m.addAttribute("cityList",cityList);
            
            
            return "pages/userRoom/editRoom";
        }
          return "redirect:/login";
	}
	@GetMapping("/checkMap")
	public String testMap() {
		return"pages/room/checkMap";
	}
	
	@GetMapping("/userRooms")
	public String getUserRooms(Model m) {
		Account myaccount = (Account) m.getAttribute("myaccount");
		if(myaccount !=null) {
			List<Room> userRooms = roomService.findByOwnerId(myaccount.getId());
			m.addAttribute("userRooms", userRooms);
			List<RoomServe> serveList = roomServeService.findAll();
            serveList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("serveList",serveList);

            List<RoomDevice> deviceList = roomDeviceService.findAll();
            deviceList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("deviceList",deviceList);
            
            List<RoomRestrict> restrictList = roomRestrictService.findAll();
            restrictList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("restrictList",restrictList);
            
            List<RoomStatus> statusList = roomStatusService.findAll();
            statusList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
            m.addAttribute("statusList",statusList);
            
			return "/pages/room/userRooms";	
		}
		return "redirect:/login";
	}
	
	
	@PostMapping("/loadUserRooms")
	@ResponseBody
	public List<EditRoomDto> loadUserRooms(@RequestBody AccountDto account,Model m) {
	    Account myaccount = (Account) m.getAttribute("myaccount");
	    if(myaccount !=null) {
	        List<Room> userRooms = roomService.findByOwnerId(myaccount.getId());
	        ArrayList<EditRoomDto> rooms = new ArrayList<EditRoomDto>();
	        for(Room room :userRooms) {
	            EditRoomDto roomDto = new EditRoomDto(room);
	            rooms.add(roomDto);
	        }
	        return rooms;
	    }
	    return null;
	}
	@PostMapping("/editRoomStatus")
	@ResponseBody
	public EditRoomDto editRoomStatus(@RequestBody EditRoomDto editRoomDto,Model m) {
	    Long roomId =editRoomDto.getId();
	    Room room = roomService.findById(roomId);
	    if(room.getStatus().getId()!=3) {
	        RoomStatus enable = roomStatusService.findById(3);
	        room.setStatus(enable);
	        roomService.insert(room);
	    }else{
	        RoomStatus disable = roomStatusService.findById(1);
	        room.setStatus(disable);
	        roomService.insert(room);  
	    }
	    EditRoomDto roomDto = new EditRoomDto(room);
	    return roomDto;
	    
	}
	
	
	@GetMapping("/toEditPage")
	public String toEditPage(Model m,@RequestParam Long roomId) {
		Account myaccount = (Account) m.getAttribute("myaccount");
		if(myaccount !=null) {
			Room room = roomService.findById(roomId);
	
			m.addAttribute("room",room);
			
			List<RoomServe> serveList = roomServeService.findAll();
			serveList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("serveList",serveList);

			List<RoomDevice> deviceList = roomDeviceService.findAll();
			deviceList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("deviceList",deviceList);
			
			List<RoomRestrict> restrictList = roomRestrictService.findAll();
			restrictList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("restrictList",restrictList);
			
			List<RoomStatus> statusList = roomStatusService.findAll();
			statusList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("statusList",statusList);
			
			List<RoomType> typeList = roomTypeService.findAll();
			typeList.sort((o1, o2) -> -(o1.getId()-o2.getId()));
			m.addAttribute("typeList",typeList);
			
			List<City> cityList = cityService.findAll();
			cityList.sort((o1, o2) -> o1.getId()-o2.getId()	);
			m.addAttribute("cityList",cityList);
			
			
			return "pages/userRoom/editRoom";
		}
		  return "redirect:/login";
    }
	@GetMapping("/toEditPicturePage")
	public String toEditPicturePage(Model m,@RequestParam Long roomId) {
		    Account myaccount = (Account) m.getAttribute("myaccount");
		    if(myaccount !=null) {
		        Room room = roomService.findById(roomId);
		        m.addAttribute("room",room);
		          
		        return "pages/userRoom/editRoomPicture";
		    }
		
		    return "redirect:/login";
		}
	@PostMapping(value="/userEditRoom" , produces = "application/json;charset=UTF-8")
	public @ResponseBody EditRoomDto editRoom(@RequestBody EditRoomDto editRoom) {
	    Room room = roomService.findById(editRoom.getId());
	    
	    if(editRoom.getType()!=null) {
	        roomTypeService.editTypeById(room.getInformation(),editRoom.getType() );
	    }
	  
	    if(editRoom.getTitle()!=null) {
	        
	        room.getInformation().setTitle(editRoom.getTitle());
	    }
	    if(editRoom.getIntroduction()!=null) {
	      
	        room.getInformation().setIntroduction(editRoom.getIntroduction());
	    }
	    if(editRoom.getMaxPeopleCapacity()!=null) {
	        room.getInformation().setMaxPeopleCapacity(editRoom.getMaxPeopleCapacity());
	    }
	    if(editRoom.getMinPeopleCapacity()!=null) {
	    
	        room.getInformation().setMinPeopleCapacity(editRoom.getMinPeopleCapacity());
	    }
	    if(editRoom.getStatus()!=null) {
	        room.getStatus().getRooms().remove(room);
	        RoomStatus newStatus = roomStatusService.findById(editRoom.getStatus());
	        room.setStatus(newStatus);
	        newStatus.getRooms().add(room);
	    }
	    if(editRoom.getServe()!=null || editRoom.getDevice()!=null) {
	        roomServeService.editServeByIdArray(room, editRoom.getServe());
	        roomDeviceService.editDeviceByIdArray(room,editRoom.getDevice() );
	    }
	    if(editRoom.getRestrict()!=null) {
	        roomRestrictService.editRestrictByIdArray(room,editRoom.getRestrict() );
	    }
	    if(editRoom.getPrice()!=null) {
	        room.setPrice(editRoom.getPrice());
	    }
	    if(editRoom.getBedroomCount()!=null && editRoom.getBathroomCount()!=null || editRoom.getFloorMattressCount()!=null ||
	           editRoom.getDoubleSizeBedCount()!=null || editRoom.getSingleSizeBedCount()!=null) {
	        room.getInformation().setBedroomCount(editRoom.getBedroomCount());
	        room.getInformation().setBathroomCount(editRoom.getBathroomCount());
	        room.getInformation().setSingleSizeBedCount(editRoom.getSingleSizeBedCount());
	        room.getInformation().setDoubleSizeBedCount(editRoom.getDoubleSizeBedCount());
	        room.getInformation().setFloorMattressCount(editRoom.getFloorMattressCount());
	    }
	    if(editRoom.getCity()!=null && editRoom.getAddress()!=null && editRoom.getLatitude()!=null ||
	            editRoom.getLatitude()!=null) {
	        City myCity = cityService.findById(editRoom.getCity());
	        room.setAddress(myCity.getTitle()+editRoom.getAddress());
	        room.getInformation().setLatitude(editRoom.getLatitude());
	        room.getInformation().setLongitude(editRoom.getLongitude());
	        cityService.editCityByCityId(room, editRoom.getCity());
	        editRoom.setAddress(myCity.getTitle()+editRoom.getAddress());
	    }
	    roomService.insert(room);
	    return editRoom;
	}
	@PostMapping(value="/editRooms" , produces = "application/json;charset=UTF-8")
	public @ResponseBody EditRoomsDto editRooms(@RequestBody EditRoomsDto editRooms ) {
	    
	    for(Long id : editRooms.getIds()) {
	        Room room = roomService.findById(id);
	        if(editRooms.getStatus()!=null) {
	            room.getStatus().getRooms().remove(room);
	            RoomStatus newStatus = roomStatusService.findById(editRooms.getStatus());
	            editRooms.setStatusTitle(newStatus.getTitle());
	            room.setStatus(newStatus);
	            newStatus.getRooms().add(room);
	        }
	        if(editRooms.getServe()!=null) {
	            roomServeService.editServeByIdArray(room, editRooms.getServe());
	        }
	        if(editRooms.getRestrict()!=null) {
	            roomRestrictService.editRestrictByIdArray(room,editRooms.getRestrict() );
	        }
	        if(editRooms.getDevice()!=null) {
	            roomDeviceService.editDeviceByIdArray(room,editRooms.getDevice() );
	        } 
	        roomService.insert(room);	        
	    }
	    return editRooms;
	}
	
}
