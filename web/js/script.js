
 
 
 $("#year").text(new Date().getFullYear());

 $(".carousel").carousel({
        interval: 2000,
        pause: "false"
      });

//lightbox init
      $(document).on("click", '[data-toggle="lightbox"]', function(e) {
        e.preventDefault();
        $(this).ekkoLightbox();
      });

 
 
/*--------------------------GERAL--------------------------*/
// JSON to Model decoder
function Model(obj) {
    for(var prop in obj){
        this[prop] = obj[prop];
    }
}

 
 
/*--------------------------PRODUCT LIST--------------------------*/
//Variavel global
var tempidProduct;
var priceProduct;
var qtdProduct;

//Buscar produto
function getProduct(idProduct){

    //AJAX configure
    var processData = 'JSON';
    var route = "GetProduct";
    $.ajax({  
        type: "GET",  
        url: "products",  
        data: "route="+route+"&idProduct="+idProduct+"&processData="+processData,  
        success: function(result){
            //alert(result.name);

            //var m = new Model(result);
            //alert("Modelo: "+m.name);

            showProduct(result);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert("Error status code: "+xhr.status);
            alert("Error details: "+ thrownError);
        }
    });
}

// Preencher formulário
function showProduct(model){
    // window.alert("Classe: "+model.ref);
    $("#ref").text(model.ref);
    $("#name").text(model.name);
    $("#color").text(model.color);
    $("#desc").text(model.desc);
    $("#price").text(Number(model.price).toFixed(2)+" €");
    $("#foto").attr("src","images/produtos/"+model.foto);

    // Definir variavel global
    tempidProduct = model.idProduct;
    priceProduct = Number(model.price);
    qtdProduct = 0;

    $("#total").html("<b>Qtd:</b> "+qtdProduct+" pairs | <b>Qtd:</b> "+(qtdProduct * priceProduct).toFixed(2)+" €");

    //console.log(model.price);
    //console.log();

    // Limapr tabela dos tamanhos
    $("#tHead").children('th').remove();        
    $("#tBody").children('td').remove();

    // Preencher tabela dos tamanhos
    for(i = Number(model.init); i <= Number(model.fin); i++){
        $("#tHead").append('<th>'+i+'</th>');
        $("#tBody").append("<td><input onchange='upDateTotals()' class='orderSize' type='number' step='1' min='0' size=3 name='"+i+"' style='width:50px; text-align: center;' /></td>");
    }
}

// Atualizar totais
function upDateTotals(){
    //alert("ok")
    var list = $('.orderSize');     
    //console.log(list);
    //console.log(list[0].value);

    qtdProduct = 0;
    for (i=0; i<list.length; i++) {
        qtdProduct += Number(list[i].value);
    }

    $("#total").html("<b>Qnt: </b> "+qtdProduct+" pairs | <b>Amont: </b> "+(qtdProduct * priceProduct).toFixed(2)+" €");
}

// Encomendar produto
$(document).on("click", "#addToCart", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
    //alert(tempidProduct);
    //alert($("input[name=40]").val());

    $.ajax({
        type: "POST",
        url: "movement",
        data:{"route":"addToCart",
              "idProduct":tempidProduct,
              "35":$("input[name=35]").val(),
              "36":$("input[name=36]").val(),
              "37":$("input[name=37]").val(),
              "38":$("input[name=38]").val(),
              "39":$("input[name=39]").val(),
              "40":$("input[name=40]").val(),
              "41":$("input[name=41]").val(),
              "42":$("input[name=42]").val(),
              "43":$("input[name=43]").val(),
              "44":$("input[name=44]").val(),
              "45":$("input[name=45]").val(),
              "46":$("input[name=46]").val(),
              "47":$("input[name=47]").val(),
              "48":$("input[name=48]").val(),
            },
        success: function(result){
            //alert(result.ok + " Add to Cart.");
            getItemsCart();
        },
        error:function(result){
            alert("error: "+ result.error);
        },
     });
});

 


 

/*--------------------------LAYOUT--------------------------*/
$("#year").text(new Date().getFullYear());
      
// Carregar Items Cart
function getItemsCart(){   
    //AJAX configure
    var processData = 'JSON';
    var route = "getItemsCart";
    $.ajax({  
        type: "GET",  
        url: "movement",  
        data: "route="+route,  
        success: function(result){
            console.log(result);
            /*
            var lstItems = [];
            result.forEach(function(item) {
                //console.log(item);
                var obj = new Model(item);
                lstItems.push(obj);
            });*/
            showItemCart(result);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.log("Error status code: "+xhr.status);
            console.log("Error details: "+ thrownError);
        }
    });
}

function showItemCart(lstItems){
    
    var totalAmount = 0;
    if(lstItems.length == 0) $("#nrCartItems").text("");
    else $("#nrCartItems").text(lstItems.length);
    $("#nrCartItemsIn").text(lstItems.length);
    
    $("#lstItemsCart").children('tr').remove();
    
    for( var i=0; i<lstItems.length; i++){
        totalAmount += Number(lstItems[i].totalAmount);
        console.log(lstItems[i]);   
        $("#lstItemsCart").append("\
            <tr> \n\
                <td class='align-middle'> \n\
                    <img style='max-width: 80px; height: 70px; object-fit: cover; object-position: bottom'  \n\
                         src='images/produtos/"+ lstItems[i].foto +"' class='img-thumbnail card-img-top'> \n\
                </td> \n\
                <td> \n\
                    <p>"+ lstItems[i].name +"<small class='text-muted'> / "+ lstItems[i].ref +"</small></p> \n\
                    <span class='price text-info'>"+ Number(lstItems[i].totalAmount).toFixed(2) +" €</span> <span class='count'>"+ lstItems[i].totalQtd +" pairs</span> \n\
                </td> \n\
            </tr> \n\
        ");
    }
    
    $("#totalAmount").text(Number(totalAmount).toFixed(2)+" €");
}
