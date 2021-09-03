<#import "*/macros/common.ftlh" as c>
<@c.page>
    <main class="container">
        <h2 class="mb-3" align="center">Создать устройство</h2>
        <form action="/devices/add" method="post">
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Power:</label>
                <div class="col-sm-9">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck1" name="power">
                        <label class="custom-control-label" for="customCheck1"></label>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Voltage:</label>
                <div class="col-sm-9">
                    <input type="number" min="5" max="220" step="5" name="voltage">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Дом:</label>
                <div class="col-sm-9">
                    <select name="house" class="form-control">
                        <option value="0">-- Выберите дом --</option>
                        <#list houses as house>
                            <option value="${house.id}">${house.description}</option>
                        </#list>
                    </select>
                </div>
            </div>
            <hr>
            <button type="submit" class="btn btn-block btn-success m-0">Сохранить</button>
        </form>
        <a href="/devices" class="btn btn-outline-secondary m-0 mt-1 mb-3">Назад</a>
    </main>
</@c.page>