"use strict";
function validar() {
    var ci=document.formu.ci.value;
    var nombres=document.formu.nombres.value;
    var ap=document.formu.ap.value;
    var am=document.formu.am.value;
    
    if(ci==""){
           alert("El valor de ci esta vacio");
           document.formu.ci.focus();
           return;
    }
    if((!v1.test(nombres))){
        alert("el valor de nombres es incorrecto o esta vacio");
        document.formu.nombres.focus();
        return;
        }
    if(ap!=""){
        if((!v1.test(ap))){
     alert("El valor de ap es incorrecto");
        document.formu.ap.focus();
        return;
        }
    }
    if (am != ""){
    if((!v1.test(am))){
    alert("el valor de am es incorrecto");
    document.formu.am.focus();
    return;
    }
    }
   
   if((ap=="") && (am=="")){
    alert("Uno de los dos apellidos debe ser llenado");
    document.formu.ap.focus();
    return;
   }
  
   
    document.formu.submit();
}