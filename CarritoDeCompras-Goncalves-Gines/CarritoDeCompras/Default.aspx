﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarritoDeCompras.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        if (Session["ListaItemCarrito"] != null)
        {
            cantArticulos = ((List<dominio.ItemCarrito>)(Session["ListaItemCarrito"])).Sum( item => item.cantidad );
        }
        else { cantArticulos = 0; };
    %>

    <div id="carrito">
        <i></i>
        <button type="button" class="btn btn-primary position-relative " onclick="location.href='Carrito.aspx'">
            <span class="material-symbols-outlined">shopping_cart</span>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                <%: cantArticulos %>
            </span>
        </button>
    </div>
    
    <div class="row g-3" style="padding-top:20px">
        <div class="col-sm-5">
            <asp:DropDownList ID="DropDownCategoria" class="form-select" AutoPostBack="false" runat="server"></asp:DropDownList>
        </div>
        <div class="col-sm-5">
            <asp:DropDownList ID="DropDownMarca" class="form-select" AutoPostBack="false" runat="server"></asp:DropDownList>
        </div>
        <div class="col-sm-2">
            <asp:Button Text="Buscar" CssClass="btn btn-success " runat="server" ID="btnFiltrar" OnClick="btnFiltrar_Click1" />
        </div>
    </div>

    <h1 style="padding:20px">Listado de Artículos</h1> 
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <asp:Repeater runat="server" ID="repRepetidor">
            <ItemTemplate >

                <div class="col">
                    <div class="card" id="cardArticulo" style="width: 20rem; height: 30rem;">
                        <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="imagen de producto" style="width: 20rem; height: 19rem; object-fit: contain;" onerror="this.src='https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=170667a&w=0&h=YGycIDbBRAWkZaSvdyUFvotdGfnKhkutJhMOZtIoUKY='">
                        <div class="card-body" style="width: 20rem; height: 5rem;">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <div>
                                <asp:Button Text="Comprar" CssClass="btn btn-success" runat="server" ID="btnComprar" CommandArgument='<%#Eval("Id") %>' CommandName="ArticuloId" OnClick="btnComprar_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
<%--    <footer style="margin:30px">
        <hr />

    </footer>--%>
</asp:Content>

