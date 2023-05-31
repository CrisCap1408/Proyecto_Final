<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Proyecto_nuevo.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form runat="server">
        <div style="width:500px">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Nombre</label>
    <asp:TextBox class="form-control" ID="nom" runat="server"></asp:TextBox>
  </div>
       <div class="mb-3">
    <asp label for="disabledSelect" class="form-label">Latitud</asp>
     <input type="text" class="form-control" id="lati"></>
    <asp:TextBox class="form-control" ID="latitud" runat="server"></asp:TextBox>
  </div>
    <div class="mb-3">
    <label for="disabledSelect" class="form-label">Longitud</label>
        <input type="text" class="form-control" id="longi"></>
    <asp:TextBox class="form-control" ID="longitud" runat="server"></asp:TextBox>
  </div>
        <asp:Button class="btn btn-primary" ID="boton_reg" runat="server" Text="Registrar" OnClick="boton_reg_Click"></asp:Button>
        </div>
</form>
<!--Inicio Mapa-->
    <div id="map" style="background:red; width:100%; height:300px"></div>
    <script>
        const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        let labelIndex = 0;

        var map;
        function initMap() {

            var latitud = 22.145283;
            var longitud = - 101.015192;

            coordenadas = {
                lng: longitud,
                lat: latitud,
            };

            generarMapa(coordenadas);

        }

        function generarMapa(coordenadas) {

            map = new google.maps.Map(document.getElementById('map'), {
                center: new google.maps.LatLng(coordenadas.lat, coordenadas.lng),
                zoom: 13,
            });
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(coordenadas.lat, coordenadas.lng),
                draggable: true,
                map: map,
                title: 'Hospitales'
            });
            var infowindow = new google.maps.InfoWindow({
                content: "<p>Coordenadas:" + marker.getPosition() + "</p>",
            });

            //Evento para tomar coordenadas al arrastrar
            marker.addListener('dragend', function (event) {
                document.getElementById("lati").value = this.getPosition().lat();
                document.getElementById("longi").value = this.getPosition().lng();
            })

            google.maps.event.addListener(map, "click", (event) => {
                addMarker(event.latLng, map);
            });
            addMarker(bangalore, map);
        }

        function addMarker(location, map) {
            new google.maps.Marker({
                position: location,
                label: labels[labelIndex++ % labels.length],
                map: map,
            });
        }

        window.initMap = initMap;

    </script>
</asp:Content>
