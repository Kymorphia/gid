/// Module for [HeaderBar] class
module gtk.header_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
    GtkHeaderBar is similar to a horizontal #GtkBox. It allows children to
    be placed at the start or the end. In addition, it allows a title and
    subtitle to be displayed. The title will be centered with respect to
    the width of the box, even if the children at either side take up
    different amounts of space. The height of the titlebar will be
    set to provide sufficient space for the subtitle, even if none is
    currently set. If a subtitle is not needed, the space reservation
    can be turned off with [gtk.header_bar.HeaderBar.setHasSubtitle].
    
    GtkHeaderBar can add typical window frame controls, such as minimize,
    maximize and close buttons, or the window icon.
    
    For these reasons, GtkHeaderBar is the natural choice for use as the custom
    titlebar widget of a #GtkWindow (see [gtk.window.Window.setTitlebar]), as it gives
    features typical of titlebars while allowing the addition of child widgets.
*/
class HeaderBar : gtk.container.Container
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_header_bar_get_type != &gidSymbolNotFound ? gtk_header_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HeaderBar self()
  {
    return this;
  }

  /** */
  @property gtk.widget.Widget customTitle()
  {
    return getCustomTitle();
  }

  /** */
  @property void customTitle(gtk.widget.Widget propval)
  {
    return setCustomTitle(propval);
  }

  /**
      Get `decorationLayout` property.
      Returns: The decoration layout for buttons. If this property is
        not set, the #GtkSettings:gtk-decoration-layout setting
        is used.
        
        See [gtk.header_bar.HeaderBar.setDecorationLayout] for information
        about the format of this string.
  */
  @property string decorationLayout()
  {
    return getDecorationLayout();
  }

  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for buttons. If this property is
          not set, the #GtkSettings:gtk-decoration-layout setting
          is used.
          
          See [gtk.header_bar.HeaderBar.setDecorationLayout] for information
          about the format of this string.
  */
  @property void decorationLayout(string propval)
  {
    return setDecorationLayout(propval);
  }

  /**
      Get `decorationLayoutSet` property.
      Returns: Set to true if #GtkHeaderBar:decoration-layout is set.
  */
  @property bool decorationLayoutSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("decoration-layout-set");
  }

  /**
      Set `decorationLayoutSet` property.
      Params:
        propval = Set to true if #GtkHeaderBar:decoration-layout is set.
  */
  @property void decorationLayoutSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("decoration-layout-set", propval);
  }

  /**
      Get `hasSubtitle` property.
      Returns: If true, reserve space for a subtitle, even if none
        is currently set.
  */
  @property bool hasSubtitle()
  {
    return getHasSubtitle();
  }

  /**
      Set `hasSubtitle` property.
      Params:
        propval = If true, reserve space for a subtitle, even if none
          is currently set.
  */
  @property void hasSubtitle(bool propval)
  {
    return setHasSubtitle(propval);
  }

  /**
      Get `showCloseButton` property.
      Returns: Whether to show window decorations.
        
        Which buttons are actually shown and where is determined
        by the #GtkHeaderBar:decoration-layout property, and by
        the state of the window (e.g. a close button will not be
        shown if the window can't be closed).
  */
  @property bool showCloseButton()
  {
    return getShowCloseButton();
  }

  /**
      Set `showCloseButton` property.
      Params:
        propval = Whether to show window decorations.
          
          Which buttons are actually shown and where is determined
          by the #GtkHeaderBar:decoration-layout property, and by
          the state of the window (e.g. a close button will not be
          shown if the window can't be closed).
  */
  @property void showCloseButton(bool propval)
  {
    return setShowCloseButton(propval);
  }

  /** */
  @property int spacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("spacing");
  }

  /** */
  @property void spacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("spacing", propval);
  }

  /** */
  @property string subtitle()
  {
    return getSubtitle();
  }

  /** */
  @property void subtitle(string propval)
  {
    return setSubtitle(propval);
  }

  /** */
  @property string title()
  {
    return getTitle();
  }

  /** */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Creates a new #GtkHeaderBar widget.
      Returns: a new #GtkHeaderBar
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_header_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the custom title widget of the header. See
      [gtk.header_bar.HeaderBar.setCustomTitle].
      Returns: the custom title widget
           of the header, or null if none has been set explicitly.
  */
  gtk.widget.Widget getCustomTitle()
  {
    GtkWidget* _cretval;
    _cretval = gtk_header_bar_get_custom_title(cast(GtkHeaderBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the decoration layout set with
      [gtk.header_bar.HeaderBar.setDecorationLayout].
      Returns: the decoration layout
  */
  string getDecorationLayout()
  {
    const(char)* _cretval;
    _cretval = gtk_header_bar_get_decoration_layout(cast(GtkHeaderBar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves whether the header bar reserves space for
      a subtitle, regardless if one is currently set or not.
      Returns: true if the header bar reserves space
            for a subtitle
  */
  bool getHasSubtitle()
  {
    bool _retval;
    _retval = cast(bool)gtk_header_bar_get_has_subtitle(cast(GtkHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether this header bar shows the standard window
      decorations.
      Returns: true if the decorations are shown
  */
  bool getShowCloseButton()
  {
    bool _retval;
    _retval = cast(bool)gtk_header_bar_get_show_close_button(cast(GtkHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the subtitle of the header. See [gtk.header_bar.HeaderBar.setSubtitle].
      Returns: the subtitle of the header, or null if none has
           been set explicitly. The returned string is owned by the widget
           and must not be modified or freed.
  */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = gtk_header_bar_get_subtitle(cast(GtkHeaderBar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the title of the header. See [gtk.header_bar.HeaderBar.setTitle].
      Returns: the title of the header, or null if none has
           been set explicitly. The returned string is owned by the widget
           and must not be modified or freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_header_bar_get_title(cast(GtkHeaderBar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Adds child to bar, packed with reference to the
      end of the bar.
  
      Params:
        child = the #GtkWidget to be added to bar
  */
  void packEnd(gtk.widget.Widget child)
  {
    gtk_header_bar_pack_end(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds child to bar, packed with reference to the
      start of the bar.
  
      Params:
        child = the #GtkWidget to be added to bar
  */
  void packStart(gtk.widget.Widget child)
  {
    gtk_header_bar_pack_start(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets a custom title for the #GtkHeaderBar.
      
      The title should help a user identify the current view. This
      supersedes any title set by [gtk.header_bar.HeaderBar.setTitle] or
      [gtk.header_bar.HeaderBar.setSubtitle]. To achieve the same style as
      the builtin title and subtitle, use the “title” and “subtitle”
      style classes.
      
      You should set the custom title to null, for the header title
      label to be visible again.
  
      Params:
        titleWidget = a custom widget to use for a title
  */
  void setCustomTitle(gtk.widget.Widget titleWidget = null)
  {
    gtk_header_bar_set_custom_title(cast(GtkHeaderBar*)this._cPtr, titleWidget ? cast(GtkWidget*)titleWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the decoration layout for this header bar, overriding
      the #GtkSettings:gtk-decoration-layout setting.
      
      There can be valid reasons for overriding the setting, such
      as a header bar design that does not allow for buttons to take
      room on the right, or only offers room for a single close button.
      Split header bars are another example for overriding the
      setting.
      
      The format of the string is button names, separated by commas.
      A colon separates the buttons that should appear on the left
      from those on the right. Recognized button names are minimize,
      maximize, close, icon (the window icon) and menu (a menu button
      for the fallback app menu).
      
      For example, “menu:minimize,maximize,close” specifies a menu
      on the left, and minimize, maximize and close buttons on the right.
  
      Params:
        layout = a decoration layout, or null to
              unset the layout
  */
  void setDecorationLayout(string layout = null)
  {
    const(char)* _layout = layout.toCString(No.Alloc);
    gtk_header_bar_set_decoration_layout(cast(GtkHeaderBar*)this._cPtr, _layout);
  }

  /**
      Sets whether the header bar should reserve space
      for a subtitle, even if none is currently set.
  
      Params:
        setting = true to reserve space for a subtitle
  */
  void setHasSubtitle(bool setting)
  {
    gtk_header_bar_set_has_subtitle(cast(GtkHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets whether this header bar shows the standard window decorations,
      including close, maximize, and minimize.
  
      Params:
        setting = true to show standard window decorations
  */
  void setShowCloseButton(bool setting)
  {
    gtk_header_bar_set_show_close_button(cast(GtkHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets the subtitle of the #GtkHeaderBar. The title should give a user
      an additional detail to help him identify the current view.
      
      Note that GtkHeaderBar by default reserves room for the subtitle,
      even if none is currently set. If this is not desired, set the
      #GtkHeaderBar:has-subtitle property to false.
  
      Params:
        subtitle = a subtitle, or null
  */
  void setSubtitle(string subtitle = null)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    gtk_header_bar_set_subtitle(cast(GtkHeaderBar*)this._cPtr, _subtitle);
  }

  /**
      Sets the title of the #GtkHeaderBar. The title should help a user
      identify the current view. A good title should not include the
      application name.
  
      Params:
        title = a title, or null
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_header_bar_set_title(cast(GtkHeaderBar*)this._cPtr, _title);
  }
}
