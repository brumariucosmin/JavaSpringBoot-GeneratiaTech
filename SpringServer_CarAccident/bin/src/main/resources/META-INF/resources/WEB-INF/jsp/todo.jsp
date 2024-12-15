
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<%@ include file="common/footer.jspf"%>

<div class="container">

    <h1>Enter Accident Details</h1>

    <form:form method="post" modelAttribute="accident">

        <fieldset class="mb-3">
            <form:label path="intensity">Description</form:label>
            <form:input type="text" path="intensity" required="required"/>
            <form:errors path="intensity" cssClass="text-warning"/>
        </fieldset>

        <fieldset class="mb-3">
            <form:label path="targetDate">Target Date</form:label>
            <form:input type="text" path="targetDate" required="required"/>
            <form:errors path="targetDate" cssClass="text-warning"/>
        </fieldset>


        <form:input type="hidden" path="id"/>

        <form:input type="hidden" path="done"/>

        <input type="submit" class="btn btn-success"/>

    </form:form>

</div>


</div>
<script type="text/javascript">
$('#targetDate').datepicker({
    format: 'yyyy-mm-dd'
});
</script>