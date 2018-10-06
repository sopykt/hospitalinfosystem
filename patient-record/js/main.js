var app = angular.module("myApp",["ngRoute"]);

app.config(function($routeProvider) {
     
    $routeProvider
    .when("/", {
        templateUrl : "register.html"
    })
	.when("/login", {
        templateUrl : "index_login.html"
    })
	.when("/register", {
        templateUrl : "register.html"
    })
	.when("/register_doctor", {
        templateUrl : "register_doctor.html"
    })
    .when("/register_patient", {
        templateUrl : "register_patient.html"
    })
	.when("/registerp", {
        templateUrl : "registerp.html"
    })
	.when("/appointmentlst", {
        templateUrl : "appointmentlst.html"
    })
	.when("/treatment", {
        templateUrl : "treatment.html"
    })
	.when("/pharmacy", {
        templateUrl : "pharmacy.html"
    })
	.when("/patientrecord", {
        templateUrl : "patientrecord.html"
    })
});

app.value("mainurl","http://localhost/prs_backend/");
 app.run(['$rootScope', '$location' , '$window' , 'Auth', function ($rootScope, $location, $window, Auth) {
    $rootScope.uname = "test_user";
	console.log("here is authanticaction");
    $rootScope.$on('$routeChangeStart', function (event) {
        Auth.isLoggedIn().then(function(data){
                console.log("promise data " + data);
                loggedin = data;
                console.log("promise data2 " + loggedin);
                if (!data) {
                    console.log('DENY');
                        console.log($location.path());
                        //event.preventDefault();
                        $location.path('/login');
						//$window.location.href = 'index.html';
                        $('#navlogin').show();
						$('#userdropdown').hide();
						$('#navuser').hide();       
						$('#navdoctor').hide();
						$('#navpharm').hide();
						$('#navstaff').hide();
                }
                else {                    
                    console.log('ALLOW');
                    console.log(Auth.getuser());//urid
                    console.log( Auth.geturname());
                    console.log(Auth.getemail());
                    $rootScope.name = Auth.getuser();
                    $rootScope.uid = Auth.getuid();
                    $rootScope.urid = Auth.geturid();
					$rootScope.userrole = Auth.geturname();
					$rootScope.email = Auth.getemail();
                    $('#navlogin').hide();
					$('#userdropdown').show();
					console.log ($rootScope.urid);
					if ($rootScope.urid == 1){
						$('#navuser').show();
					}
					if ($rootScope.urid == 2){
						$('#navdoctor').show();
					}
					if ($rootScope.urid == 3){
						$('#navpharm').show();
					}
					if ($rootScope.urid == 5){
						$('#navstaff').show();
					}
						
				}
            }); 
    });
}]); 
app.factory('Auth', function($http,$q){
var user;
var uid;
var urid;
var urname;
var uemail;

return{
    setUser : function(aUser,auid,aurid,aurname,aemail){
		console.log('sessionset.php?uname=' + aUser + '&uid=' + auid + '&urid=' + aurid + '&urname=' + aurname + '&email=' + aemail);
        user = aUser;
        uid = auid;
        urid = aurid;
		urname = aurname;
		uemail = aemail
        return $http.get('sessionset.php?uname=' + aUser + '&uid=' + auid + '&urid=' + aurid + '&urname=' + aurname + '&email=' + aemail).then(function(result) {       
            return result.data; 
        });
    },
    getuser : function(){
        return user;
    },
    getuid : function(){
        return uid;  
    },
    geturid : function(){
        return urid;  
    },
	geturname : function(){
        return urname;  
    },
	getemail : function(){
        return uemail;  
    },
    logout : function(){
        return $http.get('sessiondestroy.php').then(function(result) { 
            console.log("session destroy" + result.data);
            return result.data; 
        });
    },
    isLoggedIn : function(){
        var deferred = $q.defer();
		console.log("it's log in");
        deferred.resolve(
            $http.get('sessioncheck.php').then(function(result) {      
            //return result.data; 
            console.log(result.status);
			var response = result.data;
			if(response.status == 'success'){
				user = response.uname;
				uid = response.uid;
				urid = response.urid;
				urname = response.urname;
				uemail = response.uemail;
				return true;
			}
			else{
				return false;
			}
            /* var response = result.data;
            user = response.uname;
            uid = response.uid;
            urid = response.urid;
            console.log(response.uname);
            console.log(response.uid); */
            //return(response.uname)? response.uname : false;
            //return(user)? true : false;
            //return false;
        }));
        //return(user)? user : false;
        return deferred.promise;
    }
  }
});

app.controller('loginCtrl', function($scope, $http, $location,Auth,mainurl,$window) {
    console.log(mainurl);
    //$http.get("http://localhost:8000/user/login?email=admin2@mail.com&password=admin2")
    $scope.loginFunction = function() {
        console.log(mainurl + "user/login.php?e="+ $scope.email +"&p=" +$scope.password );
        $http({
		method : "GET",
		url : mainurl + "user/login.php?e="+ $scope.email +"&p=" +$scope.password 
			}).success(function(data, status, header, config) {
            $scope.myWelcome = status + data.status + '-' + data.message;
			 if (data.id == null){
					  var errmsg = document.getElementById('message');
                      errmsg.innerHTML = "<b>" + "Somethings Wrong!" + "</b>"
					  errmsg.style.display = '';
				  }
				  else{
                      console.log(data.name);
                      console.log(data.id);
                      Auth.setUser(data.name,data.id,data.role,data.role_name,data.email);
					  if(data.role == 1)
						$location.path('/register');
					if(data.role == 2)
						$location.path('/appointmentlst');
					if(data.role == 3)
						$location.path('/pharmacy');
					if(data.role == 5)
						$location.path('/register');
					  	
					  
					  //$window.location.href = 'form-basic.html';
					  //userrole = data.role;
					  //$window.location.href = 'index_chat.php?uname=' + data.username + '&' + 'urole=' + data.role;
				  }
			}).error ( function (data, status, header, config) {
			  //$scope.myStatus = status;
			  //$scope.myWelcome = 'ERROR';
            $scope.myWelcome = status + data;
		});
    }
})
.controller('logoutCtrl',function($scope, $http, $location,$window,Auth){
    $scope.logoutFunction = function() {
        console.log ('here logout');
        Auth.logout();
        $location.path('/');
        $('#navlogin').show();
		$('#userdropdown').hide();
		$('#navuser').hide();       
		$('#navdoctor').hide();
		$('#navpharm').hide();
		$('#navstaff').hide();
        $window.location.reload();
    }    
})
.controller('registerCtrl', function($scope, $http, $location,$window,mainurl){
	$http({
		  method : "GET",
		  url : mainurl + "user/read.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.user_lst = data.records;
			console.log($scope.user_lst);
        }).error ( function (data, status, header, config) {
		});
		
	$http({
		  method : "GET",
		  url : mainurl + "patient/read.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.patient_lst = data.records;
        }).error ( function (data, status, header, config) {
		});
		
	$http({
		  method : "GET",
		  url : mainurl + "doctor/read.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.doctor_lst = data.records;
        }).error ( function (data, status, header, config) {
		});
		
	$scope.editFunction=function(uid){
		document.getElementById('userlst').style.display='none';
		document.getElementById('userinfo').style.display='';
		id =$scope.user_lst.findIndex(el => el.id === uid);
		
		$scope.uid = uid;
		$scope.username = $scope.user_lst[id].name;
		$scope.useremail = $scope.user_lst[id].email;
		$scope.phone = $scope.user_lst[id].phone;
		$scope.gender = $scope.user_lst[id].gender;
		var dobdate = new Date($scope.user_lst[id].dob);
		    dobdate.setDate(dobdate.getDate() );
            $scope.dob =dobdate;
		//$scope.dob = $scope.user_lst[id].dob;
		$scope.address = $scope.user_lst[id].address;
		$scope.roleselected = $scope.user_lst[id].role;
		$scope.password = "test";
		
		console.log($scope.user_lst[id].phone);
	}
	
	$scope.editpatientFunction=function(pid){
		document.getElementById('patientlst').style.display='none';
		document.getElementById('patientinfo').style.display='';
		id =$scope.patient_lst.findIndex(el => el.pid === pid);
		
		$scope.pid = pid;
		$scope.uid = $scope.patient_lst[id].uid;
		$scope.username = $scope.patient_lst[id].name;
		$scope.phone = $scope.patient_lst[id].phone;
		$scope.gender = $scope.patient_lst[id].gender;
		var dobdate = new Date($scope.patient_lst[id].dob);
		    dobdate.setDate(dobdate.getDate() );
            $scope.dob =dobdate;
		$scope.address = $scope.patient_lst[id].address;
		$scope.bloodtype = $scope.patient_lst[id].bloodtype;
		$scope.weight = $scope.patient_lst[id].weight;
		$scope.height = $scope.patient_lst[id].height;
		
	}
	
	$scope.editdoctorFunction=function(did){
		$scope.did = 0;
		$scope.uid = 0;
		document.getElementById('doctorlist').style.display='none';
		document.getElementById('doctorinfo').style.display='';
		id =$scope.doctor_lst.findIndex(el => el.did === did);
		
		$scope.did = did;
		$scope.uid = $scope.doctor_lst[id].uid;
		$scope.username = $scope.doctor_lst[id].name;
		$scope.phone = $scope.doctor_lst[id].phone;
		$scope.useremail = $scope.doctor_lst[id].email;
		$scope.gender = $scope.doctor_lst[id].gender;
		var dobdate = new Date($scope.doctor_lst[id].dob);
		    dobdate.setDate(dobdate.getDate() );
            $scope.dob =dobdate;
		$scope.address = $scope.doctor_lst[id].address;
		$scope.degree = $scope.doctor_lst[id].degree;
		$scope.special = $scope.doctor_lst[id].speciality;
		$scope.remark = $scope.doctor_lst[id].remark;
		$scope.day0 = ($scope.doctor_lst[id].day0 == 1)? true:false;
		$scope.day1 = ($scope.doctor_lst[id].day1 == 1)? true:false;
		$scope.day2 = ($scope.doctor_lst[id].day2 == 1)? true:false;
		$scope.day3 = ($scope.doctor_lst[id].day3 == 1)? true:false;
		$scope.day4 = ($scope.doctor_lst[id].day4 == 1)? true:false;
		$scope.day5 = ($scope.doctor_lst[id].day5 == 1)? true:false;
		$scope.day6 = ($scope.doctor_lst[id].day6 == 1)? true:false;
		//moment($scope.stime).format('HH:mm:ss')
		//$scope.stime = moment($scope.doctor_lst[id].stime);
		//$scope.etime = moment($scope.doctor_lst[id].etime);
		document.getElementById('appt-stime').value = $scope.doctor_lst[id].stime;
		document.getElementById('appt-etime').value = $scope.doctor_lst[id].etime;
		$scope.password = "test";
	}
	
	
	$scope.regFunction = function() {
        console.log($scope.name);
        console.log($scope.email);
        console.log($scope.phone);
        console.log($scope.roleselected);
        console.log($scope.dob);
        console.log($scope.address);
        console.log($scope.gender);
        console.log($scope.password);
        console.log($scope.uid);
        
        var dobdate = new Date($scope.dob);
		if($scope.uid == 0)
			dobdate.setDate(dobdate.getDate() +parseInt(1));
		else
			dobdate.setDate(dobdate.getDate());
        console.log('{"id":'+$scope.uid+' ,"name":'+$scope.username+',"email":'+$scope.useremail+',"phone":'+$scope.phone+',"gender":'+$scope.gender+',"dob":'+$scope.dob+',"address":'+$scope.address+',"password":'+$scope.password+',"role":'+$scope.roleselected+'}');
        $http({
		  method : "Post",
		  url : mainurl + "user/create.php",
		  data : {"id":$scope.uid ,"name":$scope.username,"email":$scope.useremail,"phone":$scope.phone,"gender":$scope.gender,"dob":dobdate,"address":$scope.address,"password":$scope.password,"role":$scope.roleselected} ,			
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			if (data.message == 'success'){
				console.log(data.message); 
                $window.location.reload();
			}
			else  {
				console.log(data.message);
			}
			
			console.log(data.message);
        }).error ( function (data, status, header, config) {
			  $scope.myStatus = status;
			  $scope.myWelcome = 'ERROR';
		});
    }
	
	$scope.regdoctorFunction = function() {
        console.log($scope.name);
        console.log($scope.email);
        console.log($scope.phone);
        console.log($scope.dob);
        console.log($scope.address);
        console.log($scope.gender);
        console.log($scope.password);
        console.log($scope.uid);
		console.log(moment($scope.stime).format('HH:mm:ss'));
		console.log(moment($scope.etime).format('HH:mm:ss'));
		$scope.day0 = ($scope.day0)? 1:0;
		$scope.day1 = ($scope.day1)? 1:0;
		$scope.day2 = ($scope.day2)? 1:0;
		$scope.day3 = ($scope.day3)? 1:0;
		$scope.day4 = ($scope.day4)? 1:0;
		$scope.day5 = ($scope.day5)? 1:0;
		$scope.day6 = ($scope.day6)? 1:0;
        
        var dobdate = new Date($scope.dob);
		if($scope.uid == 0)
			dobdate.setDate(dobdate.getDate() +parseInt(1));
		else
			dobdate.setDate(dobdate.getDate());
        
			$http({
		  method : "Post",
		  url : mainurl + "doctor/create.php",
		  data : {'id':$scope.uid,'did':$scope.did,'name':$scope.username,'email':$scope.useremail,'phone':$scope.phone,'gender':$scope.gender,'dob':dobdate,'address':$scope.address,"password":$scope.password,"role":2,
					'degree':$scope.degree,'speciality':$scope.special,'remark':$scope.remark,'day0':$scope.day0,'day1':$scope.day1,'day2':$scope.day2,'day3':$scope.day3,'day4':$scope.day4,'day5':$scope.day5,'day6':$scope.day6,
					'stime':moment($scope.stime).format('HH:mm:ss'),'etime':moment($scope.etime).format('HH:mm:ss')},
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			if (data.message == 'success'){
				console.log(data.message); 
                $window.location.reload();
			}
			else  {
				console.log(data.message);
			}
			
			console.log(data.message);
        }).error ( function (data, status, header, config) {
			  $scope.myStatus = status;
			  $scope.myWelcome = 'ERROR';
		});
    }
	
	$scope.deleteFunction = function(uid){
		$http({
		  method : "GET",
		  url : mainurl + "user/delete.php?id=" + uid,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			if (data.message == 'success'){
				$window.location.reload();
			}
        }).error ( function (data, status, header, config) {
		});
	}
	
	$scope.deletepatientFunction = function(uid,pid){
		$http({
		  method : "GET",
		  url : mainurl + "patient/delete.php?id=" + uid + "&pid=" +pid,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			if (data.message == 'success'){
				$window.location.reload();
			}
        }).error ( function (data, status, header, config) {
		});
	}
	
	$scope.deletedoctorFunction = function(uid,did){
		console.log(uid);
		console.log(did);
		$http({
		  method : "GET",
		  url : mainurl + "doctor/delete.php?uid=" + uid + "&did=" +did,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			if (data.message == 'success'){
				$window.location.reload();
			}
        }).error ( function (data, status, header, config) {
		});
	}
	
	$scope.regpatientFunction = function() {
        console.log($scope.name);
        console.log($scope.email);
        console.log($scope.phone);
        console.log($scope.dob);
        console.log($scope.address);
        console.log($scope.gender);
        console.log($scope.uid);
        
        var dobdate = new Date($scope.dob);
		if($scope.pid == 0)
			dobdate.setDate(dobdate.getDate() +parseInt(1));
		else
			dobdate.setDate(dobdate.getDate());
        console.log("{'id':0,'pid':0,'name':'"+$scope.username+"','email':'"+$scope.useremail+"','phone':'"+$scope.phone+"','gender':'"+$scope.gender+"','dob':'"+dobdate+"','address':'"+$scope.address+"','password':'','role':6," +
					"'bloodtype':'"+$scope.bloodtype+"','weight':'"+$scope.weight+"','height':'"+$scope.height+"'}");
			$http({
		  method : "Post",
		  url : mainurl + "patient/create.php",
		  data : {"id":$scope.uid,"pid":$scope.pid,"name":$scope.username,"email":"","phone":$scope.phone,"gender":$scope.gender,"dob":dobdate,"address":$scope.address,"password":"","role":6,
					"bloodtype":$scope.bloodtype,"weight":$scope.weight,"height":$scope.height},
		  /* {'id':0,'pid':0,'name':$scope.username,'email':$scope.useremail,'phone':$scope.phone,'gender':$scope.gender,'dob':dobdate,'address':$scope.address,'password':"",'role':6,
					'bloodtype':$scope.bloodtype,'weight':$scope.weight,'height':$scope.height}, */
				
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			if (data.message == 'success'){
				console.log(data.message);
				if ($scope.pid ==0){
					document.getElementById('patientinfo').style.display='none';
					document.getElementById('patientcode').style.display='';
					$scope.p_code = data.code;
					$scope.p_name = $scope.username;
					$scope.dob =moment( new Date($scope.dob)).format('MMM D, YYYY');
				}
				else{
					$window.location.reload();
				}
			}
			else  {
				console.log(data.message);
			}
			
			console.log(data.message);
        }).error ( function (data, status, header, config) {
			  $scope.myStatus = status;
			  $scope.myWelcome = 'ERROR';
		});
    }
	
	$scope.cancelFunction = function(){
		$window.location.reload();
	}
	
})
.controller('patientCtrl', function($scope, $http, $location,$window,mainurl){
	var code=[];
	var name=[];
	$http({
		  method : "GET",
		  url : mainurl + "patient/readcode.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			for (i = 0; i < data.records.length; i++) {
				code.push(data.records[i].code);
			}
        }).error ( function (data, status, header, config) {
		});
	autocomplete(document.getElementById("myInput"), code, $http);
	
	$http({
		  method : "GET",
		  url : mainurl + "doctor/readname.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.doctorlst = data.records;
        }).error ( function (data, status, header, config) {
	});
	
	$scope.gopatientform = function(){
		console.log("here is go to next");
		$location.path('/register_patient');
	}
	
	$scope.goappointment = function(){
		$location.path('/appointmentlst');
	}
	
	var day0,day1,day2,day3,day4,day5,day6 = 0;
	$scope.doctorchange = function(){
		console.log($scope.doctorselect);
		$http({
			  method : "GET",
			  url : mainurl + "doctor/read_one.php?id=" + $scope.doctorselect,
			  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
			}).success(function(data, status, header, config) {
				$scope.dname = data.name;
				$scope.degree = data.degree;
				$scope.special = data.speciality;
				$scope.dphone = data.phone;
				var dtime = (data.day0==1)? "Sun-" : "";
				day0=(data.day0==1)? 1:0;
				dtime += (data.day1==1)? "Mon-" : "";
				day1=(data.day1==1)? 1:0;
				dtime += (data.day2==1)? "Tue-" : "";
				day2=(data.day2==1)? 1:0;
				dtime += (data.day3==1)? "Wed-" : "";
				day3=(data.day3=1)? 1:0;
				dtime += (data.day4==1)? "Thur-" : "";
				day4=(data.day4=1)? 1:0;
				dtime += (data.day5==1)? "Fri-" : "";
				day5=(data.day5==1)? 1:0;
				dtime += (data.day6==1)? "Sat-" : "";
				day6=(data.day6==1)? 1:0;
				console.log (dtime);
				dtime = dtime + "(" + moment(data.stime, 'HH:mm:ss').format('hh:mm A') + "-" +  moment(data.etime, 'HH:mm:ss').format('hh:mm A') + ")";
				$scope.dtime = dtime;
				
			}).error ( function (data, status, header, config) {
		});
	}
	
	$scope.appointmentFunction = function(){
		console.log(document.getElementById('pid').value);
		$scope.pid = document.getElementById('pid').value;
		var tday = false;
		switch (new Date().getDay()) {
			case 0:
				tday = (day0 == 1)? true:false;
				break;
			case 1:
				tday = (day1 == 1)? true:false;
				break;
			case 2:
				tday = (day2 == 1)? true:false;
				break;
			case 3:
				tday = (day3 == 1)? true:false;
				break;
			case 4:
				tday = (day4 == 1)? true:false;
				break;
			case 5:
				tday = (day5 == 1)? true:false;
				break;
			case 6:
				tday = (day6 == 1)? true:false;
		}
		if (!tday){
			$scope.message = "Can't appoint today.";
		}
		else{
			//var ttime = new Date();
			//console.log (moment(ttime).format('YYYY-mm-dd HH:mm:ss'));
			$http({
				  method : "Post",
				  url : mainurl + "booking/create.php",
				  data : {"bid":0,"did":$scope.doctorselect,"pid":$scope.pid},
				  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
			}).success(function(data, status, header, config) {
				if (data.message == 'success'){
					console.log(data.message); 
					$window.location.reload();
				}
				else  {
					console.log(data.message);
				}
				}).error ( function (data, status, header, config) {
					  $scope.myStatus = status;
					  $scope.myWelcome = 'ERROR';
				});
		}
	}
})
.controller('appointmentCtrl',function($scope,$rootScope, $http, $location,$window,Auth,mainurl){
	var today = new Date();
	$scope.tdate = today;
	var uid = $rootScope.uid;
	if ($rootScope.urid==2){
		$('#cbodoctor').hide();
		str_url = '';
		console.log($rootScope.urid);
	}
	else{
		$('#cbodoctor').show();
		uid = 0;
		str_url = "&did=" + $scope.doctorselect;
	}
	
	console.log(formatDate(today));
	console.log(mainurl + "booking/read.php?stime=" + formatDate(today)+"&uid=" + uid);
	//today = moment(today).format('YYYY-MM-DD');
	$http({
		  method : "GET",
		  url : mainurl + "booking/read.php?stime=" + formatDate(today)+"&uid=" + uid,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.applst = data.records;
        }).error ( function (data, status, header, config) {
		});
	
	$http({
		  method : "GET",
		  url : mainurl + "doctor/readname.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.doctorlst = data.records;
        }).error ( function (data, status, header, config) {
	});
	
	$scope.search = function(){
		var today;
		today = new Date($scope.tdate);
		if ($rootScope.urid==2){
			str_url = '';
		}
		else{
			str_url = "&did=" + $scope.doctorselect;
		}
		
		console.log(mainurl + "booking/read.php?stime=" + formatDate(today)+"&uid=" + uid + str_url);
		console.log($scope.tdate);
		//today = moment(today).format('YYYY-MM-DD');
		$http({
		  method : "GET",
		  url : mainurl + "booking/read.php?stime=" + formatDate(today)+"&uid=" + uid + str_url,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.applst = data.records;
        }).error ( function (data, status, header, config) {
		});
	}
})
.controller('treatmentCtrl',function($scope,$rootScope, $http, $location,$window,Auth,mainurl){
	var code = [];
	var today = new Date();
	console.log(mainurl + "booking/read.php?stime="+formatDate(today)+"&uid=" + $rootScope.uid);
		$http({
		  method : "GET",
		  //url : mainurl + "booking/read.php?stime="+today+"&did=" + $scope.doctorselect,
		  url : mainurl + "booking/read.php?stime="+formatDate(today)+"&uid=" + $rootScope.uid,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			for (i = 0; i < data.records.length; i++) {
				code.push(data.records[i].code);
			}
        }).error ( function (data, status, header, config) {
		});
	autocomplete(document.getElementById("myInput"), code, $http);
	
	$scope.treatFunction = function(){
		console.log(document.getElementById('pid').value);
		$scope.pid = document.getElementById('pid').value;
		
		console.log('{"tid":0,"uid":'+$rootScope.uid+',"pid":'+$scope.pid+',"history":'+$scope.history+',"treatment":'+$scope.treatment+',"issuepharm":0}');
		
		$http({
			method : "Post",
			url : mainurl + "doctor/treatment.php",
			data : {"tid":0,"uid":$rootScope.uid,"pid":$scope.pid,"history":$scope.history,"treatment":$scope.treatment,"issuepharm":0},
			headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
		}).success(function(data, status, header, config) {
			if (data.message == 'success'){
				console.log(data.message); 
				$window.location.reload();
			}
			else  {
				console.log(data.message);
			}
		}).error ( function (data, status, header, config) {
			$scope.myStatus = status;
			$scope.myWelcome = 'ERROR';
		});
		
	}
	
	$scope.cancelFunction = function(){
		$window.location.reload();
	}
})
.controller('pharmacyCtrl',function($scope,$rootScope, $http, $location,$window,Auth,mainurl){
	
	//var code = [];
	var treat = [];
	var pid = [];
	var tid = [];
	$scope.tid = 0;
	
	var today = new Date();
	$scope.tdate = today;
	var status = $('#singleSelect').val();
	console.log (status);
	console.log (mainurl + "patient/readforpharm.php?stime=" + formatDate(today)+"&status=" + status);
	//today = moment(today).format('YYYY-MM-DD');
		$http({
		  method : "GET",
		  //url : mainurl + "booking/read.php?stime="+today+"&did=" + $scope.doctorselect,
		  url : mainurl + "patient/readforpharm.php?stime=" + formatDate(today)+"&status=" + status,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.issuelist = data.records;
        }).error ( function (data, status, header, config) {
		});
		
	var code=[];
	var name=[];
	$http({
		  method : "GET",
		  url : mainurl + "patient/readcode.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			for (i = 0; i < data.records.length; i++) {
				code.push(data.records[i].code);
			}
        }).error ( function (data, status, header, config) {
		});
	autocomplete(document.getElementById("myInput"), code, $http);
	
	$scope.search = function(){
		if ($('#singleSelect').val() == 1){
			$('#btnissue').hide();
		}
		else{
			$('#btnissue').show();
		}
		today = new Date ($scope.tdate);
		var pid = (document.getElementById('pid').value)?document.getElementById('pid').value:0;
		status = $('#singleSelect').val();
		console.log(mainurl + "patient/readforpharm.php?stime=" + formatDate(today) + "&pid=" + pid +"&status=" + status);
		$http({
		  method : "GET",
		  //url : mainurl + "booking/read.php?stime="+today+"&did=" + $scope.doctorselect,
		  url : mainurl + "patient/readforpharm.php?stime=" + formatDate(today) + "&pid=" + pid +"&status=" + status,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.issuelist = data.records;
        }).error ( function (data, status, header, config) {
		});
	}
	
	
	$scope.searchFunction = function(tid){
		$scope.tid = tid;
		document.getElementById('patientlst').style.display = 'none';
		document.getElementById('issueinfo').style.display = '';
		id =$scope.issuelist.findIndex(el => el.tid === tid);
		$scope.tdate = $scope.issuelist[id].tdate;
        $scope.code = $scope.issuelist[id].code;
		$scope.pname = $scope.issuelist[id].name;
		$scope.dob = $scope.issuelist[id].dob;
		$scope.dname = $scope.issuelist[id].dname;
		$scope.treatment = $scope.issuelist[id].treatment;
	}
	
	$scope.cancelFunction = function(){
		$window.location.reload();
	}
	
	$scope.issueFunction = function(){
		$http({
			method : "Post",
			url : mainurl + "doctor/issue.php",
			data : {"tid":$scope.tid},
			headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
		}).success(function(data, status, header, config) {
			if (data.message == 'success'){
				console.log(data.message); 
				$window.location.reload();
			}
			else  {
				console.log(data.message);
			}
		}).error ( function (data, status, header, config) {
			$scope.myStatus = status;
			$scope.myWelcome = 'ERROR';
		});
	}
})
.controller('patientrecordCtrl',function($scope,$rootScope, $http, $location,$window,Auth,mainurl){
	var code =[];
	$http({
		  method : "GET",
		  url : mainurl + "patient/readcode.php",
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			for (i = 0; i < data.records.length; i++) {
				code.push(data.records[i].code);
			}
        }).error ( function (data, status, header, config) {
		});
	autocomplete(document.getElementById("myInput"), code, $http);
	
	$scope.viewFunction = function(){
		console.log(document.getElementById('pid').value);
		$scope.pid = document.getElementById('pid').value;
		
		document.getElementById('patientcode').style.display = 'none';
		document.getElementById('patientrecord').style.display = '';
		
		$http({
		  method : "GET",
		  //url : mainurl + "booking/read.php?stime="+today+"&did=" + $scope.doctorselect,
		  url : mainurl + "patient/patientrecord.php?pid=" + $scope.pid,
		  headers:{'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
        }).success(function(data, status, header, config) {
			console.log (data.records);
			$scope.code = data.records[0].code;
			$scope.pname = data.records[0].name;
			$scope.dob = data.records[0].dob;
			$scope.gender = (data.records[0].gender==0)?'Male':'Female';
			$scope.address = data.records[0].address;
			$scope.phone = data.records[0].phone;
			$scope.bloodtype = data.records[0].bloodtype;
			$scope.weight = data.records[0].weight;
			$scope.height = data.records[0].height;
			$scope.patientrec = data.records;
        }).error ( function (data, status, header, config) {
		});
	}
});
 function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}