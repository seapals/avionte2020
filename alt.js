// Inject classes
function injectClass(targetType, targetName, className) {

  switch (targetType) {
    case "id": {
      const element = document.getElementById(targetName);
      element.classList.add(className);
      break;
    }
    case "class": {
      const element = document.getElementsByClassName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].classList.add(className);
      }
      break;
    }
    case "tag": {
      const element = document.getElementsByTagName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].classList.add(className);
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
      element.classList.remove(className);
      break;
    }
    case "class": {
      const element = document.getElementsByClassName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].classList.remove(className);
      }
      break;
    }
    case "tag": {
      const element = document.getElementsByTagName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].classList.remove(className);
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
      element.removeAttribute(attrName);
      break;
    }
    case "class": {
      const element = document.getElementsByClassName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].removeAttribute(attrName);
      }
      break;
    }
    case "tag": {
      const element = document.getElementsByTagName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].removeAttribute(attrName);
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
  // Main Wrapper - Needs fluid width container
  // injectClass("id", "vc-main", "container-fluid");

  // Main content wrapping element - Needs regular container
  injectClass("id", "mainContentAll", "container");
  
  // Remove zoom:1 style from body
  stripAttr("tag", "body", "style");

  stripAttr("id", "ctl00__IG_CSS_LINKS_", "value");

  // stripID("vc-main");
  // injectClass("class", "applicant_container", "row");
  // stripClass("class", "applicant_container", "applicant_container");
  // stripID("applicantCenter");

  // injectClass("id", "vc-body", "row");
  

  /* Layout blocks */

  injectClass("id", "footer", "row");

  // Layout containers

  injectClass("tag", "table", "table");
  injectClass("tag", "table", "table-default");
  stripClass("class", "igpnl_CaribbeanPanel", "igpnl_CaribbeanPanel");

  // Make main form tables responsive
  // injectClass ("class", "groupbox_body_inner_style", "table-responsive")

/* Tables */
  stripAttr("class", "table_outer", "style");
  stripAttr("tag", "table", "width");
  stripAttr("tag", "table", "height");
  stripAttr("tag", "table", "border");
  stripAttr("tag", "table", "cellspacing");
  stripAttr("tag", "table", "cellpadding");
  stripAttr("tag", "td", "style");
  stripAttr("tag", "td", "width");
  stripAttr("tag", "td", "align");
  stripAttr("tag", "td", "valign");
  

/* Inputs */
  
  injectClass("tag", "select", "form-control");
  stripClass("class", "button", "form-control");
  injectClass("class", "answerboxType", "form-control");
  stripAttr("tag", "input", "style");
  stripClass("id", "ctl00$ContentPlaceHolder1$Button2", "form-control");
  // stripClass("class", "button", "form-control");
  // injectClass("class", "button", "btn");
  // injectClass("class", "button", "btn-primary");
  // stripClass("class", "button", "button");


});

