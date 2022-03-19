<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="harita.aspx.cs" Inherits="yazlab2._1.harita" %>

<!DOCTYPE html>
<html>
<head>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="https://api-maps.yandex.ru/2.1/?apikey==2ed6d8b1-de0a-4782-98c0-d20ced6ca7c1&lang=tr_TR" type="text/javascript">
    </script>
       </script>
    <script type="text/javascript">
        ymaps.ready(init);
        function init() {
            var myMap = new ymaps.Map("map", {
                center: [59.37518817, 18.01655491],
                zoom: 7
            }, {
                searchControlProvider: 'yandex#search'
            }),

                // Creating a geo object with the "Point" geometry type.
                myGeoObject = new ymaps.GeoObject({
                    /**
                     * Options.
                     * The placemark's icon will stretch to fit its contents.
                     */
                    preset: 'islands#blackStretchyIcon',
                    // The placemark can be dragged.
                    draggable: true
                });


     
            var data = document.getElementById('<%=HiddenField1.ClientID%>').value;
            const x = data.replaceAll(",", ".");
            const myArrayx = x.split(" ");
            var data = document.getElementById('<%=HiddenField2.ClientID%>').value;
            const y = data.replaceAll(",", ".");
            const myArrayy = y.split(" ");
            //const myArrayx=[37.5080508];
            //const myArrayy=[33.9787605];
            for (var i = 0; i < myArrayx.length; i++) {
               // alert(myArrayx[i]);
                myMap.geoObjects
                    .add(new ymaps.Placemark([parseFloat(myArrayx[i]), parseFloat(myArrayy[i])], {
                        balloonContent: '' + myArrayx[i] + ' ' + myArrayy[i]
                    }, {
                        preset: 'islands#icon',
                        iconColor: '#0095b6'
                    }));
            }
       
        //    var coords = [
        //        [55.75, 37.50], [55.75, 37.71], [55.70, 37.70]
        //    ],
        //        myCollection = new ymaps.GeoObjectCollection({}, {
        //            preset: 'islands#redIcon', //all placemarks are red
        //            draggable: false // and draggable
        //        });

        //    for (var i = 0; i < coords.length; i++) {
        //        alert(myArrayx[i]);
        //        myCollection.add(new ymaps.Placemark(myArrayx[i], myArrayy[i]));
        //    }

            //    myMap.geoObjects.add(myCollection);
          
        }

    </script>


<style>

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #04AA6D;
}
li #Button1 {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
</style>
</head>
<body >
    <form id="form1" runat="server">
<ul>
            <li><a href="#home">Anasayfa</a></li>
          
            <li style="float: right"> <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="Çıkış" OnClick="Button1_Click" /></li>

        </ul>


     <asp:TextBox Style="margin:15px" ID="tb" runat="server"></asp:TextBox>
        <asp:Button ID="Button30" runat="server" OnClick="Button30_Click" Text="Dakika" />
       
       <div id="map" style="width: 600px; height: 400px"></div>
       <asp:HiddenField ID="HiddenField1" runat="server" />
       <asp:HiddenField ID="HiddenField2" runat="server" />

    </form>
    
    


</body>
</html>
