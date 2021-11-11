<cfinclude template="functions.inc.cfm">
<cfset functions = createObject('component','components/functions')>
<cfset category_list = functions.get_category()>

<!---<cfquery name="category">
    select * from dbo.categories where status = 1 order by categories asc;
</cfquery>--->
<cfset count = 0>
<cfif (structKeyExists(session,'USER_LOGIN') AND session['USER_LOGIN'] EQ 'yes')>
    <cfset userid = #session['USER_ID']#>
    <cfif isNumeric(#userid#)>
        <cfquery name="cartitems">
            select * from cart where userId = #userid#;
        </cfquery>
        <cfset count = cartitems.recordCount>
    <cfelse>
        <cflocation url="logout.cfm">
    </cfif>
</cfif>


<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ecom Website</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/core.css">
    <link rel="stylesheet" href="css/shortcode/shortcodes.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/custom.css">
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <header id="htc__header" class="htc__header__area header--one">
            <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="menumenu__container clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5"> 
                                <div class="logo">
                                     <a href="index.cfm"><img src="images/logo/4.png" alt="logo images"></a>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-7 col-sm-5 col-xs-3">
                                <nav class="main__menu__nav hidden-xs hidden-sm">
                                    <ul class="main__menu">
                                        <li class="drop"><a href="index.cfm">Home</a></li>
                                        <cfloop from="1" to="#arrayLen(category_list)#" index="i">
                                            <li><a href="categories.cfm?id=<cfoutput>#category_list[i].id#</cfoutput>"><cfoutput>#category_list[i].categories#</cfoutput></a></li>

                                        </cfloop>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-md-3 col-lg-3 col-sm-4 col-xs-4">
                                <div class="header__right">
									<div class="header__search search search__open">
                                        <a href="#"><i class="icon-magnifier icons"></i></a>
                                    </div>
                                    <cfif (structKeyExists(session,'USER_LOGIN'))>
                                        <cfif session['USER_LOGIN'] EQ 'yes'>
                                            <div class="dropdown">
                                                <button class="dropbtn"><cfoutput>#session['USER_NAME']#</cfoutput></button>
                                                <div class="dropdown-content">
                                                  <a href="my_orders.cfm">My Orders</a>
                                                  <a href="user_profile.cfm">Profile</a>
                                                  <a href="change_password.cfm">Change Password</a>
                                                  <a href="logout.cfm">Logout</a>
                                                </div>
                                            </div>
                                        </cfif>
                                        <cfif session['USER_LOGIN'] EQ 'admin'>
                                            <cflocation url="admin">
                                        </cfif>
                                        
                                    <cfelse>
                                        <div class="dropdown">
                                            <a href="login.cfm"><button class="dropbtn">Login/Register</button></a>   
                                        </div>
                                    </cfif>
                                    
                                    
                                    &nbsp;&nbsp;
                                    <div class="htc__shopping__cart">
                                        <a class="cart__menu" href=""><i class="icon-handbag icons"></i></a>
                                        <a href="cart.cfm"><span class="htc__qua"><cfoutput>#count#</cfoutput></span></a>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mobile-menu-area"></div>
                </div>
            </div>
        </header>
        <div class="body__overlay"></div>
		<div class="offset__wrapper">
            <div class="search__area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="search__inner">
                                <form action="search.cfm" method="get">
                                    <input placeholder="Search here... " type="text" name="str">
                                    <button type="submit"></button>
                                </form>
                                <div class="search__close__btn">
                                    <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
   