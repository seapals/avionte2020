(function ($) {
    function toggleRequiredFieldLabels(checkbox) {
        var labels;

        if ($('#ApplicantSkillUserControl').length > 0) {
            // Traverse up to the table row, then find all required field label children
            labels = $(checkbox).parent().parent().parent().find('.requiredFieldLabel');
        } else if ($('#Applicant3ColumnSkillUserControl').length > 0) {
            // Traverse up to the table cell, then traverse two cells down, and find all required field label children
            labels = $(checkbox).parent().parent().next().next().find('.requiredFieldLabel');
        } else {
            return;
        }

        if (checkbox.checked) {
            labels.css('visibility', 'visible');
        } else {
            labels.css('visibility', 'hidden');
        }
    }

    function initialize() {
        $('.skillCheckbox input').each(function (index, item) {
            toggleRequiredFieldLabels(item);
        });

        $(document).on('click', '.skillCheckbox input', function (event) {
            toggleRequiredFieldLabels(event.target);
        });
    }

    $(initialize);

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(initialize);
})(jQuery);