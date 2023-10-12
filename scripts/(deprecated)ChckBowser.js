(function ($) {
    function checkBrowser() {
        var changeBrowserMessage = "The browser you are currently using is not supported by this application.  Please use one of the following or a newer version: Internet Explorer 8.0, Mozilla Firefox 3.0, Safari 5.0, or Chrome 11.0 to access this application.";
        var hasCookie = $.cookie('changeBrowser');
        
        if (hasCookie == null || hasCookie == "") {
            if ($.browser.versionNumber <= 7 && $.browser.name == "explorer") {
                alert(changeBrowserMessage);
                $.cookie('changeBrowser', 'true', { expires: 30, path: '/' });

            } else if ($.browser.versionNumber <= 3 && $.browser.name == "chrome") {
                alert(changeBrowserMessage);
                $.cookie('changeBrowser', 'true', { expires: 30, path: '/' });
            } else if ($.browser.versionNumber <= 4 && $.browser.name == "safari") {
                alert(changeBrowserMessage);
                $.cookie('changeBrowser', 'true', { expires: 30, path: '/' });
            } else if ($.browser.versionNumber <= 2 && $.browser.name == "firefox") {
                alert(changeBrowserMessage);
                $.cookie('changeBrowser', 'true', { expires: 30, path: '/' });
            } else {
                return;
            }
        }
        else {
            return;
        }

    }
break
⮕$(window).on('load', checkBrowser);
})(jQuery);
