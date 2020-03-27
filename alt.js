// Inject classes
function injectClass(targetType, targetName, className) {
  var element;

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
  var element;

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
  injectClass("id", "vc-main", "container-fluid");
  stripID("vc-main");
  injectClass("class", "applicant_container", "row");
  stripClass("class", "applicant_container", "applicant_container");
  stripID("applicantCenter");

  // injectClass("id", "vc-body", "row");
  

  /* Layout blocks */

  injectClass("id", "footer", "row");

  // Layout containers

  injectClass("tag", "table", "table");
  injectClass("tag", "table", "table-default");
  

});

