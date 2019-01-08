<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<!-- Sub-Navigation Bar, in place of Side Panel -->
<meta name="viewport"

		content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">
* { box-sizing:border-box }
*:before, *:after { box-sizing:inherit }

/* Basic styles */
html {
  font-size: 62.5%;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  font-family: @font-family-base;
}

body {
    font-family: 'Roboto', sans-serif;
    font-size: 1.4rem;
    line-height: 1.42857143;
    color: #555;
    background-color: #f7f7f7;
}

a { text-decoration: none }

ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

main {
    margin-top: 10rem;
    text-align: center;
}
/* Header styles */
header {
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    background-color: #fff;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    height: 7rem;
    padding: 0 15px;
    position: fixed;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
    top: 0;
    width: 100%
}

.site-logo {
    transition: color 200ms cubic-bezier(.55, 0, .1, 1);
    color: #30acff;
    font-size: 3rem;
}

.ok-header__logo:hover {color: #546edb}

/* okayNav styles */
body.okayNav-loaded {
  overflow-x: hidden;
}
.okayNav:not(.loaded) {
  visibility: hidden;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.okayNav ul {
  /* We want two navigations - one hidden and one visible */
  float: left;
}
.okayNav a {
  /* Links general styling */
  color: #2e2e33;
  font-size: 1.4rem;
  font-weight: bold;
  position: relative;
  z-index: 1;
}
.okayNav__nav--visible {
  overflow: hidden;
  white-space: nowrap;
}
.okayNav__nav--visible li {
  display: inline-block;
}
.okayNav__nav--visible a {
  /* Link styling for the visible part of the nav */
  display: block;
  transition: color 200ms cubic-bezier(0.55, 0, 0.1, 1);
  padding: 15px 15px;
}
.okayNav__nav--visible a:hover {
  color: #546edb;
}
/* Link styling for the off-screen part of the nav */
.okayNav__nav--invisible {
  position: fixed;
  top: 70px;
  bottom: 0;
  overflow-y: scroll;
  -webkit-overflow-scrolling: touch;
  background: #fff;
}
.okayNav__nav--invisible a {
  background: #fff;
  width: 240px;
  display: block;
  padding: 15px;
}
.okayNav__nav--invisible.nav-left {
  left: 0;
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.okayNav__nav--invisible.nav-right {
  right: 0;
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.okayNav__nav--invisible.transition-enabled {
  transition: -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1), -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
}
.okayNav__nav--invisible.nav-open {
  -webkit-transform: translateX(0);
          transform: translateX(0);
}
/* Kebab icon */
.okayNav__menu-toggle {
  position: relative;
  transition: -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  transition: transform 400ms cubic-bezier(0.55, 0, 0.1, 1), -webkit-transform 400ms cubic-bezier(0.55, 0, 0.1, 1);
  cursor: pointer;
  width: 40px;
  height: 20px;
  float: left;
  z-index: 1;
  top: 15px;
}
.okayNav__menu-toggle.okay-invisible {
  position: absolute;
  opacity: 0;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  pointer-events: none;
}
.okayNav__menu-toggle span {
  display: block;
  position: absolute;
  margin: auto;
  height: 4px;
  width: 4px;
  background: #2e2e33;
  border-radius: 50%;
  left: 0;
  right: 0;
  pointer-events: none;
}
.okayNav__menu-toggle span:nth-child(1) {
  top: 0;
}
.okayNav__menu-toggle span:nth-child(2) {
  top: 50%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
}
.okayNav__menu-toggle span:nth-child(3) {
  bottom: 0;
}
.okayNav__menu-toggle.icon--active {
  /* Kebab icon when off-screen nav is open */
  -webkit-transform: rotate(90deg);
          transform: rotate(90deg);
}
.okayNav__menu-toggle.icon--active span {
  background: #546edb;
}
/* .container {
	width: 100%;
	margin-top: 6%;
} */
</style>

<header id="header" class="fixed-top">
  <a class="site-logo" href="Store_main.do">
           <img src="/Muhan/cus/cus_images/logo_red.png">
        </a>
<c:if test="${sessionScope.store_id eq null}">
  <nav role="navigation" id="nav-main" class="okayNav" onclick="sessionLogincheck()">
    <ul>
      <li><a href="Store_main.do">메인</a></li>
      <li><a href="Store_main.do">현재주문확인</a></li>
      <li><a href="Store_main.do">모든 주문위치</a></li>
      <li><a href="Store_main.do">매출확인</a></li>
      <li><a href="Store_main.do">카테고리관리</a></li>
      <li><a href="Store_main.do">날씨확인</a></li>
      <li><a href="Store_main.do">회원정보수정</a></li>
      <li><a href="Store_main.do">로그인</a></li>
    </ul>
  </nav>
</c:if>

<c:if test="${sessionScope.store_id ne null}">
  <nav role="navigation" id="nav-main" class="okayNav">
    <ul>
      <li><a href="Store_main.do">메인</a></li>
      <li><a href="Store_order_check.do">현재주문확인</a></li>
      <li><a href="Store_orders_location.do">모든 주문위치</a></li>
      <li><a href="Store_revenue_day.do">매출확인</a></li>
      <li><a href="Store_weather.do">날씨확인</a></li>
      <li><a href="Store_info.do">매장 정보</a></li>
      <li><a href="Store_modify_form.do">회원정보수정</a></li>
	  <li><a href="Store_logout.do">로그아웃</a></li>
    </ul>
  </nav>
</c:if>       

</header>
<!-- /header -->
<script type="text/javascript">
function sessionLogincheck() {
	alert("로그인 후 이용 가능 한 서비스입니다.");
}

(function($, window, document, undefined) {

    // Defaults
    var okayNav = 'okayNav',
        defaults = {
            parent: '', // will call nav's parent() by default
            toggle_icon_class: 'okayNav__menu-toggle',
            toggle_icon_content: '<span /><span /><span />',
            align_right: true, // If false, the menu and the kebab icon will be on the left
            swipe_enabled: true, // If true, you'll be able to swipe left/right to open the navigation
            threshold: 50, // Nav will auto open/close if swiped >= this many percent
            beforeOpen: function() {}, // Will trigger before the nav gets opened
            afterOpen: function() {}, // Will trigger after the nav gets opened
            beforeClose: function() {}, // Will trigger before the nav gets closed
            afterClose: function() {}, // Will trigger after the nav gets closed
            itemHidden: function() {},
            itemDisplayed: function() {}
        };

    // Begin
    function Plugin(element, options) {
        self = this;
        this.options = $.extend({}, defaults, options);
        _options = this.options;

        $navigation = $(element);
        $document = $(document);
        $window = $(window);

        this.options.parent == '' ? this.options.parent = $navigation.parent() : '';

        _nav_visible = false; // Store the state of the hidden nav
        _nav_full_width = 0;
        _parent_full_width = 0;

        // Swipe stuff
        radCoef = 180 / Math.PI;
        _sTouch = {
            x: 0,
            y: 0
        };
        _cTouch = {
            x: 0,
            y: 0
        };
        _sTime = 0;
        _nav_position = 0;
        _percent_open = 0;
        _nav_moving = false;


        self.init();
    }

    Plugin.prototype = {

        init: function() {

            $('body').addClass('okayNav-loaded');

            // Add classes
            $navigation
                .addClass('okayNav loaded')
                .children('ul').addClass('okayNav__nav--visible');

            // Append elements
            if (self.options.align_right) {
                $navigation
                    .append('<ul class="okayNav__nav--invisible transition-enabled nav-right" />')
                    .append('<a href="#" class="' + _options.toggle_icon_class + ' okay-invisible">' + _options.toggle_icon_content + '</a>')
            } else {
                $navigation
                    .prepend('<ul class="okayNav__nav--invisible transition-enabled nav-left" />')
                    .prepend('<a href="#" class="' + _options.toggle_icon_class + ' okay-invisible">' + _options.toggle_icon_content + '</a>')
            }

            // Cache new elements for further use
            $nav_visible = $navigation.children('.okayNav__nav--visible');
            $nav_invisible = $navigation.children('.okayNav__nav--invisible');
            $nav_toggle_icon = $navigation.children('.' + _options.toggle_icon_class);

            _toggle_icon_width = $nav_toggle_icon.outerWidth(true);
            _nav_default_width = self.getChildrenWidth($navigation);
            _parent_full_width = $(_options.parent).outerWidth(true);
            _last_visible_child_width = 0; // We'll define this later

            // Events are up once everything is set
            self.initEvents();
            if (_options.swipe_enabled == true) self.initSwipeEvents();
        },

        initEvents: function() {
            // Toggle hidden nav when hamburger icon is clicked and
            // Collapse hidden nav on click outside the header
            $document.on('click.okayNav', function(e) {
                var _target = $(e.target);

                if (_nav_visible === true && _target.closest('.okayNav').length == 0)
                    self.closeInvisibleNav();

                if (_target.hasClass(_options.toggle_icon_class)) {
                    e.preventDefault();
                    self.toggleInvisibleNav();
                }
            });

            $window.on('load.okayNav resize.okayNav', function(e) {
                self.recalcNav();
            });
        },

        initSwipeEvents: function() {
            $document
                .on('touchstart.okayNav', function(e) {
                    $nav_invisible.removeClass('transition-enabled');

                    //Trigger only on touch with one finger
                    if (e.originalEvent.touches.length == 1) {
                        var touch = e.originalEvent.touches[0];
                        if (
                            ((touch.pageX < 25 && self.options.align_right == false) ||
                                (touch.pageX > ($(_options.parent).outerWidth(true) - 25) && self.options.align_right == true)) ||
                            _nav_visible === true) {

                            _sTouch.x = _cTouch.x = touch.pageX;
                            _sTouch.y = _cTouch.y = touch.pageY;
                            _sTime = Date.now();
                        }

                    }
                })
                .on('touchmove.okayNav', function(e) {
                    var touch = e.originalEvent.touches[0];
                    self._triggerMove(touch.pageX, touch.pageY);
                    _nav_moving = true;
                })
                .on('touchend.okayNav', function(e) {
                    _sTouch = {
                        x: 0,
                        y: 0
                    };
                    _cTouch = {
                        x: 0,
                        y: 0
                    };
                    _sTime = 0;

                    //Close menu if not swiped enough
                    if (_percent_open > (100 - self.options.threshold)) {
                        _nav_position = 0;
                        self.closeInvisibleNav();

                    } else if (_nav_moving == true) {
                        _nav_position = $nav_invisible.width();
                        self.openInvisibleNav();
                    }

                    _nav_moving = false;

                    $nav_invisible.addClass('transition-enabled');
                });
        },

        _getDirection: function(dx) {
            if (self.options.align_right) {
                return (dx > 0) ? -1 : 1;
            } else {
                return (dx < 0) ? -1 : 1;
            }
        },

        _triggerMove: function(x, y) {
            _cTouch.x = x;
            _cTouch.y = y;

            var currentTime = Date.now();
            var dx = (_cTouch.x - _sTouch.x);
            var dy = (_cTouch.y - _sTouch.y);

            var opposing = dy * dy;
            var distance = Math.sqrt(dx * dx + opposing);
            //Length of the opposing side of the 90deg triagle
            var dOpposing = Math.sqrt(opposing);

            var angle = Math.asin(Math.sin(dOpposing / distance)) * radCoef;
            var speed = distance / (currentTime - _sTime);

            //Set new start position
            _sTouch.x = x;
            _sTouch.y = y;

            //Remove false swipes
            if (angle < 20) {
                var dir = self._getDirection(dx);

                var newPos = _nav_position + dir * distance;
                var menuWidth = $nav_invisible.width();
                var overflow = 0;


                if (newPos < 0) {
                    overflow = -newPos;
                } else if (newPos > menuWidth) {
                    overflow = menuWidth - newPos;
                }

                var size = menuWidth - (_nav_position + dir * distance + overflow);
                var threshold = (size / menuWidth) * 100;

                //Set new position and threshold
                _nav_position += dir * distance + overflow;
                _percent_open = threshold;

                $nav_invisible.css('transform', 'translateX(' + (self.options.align_right ? 1 : -1) * threshold + '%)');
            }

        },

        /*
         * A few methods to allow working with elements
         */
        getParent: function() {
            return _options.parent;
        },

        getVisibleNav: function() { // Visible navigation
            return $nav_visible;
        },

        getInvisibleNav: function() { // Hidden behind the kebab icon
            return $nav_invisible;
        },

        getNavToggleIcon: function() { // Kebab icon
            return $nav_toggle_icon;
        },

        /*
         * Operations
         */
        openInvisibleNav: function() {
            !_options.enable_swipe ? _options.beforeOpen.call() : '';

            $nav_toggle_icon.addClass('icon--active');
            $nav_invisible.addClass('nav-open');
            _nav_visible = true;
            $nav_invisible.css({
                '-webkit-transform': 'translateX(0%)',
                'transform': 'translateX(0%)'
            });

            _options.afterOpen.call();
        },

        closeInvisibleNav: function() {
            !_options.enable_swipe ? _options.beforeClose.call() : '';

            $nav_toggle_icon.removeClass('icon--active');
            $nav_invisible.removeClass('nav-open');

            if (self.options.align_right) {
                $nav_invisible.css({
                    '-webkit-transform': 'translateX(100%)',
                    'transform': 'translateX(100%)'
                });
            } else {
                $nav_invisible.css({
                    '-webkit-transform': 'translateX(-100%)',
                    'transform': 'translateX(-100%)'
                });
            }
            _nav_visible = false;

            _options.afterClose.call();
        },

        toggleInvisibleNav: function() {
            if (!_nav_visible) {
                self.openInvisibleNav();
            } else {
                self.closeInvisibleNav();
            }
        },


        /*
         * Math stuff
         */
        getChildrenWidth: function(el) {
            var children_width = 0;
            var children = $(el).children();
            for (var i = 0; i < children.length; i++) {
                children_width += $(children[i]).outerWidth(true);
            };

            return children_width;
        },

        getVisibleItemCount: function() {
            return $('li', $nav_visible).length;
        },
        getHiddenItemCount: function() {
            return $('li', $nav_invisible).length;
        },

        recalcNav: function() {
            var wrapper_width = $(_options.parent).outerWidth(true),
                space_taken = self.getChildrenWidth(_options.parent),
                nav_full_width = $navigation.outerWidth(true),
                visible_nav_items = self.getVisibleItemCount(),
                collapse_width = $nav_visible.outerWidth(true) + _toggle_icon_width,
                expand_width = space_taken + _last_visible_child_width + _toggle_icon_width,
                expandAll_width = space_taken - nav_full_width + _nav_default_width;
          
            //console.log('Nav width: ' + nav_full_width);
            //console.log('Visible nav + toggle icon: ' + collapse_width);

            if (wrapper_width > expandAll_width) {
                self._expandAllItems();
                $nav_toggle_icon.addClass('okay-invisible');
                return;
            }

            if (visible_nav_items > 0 &&
                nav_full_width <= collapse_width &&
                wrapper_width <= expand_width) {
                self._collapseNavItem();
            }

            if (wrapper_width > expand_width + _toggle_icon_width * 2) {
                self._expandNavItem();
            }

            // Hide the kebab icon if no items are hidden
            self.getHiddenItemCount() == 0 ?
                $nav_toggle_icon.addClass('okay-invisible') :
                $nav_toggle_icon.removeClass('okay-invisible');
        },

        _collapseNavItem: function() {
            var $last_child = $('li:last-child', $nav_visible);
            _last_visible_child_width = $last_child.outerWidth(true);
            $document.trigger('okayNav:collapseItem', $last_child);
            $last_child.detach().prependTo($nav_invisible);
            _options.itemHidden.call();
            // All nav items are visible by default
            // so we only need recursion when collapsing

            self.recalcNav();
        },

        _expandNavItem: function() {
            var $first = $('li:first-child', $nav_invisible);
            $document.trigger('okayNav:expandItem', $first);
            $first.detach().appendTo($nav_visible);
            _options.itemDisplayed.call();
        },

        _expandAllItems: function() {
            $('li', $nav_invisible).detach().appendTo($nav_visible);
            _options.itemDisplayed.call();
        },

        _collapseAllItems: function() {
            $('li', $nav_visible).detach().appendTo($nav_invisible);
            _options.itemHidden.call();
        },

        destroy: function() {
            $('li', $nav_invisible).appendTo($nav_visible);
            $nav_invisible.remove();
            $nav_visible.removeClass('okayNav__nav--visible');
            $nav_toggle_icon.remove();

            $document.unbind('.okayNav');
            $window.unbind('.okayNav');
        }

    }

    // Plugin wrapper
    $.fn[okayNav] = function(options) {
        var args = arguments;

        if (options === undefined || typeof options === 'object') {
            return this.each(function() {
                if (!$.data(this, 'plugin_' + okayNav)) {
                    $.data(this, 'plugin_' + okayNav, new Plugin(this, options));
                }
            });

        } else if (typeof options === 'string' && options[0] !== '_' && options !== 'init') {

            var returns;
            this.each(function() {
                var instance = $.data(this, 'plugin_' + okayNav);
                if (instance instanceof Plugin && typeof instance[options] === 'function') {
                    returns = instance[options].apply(instance, Array.prototype.slice.call(args, 1));
                }

                if (options === 'destroy') {
                    $.data(this, 'plugin_' + okayNav, null);
                }
            });

            return returns !== undefined ? returns : this;
        }
    };

}(jQuery, window, document));

var navigation = $('#nav-main').okayNav();
</script>

