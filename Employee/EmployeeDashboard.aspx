<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="ColdStorageManagementSystem.Employee.EmployeeDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        table {
            border: 1px solid black;
            border-collapse: collapse;
            margin-left: 40px;
            margin-top: 0px;
            width: 93%;
        }

        th {
            color: black;
            padding-left: 50px;
            padding-right: 50px;
            border: 1px solid black;
            border-collapse: collapse;
        }

        td {
            color: black;
            padding: 50px;
            border: 1px solid black;
            border-collapse: collapse;
            font-weight: bold;
            font-size: large;
        }

            td:hover {
                cursor: pointer;
                background-color: rgba(14, 192, 246, 0.6);
            }
        .pagination li:hover {
            cursor: pointer;
        }

        table tbody tr {
            display: none;
        }

        .pageNo {
            border: 1px solid #808080;
            border-collapse: collapse;
            padding: 5px;
            color: black;
        }

        .active {
            background-color: #3B71CA;
            color: black;
        }
        /* 
  You want a simple and fancy tooltip?
  Just copy all [data-tooltip] blocks:
*/
        [data-tooltip] {
            --arrow-size: 5px;
            position: relative;
            z-index: 10;
        }

            /* Positioning and visibility settings of the tooltip */
            [data-tooltip]:before,
            [data-tooltip]:after {
                position: absolute;
                visibility: hidden;
                opacity: 0;
                left: 50%;
                bottom: calc(100% + var(--arrow-size));
                pointer-events: none;
                transition: 0.2s;
                will-change: transform;
            }

            /* The actual tooltip with a dynamic width */
            [data-tooltip]:before {
                content: attr(data-tooltip);
                padding: 10px 10px;
                min-width: 50px;
                max-width: 130px;
                width: max-content;
                width: -moz-max-content;
                border-radius: 6px;
                font-size: 14px;
                background-color: rgba(59, 72, 80, 0.9);
                background-image: linear-gradient(30deg, rgba(59, 72, 80, 0.44), rgba(59, 68, 75, 0.44), rgba(60, 82, 88, 0.44));
                box-shadow: 0px 0px 24px rgba(0, 0, 0, 0.2);
                color: #fff;
                text-align: center;
                white-space: pre-wrap;
                transform: translate(-50%, calc(0px - var(--arrow-size))) scale(0.5);
            }

            /* Tooltip arrow */
            [data-tooltip]:after {
                content: '';
                border-style: solid;
                border-width: var(--arrow-size) var(--arrow-size) 0px var(--arrow-size);
                /* CSS triangle */
                border-color: rgba(55, 64, 70, 0.9) transparent transparent transparent;
                transition-duration: 0s;
                /* If the mouse leaves the element, 
                              the transition effects for the 
                              tooltip arrow are "turned off" */
                transform-origin: top;
                /* Orientation setting for the
                              slide-down effect */
                transform: translateX(-50%) scaleY(0);
            }

            /* Tooltip becomes visible at hover */
            [data-tooltip]:hover:before,
            [data-tooltip]:hover:after {
                visibility: visible;
                opacity: 1;
            }

            /* Scales from 0.5 to 1 -> grow effect */
            [data-tooltip]:hover:before {
                transition-delay: 0.3s;
                transform: translate(-50%, calc(0px - var(--arrow-size))) scale(1);
            }

            /* 
  Arrow slide down effect only on mouseenter (NOT on mouseleave)
*/
            [data-tooltip]:hover:after {
                transition-delay: 0.5s;
                /* Starting after the grow effect */
                transition-duration: 0.2s;
                transform: translateX(-50%) scaleY(1);
            }

        /*
  That's it for the basic tooltip.

  If you want some adjustability
  here are some orientation settings you can use:
*/

        /* LEFT */
        /* Tooltip + arrow */
        [data-tooltip-location="left"]:before,
        [data-tooltip-location="left"]:after {
            left: auto;
            right: calc(100% + var(--arrow-size));
            bottom: 50%;
        }

        /* Tooltip */
        [data-tooltip-location="left"]:before {
            transform: translate(calc(0px - var(--arrow-size)), 50%) scale(0.5);
        }

        [data-tooltip-location="left"]:hover:before {
            transform: translate(calc(0px - var(--arrow-size)), 50%) scale(1);
        }

        /* Arrow */
        [data-tooltip-location="left"]:after {
            border-width: var(--arrow-size) 0px var(--arrow-size) var(--arrow-size);
            border-color: transparent transparent transparent rgba(55, 64, 70, 0.9);
            transform-origin: left;
            transform: translateY(50%) scaleX(0);
        }

        [data-tooltip-location="left"]:hover:after {
            transform: translateY(50%) scaleX(1);
        }



        /* RIGHT */
        [data-tooltip-location="right"]:before,
        [data-tooltip-location="right"]:after {
            left: calc(100% + var(--arrow-size));
            bottom: 50%;
        }

        [data-tooltip-location="right"]:before {
            transform: translate(var(--arrow-size), 50%) scale(0.5);
        }

        [data-tooltip-location="right"]:hover:before {
            transform: translate(var(--arrow-size), 50%) scale(1);
        }

        [data-tooltip-location="right"]:after {
            border-width: var(--arrow-size) var(--arrow-size) var(--arrow-size) 0px;
            border-color: transparent rgba(55, 64, 70, 0.9) transparent transparent;
            transform-origin: right;
            transform: translateY(50%) scaleX(0);
        }

        [data-tooltip-location="right"]:hover:after {
            transform: translateY(50%) scaleX(1);
        }



        /* BOTTOM */
        [data-tooltip-location="bottom"]:before,
        [data-tooltip-location="bottom"]:after {
            top: calc(100% + var(--arrow-size));
            bottom: auto;
        }

        [data-tooltip-location="bottom"]:before {
            transform: translate(-50%, var(--arrow-size)) scale(0.5);
        }

        [data-tooltip-location="bottom"]:hover:before {
            transform: translate(-50%, var(--arrow-size)) scale(1);
        }

        [data-tooltip-location="bottom"]:after {
            border-width: 0px var(--arrow-size) var(--arrow-size) var(--arrow-size);
            border-color: transparent transparent rgba(55, 64, 70, 0.9) transparent;
            transform-origin: bottom;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>Storage Status</h2>
        <div class="row" style="margin-left: 5%;">
            <div class="form-group col-2">
                <!--		Show Numbers Of Rows 		-->
                <select class="form-control mb-4" name="state" id="maxRows">
                    <option value="5000">Show ALL Rows</option>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="70">70</option>
                    <option value="100">100</option>
                </select>
            </div>

            <div class="form-group col-4">
                <input type="search" id="custname" name="searchName" runat="server" class="form-control" placeholder="Customer Name"/>
            </div>

            <div class="form-group col-4">
                <input type="search" id="custmo" name="searchMO" runat="server" class="form-control" pattern="[0-9]{10}" title="enter valid mobile no" placeholder="Customer Mobile no."/>
            </div>

            <div class="form-group col-1">
                <asp:Button ID="search" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="search_Click"/>
            </div>
        </div>
        <div class="container">
            <asp:PlaceHolder ID="test" runat="server"></asp:PlaceHolder>
            <p class="text-danger">Click on Rack for Inword And Outword Entry...</p>
            <asp:PlaceHolder ID="Racks" runat="server"></asp:PlaceHolder>
        </div>
        <%--<span class="text-danger">Colored Blocks are not Empty..!!!!!</span>--%><br />

        <!--		Start Pagination -->
        <div class='pagination-container'>
            <nav>
                <ul class="pagination">

                    <li class="pageNo" data-page="prev">
                        <span>Previous<span class="sr-only">(current)</span></span>
                    </li>
                    <!--	Here the JS Function Will Add the Rows -->
                    <li class="pageNo" data-page="next" id="prev">
                        <span>Next <span class="sr-only">(current)</span></span>
                    </li>
                </ul>
            </nav>
        </div>

    </div>
    <!-- 		End of Container -->
    <script>

        getPagination('#table-id');


        function getPagination(table) {
            var lastPage = 1;

            $('#maxRows')
                .on('change', function (evt) {
                    //$('.paginationprev').html('');						// reset pagination

                    lastPage = 1;
                    $('.pagination')
                        .find('li')
                        .slice(1, -1)
                        .remove();
                    var trnum = 0; // reset tr counter
                    var maxRows = parseInt($(this).val()); // get Max Rows from select option

                    if (maxRows == 5000) {
                        $('.pagination').hide();
                    } else {
                        $('.pagination').show();
                    }

                    var totalRows = $(table + ' tbody tr').length; // numbers of rows
                    $(table + ' tr:gt(0)').each(function () {
                        // each TR in  table and not the header
                        trnum++; // Start Counter
                        if (trnum > maxRows) {
                            // if tr number gt maxRows

                            $(this).hide(); // fade it out
                        }
                        if (trnum <= maxRows) {
                            $(this).show();
                        } // else fade in Important in case if it ..
                    }); //  was fade out to fade it in
                    if (totalRows > maxRows) {
                        // if tr total rows gt max rows option
                        var pagenum = Math.ceil(totalRows / maxRows); // ceil total(rows/maxrows) to get ..
                        //	numbers of pages
                        for (var i = 1; i <= pagenum;) {
                            // for each page append pagination li
                            $('.pagination #prev')
                                .before(
                                    '<li class="pageNo" data-page="' +
                                    i +
                                    '">\
								  <span>' +
                                    i++ +
                                    '<span class="sr-only">(current)</span></span>\
								</li>'
                                )
                                .show();
                        } // end for i
                    } // end if row count > max rows
                    $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
                    $('.pagination li').on('click', function (evt) {
                        // on click each page
                        evt.stopImmediatePropagation();
                        evt.preventDefault();
                        var pageNum = $(this).attr('data-page'); // get it's number

                        var maxRows = parseInt($('#maxRows').val()); // get Max Rows from select option

                        if (pageNum == 'prev') {
                            if (lastPage == 1) {
                                return;
                            }
                            pageNum = --lastPage;
                        }
                        if (pageNum == 'next') {
                            if (lastPage == $('.pagination li').length - 2) {
                                return;
                            }
                            pageNum = ++lastPage;
                        }

                        lastPage = pageNum;
                        var trIndex = 0; // reset tr counter
                        $('.pagination li').removeClass('active'); // remove active class from all li
                        $('.pagination [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
                        // $(this).addClass('active');					// add active class to the clicked
                        limitPagging();
                        $(table + ' tr:gt(0)').each(function () {
                            // each tr in table not the header
                            trIndex++; // tr index counter
                            // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
                            if (
                                trIndex > maxRows * pageNum ||
                                trIndex <= maxRows * pageNum - maxRows
                            ) {
                                $(this).hide();
                            } else {
                                $(this).show();
                            } //else fade in
                        }); // end of for each tr in table
                    }); // end of on click pagination list
                    limitPagging();
                })
                .val(5)
                .change();

            // end of on select change

            // END OF PAGINATION
        }

        function limitPagging() {
            // alert($('.pagination li').length)

            if ($('.pagination li').length > 7) {
                if ($('.pagination li.active').attr('data-page') <= 3) {
                    $('.pagination li:gt(5)').hide();
                    $('.pagination li:lt(5)').show();
                    $('.pagination [data-page="next"]').show();
                } if ($('.pagination li.active').attr('data-page') > 3) {
                    $('.pagination li:gt(0)').hide();
                    $('.pagination [data-page="next"]').show();
                    for (let i = (parseInt($('.pagination li.active').attr('data-page')) - 2); i <= (parseInt($('.pagination li.active').attr('data-page')) + 2); i++) {
                        $('.pagination [data-page="' + i + '"]').show();
                    }
                }
            }
        }

        function inword_req(rackId) {
            /*alert("Run Thay 6e" + rackId);*/
            window.location.href = "Inword.aspx?err=" + rackId;
        }

        function outword_req(rackId) {
            //alert("Run Thay 6e");
            window.location.href = "Outword.aspx?err=" + rackId;
        }

        document.getElementById("dash").classList.add("active");
        document.getElementById("dash").href = "javascript:void(0)";
    </script>
</asp:Content>
