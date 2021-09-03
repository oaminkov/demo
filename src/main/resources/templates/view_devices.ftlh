<#import "*/macros/common.ftlh" as c>
<@c.page>
    <a href="/houses" class="btn btn-block btn-secondary m-0 mt-1 mb-3">Перейти к просмотру домов</a>

    <table id="table_id" class="table table-striped table-bordered mt-0 mx-auto" style="width:95%;">
        <thead>
        <tr>
            <th>Id</th>
            <th>Power</th>
            <th>Voltage</th>
            <th>House</th>
        </tr>
        </thead>
        <tbody>
        <#list devices as device>
            <tr>
                <td>${device.id}</td>
                <td>${device.power?string('on', "off")}</td>

                <#if device.voltage??>
                    <td>${device.voltage}</td>
                <#else>
                    <td>NULL</td>
                </#if>

                <#if device.house??>
                    <td>Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${device.house.id}<br>Descr:&nbsp;${device.house.description}</td>
                <#else>
                    <td>БЕЗДОМНЫЙ</td>
                </#if>
                <td>
                    <form action="/devices/${device.id}">
                        <button type="submit" class="btn btn-sm btn-info m-0">Просмотреть</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <div class="d-flex justify-content-center mt-3">
        <a href="/devices/add" class="btn btn-primary">Добавить</a>
    </div>
</@c.page>