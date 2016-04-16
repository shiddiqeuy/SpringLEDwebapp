<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
                <title>OpenAPI Map Test - Draggable Marker 테스트 </title>
                <style>v\:* { behavior: url(#default#VML); }</style>
                <!-- prevent IE6 flickering -->
                <script type="text/javascript">
                        try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
                </script>
                <script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId={Ooru3pcpK4NJIFnvouaj}"></script>
<title>OpenAPI Map Test - Draggable Marker 테스트 </title>
</head>
<body>
<div id = "testMap" style="border:1px solid #000; width:700px; height:400px; margin:20px; display:block;"></div>
 <script type="text/javascript">
                        var oPoint = new nhn.api.map.LatLng(37.5010226, 127.0396037);
                        var oPoint2 = new nhn.api.map.LatLng(37.5055226, 127.0452037);
                        nhn.api.map.setDefaultPoint('LatLng');
                        oMap = new nhn.api.map.Map('testMap', {
                                                center : oPoint,
                                                level : 10, // - 초기 줌 레벨은 10이다.
                                                enableWheelZoom : true,
                                                enableDragPan : true,
                                                enableDblClickZoom : false,
                                                mapMode : 0,
                                                activateTrafficMap : false,
                                                activateBicycleMap : false,
                                                activateRealtyMap : true,
                                                minMaxLevel : [ 1, 14 ],
                                                size : new nhn.api.map.Size(500, 400)
                        });

                        var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
                        mapZoom.setPosition({left:80, bottom:40}); // - 줌 컨트롤 위치 지정.
                        oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
                        
                        var oSize = new nhn.api.map.Size(28, 37);
                        var oOffset = new nhn.api.map.Size(14, 37);
                        var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

                        // - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
                        // - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
                        // - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.
                        var testdefaultSpriteIcon = {
                                        url:"http://static.naver.com/maps2/icons/pin_api2.png", 
                                        size:{width:19, height:24},
                                        spriteSize:{width:190, height:96},
                                        imgOrder:0, 
                                        offset : {width: 10, height: 24}
                        };
                        // - 위에서 지정한 기본값을 이용해 실제로 SpriteIcon 을 생성한다.
                        var testDupSpriteIcon_first = new nhn.api.map.SpriteIcon(testdefaultSpriteIcon.url, testdefaultSpriteIcon.size, testdefaultSpriteIcon.spriteSize, 0, testdefaultSpriteIcon.offset); 

                        var DraggableMarker = new nhn.api.map.DraggableMarker(testDupSpriteIcon_first , {       
                                title : 'first row image',
                                point : oPoint,
                                zIndex : 1,
                                smallSrc :  testDupSpriteIcon_first});          
                        oMap.addOverlay(DraggableMarker);
                        
                        var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성.
                        mapInfoTestWindow.setVisible(false); // - infowindow 표시 여부 지정.
                        oMap.addOverlay(mapInfoTestWindow);     // - 지도에 info window를 추가한다.      
                        
                        oMap.attach('click', function(oCustomEvent) {
                                var oPoint = oCustomEvent.point;
                                var oTarget = oCustomEvent.target;
                                mapInfoTestWindow.setVisible(false);
                                // 마커를 클릭했을 때.
                                if (oTarget instanceof nhn.api.map.DraggableMarker) {
                                        // 겹침 마커를 클릭했을 때.
                                        if (oCustomEvent.clickCoveredMarker) {
                                                return;
                                        }
                                        mapInfoTestWindow.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
                                                        '<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
                                                        'Hello World <br /> ' + oTarget.getPoint()
                                                        +'<span></div>');
                                        mapInfoTestWindow.setPoint(oTarget.getPoint());
                                        mapInfoTestWindow.setVisible(true);
                                        mapInfoTestWindow.autoPosition();
                                        return;
                                }
                        });
                        
                        var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언
                        oMap.addOverlay(oLabel); // - 마커 라벨을 지도에 추가한다. 기본은 라벨이 보이지 않는 상태로 추가됨.

                        oMap.attach("mouseenter", function(oEvent){
                                var oTarget = oEvent.target;
                                if(oTarget instanceof nhn.api.map.DraggableMarker){
                                        oLabel.setVisible(true, oTarget); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
                                }
                        });
                        
                        oMap.attach("mouseleave", function(oEvent) {
                                var oTarget = oEvent.target;
                                if(oTarget instanceof nhn.api.map.DraggableMarker){
                                        oLabel.setVisible(false);
                                }
                        });
                        /*
                        * draggable marker 의 자체 이벤트로 changePosition 이 있다.
                        * 이 이벤트는, 사용자가 drag 를 이용해 마커의 위치를 옮길 때 발생한다.
                        * oEvent 의 파라미터는 두 개로, oldPoint 와 newPoint 이다.
                        * oldPoint 는 drag 하기 전의 마커 위치이며, newPoint 는 drag 한 이후의 마커 위치가 된다..
                        */
                        DraggableMarker.attach("changePosition" , function (oEvent) {
                                if(mapInfoTestWindow.getVisible() != false){
                                        mapInfoTestWindow.setVisible(false); // - infowindow 의 표시 여부 지정.
                                        // - infoWindow 의 내용은 사용자가 임의로 지정할 수 있습니다. 단 HTML 로 지정을 하셔야 합니다. 
                                        mapInfoTestWindow.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
                                                        '<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
                                                        'Hello World <br /> ' + oEvent.newPoint
                                                        +'<span></div>');
                                        mapInfoTestWindow.setPoint(oEvent.newPoint);
                                        mapInfoTestWindow.setVisible(true);
                                        mapInfoTestWindow.autoPosition();
                                }
                        });
  </script>


</body>
</html>