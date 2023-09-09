<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 3/26/2023
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%--    <div class="row flex-nowrap">--%>
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <img src="${pageContext.request.contextPath}/seller-center/resources/logo.png" style="width:170px; height: auto">
                </a>
                <span class="fs-5 d-none d-sm-inline">Seller Center</span>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/seller-center/dashboard.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">Products</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="${pageContext.request.contextPath}/view-products" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp&nbspView</span> </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/seller-center/addProduct.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp&nbspAdd</span> </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/seller-center/orders.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Orders</span></a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/seller-center/customers.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">Customers</span> </a>
                    </li>
                </ul>
                <hr>
                  </div>
<%--        </div>--%>
    </div>


