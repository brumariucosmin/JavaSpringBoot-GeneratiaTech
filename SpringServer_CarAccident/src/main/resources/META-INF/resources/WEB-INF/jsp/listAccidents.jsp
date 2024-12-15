
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<%@ include file="common/footer.jspf"%>

<div class="container">
<h1>Your Accidents</h1>
<table class="table">
    <thead>
    <tr>
        <th>Intensity</th>
        <th>Amplitude</th>
        <th>Time Date</th>
        <th>Accident?</th>
        <th></th>
        <th></th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${accidents}" var="accident">
        <tr>
            <td>${accident.intensity}</td>
            <td>${accident.amplitude}</td>
            <td>${accident.targetDate}</td>
            <td>${accident.done}</td>

            <td> <a href="delete-accident?id=${accident.id}" class="btn btn-warning">DELETE</a></td>
            <td> <a href="update-accident?id=${accident.id}" class="btn btn-success">UPDATE</a></td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="add-accident" class="btn btn-success">Add Accident</a>
<a href="delete-all-accident" class="btn btn-warning">Delete All Accident</a>

</div>
