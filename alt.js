// Inject classes
function notFound(x){
  console.log("no " + x + " found");
};

function injectClass(targetType, targetName, className) {

  switch (targetType) {
    case "id": {
      const element = document.getElementById(targetName);
      element != null ? element.classList.add(className) : notFound(targetName);
      break;
    }
    case "class": {
      const element = document.getElementsByClassName(targetName);
      for (i = 0; i < element.length; i++) {
        element != null ? element[i].classList.add(className) : notFound(targetName);
      }
      break;
    }
    case "tag": {
      const element = document.getElementsByTagName(targetName);
      for (i = 0; i < element.length; i++) {
        element != null ? element[i].classList.add(className) : notFound(targetName);
      }
      break;
    }
  }
}

// Remove classes
function stripClass(targetType, targetName, className) {

  switch (targetType) {
    case "id": {
      const element = document.getElementById(targetName);
      element != null ? element.classList.remove(className) : notFound(targetName);
      break;
    }
    case "class": {
      const element = document.getElementsByClassName(targetName);
      for (i = 0; i < element.length; i++) {
        element != null ? element[i].classList.remove(className) : notFound(targetName);
      }
      break;
    }
    case "tag": {
      const element = document.getElementsByTagName(targetName);
      for (i = 0; i < element.length; i++) {
        element != null ? element[i].classList.remove(className) : notFound(targetName);
      }
      break;
    }
  }
}


// Remove classes
function stripAttr(targetType, targetName, attrName) {
  switch (targetType) {
    case "id": {
      const element = document.getElementById(targetName);
      element != null ? element.removeAttribute(attrName) : notFound(targetName);
      break;
    }
    case "class": {
      const element = document.getElementsByClassName(targetName);
      for (i = 0; i < element.length; i++) {
        element != null ? element[i].removeAttribute(attrName) : notFound(targetName);
      }
      break;
    }
    case "tag": {
      const element = document.getElementsByTagName(targetName);
      for (i = 0; i < element.length; i++) {
        element != null ? element[i].removeAttribute(attrName) : notFound(targetName);
      }
      break;
    }
  }
}

// Remove ID
function stripID(targetID) {
  element = document.getElementById(targetID);
  element.removeAttribute('id');
}

document.addEventListener("DOMContentLoaded", () => {

  // Cleanup

  /* 
  Main Layout
  */

  /* Wrapper containers */

  // Main content wrapping element - Needs regular container
  injectClass("id", "mainContentAll", "container-md");

  // Remove zoom:1 style from body
  stripAttr("tag", "body", "style");
  stripAttr("id", "ctl00__IG_CSS_LINKS_", "value");

  // injectClass("id", "applicantCenter", "container-md");

/*
Layout blocks
*/
  
  injectClass("id", "footer", "row");

  // Layout containers
  injectClass("tag", "table", "container-md");
  stripClass("class", "igpnl_CaribbeanPanel", "igpnl_CaribbeanPanel");

  // Make main form tables responsive

/* Tables */
  
  injectClass("class", "table_normal", "table-grid");
  stripClass("class", "table_normal", "table_normal");
  injectClass("id", "ctl00_ContentPlaceHolder1_PersonalInfo1_WebPanel1_ContactMethodList1_GridView1", "table-grid");
  stripAttr("class", "table_outer", "style");
  stripAttr("tag", "table", "width");
  stripAttr("tag", "table", "height");
  stripAttr("tag", "table", "border");
  stripAttr("tag", "table", "style");
  stripAttr("tag", "table", "cellspacing");
  stripAttr("tag", "table", "cellpadding");
  stripAttr("tag", "td", "style");
  stripAttr("tag", "td", "width");
  stripAttr("tag", "td", "align");
  stripAttr("tag", "td", "valign");
  stripAttr("tag", "div", "style");
  stripAttr("tag", "span", "style");
  stripAttr("tag", "textarea", "style");


  /* Inputs */

  injectClass("tag", "select", "form-control");
  injectClass("class", "answerboxType", "form-control");
  injectClass("tag", "input", "form-control");
  stripAttr("tag", "input", "style");
  stripClass("class", "button", "form-control");
  // stripClass("id", "ctl00$ContentPlaceHolder1$Button2", "form-control");
  // stripClass("class", "button", "form-control");
  // injectClass("class", "button", "btn");
  // injectClass("class", "button", "btn-primary");
  // stripClass("class", "button", "button");


});