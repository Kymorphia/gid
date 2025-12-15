/// Module for [HeaderBar] class
module gtk.header_bar;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.header_bar.HeaderBar] is a widget for creating custom title bars for windows.
    
    ![An example GtkHeaderBar](headerbar.png)
    
    [gtk.header_bar.HeaderBar] is similar to a horizontal [gtk.center_box.CenterBox]. It allows
    children to be placed at the start or the end. In addition, it allows
    the window title to be displayed. The title will be centered with respect
    to the width of the box, even if the children at either side take up
    different amounts of space.
    
    [gtk.header_bar.HeaderBar] can add typical window frame controls, such as minimize,
    maximize and close buttons, or the window icon.
    
    For these reasons, [gtk.header_bar.HeaderBar] is the natural choice for use as the
    custom titlebar widget of a [gtk.window.Window] (see [gtk.window.Window.setTitlebar]),
    as it gives features typical of titlebars while allowing the addition of
    child widgets.
    
    ## GtkHeaderBar as GtkBuildable
    
    The [gtk.header_bar.HeaderBar] implementation of the [gtk.buildable.Buildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a `<child>` element, or setting the title widget by
    specifying “title” value.
    
    By default the [gtk.header_bar.HeaderBar] uses a [gtk.label.Label] displaying the title of the
    window it is contained in as the title widget, equivalent to the following
    UI definition:
    
    ```xml
    <object class="GtkHeaderBar">
      <property name="title-widget">
        <object class="GtkLabel">
          <property name="label" translatable="yes">Label</property>
          <property name="single-line-mode">True</property>
          <property name="ellipsize">end</property>
          <property name="width-chars">5</property>
          <style>
            <class name="title"/>
          </style>
        </object>
      </property>
    </object>
    ```
    
    # CSS nodes
    
    ```
    headerbar
    ╰── windowhandle
        ╰── box
            ├── box.start
            │   ├── windowcontrols.start
            │   ╰── [other children]
            ├── [Title Widget]
            ╰── box.end
                ├── [other children]
                ╰── windowcontrols.end
    ```
    
    A [gtk.header_bar.HeaderBar]'s CSS node is called `headerbar`. It contains a `windowhandle`
    subnode, which contains a `box` subnode, which contains two `box` subnodes at
    the start and end of the header bar, as well as a center node that represents
    the title.
    
    Each of the boxes contains a `windowcontrols` subnode, see
    [gtk.window_controls.WindowControls] for details, as well as other children.
    
    # Accessibility
    
    [gtk.header_bar.HeaderBar] uses the [gtk.types.AccessibleRole.Group] role.
*/
class HeaderBar : gtk.widget.Widget
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

  /**
      Get `decorationLayout` property.
      Returns: The decoration layout for buttons.
      
      If this property is not set, the
      `property@Gtk.Settings:gtk-decoration-layout` setting is used.
  */
  @property string decorationLayout()
  {
    return getDecorationLayout();
  }

  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for buttons.
        
        If this property is not set, the
        `property@Gtk.Settings:gtk-decoration-layout` setting is used.
  */
  @property void decorationLayout(string propval)
  {
    return setDecorationLayout(propval);
  }

  /**
      Get `showTitleButtons` property.
      Returns: Whether to show title buttons like close, minimize, maximize.
      
      Which buttons are actually shown and where is determined
      by the `property@Gtk.HeaderBar:decoration-layout` property,
      and by the state of the window (e.g. a close button will not
      be shown if the window can't be closed).
  */
  @property bool showTitleButtons()
  {
    return getShowTitleButtons();
  }

  /**
      Set `showTitleButtons` property.
      Params:
        propval = Whether to show title buttons like close, minimize, maximize.
        
        Which buttons are actually shown and where is determined
        by the `property@Gtk.HeaderBar:decoration-layout` property,
        and by the state of the window (e.g. a close button will not
        be shown if the window can't be closed).
  */
  @property void showTitleButtons(bool propval)
  {
    return setShowTitleButtons(propval);
  }

  /** */
  @property gtk.widget.Widget titleWidget()
  {
    return getTitleWidget();
  }

  /** */
  @property void titleWidget(gtk.widget.Widget propval)
  {
    return setTitleWidget(propval);
  }

  /**
      Creates a new [gtk.header_bar.HeaderBar] widget.
      Returns: a new [gtk.header_bar.HeaderBar]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_header_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the decoration layout of the [gtk.header_bar.HeaderBar].
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
      Returns whether this header bar shows the standard window
      title buttons.
      Returns: true if title buttons are shown
  */
  bool getShowTitleButtons()
  {
    bool _retval;
    _retval = cast(bool)gtk_header_bar_get_show_title_buttons(cast(GtkHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the title widget of the header.
      
      See [gtk.header_bar.HeaderBar.setTitleWidget].
      Returns: the title widget of the header
  */
  gtk.widget.Widget getTitleWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_header_bar_get_title_widget(cast(GtkHeaderBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds child to bar, packed with reference to the
      end of the bar.
  
      Params:
        child = the [gtk.widget.Widget] to be added to bar
  */
  void packEnd(gtk.widget.Widget child)
  {
    gtk_header_bar_pack_end(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds child to bar, packed with reference to the
      start of the bar.
  
      Params:
        child = the [gtk.widget.Widget] to be added to bar
  */
  void packStart(gtk.widget.Widget child)
  {
    gtk_header_bar_pack_start(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child from the [gtk.header_bar.HeaderBar].
      
      The child must have been added with
      [gtk.header_bar.HeaderBar.packStart],
      [gtk.header_bar.HeaderBar.packEnd] or
      [gtk.header_bar.HeaderBar.setTitleWidget].
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child)
  {
    gtk_header_bar_remove(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the decoration layout for this header bar.
      
      This property overrides the
      `propertyGtk.Settings:gtk-decoration-layout` setting.
      
      There can be valid reasons for overriding the setting, such
      as a header bar design that does not allow for buttons to take
      room on the right, or only offers room for a single close button.
      Split header bars are another example for overriding the setting.
      
      The format of the string is button names, separated by commas.
      A colon separates the buttons that should appear on the left
      from those on the right. Recognized button names are minimize,
      maximize, close and icon (the window icon).
      
      For example, “icon:minimize,maximize,close” specifies an icon
      on the left, and minimize, maximize and close buttons on the right.
  
      Params:
        layout = a decoration layout, or null to unset the layout
  */
  void setDecorationLayout(string layout = null)
  {
    const(char)* _layout = layout.toCString(No.Alloc);
    gtk_header_bar_set_decoration_layout(cast(GtkHeaderBar*)this._cPtr, _layout);
  }

  /**
      Sets whether this header bar shows the standard window
      title buttons.
  
      Params:
        setting = true to show standard title buttons
  */
  void setShowTitleButtons(bool setting)
  {
    gtk_header_bar_set_show_title_buttons(cast(GtkHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets the title for the [gtk.header_bar.HeaderBar].
      
      When set to null, the headerbar will display the title of
      the window it is contained in.
      
      The title should help a user identify the current view.
      To achieve the same style as the builtin title, use the
      “title” style class.
      
      You should set the title widget to null, for the window
      title label to be visible again.
  
      Params:
        titleWidget = a widget to use for a title
  */
  void setTitleWidget(gtk.widget.Widget titleWidget = null)
  {
    gtk_header_bar_set_title_widget(cast(GtkHeaderBar*)this._cPtr, titleWidget ? cast(GtkWidget*)titleWidget._cPtr(No.Dup) : null);
  }
}
