/// Module for [Widget] class
module gtk.widget;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import atk.object;
import cairo.context;
import cairo.font_options;
import cairo.region;
import gdk.atom;
import gdk.color;
import gdk.device;
import gdk.display;
import gdk.drag_context;
import gdk.event;
import gdk.event_any;
import gdk.event_button;
import gdk.event_configure;
import gdk.event_crossing;
import gdk.event_expose;
import gdk.event_focus;
import gdk.event_grab_broken;
import gdk.event_key;
import gdk.event_motion;
import gdk.event_property;
import gdk.event_proximity;
import gdk.event_scroll;
import gdk.event_selection;
import gdk.event_visibility;
import gdk.event_window_state;
import gdk.frame_clock;
import gdk.rectangle;
import gdk.rgba;
import gdk.screen;
import gdk.types;
import gdk.visual;
import gdk.window;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.action_group;
import gio.icon;
import gobject.closure;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gtk.accel_group;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.clipboard;
import gtk.container;
import gtk.rc_style;
import gtk.requisition;
import gtk.selection_data;
import gtk.settings;
import gtk.style;
import gtk.style_context;
import gtk.target_entry;
import gtk.target_list;
import gtk.tooltip;
import gtk.types;
import gtk.widget_path;
import gtk.window;
import pango.context;
import pango.font_description;
import pango.font_map;
import pango.layout;

/**
    GtkWidget is the base class all widgets in GTK+ derive from. It manages the
    widget lifecycle, states and style.
    
    # Height-for-width Geometry Management # {#geometry-management}
    
    GTK+ uses a height-for-width (and width-for-height) geometry management
    system. Height-for-width means that a widget can change how much
    vertical space it needs, depending on the amount of horizontal space
    that it is given (and similar for width-for-height). The most common
    example is a label that reflows to fill up the available width, wraps
    to fewer lines, and therefore needs less height.
    
    Height-for-width geometry management is implemented in GTK+ by way
    of five virtual methods:
    
    $(LIST
      * #GtkWidgetClass.get_request_mode()
      * #GtkWidgetClass.get_preferred_width()
      * #GtkWidgetClass.get_preferred_height()
      * #GtkWidgetClass.get_preferred_height_for_width()
      * #GtkWidgetClass.get_preferred_width_for_height()
      * #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
    )
      
    There are some important things to keep in mind when implementing
    height-for-width and when using it in container implementations.
    
    The geometry management system will query a widget hierarchy in
    only one orientation at a time. When widgets are initially queried
    for their minimum sizes it is generally done in two initial passes
    in the #GtkSizeRequestMode chosen by the toplevel.
    
    For example, when queried in the normal
    [gtk.types.SizeRequestMode.HeightForWidth] mode:
    First, the default minimum and natural width for each widget
    in the interface will be computed using [gtk.widget.Widget.getPreferredWidth].
    Because the preferred widths for each container depend on the preferred
    widths of their children, this information propagates up the hierarchy,
    and finally a minimum and natural width is determined for the entire
    toplevel. Next, the toplevel will use the minimum width to query for the
    minimum height contextual to that width using
    [gtk.widget.Widget.getPreferredHeightForWidth], which will also be a highly
    recursive operation. The minimum height for the minimum width is normally
    used to set the minimum size constraint on the toplevel
    (unless [gtk.window.Window.setGeometryHints] is explicitly used instead).
    
    After the toplevel window has initially requested its size in both
    dimensions it can go on to allocate itself a reasonable size (or a size
    previously specified with [gtk.window.Window.setDefaultSize]). During the
    recursive allocation process it’s important to note that request cycles
    will be recursively executed while container widgets allocate their children.
    Each container widget, once allocated a size, will go on to first share the
    space in one orientation among its children and then request each child's
    height for its target allocated width or its width for allocated height,
    depending. In this way a #GtkWidget will typically be requested its size
    a number of times before actually being allocated a size. The size a
    widget is finally allocated can of course differ from the size it has
    requested. For this reason, #GtkWidget caches a  small number of results
    to avoid re-querying for the same sizes in one allocation cycle.
    
    See
    [GtkContainer’s geometry management section][container-geometry-management]
    to learn more about how height-for-width allocations are performed
    by container widgets.
    
    If a widget does move content around to intelligently use up the
    allocated size then it must support the request in both
    #GtkSizeRequestModes even if the widget in question only
    trades sizes in a single orientation.
    
    For instance, a #GtkLabel that does height-for-width word wrapping
    will not expect to have #GtkWidgetClass.get_preferred_height() called
    because that call is specific to a width-for-height request. In this
    case the label must return the height required for its own minimum
    possible width. By following this rule any widget that handles
    height-for-width or width-for-height requests will always be allocated
    at least enough space to fit its own content.
    
    Here are some examples of how a [gtk.types.SizeRequestMode.HeightForWidth] widget
    generally deals with width-for-height requests, for #GtkWidgetClass.get_preferred_height()
    it will do:
    
    ```c
    static void
    foo_widget_get_preferred_height (GtkWidget *widget,
                                     gint *min_height,
                                     gint *nat_height)
    {
       if (i_am_in_height_for_width_mode)
         {
           gint min_width, nat_width;
    
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               &min_width,
                                                               &nat_width);
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_height_for_width
                                                              (widget,
                                                               min_width,
                                                               min_height,
                                                               nat_height);
         }
       else
         {
            ... some widgets do both. For instance, if a GtkLabel is
            rotated to 90 degrees it will return the minimum and
            natural height for the rotated label here.
         }
    }
    ```
    
    And in #GtkWidgetClass.get_preferred_width_for_height() it will simply return
    the minimum and natural width:
    ```c
    static void
    foo_widget_get_preferred_width_for_height (GtkWidget *widget,
                                               gint for_height,
                                               gint *min_width,
                                               gint *nat_width)
    {
       if (i_am_in_height_for_width_mode)
         {
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               min_width,
                                                               nat_width);
         }
       else
         {
            ... again if a widget is sometimes operating in
            width-for-height mode (like a rotated GtkLabel) it can go
            ahead and do its real width for height calculation here.
         }
    }
    ```
    
    Often a widget needs to get its own request during size request or
    allocation. For example, when computing height it may need to also
    compute width. Or when deciding how to use an allocation, the widget
    may need to know its natural size. In these cases, the widget should
    be careful to call its virtual methods directly, like this:
    
    ```c
    GTK_WIDGET_GET_CLASS(widget)->get_preferred_width (widget,
                                                       &min,
                                                       &natural);
    ```
    
    It will not work to use the wrapper functions, such as
    [gtk.widget.Widget.getPreferredWidth] inside your own size request
    implementation. These return a request adjusted by #GtkSizeGroup
    and by the #GtkWidgetClass.adjust_size_request() virtual method. If a
    widget used the wrappers inside its virtual method implementations,
    then the adjustments (such as widget margins) would be applied
    twice. GTK+ therefore does not allow this and will warn if you try
    to do it.
    
    Of course if you are getting the size request for
    another widget, such as a child of a
    container, you must use the wrapper APIs.
    Otherwise, you would not properly consider widget margins,
    #GtkSizeGroup, and so forth.
    
    Since 3.10 GTK+ also supports baseline vertical alignment of widgets. This
    means that widgets are positioned such that the typographical baseline of
    widgets in the same row are aligned. This happens if a widget supports baselines,
    has a vertical alignment of [gtk.types.Align.Baseline], and is inside a container
    that supports baselines and has a natural “row” that it aligns to the baseline,
    or a baseline assigned to it by the grandparent.
    
    Baseline alignment support for a widget is done by the #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
    virtual function. It allows you to report a baseline in combination with the
    minimum and natural height. If there is no baseline you can return -1 to indicate
    this. The default implementation of this virtual function calls into the
    #GtkWidgetClass.get_preferred_height() and #GtkWidgetClass.get_preferred_height_for_width(),
    so if baselines are not supported it doesn’t need to be implemented.
    
    If a widget ends up baseline aligned it will be allocated all the space in the parent
    as if it was [gtk.types.Align.Fill], but the selected baseline can be found via [gtk.widget.Widget.getAllocatedBaseline].
    If this has a value other than -1 you need to align the widget such that the baseline
    appears at the position.
    
    # Style Properties
    
    #GtkWidget introduces “style
    properties” - these are basically object properties that are stored
    not on the object, but in the style object associated to the widget. Style
    properties are set in [resource files][gtk3-Resource-Files].
    This mechanism is used for configuring such things as the location of the
    scrollbar arrows through the theme, giving theme authors more control over the
    look of applications without the need to write a theme engine in C.
    
    Use [gtk.widget_class.WidgetClass.installStyleProperty] to install style properties for
    a widget class, [gtk.widget_class.WidgetClass.findStyleProperty] or
    [gtk.widget_class.WidgetClass.listStyleProperties] to get information about existing
    style properties and [gtk.widget.Widget.styleGetProperty], [gtk.widget.Widget.styleGet] or
    [gtk.widget.Widget.styleGetValist] to obtain the value of a style property.
    
    # GtkWidget as GtkBuildable
    
    The GtkWidget implementation of the GtkBuildable interface supports a
    custom `<accelerator>` element, which has attributes named ”key”, ”modifiers”
    and ”signal” and allows to specify accelerators.
    
    An example of a UI definition fragment specifying an accelerator:
    
    ```xml
    <object class="GtkButton">
      <accelerator key="q" modifiers="GDK_CONTROL_MASK" signal="clicked"/>
    </object>
    ```
    
    In addition to accelerators, GtkWidget also support a custom `<accessible>`
    element, which supports actions and relations. Properties on the accessible
    implementation of an object can be set by accessing the internal child
    “accessible” of a #GtkWidget.
    
    An example of a UI definition fragment specifying an accessible:
    
    ```xml
    <object class="GtkLabel" id="label1"/>
      <property name="label">I am a Label for a Button</property>
    </object>
    <object class="GtkButton" id="button1">
      <accessibility>
        <action action_name="click" translatable="yes">Click the button.</action>
        <relation target="label1" type="labelled-by"/>
      </accessibility>
      <child internal-child="accessible">
        <object class="AtkObject" id="a11y-button1">
          <property name="accessible-name">Clickable Button</property>
        </object>
      </child>
    </object>
    ```
    
    Finally, GtkWidget allows style information such as style classes to
    be associated with widgets, using the custom `<style>` element:
    
    ```xml
    <object class="GtkButton" id="button1">
      <style>
        <class name="my-special-button-class"/>
        <class name="dark-button"/>
      </style>
    </object>
    ```
    
    # Building composite widgets from template XML ## {#composite-templates}
    
    GtkWidget exposes some facilities to automate the procedure
    of creating composite widgets using #GtkBuilder interface description
    language.
    
    To create composite widgets with #GtkBuilder XML, one must associate
    the interface description with the widget class at class initialization
    time using [gtk.widget_class.WidgetClass.setTemplate].
    
    The interface description semantics expected in composite template descriptions
    is slightly different from regular #GtkBuilder XML.
    
    Unlike regular interface descriptions, [gtk.widget_class.WidgetClass.setTemplate] will
    expect a `<template>` tag as a direct child of the toplevel `<interface>`
    tag. The `<template>` tag must specify the “class” attribute which must be
    the type name of the widget. Optionally, the “parent” attribute may be
    specified to specify the direct parent type of the widget type, this is
    ignored by the GtkBuilder but required for Glade to introspect what kind
    of properties and internal children exist for a given type when the actual
    type does not exist.
    
    The XML which is contained inside the `<template>` tag behaves as if it were
    added to the `<object>` tag defining "widget" itself. You may set properties
    on @widget by inserting `<property>` tags into the `<template>` tag, and also
    add `<child>` tags to add children and extend "widget" in the normal way you
    would with `<object>` tags.
    
    Additionally, `<object>` tags can also be added before and after the initial
    `<template>` tag in the normal way, allowing one to define auxiliary objects
    which might be referenced by other widgets declared as children of the
    `<template>` tag.
    
    An example of a GtkBuilder Template Definition:
    
    ```xml
    <interface>
      <template class="FooWidget" parent="GtkBox">
        <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
        <property name="spacing">4</property>
        <child>
          <object class="GtkButton" id="hello_button">
            <property name="label">Hello World</property>
            <signal name="clicked" handler="hello_button_clicked" object="FooWidget" swapped="yes"/>
          </object>
        </child>
        <child>
          <object class="GtkButton" id="goodbye_button">
            <property name="label">Goodbye World</property>
          </object>
        </child>
      </template>
    </interface>
    ```
    
    Typically, you'll place the template fragment into a file that is
    bundled with your project, using #GResource. In order to load the
    template, you need to call [gtk.widget_class.WidgetClass.setTemplateFromResource]
    from the class initialization of your #GtkWidget type:
    
    ```c
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
    
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
    }
    ```
    
    You will also need to call [gtk.widget.Widget.initTemplate] from the instance
    initialization function:
    
    ```c
    static void
    foo_widget_init (FooWidget *self)
    {
      // ...
      gtk_widget_init_template (GTK_WIDGET (self));
    }
    ```
    
    You can access widgets defined in the template using the
    [gtk.widget.Widget.getTemplateChild] function, but you will typically declare
    a pointer in the instance private data structure of your type using the same
    name as the widget in the template definition, and call
    gtk_widget_class_bind_template_child_private() with that name, e.g.
    
    ```c
    typedef struct {
      GtkWidget *hello_button;
      GtkWidget *goodbye_button;
    } FooWidgetPrivate;
    
    G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)
    
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
      gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
                                                    FooWidget, hello_button);
      gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
                                                    FooWidget, goodbye_button);
    }
    
    static void
    foo_widget_init (FooWidget *widget)
    {
    
    }
    ```
    
    You can also use gtk_widget_class_bind_template_callback() to connect a signal
    callback defined in the template with a function visible in the scope of the
    class, e.g.
    
    ```c
    // the signal handler has the instance and user data swapped
    // because of the swapped="yes" attribute in the template XML
    static void
    hello_button_clicked (FooWidget *self,
                          GtkButton *button)
    {
      g_print ("Hello, world!\n");
    }
    
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
      gtk_widget_class_bind_template_callback (GTK_WIDGET_CLASS (klass), hello_button_clicked);
    }
    ```
*/
class Widget : gobject.initially_unowned.InitiallyUnowned, atk.implementor_iface.ImplementorIface, gtk.buildable.Buildable
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
    return cast(void function())gtk_widget_get_type != &gidSymbolNotFound ? gtk_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Widget self()
  {
    return this;
  }

  /** */
  @property bool appPaintable()
  {
    return getAppPaintable();
  }

  /** */
  @property void appPaintable(bool propval)
  {
    return setAppPaintable(propval);
  }

  /** */
  @property bool canDefault()
  {
    return getCanDefault();
  }

  /** */
  @property void canDefault(bool propval)
  {
    return setCanDefault(propval);
  }

  /** */
  @property bool canFocus()
  {
    return getCanFocus();
  }

  /** */
  @property void canFocus(bool propval)
  {
    return setCanFocus(propval);
  }

  /** */
  @property bool compositeChild()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("composite-child");
  }

  /**
      Get `doubleBuffered` property.
      Returns: Whether the widget is double buffered.
  
      Deprecated: Widgets should not use this property.
  */
  @property bool doubleBuffered()
  {
    return getDoubleBuffered();
  }

  /**
      Set `doubleBuffered` property.
      Params:
        propval = Whether the widget is double buffered.
  
      Deprecated: Widgets should not use this property.
  */
  @property void doubleBuffered(bool propval)
  {
    return setDoubleBuffered(propval);
  }

  /** */
  @property gdk.types.EventMask events()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.types.EventMask)("events");
  }

  /** */
  @property void events(gdk.types.EventMask propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.types.EventMask)("events", propval);
  }

  /**
      Get `expand` property.
      Returns: Whether to expand in both directions. Setting this sets both #GtkWidget:hexpand and #GtkWidget:vexpand
  */
  @property bool expand()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("expand");
  }

  /**
      Set `expand` property.
      Params:
        propval = Whether to expand in both directions. Setting this sets both #GtkWidget:hexpand and #GtkWidget:vexpand
  */
  @property void expand(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("expand", propval);
  }

  /**
      Get `focusOnClick` property.
      Returns: Whether the widget should grab focus when it is clicked with the mouse.
        
        This property is only relevant for widgets that can take focus.
        
        Before 3.20, several widgets (GtkButton, GtkFileChooserButton,
        GtkComboBox) implemented this property individually.
  */
  @property bool focusOnClick()
  {
    return getFocusOnClick();
  }

  /**
      Set `focusOnClick` property.
      Params:
        propval = Whether the widget should grab focus when it is clicked with the mouse.
          
          This property is only relevant for widgets that can take focus.
          
          Before 3.20, several widgets (GtkButton, GtkFileChooserButton,
          GtkComboBox) implemented this property individually.
  */
  @property void focusOnClick(bool propval)
  {
    return setFocusOnClick(propval);
  }

  /**
      Get `halign` property.
      Returns: How to distribute horizontal space if widget gets extra space, see #GtkAlign
  */
  @property gtk.types.Align halign()
  {
    return getHalign();
  }

  /**
      Set `halign` property.
      Params:
        propval = How to distribute horizontal space if widget gets extra space, see #GtkAlign
  */
  @property void halign(gtk.types.Align propval)
  {
    return setHalign(propval);
  }

  /**
      Get `hasTooltip` property.
      Returns: Enables or disables the emission of #GtkWidget::query-tooltip on @widget.
        A value of true indicates that @widget can have a tooltip, in this case
        the widget will be queried using #GtkWidget::query-tooltip to determine
        whether it will provide a tooltip or not.
        
        Note that setting this property to true for the first time will change
        the event masks of the GdkWindows of this widget to include leave-notify
        and motion-notify events.  This cannot and will not be undone when the
        property is set to false again.
  */
  @property bool hasTooltip()
  {
    return getHasTooltip();
  }

  /**
      Set `hasTooltip` property.
      Params:
        propval = Enables or disables the emission of #GtkWidget::query-tooltip on @widget.
          A value of true indicates that @widget can have a tooltip, in this case
          the widget will be queried using #GtkWidget::query-tooltip to determine
          whether it will provide a tooltip or not.
          
          Note that setting this property to true for the first time will change
          the event masks of the GdkWindows of this widget to include leave-notify
          and motion-notify events.  This cannot and will not be undone when the
          property is set to false again.
  */
  @property void hasTooltip(bool propval)
  {
    return setHasTooltip(propval);
  }

  /** */
  @property int heightRequest()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("height-request");
  }

  /** */
  @property void heightRequest(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("height-request", propval);
  }

  /**
      Get `hexpand` property.
      Returns: Whether to expand horizontally. See [gtk.widget.Widget.setHexpand].
  */
  @property bool hexpand()
  {
    return getHexpand();
  }

  /**
      Set `hexpand` property.
      Params:
        propval = Whether to expand horizontally. See [gtk.widget.Widget.setHexpand].
  */
  @property void hexpand(bool propval)
  {
    return setHexpand(propval);
  }

  /**
      Get `hexpandSet` property.
      Returns: Whether to use the #GtkWidget:hexpand property. See [gtk.widget.Widget.getHexpandSet].
  */
  @property bool hexpandSet()
  {
    return getHexpandSet();
  }

  /**
      Set `hexpandSet` property.
      Params:
        propval = Whether to use the #GtkWidget:hexpand property. See [gtk.widget.Widget.getHexpandSet].
  */
  @property void hexpandSet(bool propval)
  {
    return setHexpandSet(propval);
  }

  /**
      Get `margin` property.
      Returns: Sets all four sides' margin at once. If read, returns max
        margin on any side.
  */
  @property int margin()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("margin");
  }

  /**
      Set `margin` property.
      Params:
        propval = Sets all four sides' margin at once. If read, returns max
          margin on any side.
  */
  @property void margin(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("margin", propval);
  }

  /**
      Get `marginBottom` property.
      Returns: Margin on bottom side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property int marginBottom()
  {
    return getMarginBottom();
  }

  /**
      Set `marginBottom` property.
      Params:
        propval = Margin on bottom side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property void marginBottom(int propval)
  {
    return setMarginBottom(propval);
  }

  /**
      Get `marginEnd` property.
      Returns: Margin on end of widget, horizontally. This property supports
        left-to-right and right-to-left text directions.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property int marginEnd()
  {
    return getMarginEnd();
  }

  /**
      Set `marginEnd` property.
      Params:
        propval = Margin on end of widget, horizontally. This property supports
          left-to-right and right-to-left text directions.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property void marginEnd(int propval)
  {
    return setMarginEnd(propval);
  }

  /**
      Get `marginLeft` property.
      Returns: Margin on left side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gtk.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-start instead.
  */
  @property int marginLeft()
  {
    return getMarginLeft();
  }

  /**
      Set `marginLeft` property.
      Params:
        propval = Margin on left side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gtk.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-start instead.
  */
  @property void marginLeft(int propval)
  {
    return setMarginLeft(propval);
  }

  /**
      Get `marginRight` property.
      Returns: Margin on right side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gtk.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-end instead.
  */
  @property int marginRight()
  {
    return getMarginRight();
  }

  /**
      Set `marginRight` property.
      Params:
        propval = Margin on right side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gtk.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-end instead.
  */
  @property void marginRight(int propval)
  {
    return setMarginRight(propval);
  }

  /**
      Get `marginStart` property.
      Returns: Margin on start of widget, horizontally. This property supports
        left-to-right and right-to-left text directions.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property int marginStart()
  {
    return getMarginStart();
  }

  /**
      Set `marginStart` property.
      Params:
        propval = Margin on start of widget, horizontally. This property supports
          left-to-right and right-to-left text directions.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property void marginStart(int propval)
  {
    return setMarginStart(propval);
  }

  /**
      Get `marginTop` property.
      Returns: Margin on top side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property int marginTop()
  {
    return getMarginTop();
  }

  /**
      Set `marginTop` property.
      Params:
        propval = Margin on top side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property void marginTop(int propval)
  {
    return setMarginTop(propval);
  }

  /** */
  @property string name()
  {
    return getName();
  }

  /** */
  @property void name(string propval)
  {
    return setName(propval);
  }

  /** */
  @property bool noShowAll()
  {
    return getNoShowAll();
  }

  /** */
  @property void noShowAll(bool propval)
  {
    return setNoShowAll(propval);
  }

  /**
      Get `opacity` property.
      Returns: The requested opacity of the widget. See [gtk.widget.Widget.setOpacity] for
        more details about window opacity.
        
        Before 3.8 this was only available in GtkWindow
  */
  @property double opacity()
  {
    return getOpacity();
  }

  /**
      Set `opacity` property.
      Params:
        propval = The requested opacity of the widget. See [gtk.widget.Widget.setOpacity] for
          more details about window opacity.
          
          Before 3.8 this was only available in GtkWindow
  */
  @property void opacity(double propval)
  {
    return setOpacity(propval);
  }

  /** */
  @property gtk.container.Container parent()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.container.Container)("parent");
  }

  /** */
  @property void parent(gtk.container.Container propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.container.Container)("parent", propval);
  }

  /** */
  @property bool receivesDefault()
  {
    return getReceivesDefault();
  }

  /** */
  @property void receivesDefault(bool propval)
  {
    return setReceivesDefault(propval);
  }

  /**
      Get `scaleFactor` property.
      Returns: The scale factor of the widget. See [gtk.widget.Widget.getScaleFactor] for
        more details about widget scaling.
  */
  @property int scaleFactor()
  {
    return getScaleFactor();
  }

  /** */
  @property bool sensitive()
  {
    return getSensitive();
  }

  /** */
  @property void sensitive(bool propval)
  {
    return setSensitive(propval);
  }

  /**
      Get `style` property.
      Returns: The style of the widget, which contains information about how it will look (colors, etc).
  
      Deprecated: Use #GtkStyleContext instead
  */
  @property gtk.style.Style style()
  {
    return getStyle();
  }

  /**
      Set `style` property.
      Params:
        propval = The style of the widget, which contains information about how it will look (colors, etc).
  
      Deprecated: Use #GtkStyleContext instead
  */
  @property void style(gtk.style.Style propval)
  {
    return setStyle(propval);
  }

  /**
      Get `tooltipMarkup` property.
      Returns: Sets the text of tooltip to be the given string, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        Also see [gtk.tooltip.Tooltip.setMarkup].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null: #GtkWidget:has-tooltip
        will automatically be set to true and there will be taken care of
        #GtkWidget::query-tooltip in the default signal handler.
        
        Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
        are set, the last one wins.
  */
  @property string tooltipMarkup()
  {
    return getTooltipMarkup();
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          Also see [gtk.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null: #GtkWidget:has-tooltip
          will automatically be set to true and there will be taken care of
          #GtkWidget::query-tooltip in the default signal handler.
          
          Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
          are set, the last one wins.
  */
  @property void tooltipMarkup(string propval)
  {
    return setTooltipMarkup(propval);
  }

  /**
      Get `tooltipText` property.
      Returns: Sets the text of tooltip to be the given string.
        
        Also see [gtk.tooltip.Tooltip.setText].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null: #GtkWidget:has-tooltip
        will automatically be set to true and there will be taken care of
        #GtkWidget::query-tooltip in the default signal handler.
        
        Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
        are set, the last one wins.
  */
  @property string tooltipText()
  {
    return getTooltipText();
  }

  /**
      Set `tooltipText` property.
      Params:
        propval = Sets the text of tooltip to be the given string.
          
          Also see [gtk.tooltip.Tooltip.setText].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null: #GtkWidget:has-tooltip
          will automatically be set to true and there will be taken care of
          #GtkWidget::query-tooltip in the default signal handler.
          
          Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
          are set, the last one wins.
  */
  @property void tooltipText(string propval)
  {
    return setTooltipText(propval);
  }

  /**
      Get `valign` property.
      Returns: How to distribute vertical space if widget gets extra space, see #GtkAlign
  */
  @property gtk.types.Align valign()
  {
    return getValign();
  }

  /**
      Set `valign` property.
      Params:
        propval = How to distribute vertical space if widget gets extra space, see #GtkAlign
  */
  @property void valign(gtk.types.Align propval)
  {
    return setValign(propval);
  }

  /**
      Get `vexpand` property.
      Returns: Whether to expand vertically. See [gtk.widget.Widget.setVexpand].
  */
  @property bool vexpand()
  {
    return getVexpand();
  }

  /**
      Set `vexpand` property.
      Params:
        propval = Whether to expand vertically. See [gtk.widget.Widget.setVexpand].
  */
  @property void vexpand(bool propval)
  {
    return setVexpand(propval);
  }

  /**
      Get `vexpandSet` property.
      Returns: Whether to use the #GtkWidget:vexpand property. See [gtk.widget.Widget.getVexpandSet].
  */
  @property bool vexpandSet()
  {
    return getVexpandSet();
  }

  /**
      Set `vexpandSet` property.
      Params:
        propval = Whether to use the #GtkWidget:vexpand property. See [gtk.widget.Widget.getVexpandSet].
  */
  @property void vexpandSet(bool propval)
  {
    return setVexpandSet(propval);
  }

  /** */
  @property bool visible()
  {
    return getVisible();
  }

  /** */
  @property void visible(bool propval)
  {
    return setVisible(propval);
  }

  /** */
  @property int widthRequest()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("width-request");
  }

  /** */
  @property void widthRequest(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("width-request", propval);
  }

  /**
      Get `window` property.
      Returns: The widget's window if it is realized, null otherwise.
  */
  @property gdk.window.Window window()
  {
    return getWindow();
  }

  mixin ImplementorIfaceT!();
  mixin BuildableT!();

  /**
      Obtains the current default reading direction. See
      [gtk.widget.Widget.setDefaultDirection].
      Returns: the current default direction.
  */
  static gtk.types.TextDirection getDefaultDirection()
  {
    GtkTextDirection _cretval;
    _cretval = gtk_widget_get_default_direction();
    gtk.types.TextDirection _retval = cast(gtk.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Returns the default style used by all widgets initially.
      Returns: the default style. This #GtkStyle
            object is owned by GTK+ and should not be modified or freed.
  
      Deprecated: Use #GtkStyleContext instead, and
            [gtk.css_provider.CssProvider.getDefault] to obtain a #GtkStyleProvider
            with the default widget style information.
  */
  static gtk.style.Style getDefaultStyle()
  {
    GtkStyle* _cretval;
    _cretval = gtk_widget_get_default_style();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style.Style)(cast(GtkStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Cancels the effect of a previous call to [gtk.widget.Widget.pushCompositeChild].
  
      Deprecated: Use [gtk.widget_class.WidgetClass.setTemplate], or don’t use this API at all.
  */
  static void popCompositeChild()
  {
    gtk_widget_pop_composite_child();
  }

  /**
      Makes all newly-created widgets as composite children until
      the corresponding [gtk.widget.Widget.popCompositeChild] call.
      
      A composite child is a child that’s an implementation detail of the
      container it’s inside and should not be visible to people using the
      container. Composite children aren’t treated differently by GTK+ (but
      see [gtk.container.Container.foreach_] vs. [gtk.container.Container.forall]), but e.g. GUI
      builders might want to treat them in a different way.
  
      Deprecated: This API never really worked well and was mostly unused, now
        we have a more complete mechanism for composite children, see [gtk.widget_class.WidgetClass.setTemplate].
  */
  static void pushCompositeChild()
  {
    gtk_widget_push_composite_child();
  }

  /**
      Sets the default reading direction for widgets where the
      direction has not been explicitly set by [gtk.widget.Widget.setDirection].
  
      Params:
        dir = the new default direction. This cannot be
                 [gtk.types.TextDirection.None].
  */
  static void setDefaultDirection(gtk.types.TextDirection dir)
  {
    gtk_widget_set_default_direction(dir);
  }

  /**
      For widgets that can be “activated” (buttons, menu items, etc.)
      this function activates them. Activation is what happens when you
      press Enter on a widget during key navigation. If widget isn't
      activatable, the function returns false.
      Returns: true if the widget was activatable
  */
  bool activate()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_activate(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Installs an accelerator for this widget in accel_group that causes
      accel_signal to be emitted if the accelerator is activated.
      The accel_group needs to be added to the widget’s toplevel via
      [gtk.window.Window.addAccelGroup], and the signal must be of type `G_SIGNAL_ACTION`.
      Accelerators added through this function are not user changeable during
      runtime. If you want to support accelerators that can be changed by the
      user, use [gtk.accel_map.AccelMap.addEntry] and [gtk.widget.Widget.setAccelPath] or
      [gtk.menu_item.MenuItem.setAccelPath] instead.
  
      Params:
        accelSignal = widget signal to emit on accelerator activation
        accelGroup = accel group for this widget, added to its toplevel
        accelKey = GDK keyval of the accelerator
        accelMods = modifier key combination of the accelerator
        accelFlags = flag accelerators, e.g. [gtk.types.AccelFlags.Visible]
  */
  void addAccelerator(string accelSignal, gtk.accel_group.AccelGroup accelGroup, uint accelKey, gdk.types.ModifierType accelMods, gtk.types.AccelFlags accelFlags)
  {
    const(char)* _accelSignal = accelSignal.toCString(No.Alloc);
    gtk_widget_add_accelerator(cast(GtkWidget*)this._cPtr, _accelSignal, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null, accelKey, accelMods, accelFlags);
  }

  /**
      Adds the device events in the bitfield events to the event mask for
      widget. See [gtk.widget.Widget.setDeviceEvents] for details.
  
      Params:
        device = a #GdkDevice
        events = an event mask, see #GdkEventMask
  */
  void addDeviceEvents(gdk.device.Device device, gdk.types.EventMask events)
  {
    gtk_widget_add_device_events(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, events);
  }

  /**
      Adds the events in the bitfield events to the event mask for
      widget. See [gtk.widget.Widget.setEvents] and the
      [input handling overview][event-masks] for details.
  
      Params:
        events = an event mask, see #GdkEventMask
  */
  void addEvents(int events)
  {
    gtk_widget_add_events(cast(GtkWidget*)this._cPtr, events);
  }

  /**
      Adds a widget to the list of mnemonic labels for
      this widget. (See [gtk.widget.Widget.listMnemonicLabels]). Note the
      list of mnemonic labels for the widget is cleared when the
      widget is destroyed, so the caller must make sure to update
      its internal state at this point as well, by using a connection
      to the #GtkWidget::destroy signal or a weak notifier.
  
      Params:
        label = a #GtkWidget that acts as a mnemonic label for widget
  */
  void addMnemonicLabel(gtk.widget.Widget label)
  {
    gtk_widget_add_mnemonic_label(cast(GtkWidget*)this._cPtr, label ? cast(GtkWidget*)label._cPtr(No.Dup) : null);
  }

  /**
      Queues an animation frame update and adds a callback to be called
      before each frame. Until the tick callback is removed, it will be
      called frequently (usually at the frame rate of the output device
      or as quickly as the application can be repainted, whichever is
      slower). For this reason, is most suitable for handling graphics
      that change every frame or every few frames. The tick callback does
      not automatically imply a relayout or repaint. If you want a
      repaint or relayout, and aren’t changing widget properties that
      would trigger that (for example, changing the text of a #GtkLabel),
      then you will have to call [gtk.widget.Widget.queueResize] or
      [gtk.widget.Widget.queueDrawArea] yourself.
      
      [gdk.frame_clock.FrameClock.getFrameTime] should generally be used for timing
      continuous animations and
      [gdk.frame_timings.FrameTimings.getPredictedPresentationTime] if you are
      trying to display isolated frames at particular times.
      
      This is a more convenient alternative to connecting directly to the
      #GdkFrameClock::update signal of #GdkFrameClock, since you don't
      have to worry about when a #GdkFrameClock is assigned to a widget.
  
      Params:
        callback = function to call for updating animations
      Returns: an id for the connection of this callback. Remove the callback
            by passing it to [gtk.widget.Widget.removeTickCallback]
  */
  uint addTickCallback(gtk.types.TickCallback callback)
  {
    extern(C) gboolean _callbackCallback(GtkWidget* widget, GdkFrameClock* frameClock, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TickCallback*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take), gobject.object.ObjectWrap._getDObject!(gdk.frame_clock.FrameClock)(cast(void*)frameClock, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    uint _retval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _retval = gtk_widget_add_tick_callback(cast(GtkWidget*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
    return _retval;
  }

  /**
      Determines whether an accelerator that activates the signal
      identified by signal_id can currently be activated.
      This is done by emitting the #GtkWidget::can-activate-accel
      signal on widget; if the signal isn’t overridden by a
      handler or in a derived widget, then the default check is
      that the widget must be sensitive, and the widget and all
      its ancestors mapped.
  
      Params:
        signalId = the ID of a signal installed on widget
      Returns: true if the accelerator can be activated.
  */
  bool canActivateAccel(uint signalId)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_can_activate_accel(cast(GtkWidget*)this._cPtr, signalId);
    return _retval;
  }

  /**
      This function is used by custom widget implementations; if you're
      writing an app, you’d use [gtk.widget.Widget.grabFocus] to move the focus
      to a particular widget, and [gtk.container.Container.setFocusChain] to
      change the focus tab order. So you may want to investigate those
      functions instead.
      
      [gtk.widget.Widget.childFocus] is called by containers as the user moves
      around the window using keyboard shortcuts. direction indicates
      what kind of motion is taking place (up, down, left, right, tab
      forward, tab backward). [gtk.widget.Widget.childFocus] emits the
      #GtkWidget::focus signal; widgets override the default handler
      for this signal in order to implement appropriate focus behavior.
      
      The default ::focus handler for a widget should return true if
      moving in direction left the focus on a focusable location inside
      that widget, and false if moving in direction moved the focus
      outside the widget. If returning true, widgets normally
      call [gtk.widget.Widget.grabFocus] to place the focus accordingly;
      if returning false, they don’t modify the current focus location.
  
      Params:
        direction = direction of focus movement
      Returns: true if focus ended up inside widget
  */
  bool childFocus(gtk.types.DirectionType direction)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_child_focus(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Emits a #GtkWidget::child-notify signal for the
      [child property][child-properties] child_property
      on widget.
      
      This is the analogue of [gobject.object.ObjectWrap.notify] for child properties.
      
      Also see [gtk.container.Container.childNotify].
  
      Params:
        childProperty = the name of a child property installed on the
                           class of widget’s parent
  */
  void childNotify(string childProperty)
  {
    const(char)* _childProperty = childProperty.toCString(No.Alloc);
    gtk_widget_child_notify(cast(GtkWidget*)this._cPtr, _childProperty);
  }

  /**
      Same as [gtk.widget.Widget.path], but always uses the name of a widget’s type,
      never uses a custom name set with [gtk.widget.Widget.setName].
  
      Params:
        pathLength = location to store the length of the
              class path, or null
        path = location to store the class path as an
              allocated string, or null
        pathReversed = location to store the reverse
              class path as an allocated string, or null
  
      Deprecated: Use [gtk.widget.Widget.getPath] instead
  */
  void classPath(out uint pathLength, out string path, out string pathReversed)
  {
    char* _path;
    char* _pathReversed;
    gtk_widget_class_path(cast(GtkWidget*)this._cPtr, cast(uint*)&pathLength, &_path, &_pathReversed);
    path = _path.fromCString(Yes.Free);
    pathReversed = _pathReversed.fromCString(Yes.Free);
  }

  /**
      Computes whether a container should give this widget extra space
      when possible. Containers should check this, rather than
      looking at [gtk.widget.Widget.getHexpand] or [gtk.widget.Widget.getVexpand].
      
      This function already checks whether the widget is visible, so
      visibility does not need to be checked separately. Non-visible
      widgets are not expanded.
      
      The computed expand value uses either the expand setting explicitly
      set on the widget itself, or, if none has been explicitly set,
      the widget may expand if some of its children do.
  
      Params:
        orientation = expand direction
      Returns: whether widget tree rooted here should be expanded
  */
  bool computeExpand(gtk.types.Orientation orientation)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_compute_expand(cast(GtkWidget*)this._cPtr, orientation);
    return _retval;
  }

  /**
      Creates a new #PangoContext with the appropriate font map,
      font options, font description, and base direction for drawing
      text for this widget. See also [gtk.widget.Widget.getPangoContext].
      Returns: the new #PangoContext
  */
  pango.context.Context createPangoContext()
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_create_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #PangoLayout with the appropriate font map,
      font description, and base direction for drawing text for
      this widget.
      
      If you keep a #PangoLayout created in this way around, you need
      to re-create it when the widget #PangoContext is replaced.
      This can be tracked by using the #GtkWidget::screen-changed signal
      on the widget.
  
      Params:
        text = text to set on the layout (can be null)
      Returns: the new #PangoLayout
  */
  pango.layout.Layout createPangoLayout(string text = null)
  {
    PangoLayout* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = gtk_widget_create_pango_layout(cast(GtkWidget*)this._cPtr, _text);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Destroys a widget.
      
      When a widget is destroyed all references it holds on other objects
      will be released:
      
       $(LIST
          * if the widget is inside a container, it will be removed from its
       )
       parent
       $(LIST
          * if the widget is a container, all its children will be destroyed,
       )
       recursively
       $(LIST
          * if the widget is a top level, it will be removed from the list
       )
       of top level widgets that GTK+ maintains internally
      
      It's expected that all references held on the widget will also
      be released; you should connect to the #GtkWidget::destroy signal
      if you hold a reference to widget and you wish to remove it when
      this function is called. It is not necessary to do so if you are
      implementing a #GtkContainer, as you'll be able to use the
      #GtkContainerClass.remove() virtual function for that.
      
      It's important to notice that [gtk.widget.Widget.destroy] will only cause
      the widget to be finalized if no additional references, acquired
      using [gobject.object.ObjectWrap.ref_], are held on it. In case additional references
      are in place, the widget will be in an "inert" state after calling
      this function; widget will still point to valid memory, allowing you
      to release the references you hold, but you may not query the widget's
      own state.
      
      You should typically call this function on top level widgets, and
      rarely on child widgets.
      
      See also: [gtk.container.Container.remove]
  */
  void destroy()
  {
    gtk_widget_destroy(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function sets *widget_pointer to null if widget_pointer !=
      null.  It’s intended to be used as a callback connected to the
      “destroy” signal of a widget. You connect [gtk.widget.Widget.destroyed]
      as a signal handler, and pass the address of your widget variable
      as user data. Then when the widget is destroyed, the variable will
      be set to null. Useful for example to avoid multiple copies
      of the same dialog.
  
      Params:
        widgetPointer = address of a variable that contains widget
  */
  void destroyed(gtk.widget.Widget widgetPointer)
  {
    gtk_widget_destroyed(cast(GtkWidget*)this._cPtr, widgetPointer ? cast(GtkWidget**)widgetPointer._cPtr(No.Dup) : null);
  }

  /**
      Returns true if device has been shadowed by a GTK+
      device grab on another widget, so it would stop sending
      events to widget. This may be used in the
      #GtkWidget::grab-notify signal to check for specific
      devices. See [gtk.global.deviceGrabAdd].
  
      Params:
        device = a #GdkDevice
      Returns: true if there is an ongoing grab on device
                 by another #GtkWidget than widget.
  */
  bool deviceIsShadowed(gdk.device.Device device)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_device_is_shadowed(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function is equivalent to [gtk.widget.Widget.dragBeginWithCoordinates],
      passing -1, -1 as coordinates.
  
      Params:
        targets = The targets (data formats) in which the
             source can provide the data
        actions = A bitmask of the allowed drag actions for this drag
        button = The button the user clicked to start the drag
        event = The event that triggered the start of the drag,
             or null if none can be obtained.
      Returns: the context for this drag
  
      Deprecated: Use [gtk.widget.Widget.dragBeginWithCoordinates] instead
  */
  gdk.drag_context.DragContext dragBegin(gtk.target_list.TargetList targets, gdk.types.DragAction actions, int button, gdk.event.Event event = null)
  {
    GdkDragContext* _cretval;
    _cretval = gtk_drag_begin(cast(GtkWidget*)this._cPtr, targets ? cast(GtkTargetList*)targets._cPtr(No.Dup) : null, actions, button, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drag_context.DragContext)(cast(GdkDragContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Initiates a drag on the source side. The function only needs to be used
      when the application is starting drags itself, and is not needed when
      [gtk.widget.Widget.dragSourceSet] is used.
      
      The event is used to retrieve the timestamp that will be used internally to
      grab the pointer.  If event is null, then [gdk.types.CURRENT_TIME] will be used.
      However, you should try to pass a real event in all cases, since that can be
      used to get information about the drag.
      
      Generally there are three cases when you want to start a drag by hand by
      calling this function:
      
      1. During a #GtkWidget::button-press-event handler, if you want to start a drag
      immediately when the user presses the mouse button.  Pass the event
      that you have in your #GtkWidget::button-press-event handler.
      
      2. During a #GtkWidget::motion-notify-event handler, if you want to start a drag
      when the mouse moves past a certain threshold distance after a button-press.
      Pass the event that you have in your #GtkWidget::motion-notify-event handler.
      
      3. During a timeout handler, if you want to start a drag after the mouse
      button is held down for some time.  Try to save the last event that you got
      from the mouse, using [gdk.event.Event.copy], and pass it to this function
      (remember to free the event with [gdk.event.Event.free] when you are done).
      If you really cannot pass a real event, pass null instead.
  
      Params:
        targets = The targets (data formats) in which the
             source can provide the data
        actions = A bitmask of the allowed drag actions for this drag
        button = The button the user clicked to start the drag
        event = The event that triggered the start of the drag,
             or null if none can be obtained.
        x = The initial x coordinate to start dragging from, in the coordinate space
             of widget. If -1 is passed, the coordinates are retrieved from event or
             the current pointer position
        y = The initial y coordinate to start dragging from, in the coordinate space
             of widget. If -1 is passed, the coordinates are retrieved from event or
             the current pointer position
      Returns: the context for this drag
  */
  gdk.drag_context.DragContext dragBeginWithCoordinates(gtk.target_list.TargetList targets, gdk.types.DragAction actions, int button, gdk.event.Event event, int x, int y)
  {
    GdkDragContext* _cretval;
    _cretval = gtk_drag_begin_with_coordinates(cast(GtkWidget*)this._cPtr, targets ? cast(GtkTargetList*)targets._cPtr(No.Dup) : null, actions, button, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drag_context.DragContext)(cast(GdkDragContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks to see if a mouse drag starting at (start_x, start_y) and ending
      at (current_x, current_y) has passed the GTK+ drag threshold, and thus
      should trigger the beginning of a drag-and-drop operation.
  
      Params:
        startX = X coordinate of start of drag
        startY = Y coordinate of start of drag
        currentX = current X coordinate
        currentY = current Y coordinate
      Returns: true if the drag threshold has been passed.
  */
  bool dragCheckThreshold(int startX, int startY, int currentX, int currentY)
  {
    bool _retval;
    _retval = cast(bool)gtk_drag_check_threshold(cast(GtkWidget*)this._cPtr, startX, startY, currentX, currentY);
    return _retval;
  }

  /**
      Add the image targets supported by #GtkSelectionData to
      the target list of the drag destination. The targets
      are added with info = 0. If you need another value,
      use [gtk.target_list.TargetList.addImageTargets] and
      [gtk.widget.Widget.dragDestSetTargetList].
  */
  void dragDestAddImageTargets()
  {
    gtk_drag_dest_add_image_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the text targets supported by #GtkSelectionData to
      the target list of the drag destination. The targets
      are added with info = 0. If you need another value,
      use [gtk.target_list.TargetList.addTextTargets] and
      [gtk.widget.Widget.dragDestSetTargetList].
  */
  void dragDestAddTextTargets()
  {
    gtk_drag_dest_add_text_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the URI targets supported by #GtkSelectionData to
      the target list of the drag destination. The targets
      are added with info = 0. If you need another value,
      use [gtk.target_list.TargetList.addUriTargets] and
      [gtk.widget.Widget.dragDestSetTargetList].
  */
  void dragDestAddUriTargets()
  {
    gtk_drag_dest_add_uri_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Looks for a match between the supported targets of context and the
      dest_target_list, returning the first matching target, otherwise
      returning `GDK_NONE`. dest_target_list should usually be the return
      value from [gtk.widget.Widget.dragDestGetTargetList], but some widgets may
      have different valid targets for different parts of the widget; in
      that case, they will have to implement a drag_motion handler that
      passes the correct target list to this function.
  
      Params:
        context = drag context
        targetList = list of droppable targets, or null to use
             gtk_drag_dest_get_target_list (widget).
      Returns: first target that the source offers
            and the dest can accept, or `GDK_NONE`
  */
  gdk.atom.Atom dragDestFindTarget(gdk.drag_context.DragContext context, gtk.target_list.TargetList targetList = null)
  {
    GdkAtom _cretval;
    _cretval = gtk_drag_dest_find_target(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, targetList ? cast(GtkTargetList*)targetList._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the list of targets this widget can accept from
      drag-and-drop.
      Returns: the #GtkTargetList, or null if none
  */
  gtk.target_list.TargetList dragDestGetTargetList()
  {
    GtkTargetList* _cretval;
    _cretval = gtk_drag_dest_get_target_list(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gtk.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the widget has been configured to always
      emit #GtkWidget::drag-motion signals.
      Returns: true if the widget always emits
          #GtkWidget::drag-motion events
  */
  bool dragDestGetTrackMotion()
  {
    bool _retval;
    _retval = cast(bool)gtk_drag_dest_get_track_motion(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Sets a widget as a potential drop destination, and adds default behaviors.
      
      The default behaviors listed in flags have an effect similar
      to installing default handlers for the widget’s drag-and-drop signals
      (#GtkWidget::drag-motion, #GtkWidget::drag-drop, ...). They all exist
      for convenience. When passing #GTK_DEST_DEFAULT_ALL for instance it is
      sufficient to connect to the widget’s #GtkWidget::drag-data-received
      signal to get primitive, but consistent drag-and-drop support.
      
      Things become more complicated when you try to preview the dragged data,
      as described in the documentation for #GtkWidget::drag-motion. The default
      behaviors described by flags make some assumptions, that can conflict
      with your own signal handlers. For instance #GTK_DEST_DEFAULT_DROP causes
      invokations of [gdk.global.dragStatus] in the context of #GtkWidget::drag-motion,
      and invokations of [gtk.global.dragFinish] in #GtkWidget::drag-data-received.
      Especially the later is dramatic, when your own #GtkWidget::drag-motion
      handler calls [gtk.widget.Widget.dragGetData] to inspect the dragged data.
      
      There’s no way to set a default action here, you can use the
      #GtkWidget::drag-motion callback for that. Here’s an example which selects
      the action to use depending on whether the control key is pressed or not:
      ```c
      static void
      drag_motion (GtkWidget *widget,
                   GdkDragContext *context,
                   gint x,
                   gint y,
                   guint time)
      {
        GdkModifierType mask;
      
        gdk_window_get_pointer (gtk_widget_get_window (widget),
                                NULL, NULL, &mask);
        if (mask & GDK_CONTROL_MASK)
          gdk_drag_status (context, GDK_ACTION_COPY, time);
        else
          gdk_drag_status (context, GDK_ACTION_MOVE, time);
      }
      ```
  
      Params:
        flags = which types of default drag behavior to use
        targets = a pointer to an array of
              #GtkTargetEntrys indicating the drop types that this widget will
              accept, or null. Later you can access the list with
              [gtk.widget.Widget.dragDestGetTargetList] and [gtk.widget.Widget.dragDestFindTarget].
        actions = a bitmask of possible actions for a drop onto this widget.
  */
  void dragDestSet(gtk.types.DestDefaults flags, gtk.target_entry.TargetEntry[] targets, gdk.types.DragAction actions)
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    GtkTargetEntry[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
    const(GtkTargetEntry)* _targets = _tmptargets.ptr;

    gtk_drag_dest_set(cast(GtkWidget*)this._cPtr, flags, _targets, _nTargets, actions);
  }

  /**
      Sets this widget as a proxy for drops to another window.
  
      Params:
        proxyWindow = the window to which to forward drag events
        protocol = the drag protocol which the proxy_window accepts
            (You can use gdk_drag_get_protocol() to determine this)
        useCoordinates = If true, send the same coordinates to the
            destination, because it is an embedded
            subwindow.
  */
  void dragDestSetProxy(gdk.window.Window proxyWindow, gdk.types.DragProtocol protocol, bool useCoordinates)
  {
    gtk_drag_dest_set_proxy(cast(GtkWidget*)this._cPtr, proxyWindow ? cast(GdkWindow*)proxyWindow._cPtr(No.Dup) : null, protocol, useCoordinates);
  }

  /**
      Sets the target types that this widget can accept from drag-and-drop.
      The widget must first be made into a drag destination with
      [gtk.widget.Widget.dragDestSet].
  
      Params:
        targetList = list of droppable targets, or null for none
  */
  void dragDestSetTargetList(gtk.target_list.TargetList targetList = null)
  {
    gtk_drag_dest_set_target_list(cast(GtkWidget*)this._cPtr, targetList ? cast(GtkTargetList*)targetList._cPtr(No.Dup) : null);
  }

  /**
      Tells the widget to emit #GtkWidget::drag-motion and
      #GtkWidget::drag-leave events regardless of the targets and the
      [gtk.types.DestDefaults.Motion] flag.
      
      This may be used when a widget wants to do generic
      actions regardless of the targets that the source offers.
  
      Params:
        trackMotion = whether to accept all targets
  */
  void dragDestSetTrackMotion(bool trackMotion)
  {
    gtk_drag_dest_set_track_motion(cast(GtkWidget*)this._cPtr, trackMotion);
  }

  /**
      Clears information about a drop destination set with
      [gtk.widget.Widget.dragDestSet]. The widget will no longer receive
      notification of drags.
  */
  void dragDestUnset()
  {
    gtk_drag_dest_unset(cast(GtkWidget*)this._cPtr);
  }

  /**
      Gets the data associated with a drag. When the data
      is received or the retrieval fails, GTK+ will emit a
      #GtkWidget::drag-data-received signal. Failure of the retrieval
      is indicated by the length field of the selection_data
      signal parameter being negative. However, when [gtk.widget.Widget.dragGetData]
      is called implicitely because the [gtk.types.DestDefaults.Drop] was set,
      then the widget will not receive notification of failed
      drops.
  
      Params:
        context = the drag context
        target = the target (form of the data) to retrieve
        time = a timestamp for retrieving the data. This will
            generally be the time received in a #GtkWidget::drag-motion
            or #GtkWidget::drag-drop signal
  */
  void dragGetData(gdk.drag_context.DragContext context, gdk.atom.Atom target, uint time)
  {
    gtk_drag_get_data(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, target ? cast(GdkAtom)target._cPtr : null, time);
  }

  /**
      Highlights a widget as a currently hovered drop target.
      To end the highlight, call [gtk.widget.Widget.dragUnhighlight].
      GTK+ calls this automatically if [gtk.types.DestDefaults.Highlight] is set.
  */
  void dragHighlight()
  {
    gtk_drag_highlight(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the writable image targets supported by #GtkSelectionData to
      the target list of the drag source. The targets
      are added with info = 0. If you need another value,
      use [gtk.target_list.TargetList.addImageTargets] and
      [gtk.widget.Widget.dragSourceSetTargetList].
  */
  void dragSourceAddImageTargets()
  {
    gtk_drag_source_add_image_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the text targets supported by #GtkSelectionData to
      the target list of the drag source.  The targets
      are added with info = 0. If you need another value,
      use [gtk.target_list.TargetList.addTextTargets] and
      [gtk.widget.Widget.dragSourceSetTargetList].
  */
  void dragSourceAddTextTargets()
  {
    gtk_drag_source_add_text_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the URI targets supported by #GtkSelectionData to
      the target list of the drag source.  The targets
      are added with info = 0. If you need another value,
      use [gtk.target_list.TargetList.addUriTargets] and
      [gtk.widget.Widget.dragSourceSetTargetList].
  */
  void dragSourceAddUriTargets()
  {
    gtk_drag_source_add_uri_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Gets the list of targets this widget can provide for
      drag-and-drop.
      Returns: the #GtkTargetList, or null if none
  */
  gtk.target_list.TargetList dragSourceGetTargetList()
  {
    GtkTargetList* _cretval;
    _cretval = gtk_drag_source_get_target_list(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gtk.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets up a widget so that GTK+ will start a drag operation when the user
      clicks and drags on the widget. The widget must have a window.
  
      Params:
        startButtonMask = the bitmask of buttons that can start the drag
        targets = the table of targets
              that the drag will support, may be null
        actions = the bitmask of possible actions for a drag from this widget
  */
  void dragSourceSet(gdk.types.ModifierType startButtonMask, gtk.target_entry.TargetEntry[] targets, gdk.types.DragAction actions)
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    GtkTargetEntry[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
    const(GtkTargetEntry)* _targets = _tmptargets.ptr;

    gtk_drag_source_set(cast(GtkWidget*)this._cPtr, startButtonMask, _targets, _nTargets, actions);
  }

  /**
      Sets the icon that will be used for drags from a particular source
      to icon. See the docs for #GtkIconTheme for more details.
  
      Params:
        icon = A #GIcon
  */
  void dragSourceSetIconGicon(gio.icon.Icon icon)
  {
    gtk_drag_source_set_icon_gicon(cast(GtkWidget*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon that will be used for drags from a particular source
      to a themed icon. See the docs for #GtkIconTheme for more details.
  
      Params:
        iconName = name of icon to use
  */
  void dragSourceSetIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_drag_source_set_icon_name(cast(GtkWidget*)this._cPtr, _iconName);
  }

  /**
      Sets the icon that will be used for drags from a particular widget
      from a #GdkPixbuf. GTK+ retains a reference for pixbuf and will
      release it when it is no longer needed.
  
      Params:
        pixbuf = the #GdkPixbuf for the drag icon
  */
  void dragSourceSetIconPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_drag_source_set_icon_pixbuf(cast(GtkWidget*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon that will be used for drags from a particular source
      to a stock icon.
  
      Params:
        stockId = the ID of the stock icon to use
  
      Deprecated: Use [gtk.widget.Widget.dragSourceSetIconName] instead.
  */
  void dragSourceSetIconStock(string stockId)
  {
    const(char)* _stockId = stockId.toCString(No.Alloc);
    gtk_drag_source_set_icon_stock(cast(GtkWidget*)this._cPtr, _stockId);
  }

  /**
      Changes the target types that this widget offers for drag-and-drop.
      The widget must first be made into a drag source with
      [gtk.widget.Widget.dragSourceSet].
  
      Params:
        targetList = list of draggable targets, or null for none
  */
  void dragSourceSetTargetList(gtk.target_list.TargetList targetList = null)
  {
    gtk_drag_source_set_target_list(cast(GtkWidget*)this._cPtr, targetList ? cast(GtkTargetList*)targetList._cPtr(No.Dup) : null);
  }

  /**
      Undoes the effects of [gtk.widget.Widget.dragSourceSet].
  */
  void dragSourceUnset()
  {
    gtk_drag_source_unset(cast(GtkWidget*)this._cPtr);
  }

  /**
      Removes a highlight set by [gtk.widget.Widget.dragHighlight] from
      a widget.
  */
  void dragUnhighlight()
  {
    gtk_drag_unhighlight(cast(GtkWidget*)this._cPtr);
  }

  /**
      Draws widget to cr. The top left corner of the widget will be
      drawn to the currently set origin point of cr.
      
      You should pass a cairo context as cr argument that is in an
      original state. Otherwise the resulting drawing is undefined. For
      example changing the operator using [cairo.context.Context.setOperator] or the
      line width using [cairo.context.Context.setLineWidth] might have unwanted side
      effects.
      You may however change the context’s transform matrix - like with
      [cairo.context.Context.scale], [cairo.context.Context.translate] or [cairo.context.Context.setMatrix] and clip
      region with [cairo.context.Context.clip] prior to calling this function. Also, it
      is fine to modify the context with [cairo.context.Context.save] and
      [cairo.context.Context.pushGroup] prior to calling this function.
      
      Note that special-purpose widgets may contain special code for
      rendering to the screen and might appear differently on screen
      and when rendered using [gtk.widget.Widget.draw].
  
      Params:
        cr = a cairo context to draw to
  */
  void draw(cairo.context.Context cr)
  {
    gtk_widget_draw(cast(GtkWidget*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Ensures that widget has a style (widget->style).
      
      Not a very useful function; most of the time, if you
      want the style, the widget is realized, and realized
      widgets are guaranteed to have a style already.
  
      Deprecated: Use #GtkStyleContext instead
  */
  void ensureStyle()
  {
    gtk_widget_ensure_style(cast(GtkWidget*)this._cPtr);
  }

  /**
      Notifies the user about an input-related error on this widget.
      If the #GtkSettings:gtk-error-bell setting is true, it calls
      [gdk.window.Window.beep], otherwise it does nothing.
      
      Note that the effect of [gdk.window.Window.beep] can be configured in many
      ways, depending on the windowing backend and the desktop environment
      or window manager that is used.
  */
  void errorBell()
  {
    gtk_widget_error_bell(cast(GtkWidget*)this._cPtr);
  }

  /**
      Rarely-used function. This function is used to emit
      the event signals on a widget (those signals should never
      be emitted without using this function to do so).
      If you want to synthesize an event though, don’t use this function;
      instead, use [gtk.global.mainDoEvent] so the event will behave as if
      it were in the event queue. Don’t synthesize expose events; instead,
      use [gdk.window.Window.invalidateRect] to invalidate a region of the
      window.
  
      Params:
        event = a #GdkEvent
      Returns: return from the event signal emission (true if
                      the event was handled)
  */
  bool event(gdk.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_event(cast(GtkWidget*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Stops emission of #GtkWidget::child-notify signals on widget. The
      signals are queued until [gtk.widget.Widget.thawChildNotify] is called
      on widget.
      
      This is the analogue of [gobject.object.ObjectWrap.freezeNotify] for child properties.
  */
  void freezeChildNotify()
  {
    gtk_widget_freeze_child_notify(cast(GtkWidget*)this._cPtr);
  }

  /**
      Returns the accessible object that describes the widget to an
      assistive technology.
      
      If accessibility support is not available, this #AtkObject
      instance may be a no-op. Likewise, if no class-specific #AtkObject
      implementation is available for the widget instance in question,
      it will inherit an #AtkObject implementation from the first ancestor
      class for which such an implementation is defined.
      
      The documentation of the
      [ATK](http://developer.gnome.org/atk/stable/)
      library contains more information about accessible objects and their uses.
      Returns: the #AtkObject associated with widget
  */
  atk.object.ObjectWrap getAccessible()
  {
    AtkObject* _cretval;
    _cretval = gtk_widget_get_accessible(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the #GActionGroup that was registered using prefix. The resulting
      #GActionGroup may have been registered to widget or any #GtkWidget in its
      ancestry.
      
      If no action group was found matching prefix, then null is returned.
  
      Params:
        prefix = The “prefix” of the action group.
      Returns: A #GActionGroup or null.
  */
  gio.action_group.ActionGroup getActionGroup(string prefix)
  {
    GActionGroup* _cretval;
    const(char)* _prefix = prefix.toCString(No.Alloc);
    _cretval = gtk_widget_get_action_group(cast(GtkWidget*)this._cPtr, _prefix);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.action_group.ActionGroup)(cast(GActionGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the baseline that has currently been allocated to widget.
      This function is intended to be used when implementing handlers
      for the #GtkWidget::draw function, and when allocating child
      widgets in #GtkWidget::size_allocate.
      Returns: the baseline of the widget, or -1 if none
  */
  int getAllocatedBaseline()
  {
    int _retval;
    _retval = gtk_widget_get_allocated_baseline(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the height that has currently been allocated to widget.
      This function is intended to be used when implementing handlers
      for the #GtkWidget::draw function.
      Returns: the height of the widget
  */
  int getAllocatedHeight()
  {
    int _retval;
    _retval = gtk_widget_get_allocated_height(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the widget’s allocated size.
      
      This function returns the last values passed to
      [gtk.widget.Widget.sizeAllocateWithBaseline]. The value differs from
      the size returned in [gtk.widget.Widget.getAllocation] in that functions
      like [gtk.widget.Widget.setHalign] can adjust the allocation, but not
      the value returned by this function.
      
      If a widget is not visible, its allocated size is 0.
  
      Params:
        allocation = a pointer to a #GtkAllocation to copy to
        baseline = a pointer to an integer to copy to
  */
  void getAllocatedSize(out gtk.types.Allocation allocation, out int baseline)
  {
    gtk_widget_get_allocated_size(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation, cast(int*)&baseline);
  }

  /**
      Returns the width that has currently been allocated to widget.
      This function is intended to be used when implementing handlers
      for the #GtkWidget::draw function.
      Returns: the width of the widget
  */
  int getAllocatedWidth()
  {
    int _retval;
    _retval = gtk_widget_get_allocated_width(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the widget’s allocation.
      
      Note, when implementing a #GtkContainer: a widget’s allocation will
      be its “adjusted” allocation, that is, the widget’s parent
      container typically calls [gtk.widget.Widget.sizeAllocate] with an
      allocation, and that allocation is then adjusted (to handle margin
      and alignment for example) before assignment to the widget.
      [gtk.widget.Widget.getAllocation] returns the adjusted allocation that
      was actually assigned to the widget. The adjusted allocation is
      guaranteed to be completely contained within the
      [gtk.widget.Widget.sizeAllocate] allocation, however. So a #GtkContainer
      is guaranteed that its children stay inside the assigned bounds,
      but not that they have exactly the bounds the container assigned.
      There is no way to get the original allocation assigned by
      [gtk.widget.Widget.sizeAllocate], since it isn’t stored; if a container
      implementation needs that information it will have to track it itself.
  
      Params:
        allocation = a pointer to a #GtkAllocation to copy to
  */
  void getAllocation(out gtk.types.Allocation allocation)
  {
    gtk_widget_get_allocation(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation);
  }

  /**
      Gets the first ancestor of widget with type widget_type. For example,
      `gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)` gets
      the first #GtkBox that’s an ancestor of widget. No reference will be
      added to the returned widget; it should not be unreferenced. See note
      about checking for a toplevel #GtkWindow in the docs for
      [gtk.widget.Widget.getToplevel].
      
      Note that unlike [gtk.widget.Widget.isAncestor], [gtk.widget.Widget.getAncestor]
      considers widget to be an ancestor of itself.
  
      Params:
        widgetType = ancestor type
      Returns: the ancestor widget, or null if not found
  */
  gtk.widget.Widget getAncestor(gobject.types.GType widgetType)
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_ancestor(cast(GtkWidget*)this._cPtr, widgetType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the application intends to draw on the widget in
      an #GtkWidget::draw handler.
      
      See [gtk.widget.Widget.setAppPaintable]
      Returns: true if the widget is app paintable
  */
  bool getAppPaintable()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_app_paintable(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget can be a default widget. See
      [gtk.widget.Widget.setCanDefault].
      Returns: true if widget can be a default widget, false otherwise
  */
  bool getCanDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_default(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget can own the input focus. See
      [gtk.widget.Widget.setCanFocus].
      Returns: true if widget can own the input focus, false otherwise
  */
  bool getCanFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      This function is only for use in widget implementations. Obtains
      widget->requisition, unless someone has forced a particular
      geometry on the widget (e.g. with [gtk.widget.Widget.setSizeRequest]),
      in which case it returns that geometry instead of the widget's
      requisition.
      
      This function differs from [gtk.widget.Widget.sizeRequest] in that
      it retrieves the last size request value from widget->requisition,
      while [gtk.widget.Widget.sizeRequest] actually calls the "size_request" method
      on widget to compute the size request and fill in widget->requisition,
      and only then returns widget->requisition.
      
      Because this function does not call the “size_request” method, it
      can only be used when you know that widget->requisition is
      up-to-date, that is, [gtk.widget.Widget.sizeRequest] has been called
      since the last time a resize was queued. In general, only container
      implementations have this information; applications should use
      [gtk.widget.Widget.sizeRequest].
  
      Params:
        requisition = a #GtkRequisition to be filled in
  
      Deprecated: Use [gtk.widget.Widget.getPreferredSize] instead.
  */
  void getChildRequisition(out gtk.requisition.Requisition requisition)
  {
    gtk_widget_get_child_requisition(cast(GtkWidget*)this._cPtr, cast(GtkRequisition*)&requisition);
  }

  /**
      Gets the value set with [gtk.widget.Widget.setChildVisible].
      If you feel a need to use this function, your code probably
      needs reorganization.
      
      This function is only useful for container implementations and
      never should be called by an application.
      Returns: true if the widget is mapped with the parent.
  */
  bool getChildVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_child_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the widget’s clip area.
      
      The clip area is the area in which all of widget's drawing will
      happen. Other toolkits call it the bounding box.
      
      Historically, in GTK+ the clip area has been equal to the allocation
      retrieved via [gtk.widget.Widget.getAllocation].
  
      Params:
        clip = a pointer to a #GtkAllocation to copy to
  */
  void getClip(out gtk.types.Allocation clip)
  {
    gtk_widget_get_clip(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&clip);
  }

  /**
      Returns the clipboard object for the given selection to
      be used with widget. widget must have a #GdkDisplay
      associated with it, so must be attached to a toplevel
      window.
  
      Params:
        selection = a #GdkAtom which identifies the clipboard
                      to use. `GDK_SELECTION_CLIPBOARD` gives the
                      default clipboard. Another common value
                      is `GDK_SELECTION_PRIMARY`, which gives
                      the primary X selection.
      Returns: the appropriate clipboard object. If no
                    clipboard already exists, a new one will
                    be created. Once a clipboard object has
                    been created, it is persistent for all time.
  */
  gtk.clipboard.Clipboard getClipboard(gdk.atom.Atom selection)
  {
    GtkClipboard* _cretval;
    _cretval = gtk_widget_get_clipboard(cast(GtkWidget*)this._cPtr, selection ? cast(GdkAtom)selection._cPtr : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(GtkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the composite name of a widget.
      Returns: the composite name of widget, or null if widget is not
          a composite child. The string should be freed when it is no
          longer needed.
  
      Deprecated: Use [gtk.widget_class.WidgetClass.setTemplate], or don’t use this API at all.
  */
  string getCompositeName()
  {
    char* _cretval;
    _cretval = gtk_widget_get_composite_name(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns whether device can interact with widget and its
      children. See [gtk.widget.Widget.setDeviceEnabled].
  
      Params:
        device = a #GdkDevice
      Returns: true is device is enabled for widget
  */
  bool getDeviceEnabled(gdk.device.Device device)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_device_enabled(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the events mask for the widget corresponding to an specific device. These
      are the events that the widget will receive when device operates on it.
  
      Params:
        device = a #GdkDevice
      Returns: device event mask for widget
  */
  gdk.types.EventMask getDeviceEvents(gdk.device.Device device)
  {
    GdkEventMask _cretval;
    _cretval = gtk_widget_get_device_events(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    gdk.types.EventMask _retval = cast(gdk.types.EventMask)_cretval;
    return _retval;
  }

  /**
      Gets the reading direction for a particular widget. See
      [gtk.widget.Widget.setDirection].
      Returns: the reading direction for the widget.
  */
  gtk.types.TextDirection getDirection()
  {
    GtkTextDirection _cretval;
    _cretval = gtk_widget_get_direction(cast(GtkWidget*)this._cPtr);
    gtk.types.TextDirection _retval = cast(gtk.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Get the #GdkDisplay for the toplevel window associated with
      this widget. This function can only be called after the widget
      has been added to a widget hierarchy with a #GtkWindow at the top.
      
      In general, you should only create display specific
      resources when a widget has been realized, and you should
      free those resources when the widget is unrealized.
      Returns: the #GdkDisplay for the toplevel for this widget.
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_widget_get_display(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the widget is double buffered.
      
      See [gtk.widget.Widget.setDoubleBuffered]
      Returns: true if the widget is double buffered
  */
  bool getDoubleBuffered()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_double_buffered(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the event mask (see #GdkEventMask) for the widget. These are the
      events that the widget will receive.
      
      Note: Internally, the widget event mask will be the logical OR of the event
      mask set through [gtk.widget.Widget.setEvents] or [gtk.widget.Widget.addEvents], and the
      event mask necessary to cater for every #GtkEventController created for the
      widget.
      Returns: event mask for widget
  */
  int getEvents()
  {
    int _retval;
    _retval = gtk_widget_get_events(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the widget should grab focus when it is clicked with the mouse.
      See [gtk.widget.Widget.setFocusOnClick].
      Returns: true if the widget should grab focus when it is clicked with
                      the mouse.
  */
  bool getFocusOnClick()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_focus_on_click(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the font map that has been set with [gtk.widget.Widget.setFontMap].
      Returns: A #PangoFontMap, or null
  */
  pango.font_map.FontMap getFontMap()
  {
    PangoFontMap* _cretval;
    _cretval = gtk_widget_get_font_map(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #cairo_font_options_t used for Pango rendering. When not set,
      the defaults font options for the #GdkScreen will be used.
      Returns: the #cairo_font_options_t or null if not set
  */
  cairo.font_options.FontOptions getFontOptions()
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = gtk_widget_get_font_options(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new cairo.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the frame clock for a widget. The frame clock is a global
      “ticker” that can be used to drive animations and repaints.  The
      most common reason to get the frame clock is to call
      [gdk.frame_clock.FrameClock.getFrameTime], in order to get a time to use for
      animating. For example you might record the start of the animation
      with an initial value from [gdk.frame_clock.FrameClock.getFrameTime], and
      then update the animation by calling
      [gdk.frame_clock.FrameClock.getFrameTime] again during each repaint.
      
      [gdk.frame_clock.FrameClock.requestPhase] will result in a new frame on the
      clock, but won’t necessarily repaint any widgets. To repaint a
      widget, you have to use [gtk.widget.Widget.queueDraw] which invalidates
      the widget (thus scheduling it to receive a draw on the next
      frame). [gtk.widget.Widget.queueDraw] will also end up requesting a frame
      on the appropriate frame clock.
      
      A widget’s frame clock will not change while the widget is
      mapped. Reparenting a widget (which implies a temporary unmap) can
      change the widget’s frame clock.
      
      Unrealized widgets do not have a frame clock.
      Returns: a #GdkFrameClock,
        or null if widget is unrealized
  */
  gdk.frame_clock.FrameClock getFrameClock()
  {
    GdkFrameClock* _cretval;
    _cretval = gtk_widget_get_frame_clock(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.frame_clock.FrameClock)(cast(GdkFrameClock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:halign property.
      
      For backwards compatibility reasons this method will never return
      [gtk.types.Align.Baseline], but instead it will convert it to
      [gtk.types.Align.Fill]. Baselines are not supported for horizontal
      alignment.
      Returns: the horizontal alignment of widget
  */
  gtk.types.Align getHalign()
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_halign(cast(GtkWidget*)this._cPtr);
    gtk.types.Align _retval = cast(gtk.types.Align)_cretval;
    return _retval;
  }

  /**
      Returns the current value of the has-tooltip property.  See
      #GtkWidget:has-tooltip for more information.
      Returns: current value of has-tooltip on widget.
  */
  bool getHasTooltip()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_has_tooltip(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget has a #GdkWindow of its own. See
      [gtk.widget.Widget.setHasWindow].
      Returns: true if widget has a window, false otherwise
  */
  bool getHasWindow()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_has_window(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the widget would like any available extra horizontal
      space. When a user resizes a #GtkWindow, widgets with expand=TRUE
      generally receive the extra space. For example, a list or
      scrollable area or document in your window would often be set to
      expand.
      
      Containers should use [gtk.widget.Widget.computeExpand] rather than
      this function, to see whether a widget, or any of its children,
      has the expand flag set. If any child of a widget wants to
      expand, the parent may ask to expand also.
      
      This function only looks at the widget’s own hexpand flag, rather
      than computing whether the entire widget tree rooted at this widget
      wants to expand.
      Returns: whether hexpand flag is set
  */
  bool getHexpand()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_hexpand(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gtk.widget.Widget.setHexpand] has been used to
      explicitly set the expand flag on this widget.
      
      If hexpand is set, then it overrides any computed
      expand value based on child widgets. If hexpand is not
      set, then the expand value depends on whether any
      children of the widget would like to expand.
      
      There are few reasons to use this function, but it’s here
      for completeness and consistency.
      Returns: whether hexpand has been explicitly set
  */
  bool getHexpandSet()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_hexpand_set(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Whether the widget is mapped.
      Returns: true if the widget is mapped, false otherwise.
  */
  bool getMapped()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_mapped(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-bottom property.
      Returns: The bottom margin of widget
  */
  int getMarginBottom()
  {
    int _retval;
    _retval = gtk_widget_get_margin_bottom(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-end property.
      Returns: The end margin of widget
  */
  int getMarginEnd()
  {
    int _retval;
    _retval = gtk_widget_get_margin_end(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-left property.
      Returns: The left margin of widget
  
      Deprecated: Use [gtk.widget.Widget.getMarginStart] instead.
  */
  int getMarginLeft()
  {
    int _retval;
    _retval = gtk_widget_get_margin_left(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-right property.
      Returns: The right margin of widget
  
      Deprecated: Use [gtk.widget.Widget.getMarginEnd] instead.
  */
  int getMarginRight()
  {
    int _retval;
    _retval = gtk_widget_get_margin_right(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-start property.
      Returns: The start margin of widget
  */
  int getMarginStart()
  {
    int _retval;
    _retval = gtk_widget_get_margin_start(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-top property.
      Returns: The top margin of widget
  */
  int getMarginTop()
  {
    int _retval;
    _retval = gtk_widget_get_margin_top(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the modifier mask the widget’s windowing system backend
      uses for a particular purpose.
      
      See [gdk.keymap.Keymap.getModifierMask].
  
      Params:
        intent = the use case for the modifier mask
      Returns: the modifier mask used for intent.
  */
  gdk.types.ModifierType getModifierMask(gdk.types.ModifierIntent intent)
  {
    GdkModifierType _cretval;
    _cretval = gtk_widget_get_modifier_mask(cast(GtkWidget*)this._cPtr, intent);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Returns the current modifier style for the widget. (As set by
      [gtk.widget.Widget.modifyStyle].) If no style has previously set, a new
      #GtkRcStyle will be created with all values unset, and set as the
      modifier style for the widget. If you make changes to this rc
      style, you must call [gtk.widget.Widget.modifyStyle], passing in the
      returned rc style, to make sure that your changes take effect.
      
      Caution: passing the style back to [gtk.widget.Widget.modifyStyle] will
      normally end up destroying it, because [gtk.widget.Widget.modifyStyle] copies
      the passed-in style and sets the copy as the new modifier style,
      thus dropping any reference to the old modifier style. Add a reference
      to the modifier style if you want to keep it alive.
      Returns: the modifier style for the widget.
            This rc style is owned by the widget. If you want to keep a
            pointer to value this around, you must add a refcount using
            [gobject.object.ObjectWrap.ref_].
  
      Deprecated: Use #GtkStyleContext with a custom #GtkStyleProvider instead
  */
  gtk.rc_style.RcStyle getModifierStyle()
  {
    GtkRcStyle* _cretval;
    _cretval = gtk_widget_get_modifier_style(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.rc_style.RcStyle)(cast(GtkRcStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the name of a widget. See [gtk.widget.Widget.setName] for the
      significance of widget names.
      Returns: name of the widget. This string is owned by GTK+ and
        should not be modified or freed
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_name(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the current value of the #GtkWidget:no-show-all property,
      which determines whether calls to [gtk.widget.Widget.showAll]
      will affect this widget.
      Returns: the current value of the “no-show-all” property.
  */
  bool getNoShowAll()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_no_show_all(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Fetches the requested opacity for this widget.
      See [gtk.widget.Widget.setOpacity].
      Returns: the requested opacity for this widget.
  */
  double getOpacity()
  {
    double _retval;
    _retval = gtk_widget_get_opacity(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets a #PangoContext with the appropriate font map, font description,
      and base direction for this widget. Unlike the context returned
      by [gtk.widget.Widget.createPangoContext], this context is owned by
      the widget (it can be used until the screen for the widget changes
      or the widget is removed from its toplevel), and will be updated to
      match any changes to the widget’s attributes. This can be tracked
      by using the #GtkWidget::screen-changed signal on the widget.
      Returns: the #PangoContext for the widget.
  */
  pango.context.Context getPangoContext()
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_get_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the parent container of widget.
      Returns: the parent container of widget, or null
  */
  gtk.widget.Widget getParent()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_parent(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets widget’s parent window, or null if it does not have one.
      Returns: the parent window of widget, or null
        if it does not have a parent window.
  */
  gdk.window.Window getParentWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_widget_get_parent_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkWidgetPath representing widget, if the widget
      is not connected to a toplevel widget, a partial path will be
      created.
      Returns: The #GtkWidgetPath representing widget
  */
  gtk.widget_path.WidgetPath getPath()
  {
    GtkWidgetPath* _cretval;
    _cretval = gtk_widget_get_path(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gtk.widget_path.WidgetPath(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the location of the mouse pointer in widget coordinates.
      Widget coordinates are a bit odd; for historical reasons, they are
      defined as widget->window coordinates for widgets that return true for
      [gtk.widget.Widget.getHasWindow]; and are relative to widget->allocation.x,
      widget->allocation.y otherwise.
  
      Params:
        x = return location for the X coordinate, or null
        y = return location for the Y coordinate, or null
  
      Deprecated: Use [gdk.window.Window.getDevicePosition] instead.
  */
  void getPointer(out int x, out int y)
  {
    gtk_widget_get_pointer(cast(GtkWidget*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Retrieves a widget’s initial minimum and natural height.
      
      This call is specific to width-for-height requests.
      
      The returned request will be modified by the
      GtkWidgetClass::adjust_size_request virtual method and by any
      #GtkSizeGroups that have been applied. That is, the returned request
      is the one that should be used for layout, not necessarily the one
      returned by the widget itself.
  
      Params:
        minimumHeight = location to store the minimum height, or null
        naturalHeight = location to store the natural height, or null
  */
  void getPreferredHeight(out int minimumHeight, out int naturalHeight)
  {
    gtk_widget_get_preferred_height(cast(GtkWidget*)this._cPtr, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a widget’s minimum and natural height and the corresponding baselines if it would be given
      the specified width, or the default height if width is -1. The baselines may be -1 which means
      that no baseline is requested for this widget.
      
      The returned request will be modified by the
      GtkWidgetClass::adjust_size_request and GtkWidgetClass::adjust_baseline_request virtual methods
      and by any #GtkSizeGroups that have been applied. That is, the returned request
      is the one that should be used for layout, not necessarily the one
      returned by the widget itself.
  
      Params:
        width = the width which is available for allocation, or -1 if none
        minimumHeight = location for storing the minimum height, or null
        naturalHeight = location for storing the natural height, or null
        minimumBaseline = location for storing the baseline for the minimum height, or null
        naturalBaseline = location for storing the baseline for the natural height, or null
  */
  void getPreferredHeightAndBaselineForWidth(int width, out int minimumHeight, out int naturalHeight, out int minimumBaseline, out int naturalBaseline)
  {
    gtk_widget_get_preferred_height_and_baseline_for_width(cast(GtkWidget*)this._cPtr, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }

  /**
      Retrieves a widget’s minimum and natural height if it would be given
      the specified width.
      
      The returned request will be modified by the
      GtkWidgetClass::adjust_size_request virtual method and by any
      #GtkSizeGroups that have been applied. That is, the returned request
      is the one that should be used for layout, not necessarily the one
      returned by the widget itself.
  
      Params:
        width = the width which is available for allocation
        minimumHeight = location for storing the minimum height, or null
        naturalHeight = location for storing the natural height, or null
  */
  void getPreferredHeightForWidth(int width, out int minimumHeight, out int naturalHeight)
  {
    gtk_widget_get_preferred_height_for_width(cast(GtkWidget*)this._cPtr, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves the minimum and natural size of a widget, taking
      into account the widget’s preference for height-for-width management.
      
      This is used to retrieve a suitable size by container widgets which do
      not impose any restrictions on the child placement. It can be used
      to deduce toplevel window and menu sizes as well as child widgets in
      free-form containers such as GtkLayout.
      
      Handle with care. Note that the natural height of a height-for-width
      widget will generally be a smaller size than the minimum height, since the required
      height for the natural width is generally smaller than the required height for
      the minimum width.
      
      Use [gtk.widget.Widget.getPreferredHeightAndBaselineForWidth] if you want to support
      baseline alignment.
  
      Params:
        minimumSize = location for storing the minimum size, or null
        naturalSize = location for storing the natural size, or null
  */
  void getPreferredSize(out gtk.requisition.Requisition minimumSize, out gtk.requisition.Requisition naturalSize)
  {
    gtk_widget_get_preferred_size(cast(GtkWidget*)this._cPtr, cast(GtkRequisition*)&minimumSize, cast(GtkRequisition*)&naturalSize);
  }

  /**
      Retrieves a widget’s initial minimum and natural width.
      
      This call is specific to height-for-width requests.
      
      The returned request will be modified by the
      GtkWidgetClass::adjust_size_request virtual method and by any
      #GtkSizeGroups that have been applied. That is, the returned request
      is the one that should be used for layout, not necessarily the one
      returned by the widget itself.
  
      Params:
        minimumWidth = location to store the minimum width, or null
        naturalWidth = location to store the natural width, or null
  */
  void getPreferredWidth(out int minimumWidth, out int naturalWidth)
  {
    gtk_widget_get_preferred_width(cast(GtkWidget*)this._cPtr, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Retrieves a widget’s minimum and natural width if it would be given
      the specified height.
      
      The returned request will be modified by the
      GtkWidgetClass::adjust_size_request virtual method and by any
      #GtkSizeGroups that have been applied. That is, the returned request
      is the one that should be used for layout, not necessarily the one
      returned by the widget itself.
  
      Params:
        height = the height which is available for allocation
        minimumWidth = location for storing the minimum width, or null
        naturalWidth = location for storing the natural width, or null
  */
  void getPreferredWidthForHeight(int height, out int minimumWidth, out int naturalWidth)
  {
    gtk_widget_get_preferred_width_for_height(cast(GtkWidget*)this._cPtr, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Determines whether widget is realized.
      Returns: true if widget is realized, false otherwise
  */
  bool getRealized()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_realized(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget is always treated as the default widget
      within its toplevel when it has the focus, even if another widget
      is the default.
      
      See [gtk.widget.Widget.setReceivesDefault].
      Returns: true if widget acts as the default widget when focused,
                      false otherwise
  */
  bool getReceivesDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_receives_default(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the widget prefers a height-for-width layout
      or a width-for-height layout.
      
      #GtkBin widgets generally propagate the preference of
      their child, container widgets need to request something either in
      context of their children or in context of their allocation
      capabilities.
      Returns: The #GtkSizeRequestMode preferred by widget.
  */
  gtk.types.SizeRequestMode getRequestMode()
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_widget_get_request_mode(cast(GtkWidget*)this._cPtr);
    gtk.types.SizeRequestMode _retval = cast(gtk.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the widget’s requisition.
      
      This function should only be used by widget implementations in
      order to figure whether the widget’s requisition has actually
      changed after some internal state change (so that they can call
      [gtk.widget.Widget.queueResize] instead of [gtk.widget.Widget.queueDraw]).
      
      Normally, [gtk.widget.Widget.sizeRequest] should be used.
  
      Params:
        requisition = a pointer to a #GtkRequisition to copy to
  
      Deprecated: The #GtkRequisition cache on the widget was
        removed, If you need to cache sizes across requests and allocations,
        add an explicit cache to the widget in question instead.
  */
  void getRequisition(out gtk.requisition.Requisition requisition)
  {
    gtk_widget_get_requisition(cast(GtkWidget*)this._cPtr, cast(GtkRequisition*)&requisition);
  }

  /**
      Get the root window where this widget is located. This function can
      only be called after the widget has been added to a widget
      hierarchy with #GtkWindow at the top.
      
      The root window is useful for such purposes as creating a popup
      #GdkWindow associated with the window. In general, you should only
      create display specific resources when a widget has been realized,
      and you should free those resources when the widget is unrealized.
      Returns: the #GdkWindow root window for the toplevel for this widget.
  
      Deprecated: Use [gdk.screen.Screen.getRootWindow] instead
  */
  gdk.window.Window getRootWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_widget_get_root_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the internal scale factor that maps from window coordinates
      to the actual device pixels. On traditional systems this is 1, on
      high density outputs, it can be a higher value (typically 2).
      
      See [gdk.window.Window.getScaleFactor].
      Returns: the scale factor for widget
  */
  int getScaleFactor()
  {
    int _retval;
    _retval = gtk_widget_get_scale_factor(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Get the #GdkScreen from the toplevel window associated with
      this widget. This function can only be called after the widget
      has been added to a widget hierarchy with a #GtkWindow
      at the top.
      
      In general, you should only create screen specific
      resources when a widget has been realized, and you should
      free those resources when the widget is unrealized.
      Returns: the #GdkScreen for the toplevel for this widget.
  */
  gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gtk_widget_get_screen(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s sensitivity (in the sense of returning
      the value that has been set using [gtk.widget.Widget.setSensitive]).
      
      The effective sensitivity of a widget is however determined by both its
      own and its parent widget’s sensitivity. See [gtk.widget.Widget.isSensitive].
      Returns: true if the widget is sensitive
  */
  bool getSensitive()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_sensitive(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the settings object holding the settings used for this widget.
      
      Note that this function can only be called when the #GtkWidget
      is attached to a toplevel, since the settings object is specific
      to a particular #GdkScreen.
      Returns: the relevant #GtkSettings object
  */
  gtk.settings.Settings getSettings()
  {
    GtkSettings* _cretval;
    _cretval = gtk_widget_get_settings(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the size request that was explicitly set for the widget using
      [gtk.widget.Widget.setSizeRequest]. A value of -1 stored in width or
      height indicates that that dimension has not been set explicitly
      and the natural requisition of the widget will be used instead. See
      [gtk.widget.Widget.setSizeRequest]. To get the size a widget will
      actually request, call [gtk.widget.Widget.getPreferredSize] instead of
      this function.
  
      Params:
        width = return location for width, or null
        height = return location for height, or null
  */
  void getSizeRequest(out int width, out int height)
  {
    gtk_widget_get_size_request(cast(GtkWidget*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the widget’s state. See [gtk.widget.Widget.setState].
      Returns: the state of widget.
  
      Deprecated: Use [gtk.widget.Widget.getStateFlags] instead.
  */
  gtk.types.StateType getState()
  {
    GtkStateType _cretval;
    _cretval = gtk_widget_get_state(cast(GtkWidget*)this._cPtr);
    gtk.types.StateType _retval = cast(gtk.types.StateType)_cretval;
    return _retval;
  }

  /**
      Returns the widget state as a flag set. It is worth mentioning
      that the effective [gtk.types.StateFlags.Insensitive] state will be
      returned, that is, also based on parent insensitivity, even if
      widget itself is sensitive.
      
      Also note that if you are looking for a way to obtain the
      #GtkStateFlags to pass to a #GtkStyleContext method, you
      should look at [gtk.style_context.StyleContext.getState].
      Returns: The state flags for widget
  */
  gtk.types.StateFlags getStateFlags()
  {
    GtkStateFlags _cretval;
    _cretval = gtk_widget_get_state_flags(cast(GtkWidget*)this._cPtr);
    gtk.types.StateFlags _retval = cast(gtk.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Simply an accessor function that returns widget->style.
      Returns: the widget’s #GtkStyle
  
      Deprecated: Use #GtkStyleContext instead
  */
  gtk.style.Style getStyle()
  {
    GtkStyle* _cretval;
    _cretval = gtk_widget_get_style(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style.Style)(cast(GtkStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the style context associated to widget. The returned object is
      guaranteed to be the same for the lifetime of widget.
      Returns: a #GtkStyleContext. This memory is owned by widget and
                 must not be freed.
  */
  gtk.style_context.StyleContext getStyleContext()
  {
    GtkStyleContext* _cretval;
    _cretval = gtk_widget_get_style_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style_context.StyleContext)(cast(GtkStyleContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if widget is multiple pointer aware. See
      [gtk.widget.Widget.setSupportMultidevice] for more information.
      Returns: true if widget is multidevice aware.
  */
  bool getSupportMultidevice()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_support_multidevice(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Fetch an object build from the template XML for widget_type in this widget instance.
      
      This will only report children which were previously declared with
      [gtk.widget_class.WidgetClass.bindTemplateChildFull] or one of its
      variants.
      
      This function is only meant to be called for code which is private to the widget_type which
      declared the child and is meant for language bindings which cannot easily make use
      of the GObject structure offsets.
  
      Params:
        widgetType = The #GType to get a template child for
        name = The “id” of the child defined in the template XML
      Returns: The object built in the template XML with the id name
  */
  gobject.object.ObjectWrap getTemplateChild(gobject.types.GType widgetType, string name)
  {
    GObject* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_widget_get_template_child(cast(GtkWidget*)this._cPtr, widgetType, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for widget.
      Returns: the tooltip text, or null. You should free the
          returned string with [glib.global.gfree] when done.
  */
  string getTooltipMarkup()
  {
    char* _cretval;
    _cretval = gtk_widget_get_tooltip_markup(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for widget.
      Returns: the tooltip text, or null. You should free the
          returned string with [glib.global.gfree] when done.
  */
  string getTooltipText()
  {
    char* _cretval;
    _cretval = gtk_widget_get_tooltip_text(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the #GtkWindow of the current tooltip. This can be the
      GtkWindow created by default, or the custom tooltip window set
      using [gtk.widget.Widget.setTooltipWindow].
      Returns: The #GtkWindow of the current tooltip.
  */
  gtk.window.Window getTooltipWindow()
  {
    GtkWindow* _cretval;
    _cretval = gtk_widget_get_tooltip_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function returns the topmost widget in the container hierarchy
      widget is a part of. If widget has no parent widgets, it will be
      returned as the topmost widget. No reference will be added to the
      returned widget; it should not be unreferenced.
      
      Note the difference in behavior vs. [gtk.widget.Widget.getAncestor];
      `gtk_widget_get_ancestor (widget, GTK_TYPE_WINDOW)`
      would return
      null if widget wasn’t inside a toplevel window, and if the
      window was inside a #GtkWindow-derived widget which was in turn
      inside the toplevel #GtkWindow. While the second case may
      seem unlikely, it actually happens when a #GtkPlug is embedded
      inside a #GtkSocket within the same application.
      
      To reliably find the toplevel #GtkWindow, use
      [gtk.widget.Widget.getToplevel] and call GTK_IS_WINDOW()
      on the result. For instance, to get the title of a widget's toplevel
      window, one might use:
      ```c
      static const char *
      get_widget_toplevel_title (GtkWidget *widget)
      {
        GtkWidget *toplevel = gtk_widget_get_toplevel (widget);
        if (GTK_IS_WINDOW (toplevel))
          {
            return gtk_window_get_title (GTK_WINDOW (toplevel));
          }
      
        return NULL;
      }
      ```
      Returns: the topmost ancestor of widget, or widget itself
           if there’s no ancestor.
  */
  gtk.widget.Widget getToplevel()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_toplevel(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:valign property.
      
      For backwards compatibility reasons this method will never return
      [gtk.types.Align.Baseline], but instead it will convert it to
      [gtk.types.Align.Fill]. If your widget want to support baseline aligned
      children it must use [gtk.widget.Widget.getValignWithBaseline], or
      `g_object_get (widget, "valign", &value, NULL)`, which will
      also report the true value.
      Returns: the vertical alignment of widget, ignoring baseline alignment
  */
  gtk.types.Align getValign()
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_valign(cast(GtkWidget*)this._cPtr);
    gtk.types.Align _retval = cast(gtk.types.Align)_cretval;
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:valign property, including
      [gtk.types.Align.Baseline].
      Returns: the vertical alignment of widget
  */
  gtk.types.Align getValignWithBaseline()
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_valign_with_baseline(cast(GtkWidget*)this._cPtr);
    gtk.types.Align _retval = cast(gtk.types.Align)_cretval;
    return _retval;
  }

  /**
      Gets whether the widget would like any available extra vertical
      space.
      
      See [gtk.widget.Widget.getHexpand] for more detail.
      Returns: whether vexpand flag is set
  */
  bool getVexpand()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_vexpand(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gtk.widget.Widget.setVexpand] has been used to
      explicitly set the expand flag on this widget.
      
      See [gtk.widget.Widget.getHexpandSet] for more detail.
      Returns: whether vexpand has been explicitly set
  */
  bool getVexpandSet()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_vexpand_set(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget is visible. If you want to
      take into account whether the widget’s parent is also marked as
      visible, use [gtk.widget.Widget.isVisible] instead.
      
      This function does not check if the widget is obscured in any way.
      
      See [gtk.widget.Widget.setVisible].
      Returns: true if the widget is visible
  */
  bool getVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the visual that will be used to render widget.
      Returns: the visual for widget
  */
  gdk.visual.Visual getVisual()
  {
    GdkVisual* _cretval;
    _cretval = gtk_widget_get_visual(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s window if it is realized, null otherwise
      Returns: widget’s window.
  */
  gdk.window.Window getWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_widget_get_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Makes widget the current grabbed widget.
      
      This means that interaction with other widgets in the same
      application is blocked and mouse as well as keyboard events
      are delivered to this widget.
      
      If widget is not sensitive, it is not set as the current
      grabbed widget and this function does nothing.
  */
  void grabAdd()
  {
    gtk_grab_add(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes widget to become the default widget. widget must be able to be
      a default widget; typically you would ensure this yourself
      by calling [gtk.widget.Widget.setCanDefault] with a true value.
      The default widget is activated when
      the user presses Enter in a window. Default widgets must be
      activatable, that is, [gtk.widget.Widget.activate] should affect them. Note
      that #GtkEntry widgets require the “activates-default” property
      set to true before they activate the default widget when Enter
      is pressed and the #GtkEntry is focused.
  */
  void grabDefault()
  {
    gtk_widget_grab_default(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes widget to have the keyboard focus for the #GtkWindow it's
      inside. widget must be a focusable widget, such as a #GtkEntry;
      something like #GtkFrame won’t work.
      
      More precisely, it must have the `GTK_CAN_FOCUS` flag set. Use
      [gtk.widget.Widget.setCanFocus] to modify that flag.
      
      The widget also needs to be realized and mapped. This is indicated by the
      related signals. Grabbing the focus immediately after creating the widget
      will likely fail and cause critical warnings.
  */
  void grabFocus()
  {
    gtk_widget_grab_focus(cast(GtkWidget*)this._cPtr);
  }

  /**
      Removes the grab from the given widget.
      
      You have to pair calls to [gtk.widget.Widget.grabAdd] and [gtk.widget.Widget.grabRemove].
      
      If widget does not have the grab, this function does nothing.
  */
  void grabRemove()
  {
    gtk_grab_remove(cast(GtkWidget*)this._cPtr);
  }

  /**
      Determines whether widget is the current default widget within its
      toplevel. See [gtk.widget.Widget.setCanDefault].
      Returns: true if widget is the current default widget within
            its toplevel, false otherwise
  */
  bool hasDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_default(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget has the global input focus. See
      [gtk.widget.Widget.isFocus] for the difference between having the global
      input focus, and only having the focus within a toplevel.
      Returns: true if the widget has the global input focus.
  */
  bool hasFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget is currently grabbing events, so it
      is the only widget receiving input events (keyboard and mouse).
      
      See also [gtk.widget.Widget.grabAdd].
      Returns: true if the widget is in the grab_widgets stack
  */
  bool hasGrab()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_grab(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget style has been looked up through the rc mechanism.
      Returns: true if the widget has been looked up through the rc
          mechanism, false otherwise.
  
      Deprecated: Use #GtkStyleContext instead
  */
  bool hasRcStyle()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_rc_style(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether there is a #GdkScreen is associated with
      this widget. All toplevel widgets have an associated
      screen, and all widgets added into a hierarchy with a toplevel
      window at the top.
      Returns: true if there is a #GdkScreen associated
          with the widget.
  */
  bool hasScreen()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_screen(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget should show a visible indication that
      it has the global input focus. This is a convenience function for
      use in ::draw handlers that takes into account whether focus
      indication should currently be shown in the toplevel window of
      widget. See [gtk.window.Window.getFocusVisible] for more information
      about focus indication.
      
      To find out if the widget has the global input focus, use
      [gtk.widget.Widget.hasFocus].
      Returns: true if the widget should display a “focus rectangle”
  */
  bool hasVisibleFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_visible_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Reverses the effects of [gtk.widget.Widget.show], causing the widget to be
      hidden (invisible to the user).
  */
  void hide()
  {
    gtk_widget_hide(cast(GtkWidget*)this._cPtr);
  }

  /**
      Utility function; intended to be connected to the #GtkWidget::delete-event
      signal on a #GtkWindow. The function calls [gtk.widget.Widget.hide] on its
      argument, then returns true. If connected to ::delete-event, the
      result is that clicking the close button for a window (on the
      window frame, top right corner usually) will hide but not destroy
      the window. By default, GTK+ destroys windows when ::delete-event
      is received.
      Returns: true
  */
  bool hideOnDelete()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_hide_on_delete(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the widget is currently being destroyed.
      This information can sometimes be used to avoid doing
      unnecessary work.
      Returns: true if widget is being destroyed
  */
  bool inDestruction()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_in_destruction(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Creates and initializes child widgets defined in templates. This
      function must be called in the instance initializer for any
      class which assigned itself a template using [gtk.widget_class.WidgetClass.setTemplate]
      
      It is important to call this function in the instance initializer
      of a #GtkWidget subclass and not in #GObject.constructed() or
      #GObject.constructor() for two reasons.
      
      One reason is that generally derived widgets will assume that parent
      class composite widgets have been created in their instance
      initializers.
      
      Another reason is that when calling [gobject.object.ObjectWrap.new_] on a widget with
      composite templates, it’s important to build the composite widgets
      before the construct properties are set. Properties passed to [gobject.object.ObjectWrap.new_]
      should take precedence over properties set in the private template XML.
  */
  void initTemplate()
  {
    gtk_widget_init_template(cast(GtkWidget*)this._cPtr);
  }

  /**
      Sets an input shape for this widget’s GDK window. This allows for
      windows which react to mouse click in a nonrectangular region, see
      [gdk.window.Window.inputShapeCombineRegion] for more information.
  
      Params:
        region = shape to be added, or null to remove an existing shape
  */
  void inputShapeCombineRegion(cairo.region.Region region = null)
  {
    gtk_widget_input_shape_combine_region(cast(GtkWidget*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Inserts group into widget. Children of widget that implement
      #GtkActionable can then be associated with actions in group by
      setting their “action-name” to
      prefix.`action-name`.
      
      If group is null, a previously inserted group for name is removed
      from widget.
  
      Params:
        name = the prefix for actions in group
        group = a #GActionGroup, or null
  */
  void insertActionGroup(string name, gio.action_group.ActionGroup group = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_insert_action_group(cast(GtkWidget*)this._cPtr, _name, group ? cast(GActionGroup*)(cast(gobject.object.ObjectWrap)group)._cPtr(No.Dup) : null);
  }

  /**
      Computes the intersection of a widget’s area and area, storing
      the intersection in intersection, and returns true if there was
      an intersection.  intersection may be null if you’re only
      interested in whether there was an intersection.
  
      Params:
        area = a rectangle
        intersection = rectangle to store
            intersection of widget and area
      Returns: true if there was an intersection
  */
  bool intersect(gdk.rectangle.Rectangle area, out gdk.rectangle.Rectangle intersection)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_intersect(cast(GtkWidget*)this._cPtr, cast(const(GdkRectangle)*)&area, cast(GdkRectangle*)&intersection);
    return _retval;
  }

  /**
      Determines whether widget is somewhere inside ancestor, possibly with
      intermediate containers.
  
      Params:
        ancestor = another #GtkWidget
      Returns: true if ancestor contains widget as a child,
           grandchild, great grandchild, etc.
  */
  bool isAncestor(gtk.widget.Widget ancestor)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_ancestor(cast(GtkWidget*)this._cPtr, ancestor ? cast(GtkWidget*)ancestor._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Whether widget can rely on having its alpha channel
      drawn correctly. On X11 this function returns whether a
      compositing manager is running for widget’s screen.
      
      Please note that the semantics of this call will change
      in the future if used on a widget that has a composited
      window in its hierarchy (as set by [gdk.window.Window.setComposited]).
      Returns: true if the widget can rely on its alpha
        channel being drawn correctly.
  
      Deprecated: Use [gdk.screen.Screen.isComposited] instead.
  */
  bool isComposited()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_composited(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget can be drawn to. A widget can be drawn
      to if it is mapped and visible.
      Returns: true if widget is drawable, false otherwise
  */
  bool isDrawable()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_drawable(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget is the focus widget within its
      toplevel. (This does not mean that the #GtkWidget:has-focus property is
      necessarily set; #GtkWidget:has-focus will only be set if the
      toplevel widget additionally has the global input focus.)
      Returns: true if the widget is the focus widget.
  */
  bool isFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the widget’s effective sensitivity, which means
      it is sensitive itself and also its parent widget is sensitive
      Returns: true if the widget is effectively sensitive
  */
  bool isSensitive()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_sensitive(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget is a toplevel widget.
      
      Currently only #GtkWindow and #GtkInvisible (and out-of-process
      #GtkPlugs) are toplevel widgets. Toplevel widgets have no parent
      widget.
      Returns: true if widget is a toplevel, false otherwise
  */
  bool isToplevel()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_toplevel(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget and all its parents are marked as
      visible.
      
      This function does not check if the widget is obscured in any way.
      
      See also [gtk.widget.Widget.getVisible] and [gtk.widget.Widget.setVisible]
      Returns: true if the widget and all its parents are visible
  */
  bool isVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      This function should be called whenever keyboard navigation within
      a single widget hits a boundary. The function emits the
      #GtkWidget::keynav-failed signal on the widget and its return
      value should be interpreted in a way similar to the return value of
      [gtk.widget.Widget.childFocus]:
      
      When true is returned, stay in the widget, the failed keyboard
      navigation is OK and/or there is nowhere we can/should move the
      focus to.
      
      When false is returned, the caller should continue with keyboard
      navigation outside the widget, e.g. by calling
      [gtk.widget.Widget.childFocus] on the widget’s toplevel.
      
      The default ::keynav-failed handler returns false for
      [gtk.types.DirectionType.TabForward] and [gtk.types.DirectionType.TabBackward]. For the other
      values of #GtkDirectionType it returns true.
      
      Whenever the default handler returns true, it also calls
      [gtk.widget.Widget.errorBell] to notify the user of the failed keyboard
      navigation.
      
      A use case for providing an own implementation of ::keynav-failed
      (either by connecting to it or by overriding it) would be a row of
      #GtkEntry widgets where the user should be able to navigate the
      entire row with the cursor keys, as e.g. known from user interfaces
      that require entering license keys.
  
      Params:
        direction = direction of focus movement
      Returns: true if stopping keyboard navigation is fine, false
                      if the emitting widget should try to handle the keyboard
                      navigation attempt in its parent container(s).
  */
  bool keynavFailed(gtk.types.DirectionType direction)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_keynav_failed(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Lists the closures used by widget for accelerator group connections
      with [gtk.accel_group.AccelGroup.connectByPath] or [gtk.accel_group.AccelGroup.connect].
      The closures can be used to monitor accelerator changes on widget,
      by connecting to the GtkAccelGroup::accel-changed signal of the
      #GtkAccelGroup of a closure which can be found out with
      [gtk.accel_group.AccelGroup.fromAccelClosure].
      Returns: a newly allocated #GList of closures
  */
  gobject.closure.Closure[] listAccelClosures()
  {
    GList* _cretval;
    _cretval = gtk_widget_list_accel_closures(cast(GtkWidget*)this._cPtr);
    auto _retval = gListToD!(gobject.closure.Closure, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Retrieves a null-terminated array of strings containing the prefixes of
      #GActionGroup's available to widget.
      Returns: a null-terminated array of strings.
  */
  string[] listActionPrefixes()
  {
    const(char*)* _cretval;
    _cretval = gtk_widget_list_action_prefixes(cast(GtkWidget*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns a newly allocated list of the widgets, normally labels, for
      which this widget is the target of a mnemonic (see for example,
      [gtk.label.Label.setMnemonicWidget]).
      
      The widgets in the list are not individually referenced. If you
      want to iterate through the list and perform actions involving
      callbacks that might destroy the widgets, you
      must call `g_list_foreach (result,
      (GFunc)g_object_ref, NULL)` first, and then unref all the
      widgets afterwards.
      Returns: the list of
         mnemonic labels; free this list
         with [glib.list.List.free] when you are done with it.
  */
  gtk.widget.Widget[] listMnemonicLabels()
  {
    GList* _cretval;
    _cretval = gtk_widget_list_mnemonic_labels(cast(GtkWidget*)this._cPtr);
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      This function is only for use in widget implementations. Causes
      a widget to be mapped if it isn’t already.
  */
  void map()
  {
    gtk_widget_map(cast(GtkWidget*)this._cPtr);
  }

  /**
      Emits the #GtkWidget::mnemonic-activate signal.
  
      Params:
        groupCycling = true if there are other widgets with the same mnemonic
      Returns: true if the signal has been handled
  */
  bool mnemonicActivate(bool groupCycling)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_mnemonic_activate(cast(GtkWidget*)this._cPtr, groupCycling);
    return _retval;
  }

  /**
      Sets the base color for a widget in a particular state.
      All other style values are left untouched. The base color
      is the background color used along with the text color
      (see [gtk.widget.Widget.modifyText]) for widgets such as #GtkEntry
      and #GtkTextView. See also [gtk.widget.Widget.modifyStyle].
      
      > Note that “no window” widgets (which have the `GTK_NO_WINDOW`
      > flag set) draw on their parent container’s window and thus may
      > not draw any background themselves. This is the case for e.g.
      > #GtkLabel.
      >
      > To modify the background of such widgets, you have to set the
      > base color on their parent; if you want to set the background
      > of a rectangular area around a label, try placing the label in
      > a #GtkEventBox widget and setting the base color on that.
  
      Params:
        state = the state for which to set the base color
        color = the color to assign (does not need to
              be allocated), or null to undo the effect of previous
              calls to of [gtk.widget.Widget.modifyBase].
  
      Deprecated: Use [gtk.widget.Widget.overrideBackgroundColor] instead
  */
  void modifyBase(gtk.types.StateType state, gdk.color.Color color)
  {
    gtk_widget_modify_base(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the background color for a widget in a particular state.
      
      All other style values are left untouched.
      See also [gtk.widget.Widget.modifyStyle].
      
      > Note that “no window” widgets (which have the `GTK_NO_WINDOW`
      > flag set) draw on their parent container’s window and thus may
      > not draw any background themselves. This is the case for e.g.
      > #GtkLabel.
      >
      > To modify the background of such widgets, you have to set the
      > background color on their parent; if you want to set the background
      > of a rectangular area around a label, try placing the label in
      > a #GtkEventBox widget and setting the background color on that.
  
      Params:
        state = the state for which to set the background color
        color = the color to assign (does not need
              to be allocated), or null to undo the effect of previous
              calls to of [gtk.widget.Widget.modifyBg].
  
      Deprecated: Use [gtk.widget.Widget.overrideBackgroundColor] instead
  */
  void modifyBg(gtk.types.StateType state, gdk.color.Color color)
  {
    gtk_widget_modify_bg(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the cursor color to use in a widget, overriding the #GtkWidget
      cursor-color and secondary-cursor-color
      style properties.
      
      All other style values are left untouched.
      See also [gtk.widget.Widget.modifyStyle].
  
      Params:
        primary = the color to use for primary cursor (does not
              need to be allocated), or null to undo the effect of previous
              calls to of [gtk.widget.Widget.modifyCursor].
        secondary = the color to use for secondary cursor (does
              not need to be allocated), or null to undo the effect of
              previous calls to of [gtk.widget.Widget.modifyCursor].
  
      Deprecated: Use [gtk.widget.Widget.overrideCursor] instead.
  */
  void modifyCursor(gdk.color.Color primary, gdk.color.Color secondary)
  {
    gtk_widget_modify_cursor(cast(GtkWidget*)this._cPtr, cast(const(GdkColor)*)&primary, cast(const(GdkColor)*)&secondary);
  }

  /**
      Sets the foreground color for a widget in a particular state.
      
      All other style values are left untouched.
      See also [gtk.widget.Widget.modifyStyle].
  
      Params:
        state = the state for which to set the foreground color
        color = the color to assign (does not need to be allocated),
              or null to undo the effect of previous calls to
              of [gtk.widget.Widget.modifyFg].
  
      Deprecated: Use [gtk.widget.Widget.overrideColor] instead
  */
  void modifyFg(gtk.types.StateType state, gdk.color.Color color)
  {
    gtk_widget_modify_fg(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the font to use for a widget.
      
      All other style values are left untouched.
      See also [gtk.widget.Widget.modifyStyle].
  
      Params:
        fontDesc = the font description to use, or null
              to undo the effect of previous calls to [gtk.widget.Widget.modifyFont]
  
      Deprecated: Use [gtk.widget.Widget.overrideFont] instead
  */
  void modifyFont(pango.font_description.FontDescription fontDesc = null)
  {
    gtk_widget_modify_font(cast(GtkWidget*)this._cPtr, fontDesc ? cast(PangoFontDescription*)fontDesc._cPtr(No.Dup) : null);
  }

  /**
      Modifies style values on the widget.
      
      Modifications made using this technique take precedence over
      style values set via an RC file, however, they will be overridden
      if a style is explicitly set on the widget using [gtk.widget.Widget.setStyle].
      The #GtkRcStyle-struct is designed so each field can either be
      set or unset, so it is possible, using this function, to modify some
      style values and leave the others unchanged.
      
      Note that modifications made with this function are not cumulative
      with previous calls to [gtk.widget.Widget.modifyStyle] or with such
      functions as [gtk.widget.Widget.modifyFg]. If you wish to retain
      previous values, you must first call [gtk.widget.Widget.getModifierStyle],
      make your modifications to the returned style, then call
      [gtk.widget.Widget.modifyStyle] with that style. On the other hand,
      if you first call [gtk.widget.Widget.modifyStyle], subsequent calls
      to such functions [gtk.widget.Widget.modifyFg] will have a cumulative
      effect with the initial modifications.
  
      Params:
        style = the #GtkRcStyle-struct holding the style modifications
  
      Deprecated: Use #GtkStyleContext with a custom #GtkStyleProvider instead
  */
  void modifyStyle(gtk.rc_style.RcStyle style)
  {
    gtk_widget_modify_style(cast(GtkWidget*)this._cPtr, style ? cast(GtkRcStyle*)style._cPtr(No.Dup) : null);
  }

  /**
      Sets the text color for a widget in a particular state.
      
      All other style values are left untouched.
      The text color is the foreground color used along with the
      base color (see [gtk.widget.Widget.modifyBase]) for widgets such
      as #GtkEntry and #GtkTextView.
      See also [gtk.widget.Widget.modifyStyle].
  
      Params:
        state = the state for which to set the text color
        color = the color to assign (does not need to
              be allocated), or null to undo the effect of previous
              calls to of [gtk.widget.Widget.modifyText].
  
      Deprecated: Use [gtk.widget.Widget.overrideColor] instead
  */
  void modifyText(gtk.types.StateType state, gdk.color.Color color)
  {
    gtk_widget_modify_text(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the background color to use for a widget.
      
      All other style values are left untouched.
      See [gtk.widget.Widget.overrideColor].
  
      Params:
        state = the state for which to set the background color
        color = the color to assign, or null to undo the effect
              of previous calls to [gtk.widget.Widget.overrideBackgroundColor]
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the way a widget renders its background
          you should use a custom CSS style, through an application-specific
          #GtkStyleProvider and a CSS style class. You can also override the default
          drawing of a widget through the #GtkWidget::draw signal, and use Cairo to
          draw a specific color, regardless of the CSS style.
  */
  void overrideBackgroundColor(gtk.types.StateFlags state, gdk.rgba.RGBA color)
  {
    gtk_widget_override_background_color(cast(GtkWidget*)this._cPtr, state, cast(const(GdkRGBA)*)&color);
  }

  /**
      Sets the color to use for a widget.
      
      All other style values are left untouched.
      
      This function does not act recursively. Setting the color of a
      container does not affect its children. Note that some widgets that
      you may not think of as containers, for instance #GtkButtons,
      are actually containers.
      
      This API is mostly meant as a quick way for applications to
      change a widget appearance. If you are developing a widgets
      library and intend this change to be themeable, it is better
      done by setting meaningful CSS classes in your
      widget/container implementation through [gtk.style_context.StyleContext.addClass].
      
      This way, your widget library can install a #GtkCssProvider
      with the [gtk.types.STYLE_PROVIDER_PRIORITY_FALLBACK] priority in order
      to provide a default styling for those widgets that need so, and
      this theming may fully overridden by the user’s theme.
      
      Note that for complex widgets this may bring in undesired
      results (such as uniform background color everywhere), in
      these cases it is better to fully style such widgets through a
      #GtkCssProvider with the [gtk.types.STYLE_PROVIDER_PRIORITY_APPLICATION]
      priority.
  
      Params:
        state = the state for which to set the color
        color = the color to assign, or null to undo the effect
              of previous calls to [gtk.widget.Widget.overrideColor]
  
      Deprecated: Use a custom style provider and style classes instead
  */
  void overrideColor(gtk.types.StateFlags state, gdk.rgba.RGBA color)
  {
    gtk_widget_override_color(cast(GtkWidget*)this._cPtr, state, cast(const(GdkRGBA)*)&color);
  }

  /**
      Sets the cursor color to use in a widget, overriding the
      cursor-color and secondary-cursor-color
      style properties. All other style values are left untouched.
      See also [gtk.widget.Widget.modifyStyle].
      
      Note that the underlying properties have the #GdkColor type,
      so the alpha value in primary and secondary will be ignored.
  
      Params:
        cursor = the color to use for primary cursor (does not need to be
              allocated), or null to undo the effect of previous calls to
              of [gtk.widget.Widget.overrideCursor].
        secondaryCursor = the color to use for secondary cursor (does not
              need to be allocated), or null to undo the effect of previous
              calls to of [gtk.widget.Widget.overrideCursor].
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the color used to render the primary
          and secondary cursors you should use a custom CSS style, through an
          application-specific #GtkStyleProvider and a CSS style class.
  */
  void overrideCursor(gdk.rgba.RGBA cursor, gdk.rgba.RGBA secondaryCursor)
  {
    gtk_widget_override_cursor(cast(GtkWidget*)this._cPtr, cast(const(GdkRGBA)*)&cursor, cast(const(GdkRGBA)*)&secondaryCursor);
  }

  /**
      Sets the font to use for a widget. All other style values are
      left untouched. See [gtk.widget.Widget.overrideColor].
  
      Params:
        fontDesc = the font description to use, or null to undo
              the effect of previous calls to [gtk.widget.Widget.overrideFont]
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the font a widget uses to render its text
          you should use a custom CSS style, through an application-specific
          #GtkStyleProvider and a CSS style class.
  */
  void overrideFont(pango.font_description.FontDescription fontDesc = null)
  {
    gtk_widget_override_font(cast(GtkWidget*)this._cPtr, fontDesc ? cast(const(PangoFontDescription)*)fontDesc._cPtr(No.Dup) : null);
  }

  /**
      Sets a symbolic color for a widget.
      
      All other style values are left untouched.
      See [gtk.widget.Widget.overrideColor] for overriding the foreground
      or background color.
  
      Params:
        name = the name of the symbolic color to modify
        color = the color to assign (does not need
              to be allocated), or null to undo the effect of previous
              calls to [gtk.widget.Widget.overrideSymbolicColor]
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the color used to render symbolic icons
          you should use a custom CSS style, through an application-specific
          #GtkStyleProvider and a CSS style class.
  */
  void overrideSymbolicColor(string name, gdk.rgba.RGBA color)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_override_symbolic_color(cast(GtkWidget*)this._cPtr, _name, cast(const(GdkRGBA)*)&color);
  }

  /**
      Obtains the full path to widget. The path is simply the name of a
      widget and all its parents in the container hierarchy, separated by
      periods. The name of a widget comes from
      [gtk.widget.Widget.getName]. Paths are used to apply styles to a widget
      in gtkrc configuration files. Widget names are the type of the
      widget by default (e.g. “GtkButton”) or can be set to an
      application-specific value with [gtk.widget.Widget.setName]. By setting
      the name of a widget, you allow users or theme authors to apply
      styles to that specific widget in their gtkrc
      file. path_reversed_p fills in the path in reverse order,
      i.e. starting with widget’s name instead of starting with the name
      of widget’s outermost ancestor.
  
      Params:
        pathLength = location to store length of the path,
              or null
        path = location to store allocated path string,
              or null
        pathReversed = location to store allocated reverse
              path string, or null
  
      Deprecated: Use [gtk.widget.Widget.getPath] instead
  */
  void path(out uint pathLength, out string path, out string pathReversed)
  {
    char* _path;
    char* _pathReversed;
    gtk_widget_path(cast(GtkWidget*)this._cPtr, cast(uint*)&pathLength, &_path, &_pathReversed);
    path = _path.fromCString(Yes.Free);
    pathReversed = _pathReversed.fromCString(Yes.Free);
  }

  /**
      This function is only for use in widget implementations.
      
      Flags the widget for a rerun of the GtkWidgetClass::size_allocate
      function. Use this function instead of [gtk.widget.Widget.queueResize]
      when the widget's size request didn't change but it wants to
      reposition its contents.
      
      An example user of this function is [gtk.widget.Widget.setHalign].
  */
  void queueAllocate()
  {
    gtk_widget_queue_allocate(cast(GtkWidget*)this._cPtr);
  }

  /**
      Mark widget as needing to recompute its expand flags. Call
      this function when setting legacy expand child properties
      on the child of a container.
      
      See [gtk.widget.Widget.computeExpand].
  */
  void queueComputeExpand()
  {
    gtk_widget_queue_compute_expand(cast(GtkWidget*)this._cPtr);
  }

  /**
      Equivalent to calling [gtk.widget.Widget.queueDrawArea] for the
      entire area of a widget.
  */
  void queueDraw()
  {
    gtk_widget_queue_draw(cast(GtkWidget*)this._cPtr);
  }

  /**
      Convenience function that calls [gtk.widget.Widget.queueDrawRegion] on
      the region created from the given coordinates.
      
      The region here is specified in widget coordinates.
      Widget coordinates are a bit odd; for historical reasons, they are
      defined as widget->window coordinates for widgets that return true for
      [gtk.widget.Widget.getHasWindow], and are relative to widget->allocation.x,
      widget->allocation.y otherwise.
      
      width or height may be 0, in this case this function does
      nothing. Negative values for width and height are not allowed.
  
      Params:
        x = x coordinate of upper-left corner of rectangle to redraw
        y = y coordinate of upper-left corner of rectangle to redraw
        width = width of region to draw
        height = height of region to draw
  */
  void queueDrawArea(int x, int y, int width, int height)
  {
    gtk_widget_queue_draw_area(cast(GtkWidget*)this._cPtr, x, y, width, height);
  }

  /**
      Invalidates the area of widget defined by region by calling
      [gdk.window.Window.invalidateRegion] on the widget’s window and all its
      child windows. Once the main loop becomes idle (after the current
      batch of events has been processed, roughly), the window will
      receive expose events for the union of all regions that have been
      invalidated.
      
      Normally you would only use this function in widget
      implementations. You might also use it to schedule a redraw of a
      #GtkDrawingArea or some portion thereof.
  
      Params:
        region = region to draw
  */
  void queueDrawRegion(cairo.region.Region region)
  {
    gtk_widget_queue_draw_region(cast(GtkWidget*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      This function is only for use in widget implementations.
      Flags a widget to have its size renegotiated; should
      be called when a widget for some reason has a new size request.
      For example, when you change the text in a #GtkLabel, #GtkLabel
      queues a resize to ensure there’s enough space for the new text.
      
      Note that you cannot call [gtk.widget.Widget.queueResize] on a widget
      from inside its implementation of the GtkWidgetClass::size_allocate
      virtual method. Calls to [gtk.widget.Widget.queueResize] from inside
      GtkWidgetClass::size_allocate will be silently ignored.
  */
  void queueResize()
  {
    gtk_widget_queue_resize(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function works like [gtk.widget.Widget.queueResize],
      except that the widget is not invalidated.
  */
  void queueResizeNoRedraw()
  {
    gtk_widget_queue_resize_no_redraw(cast(GtkWidget*)this._cPtr);
  }

  /**
      Creates the GDK (windowing system) resources associated with a
      widget.  For example, widget->window will be created when a widget
      is realized.  Normally realization happens implicitly; if you show
      a widget and all its parent containers, then the widget will be
      realized and mapped automatically.
      
      Realizing a widget requires all
      the widget’s parent widgets to be realized; calling
      [gtk.widget.Widget.realize] realizes the widget’s parents in addition to
      widget itself. If a widget is not yet inside a toplevel window
      when you realize it, bad things will happen.
      
      This function is primarily used in widget implementations, and
      isn’t very useful otherwise. Many times when you think you might
      need it, a better approach is to connect to a signal that will be
      called after the widget is realized automatically, such as
      #GtkWidget::draw. Or simply g_signal_connect () to the
      #GtkWidget::realize signal.
  */
  void realize()
  {
    gtk_widget_realize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Computes the intersection of a widget’s area and region, returning
      the intersection. The result may be empty, use [cairo.region.Region.isEmpty] to
      check.
  
      Params:
        region = a #cairo_region_t, in the same coordinate system as
                   widget->allocation. That is, relative to widget->window
                   for widgets which return false from [gtk.widget.Widget.getHasWindow];
                   relative to the parent window of widget->window otherwise.
      Returns: A newly allocated region holding the intersection of widget
            and region.
  
      Deprecated: Use [gtk.widget.Widget.getAllocation] and
            [cairo.region.Region.intersectRectangle] to get the same behavior.
  */
  cairo.region.Region regionIntersect(cairo.region.Region region)
  {
    cairo_region_t* _cretval;
    _cretval = gtk_widget_region_intersect(cast(GtkWidget*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Registers a #GdkWindow with the widget and sets it up so that
      the widget receives events for it. Call [gtk.widget.Widget.unregisterWindow]
      when destroying the window.
      
      Before 3.8 you needed to call [gdk.window.Window.setUserData] directly to set
      this up. This is now deprecated and you should use [gtk.widget.Widget.registerWindow]
      instead. Old code will keep working as is, although some new features like
      transparency might not work perfectly.
  
      Params:
        window = a #GdkWindow
  */
  void registerWindow(gdk.window.Window window)
  {
    gtk_widget_register_window(cast(GtkWidget*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Removes an accelerator from widget, previously installed with
      [gtk.widget.Widget.addAccelerator].
  
      Params:
        accelGroup = accel group for this widget
        accelKey = GDK keyval of the accelerator
        accelMods = modifier key combination of the accelerator
      Returns: whether an accelerator was installed and could be removed
  */
  bool removeAccelerator(gtk.accel_group.AccelGroup accelGroup, uint accelKey, gdk.types.ModifierType accelMods)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_remove_accelerator(cast(GtkWidget*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null, accelKey, accelMods);
    return _retval;
  }

  /**
      Removes a widget from the list of mnemonic labels for
      this widget. (See [gtk.widget.Widget.listMnemonicLabels]). The widget
      must have previously been added to the list with
      [gtk.widget.Widget.addMnemonicLabel].
  
      Params:
        label = a #GtkWidget that was previously set as a mnemonic label for
                  widget with [gtk.widget.Widget.addMnemonicLabel].
  */
  void removeMnemonicLabel(gtk.widget.Widget label)
  {
    gtk_widget_remove_mnemonic_label(cast(GtkWidget*)this._cPtr, label ? cast(GtkWidget*)label._cPtr(No.Dup) : null);
  }

  /**
      Removes a tick callback previously registered with
      [gtk.widget.Widget.addTickCallback].
  
      Params:
        id = an id returned by [gtk.widget.Widget.addTickCallback]
  */
  void removeTickCallback(uint id)
  {
    gtk_widget_remove_tick_callback(cast(GtkWidget*)this._cPtr, id);
  }

  /**
      A convenience function that uses the theme settings for widget
      to look up stock_id and render it to a pixbuf. stock_id should
      be a stock icon ID such as #GTK_STOCK_OPEN or #GTK_STOCK_OK. size
      should be a size such as #GTK_ICON_SIZE_MENU. detail should be a
      string that identifies the widget or code doing the rendering, so
      that theme engines can special-case rendering for that widget or
      code.
      
      The pixels in the returned #GdkPixbuf are shared with the rest of
      the application and should not be modified. The pixbuf should be
      freed after use with [gobject.object.ObjectWrap.unref].
  
      Params:
        stockId = a stock ID
        size = a stock size (#GtkIconSize). A size of `(GtkIconSize)-1`
              means render at the size of the source and don’t scale (if there are
              multiple source sizes, GTK+ picks one of the available sizes).
        detail = render detail to pass to theme engine
      Returns: a new pixbuf, or null if the
            stock ID wasn’t known
  
      Deprecated: Use [gtk.widget.Widget.renderIconPixbuf] instead.
  */
  gdkpixbuf.pixbuf.Pixbuf renderIcon(string stockId, gtk.types.IconSize size, string detail = null)
  {
    GdkPixbuf* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    const(char)* _detail = detail.toCString(No.Alloc);
    _cretval = gtk_widget_render_icon(cast(GtkWidget*)this._cPtr, _stockId, size, _detail);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      A convenience function that uses the theme engine and style
      settings for widget to look up stock_id and render it to
      a pixbuf. stock_id should be a stock icon ID such as
      #GTK_STOCK_OPEN or #GTK_STOCK_OK. size should be a size
      such as #GTK_ICON_SIZE_MENU.
      
      The pixels in the returned #GdkPixbuf are shared with the rest of
      the application and should not be modified. The pixbuf should be freed
      after use with [gobject.object.ObjectWrap.unref].
  
      Params:
        stockId = a stock ID
        size = a stock size (#GtkIconSize). A size of `(GtkIconSize)-1`
              means render at the size of the source and don’t scale (if there are
              multiple source sizes, GTK+ picks one of the available sizes).
      Returns: a new pixbuf, or null if the
            stock ID wasn’t known
  
      Deprecated: Use [gtk.icon_theme.IconTheme.loadIcon] instead.
  */
  gdkpixbuf.pixbuf.Pixbuf renderIconPixbuf(string stockId, gtk.types.IconSize size)
  {
    GdkPixbuf* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_widget_render_icon_pixbuf(cast(GtkWidget*)this._cPtr, _stockId, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Moves a widget from one #GtkContainer to another, handling reference
      count issues to avoid destroying the widget.
  
      Params:
        newParent = a #GtkContainer to move the widget into
  
      Deprecated: Use [gtk.container.Container.remove] and [gtk.container.Container.add].
  */
  void reparent(gtk.widget.Widget newParent)
  {
    gtk_widget_reparent(cast(GtkWidget*)this._cPtr, newParent ? cast(GtkWidget*)newParent._cPtr(No.Dup) : null);
  }

  /**
      Reset the styles of widget and all descendents, so when
      they are looked up again, they get the correct values
      for the currently loaded RC file settings.
      
      This function is not useful for applications.
  
      Deprecated: Use #GtkStyleContext instead, and [gtk.widget.Widget.resetStyle]
  */
  void resetRcStyles()
  {
    gtk_widget_reset_rc_styles(cast(GtkWidget*)this._cPtr);
  }

  /**
      Updates the style context of widget and all descendants
      by updating its widget path. #GtkContainers may want
      to use this on a child when reordering it in a way that a different
      style might apply to it. See also [gtk.container.Container.getPathForChild].
  */
  void resetStyle()
  {
    gtk_widget_reset_style(cast(GtkWidget*)this._cPtr);
  }

  /**
      Very rarely-used function. This function is used to emit
      an expose event on a widget. This function is not normally used
      directly. The only time it is used is when propagating an expose
      event to a windowless child widget ([gtk.widget.Widget.getHasWindow] is false),
      and that is normally done using [gtk.container.Container.propagateDraw].
      
      If you want to force an area of a window to be redrawn,
      use [gdk.window.Window.invalidateRect] or [gdk.window.Window.invalidateRegion].
      To cause the redraw to be done immediately, follow that call
      with a call to [gdk.window.Window.processUpdates].
  
      Params:
        event = a expose #GdkEvent
      Returns: return from the event signal emission (true if
          the event was handled)
  
      Deprecated: Application and widget code should not handle
          expose events directly; invalidation should use the #GtkWidget
          API, and drawing should only happen inside #GtkWidget::draw
          implementations
  */
  int sendExpose(gdk.event.Event event)
  {
    int _retval;
    _retval = gtk_widget_send_expose(cast(GtkWidget*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sends the focus change event to widget
      
      This function is not meant to be used by applications. The only time it
      should be used is when it is necessary for a #GtkWidget to assign focus
      to a widget that is semantically owned by the first widget even though
      it’s not a direct child - for instance, a search entry in a floating
      window similar to the quick search in #GtkTreeView.
      
      An example of its usage is:
      
      ```c
        GdkEvent *fevent = gdk_event_new (GDK_FOCUS_CHANGE);
      
        fevent->focus_change.type = GDK_FOCUS_CHANGE;
        fevent->focus_change.in = TRUE;
        fevent->focus_change.window = _gtk_widget_get_window (widget);
        if (fevent->focus_change.window != NULL)
          g_object_ref (fevent->focus_change.window);
      
        gtk_widget_send_focus_change (widget, fevent);
      
        gdk_event_free (event);
      ```
  
      Params:
        event = a #GdkEvent of type GDK_FOCUS_CHANGE
      Returns: the return value from the event signal emission: true
          if the event was handled, and false otherwise
  */
  bool sendFocusChange(gdk.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_send_focus_change(cast(GtkWidget*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Given an accelerator group, accel_group, and an accelerator path,
      accel_path, sets up an accelerator in accel_group so whenever the
      key binding that is defined for accel_path is pressed, widget
      will be activated.  This removes any accelerators (for any
      accelerator group) installed by previous calls to
      [gtk.widget.Widget.setAccelPath]. Associating accelerators with
      paths allows them to be modified by the user and the modifications
      to be saved for future use. (See [gtk.accel_map.AccelMap.save].)
      
      This function is a low level function that would most likely
      be used by a menu creation system like #GtkUIManager. If you
      use #GtkUIManager, setting up accelerator paths will be done
      automatically.
      
      Even when you you aren’t using #GtkUIManager, if you only want to
      set up accelerators on menu items [gtk.menu_item.MenuItem.setAccelPath]
      provides a somewhat more convenient interface.
      
      Note that accel_path string will be stored in a #GQuark. Therefore, if you
      pass a static string, you can save some memory by interning it first with
      [glib.global.internStaticString].
  
      Params:
        accelPath = path used to look up the accelerator
        accelGroup = a #GtkAccelGroup.
  */
  void setAccelPath(string accelPath = null, gtk.accel_group.AccelGroup accelGroup = null)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_widget_set_accel_path(cast(GtkWidget*)this._cPtr, _accelPath, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  /**
      Sets the widget’s allocation.  This should not be used
      directly, but from within a widget’s size_allocate method.
      
      The allocation set should be the “adjusted” or actual
      allocation. If you’re implementing a #GtkContainer, you want to use
      [gtk.widget.Widget.sizeAllocate] instead of [gtk.widget.Widget.setAllocation].
      The GtkWidgetClass::adjust_size_allocation virtual method adjusts the
      allocation inside [gtk.widget.Widget.sizeAllocate] to create an adjusted
      allocation.
  
      Params:
        allocation = a pointer to a #GtkAllocation to copy from
  */
  void setAllocation(gtk.types.Allocation allocation)
  {
    gtk_widget_set_allocation(cast(GtkWidget*)this._cPtr, cast(const(GtkAllocation)*)&allocation);
  }

  /**
      Sets whether the application intends to draw on the widget in
      an #GtkWidget::draw handler.
      
      This is a hint to the widget and does not affect the behavior of
      the GTK+ core; many widgets ignore this flag entirely. For widgets
      that do pay attention to the flag, such as #GtkEventBox and #GtkWindow,
      the effect is to suppress default themed drawing of the widget's
      background. (Children of the widget will still be drawn.) The application
      is then entirely responsible for drawing the widget background.
      
      Note that the background is still drawn when the widget is mapped.
  
      Params:
        appPaintable = true if the application will paint on the widget
  */
  void setAppPaintable(bool appPaintable)
  {
    gtk_widget_set_app_paintable(cast(GtkWidget*)this._cPtr, appPaintable);
  }

  /**
      Specifies whether widget can be a default widget. See
      [gtk.widget.Widget.grabDefault] for details about the meaning of
      “default”.
  
      Params:
        canDefault = whether or not widget can be a default widget.
  */
  void setCanDefault(bool canDefault)
  {
    gtk_widget_set_can_default(cast(GtkWidget*)this._cPtr, canDefault);
  }

  /**
      Specifies whether widget can own the input focus. See
      [gtk.widget.Widget.grabFocus] for actually setting the input focus on a
      widget.
  
      Params:
        canFocus = whether or not widget can own the input focus.
  */
  void setCanFocus(bool canFocus)
  {
    gtk_widget_set_can_focus(cast(GtkWidget*)this._cPtr, canFocus);
  }

  /**
      Sets whether widget should be mapped along with its when its parent
      is mapped and widget has been shown with [gtk.widget.Widget.show].
      
      The child visibility can be set for widget before it is added to
      a container with [gtk.widget.Widget.setParent], to avoid mapping
      children unnecessary before immediately unmapping them. However
      it will be reset to its default state of true when the widget
      is removed from a container.
      
      Note that changing the child visibility of a widget does not
      queue a resize on the widget. Most of the time, the size of
      a widget is computed from all visible children, whether or
      not they are mapped. If this is not the case, the container
      can queue a resize itself.
      
      This function is only useful for container implementations and
      never should be called by an application.
  
      Params:
        isVisible = if true, widget should be mapped along with its parent.
  */
  void setChildVisible(bool isVisible)
  {
    gtk_widget_set_child_visible(cast(GtkWidget*)this._cPtr, isVisible);
  }

  /**
      Sets the widget’s clip.  This must not be used directly,
      but from within a widget’s size_allocate method.
      It must be called after [gtk.widget.Widget.setAllocation] (or after chaining up
      to the parent class), because that function resets the clip.
      
      The clip set should be the area that widget draws on. If widget is a
      #GtkContainer, the area must contain all children's clips.
      
      If this function is not called by widget during a ::size-allocate handler,
      the clip will be set to widget's allocation.
  
      Params:
        clip = a pointer to a #GtkAllocation to copy from
  */
  void setClip(gtk.types.Allocation clip)
  {
    gtk_widget_set_clip(cast(GtkWidget*)this._cPtr, cast(const(GtkAllocation)*)&clip);
  }

  /**
      Sets a widgets composite name. The widget must be
      a composite child of its parent; see [gtk.widget.Widget.pushCompositeChild].
  
      Params:
        name = the name to set
  
      Deprecated: Use [gtk.widget_class.WidgetClass.setTemplate], or don’t use this API at all.
  */
  void setCompositeName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_set_composite_name(cast(GtkWidget*)this._cPtr, _name);
  }

  /**
      Enables or disables a #GdkDevice to interact with widget
      and all its children.
      
      It does so by descending through the #GdkWindow hierarchy
      and enabling the same mask that is has for core events
      (i.e. the one that [gdk.window.Window.getEvents] returns).
  
      Params:
        device = a #GdkDevice
        enabled = whether to enable the device
  */
  void setDeviceEnabled(gdk.device.Device device, bool enabled)
  {
    gtk_widget_set_device_enabled(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, enabled);
  }

  /**
      Sets the device event mask (see #GdkEventMask) for a widget. The event
      mask determines which events a widget will receive from device. Keep
      in mind that different widgets have different default event masks, and by
      changing the event mask you may disrupt a widget’s functionality,
      so be careful. This function must be called while a widget is
      unrealized. Consider [gtk.widget.Widget.addDeviceEvents] for widgets that are
      already realized, or if you want to preserve the existing event
      mask. This function can’t be used with windowless widgets (which return
      false from [gtk.widget.Widget.getHasWindow]);
      to get events on those widgets, place them inside a #GtkEventBox
      and receive events on the event box.
  
      Params:
        device = a #GdkDevice
        events = event mask
  */
  void setDeviceEvents(gdk.device.Device device, gdk.types.EventMask events)
  {
    gtk_widget_set_device_events(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, events);
  }

  /**
      Sets the reading direction on a particular widget. This direction
      controls the primary direction for widgets containing text,
      and also the direction in which the children of a container are
      packed. The ability to set the direction is present in order
      so that correct localization into languages with right-to-left
      reading directions can be done. Generally, applications will
      let the default reading direction present, except for containers
      where the containers are arranged in an order that is explicitly
      visual rather than logical (such as buttons for text justification).
      
      If the direction is set to [gtk.types.TextDirection.None], then the value
      set by [gtk.widget.Widget.setDefaultDirection] will be used.
  
      Params:
        dir = the new direction
  */
  void setDirection(gtk.types.TextDirection dir)
  {
    gtk_widget_set_direction(cast(GtkWidget*)this._cPtr, dir);
  }

  /**
      Widgets are double buffered by default; you can use this function
      to turn off the buffering. “Double buffered” simply means that
      [gdk.window.Window.beginDrawFrame] and [gdk.window.Window.endDrawFrame] are called
      automatically around expose events sent to the
      widget. [gdk.window.Window.beginDrawFrame] diverts all drawing to a widget's
      window to an offscreen buffer, and [gdk.window.Window.endDrawFrame] draws the
      buffer to the screen. The result is that users see the window
      update in one smooth step, and don’t see individual graphics
      primitives being rendered.
      
      In very simple terms, double buffered widgets don’t flicker,
      so you would only use this function to turn off double buffering
      if you had special needs and really knew what you were doing.
      
      Note: if you turn off double-buffering, you have to handle
      expose events, since even the clearing to the background color or
      pixmap will not happen automatically (as it is done in
      [gdk.window.Window.beginDrawFrame]).
      
      In 3.10 GTK and GDK have been restructured for translucent drawing. Since
      then expose events for double-buffered widgets are culled into a single
      event to the toplevel GDK window. If you now unset double buffering, you
      will cause a separate rendering pass for every widget. This will likely
      cause rendering problems - in particular related to stacking - and usually
      increases rendering times significantly.
  
      Params:
        doubleBuffered = true to double-buffer a widget
  
      Deprecated: This function does not work under non-X11 backends or with
        non-native windows.
        It should not be used in newly written code.
  */
  void setDoubleBuffered(bool doubleBuffered)
  {
    gtk_widget_set_double_buffered(cast(GtkWidget*)this._cPtr, doubleBuffered);
  }

  /**
      Sets the event mask (see #GdkEventMask) for a widget. The event
      mask determines which events a widget will receive. Keep in mind
      that different widgets have different default event masks, and by
      changing the event mask you may disrupt a widget’s functionality,
      so be careful. This function must be called while a widget is
      unrealized. Consider [gtk.widget.Widget.addEvents] for widgets that are
      already realized, or if you want to preserve the existing event
      mask. This function can’t be used with widgets that have no window.
      (See [gtk.widget.Widget.getHasWindow]).  To get events on those widgets,
      place them inside a #GtkEventBox and receive events on the event
      box.
  
      Params:
        events = event mask
  */
  void setEvents(int events)
  {
    gtk_widget_set_events(cast(GtkWidget*)this._cPtr, events);
  }

  /**
      Sets whether the widget should grab focus when it is clicked with the mouse.
      Making mouse clicks not grab focus is useful in places like toolbars where
      you don’t want the keyboard focus removed from the main area of the
      application.
  
      Params:
        focusOnClick = whether the widget should grab focus when clicked with the mouse
  */
  void setFocusOnClick(bool focusOnClick)
  {
    gtk_widget_set_focus_on_click(cast(GtkWidget*)this._cPtr, focusOnClick);
  }

  /**
      Sets the font map to use for Pango rendering. When not set, the widget
      will inherit the font map from its parent.
  
      Params:
        fontMap = a #PangoFontMap, or null to unset any previously
              set font map
  */
  void setFontMap(pango.font_map.FontMap fontMap = null)
  {
    gtk_widget_set_font_map(cast(GtkWidget*)this._cPtr, fontMap ? cast(PangoFontMap*)fontMap._cPtr(No.Dup) : null);
  }

  /**
      Sets the #cairo_font_options_t used for Pango rendering in this widget.
      When not set, the default font options for the #GdkScreen will be used.
  
      Params:
        options = a #cairo_font_options_t, or null to unset any
            previously set default font options.
  */
  void setFontOptions(cairo.font_options.FontOptions options = null)
  {
    gtk_widget_set_font_options(cast(GtkWidget*)this._cPtr, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
  }

  /**
      Sets the horizontal alignment of widget.
      See the #GtkWidget:halign property.
  
      Params:
        align_ = the horizontal alignment
  */
  void setHalign(gtk.types.Align align_)
  {
    gtk_widget_set_halign(cast(GtkWidget*)this._cPtr, align_);
  }

  /**
      Sets the has-tooltip property on widget to has_tooltip.  See
      #GtkWidget:has-tooltip for more information.
  
      Params:
        hasTooltip = whether or not widget has a tooltip.
  */
  void setHasTooltip(bool hasTooltip)
  {
    gtk_widget_set_has_tooltip(cast(GtkWidget*)this._cPtr, hasTooltip);
  }

  /**
      Specifies whether widget has a #GdkWindow of its own. Note that
      all realized widgets have a non-null “window” pointer
      ([gtk.widget.Widget.getWindow] never returns a null window when a widget
      is realized), but for many of them it’s actually the #GdkWindow of
      one of its parent widgets. Widgets that do not create a `window` for
      themselves in #GtkWidget::realize must announce this by
      calling this function with has_window = false.
      
      This function should only be called by widget implementations,
      and they should call it in their init() function.
  
      Params:
        hasWindow = whether or not widget has a window.
  */
  void setHasWindow(bool hasWindow)
  {
    gtk_widget_set_has_window(cast(GtkWidget*)this._cPtr, hasWindow);
  }

  /**
      Sets whether the widget would like any available extra horizontal
      space. When a user resizes a #GtkWindow, widgets with expand=TRUE
      generally receive the extra space. For example, a list or
      scrollable area or document in your window would often be set to
      expand.
      
      Call this function to set the expand flag if you would like your
      widget to become larger horizontally when the window has extra
      room.
      
      By default, widgets automatically expand if any of their children
      want to expand. (To see if a widget will automatically expand given
      its current children and state, call [gtk.widget.Widget.computeExpand]. A
      container can decide how the expandability of children affects the
      expansion of the container by overriding the compute_expand virtual
      method on #GtkWidget.).
      
      Setting hexpand explicitly with this function will override the
      automatic expand behavior.
      
      This function forces the widget to expand or not to expand,
      regardless of children.  The override occurs because
      [gtk.widget.Widget.setHexpand] sets the hexpand-set property (see
      [gtk.widget.Widget.setHexpandSet]) which causes the widget’s hexpand
      value to be used, rather than looking at children and widget state.
  
      Params:
        expand = whether to expand
  */
  void setHexpand(bool expand)
  {
    gtk_widget_set_hexpand(cast(GtkWidget*)this._cPtr, expand);
  }

  /**
      Sets whether the hexpand flag (see [gtk.widget.Widget.getHexpand]) will
      be used.
      
      The hexpand-set property will be set automatically when you call
      [gtk.widget.Widget.setHexpand] to set hexpand, so the most likely
      reason to use this function would be to unset an explicit expand
      flag.
      
      If hexpand is set, then it overrides any computed
      expand value based on child widgets. If hexpand is not
      set, then the expand value depends on whether any
      children of the widget would like to expand.
      
      There are few reasons to use this function, but it’s here
      for completeness and consistency.
  
      Params:
        set = value for hexpand-set property
  */
  void setHexpandSet(bool set)
  {
    gtk_widget_set_hexpand_set(cast(GtkWidget*)this._cPtr, set);
  }

  /**
      Marks the widget as being mapped.
      
      This function should only ever be called in a derived widget's
      “map” or “unmap” implementation.
  
      Params:
        mapped = true to mark the widget as mapped
  */
  void setMapped(bool mapped)
  {
    gtk_widget_set_mapped(cast(GtkWidget*)this._cPtr, mapped);
  }

  /**
      Sets the bottom margin of widget.
      See the #GtkWidget:margin-bottom property.
  
      Params:
        margin = the bottom margin
  */
  void setMarginBottom(int margin)
  {
    gtk_widget_set_margin_bottom(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the end margin of widget.
      See the #GtkWidget:margin-end property.
  
      Params:
        margin = the end margin
  */
  void setMarginEnd(int margin)
  {
    gtk_widget_set_margin_end(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the left margin of widget.
      See the #GtkWidget:margin-left property.
  
      Params:
        margin = the left margin
  
      Deprecated: Use [gtk.widget.Widget.setMarginStart] instead.
  */
  void setMarginLeft(int margin)
  {
    gtk_widget_set_margin_left(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the right margin of widget.
      See the #GtkWidget:margin-right property.
  
      Params:
        margin = the right margin
  
      Deprecated: Use [gtk.widget.Widget.setMarginEnd] instead.
  */
  void setMarginRight(int margin)
  {
    gtk_widget_set_margin_right(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the start margin of widget.
      See the #GtkWidget:margin-start property.
  
      Params:
        margin = the start margin
  */
  void setMarginStart(int margin)
  {
    gtk_widget_set_margin_start(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the top margin of widget.
      See the #GtkWidget:margin-top property.
  
      Params:
        margin = the top margin
  */
  void setMarginTop(int margin)
  {
    gtk_widget_set_margin_top(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Widgets can be named, which allows you to refer to them from a
      CSS file. You can apply a style to widgets with a particular name
      in the CSS file. See the documentation for the CSS syntax (on the
      same page as the docs for #GtkStyleContext).
      
      Note that the CSS syntax has certain special characters to delimit
      and represent elements in a selector (period, #, >, *...), so using
      these will make your widget impossible to match by name. Any combination
      of alphanumeric symbols, dashes and underscores will suffice.
  
      Params:
        name = name for the widget
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_set_name(cast(GtkWidget*)this._cPtr, _name);
  }

  /**
      Sets the #GtkWidget:no-show-all property, which determines whether
      calls to [gtk.widget.Widget.showAll] will affect this widget.
      
      This is mostly for use in constructing widget hierarchies with externally
      controlled visibility, see #GtkUIManager.
  
      Params:
        noShowAll = the new value for the “no-show-all” property
  */
  void setNoShowAll(bool noShowAll)
  {
    gtk_widget_set_no_show_all(cast(GtkWidget*)this._cPtr, noShowAll);
  }

  /**
      Request the widget to be rendered partially transparent,
      with opacity 0 being fully transparent and 1 fully opaque. (Opacity values
      are clamped to the [0,1] range.).
      This works on both toplevel widget, and child widgets, although there
      are some limitations:
      
      For toplevel widgets this depends on the capabilities of the windowing
      system. On X11 this has any effect only on X screens with a compositing manager
      running. See [gtk.widget.Widget.isComposited]. On Windows it should work
      always, although setting a window’s opacity after the window has been
      shown causes it to flicker once on Windows.
      
      For child widgets it doesn’t work if any affected widget has a native window, or
      disables double buffering.
  
      Params:
        opacity = desired opacity, between 0 and 1
  */
  void setOpacity(double opacity)
  {
    gtk_widget_set_opacity(cast(GtkWidget*)this._cPtr, opacity);
  }

  /**
      This function is useful only when implementing subclasses of
      #GtkContainer.
      Sets the container as the parent of widget, and takes care of
      some details such as updating the state and style of the child
      to reflect its new location. The opposite function is
      [gtk.widget.Widget.unparent].
  
      Params:
        parent = parent container
  */
  void setParent(gtk.widget.Widget parent)
  {
    gtk_widget_set_parent(cast(GtkWidget*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets a non default parent window for widget.
      
      For #GtkWindow classes, setting a parent_window effects whether
      the window is a toplevel window or can be embedded into other
      widgets.
      
      For #GtkWindow classes, this needs to be called before the
      window is realized.
  
      Params:
        parentWindow = the new parent window.
  */
  void setParentWindow(gdk.window.Window parentWindow)
  {
    gtk_widget_set_parent_window(cast(GtkWidget*)this._cPtr, parentWindow ? cast(GdkWindow*)parentWindow._cPtr(No.Dup) : null);
  }

  /**
      Marks the widget as being realized. This function must only be
      called after all #GdkWindows for the widget have been created
      and registered.
      
      This function should only ever be called in a derived widget's
      “realize” or “unrealize” implementation.
  
      Params:
        realized = true to mark the widget as realized
  */
  void setRealized(bool realized)
  {
    gtk_widget_set_realized(cast(GtkWidget*)this._cPtr, realized);
  }

  /**
      Specifies whether widget will be treated as the default widget
      within its toplevel when it has the focus, even if another widget
      is the default.
      
      See [gtk.widget.Widget.grabDefault] for details about the meaning of
      “default”.
  
      Params:
        receivesDefault = whether or not widget can be a default widget.
  */
  void setReceivesDefault(bool receivesDefault)
  {
    gtk_widget_set_receives_default(cast(GtkWidget*)this._cPtr, receivesDefault);
  }

  /**
      Sets whether the entire widget is queued for drawing when its size
      allocation changes. By default, this setting is true and
      the entire widget is redrawn on every size change. If your widget
      leaves the upper left unchanged when made bigger, turning this
      setting off will improve performance.
      
      Note that for widgets where [gtk.widget.Widget.getHasWindow] is false
      setting this flag to false turns off all allocation on resizing:
      the widget will not even redraw if its position changes; this is to
      allow containers that don’t draw anything to avoid excess
      invalidations. If you set this flag on a widget with no window that
      does draw on widget->window, you are
      responsible for invalidating both the old and new allocation of the
      widget when the widget is moved and responsible for invalidating
      regions newly when the widget increases size.
  
      Params:
        redrawOnAllocate = if true, the entire widget will be redrawn
            when it is allocated to a new size. Otherwise, only the
            new portion of the widget will be redrawn.
  */
  void setRedrawOnAllocate(bool redrawOnAllocate)
  {
    gtk_widget_set_redraw_on_allocate(cast(GtkWidget*)this._cPtr, redrawOnAllocate);
  }

  /**
      Sets the sensitivity of a widget. A widget is sensitive if the user
      can interact with it. Insensitive widgets are “grayed out” and the
      user can’t interact with them. Insensitive widgets are known as
      “inactive”, “disabled”, or “ghosted” in some other toolkits.
  
      Params:
        sensitive = true to make the widget sensitive
  */
  void setSensitive(bool sensitive)
  {
    gtk_widget_set_sensitive(cast(GtkWidget*)this._cPtr, sensitive);
  }

  /**
      Sets the minimum size of a widget; that is, the widget’s size
      request will be at least width by height. You can use this
      function to force a widget to be larger than it normally would be.
      
      In most cases, [gtk.window.Window.setDefaultSize] is a better choice for
      toplevel windows than this function; setting the default size will
      still allow users to shrink the window. Setting the size request
      will force them to leave the window at least as large as the size
      request. When dealing with window sizes,
      [gtk.window.Window.setGeometryHints] can be a useful function as well.
      
      Note the inherent danger of setting any fixed size - themes,
      translations into other languages, different fonts, and user action
      can all change the appropriate size for a given widget. So, it's
      basically impossible to hardcode a size that will always be
      correct.
      
      The size request of a widget is the smallest size a widget can
      accept while still functioning well and drawing itself correctly.
      However in some strange cases a widget may be allocated less than
      its requested size, and in many cases a widget may be allocated more
      space than it requested.
      
      If the size request in a given direction is -1 (unset), then
      the “natural” size request of the widget will be used instead.
      
      The size request set here does not include any margin from the
      #GtkWidget properties margin-left, margin-right, margin-top, and
      margin-bottom, but it does include pretty much all other padding
      or border properties set by any subclass of #GtkWidget.
  
      Params:
        width = width widget should request, or -1 to unset
        height = height widget should request, or -1 to unset
  */
  void setSizeRequest(int width, int height)
  {
    gtk_widget_set_size_request(cast(GtkWidget*)this._cPtr, width, height);
  }

  /**
      This function is for use in widget implementations. Sets the state
      of a widget (insensitive, prelighted, etc.) Usually you should set
      the state using wrapper functions such as [gtk.widget.Widget.setSensitive].
  
      Params:
        state = new state for widget
  
      Deprecated: Use [gtk.widget.Widget.setStateFlags] instead.
  */
  void setState(gtk.types.StateType state)
  {
    gtk_widget_set_state(cast(GtkWidget*)this._cPtr, state);
  }

  /**
      This function is for use in widget implementations. Turns on flag
      values in the current widget state (insensitive, prelighted, etc.).
      
      This function accepts the values [gtk.types.StateFlags.DirLtr] and
      [gtk.types.StateFlags.DirRtl] but ignores them. If you want to set the widget's
      direction, use [gtk.widget.Widget.setDirection].
      
      It is worth mentioning that any other state than [gtk.types.StateFlags.Insensitive],
      will be propagated down to all non-internal children if widget is a
      #GtkContainer, while [gtk.types.StateFlags.Insensitive] itself will be propagated
      down to all #GtkContainer children by different means than turning on the
      state flag down the hierarchy, both [gtk.widget.Widget.getStateFlags] and
      [gtk.widget.Widget.isSensitive] will make use of these.
  
      Params:
        flags = State flags to turn on
        clear = Whether to clear state before turning on flags
  */
  void setStateFlags(gtk.types.StateFlags flags, bool clear)
  {
    gtk_widget_set_state_flags(cast(GtkWidget*)this._cPtr, flags, clear);
  }

  /**
      Used to set the #GtkStyle for a widget (widget->style). Since
      GTK 3, this function does nothing, the passed in style is ignored.
  
      Params:
        style = a #GtkStyle, or null to remove the effect
              of a previous call to [gtk.widget.Widget.setStyle] and go back to
              the default style
  
      Deprecated: Use #GtkStyleContext instead
  */
  void setStyle(gtk.style.Style style = null)
  {
    gtk_widget_set_style(cast(GtkWidget*)this._cPtr, style ? cast(GtkStyle*)style._cPtr(No.Dup) : null);
  }

  /**
      Enables or disables multiple pointer awareness. If this setting is true,
      widget will start receiving multiple, per device enter/leave events. Note
      that if custom #GdkWindows are created in #GtkWidget::realize,
      [gdk.window.Window.setSupportMultidevice] will have to be called manually on them.
  
      Params:
        supportMultidevice = true to support input from multiple devices.
  */
  void setSupportMultidevice(bool supportMultidevice)
  {
    gtk_widget_set_support_multidevice(cast(GtkWidget*)this._cPtr, supportMultidevice);
  }

  /**
      Sets markup as the contents of the tooltip, which is marked up with
       the [Pango text markup language][PangoMarkupFormat].
      
      This function will take care of setting #GtkWidget:has-tooltip to true
      and of the default handler for the #GtkWidget::query-tooltip signal.
      
      See also the #GtkWidget:tooltip-markup property and
      [gtk.tooltip.Tooltip.setMarkup].
  
      Params:
        markup = the contents of the tooltip for widget, or null
  */
  void setTooltipMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_widget_set_tooltip_markup(cast(GtkWidget*)this._cPtr, _markup);
  }

  /**
      Sets text as the contents of the tooltip. This function will take
      care of setting #GtkWidget:has-tooltip to true and of the default
      handler for the #GtkWidget::query-tooltip signal.
      
      See also the #GtkWidget:tooltip-text property and [gtk.tooltip.Tooltip.setText].
  
      Params:
        text = the contents of the tooltip for widget
  */
  void setTooltipText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_widget_set_tooltip_text(cast(GtkWidget*)this._cPtr, _text);
  }

  /**
      Replaces the default window used for displaying
      tooltips with custom_window. GTK+ will take care of showing and
      hiding custom_window at the right moment, to behave likewise as
      the default tooltip window. If custom_window is null, the default
      tooltip window will be used.
  
      Params:
        customWindow = a #GtkWindow, or null
  */
  void setTooltipWindow(gtk.window.Window customWindow = null)
  {
    gtk_widget_set_tooltip_window(cast(GtkWidget*)this._cPtr, customWindow ? cast(GtkWindow*)customWindow._cPtr(No.Dup) : null);
  }

  /**
      Sets the vertical alignment of widget.
      See the #GtkWidget:valign property.
  
      Params:
        align_ = the vertical alignment
  */
  void setValign(gtk.types.Align align_)
  {
    gtk_widget_set_valign(cast(GtkWidget*)this._cPtr, align_);
  }

  /**
      Sets whether the widget would like any available extra vertical
      space.
      
      See [gtk.widget.Widget.setHexpand] for more detail.
  
      Params:
        expand = whether to expand
  */
  void setVexpand(bool expand)
  {
    gtk_widget_set_vexpand(cast(GtkWidget*)this._cPtr, expand);
  }

  /**
      Sets whether the vexpand flag (see [gtk.widget.Widget.getVexpand]) will
      be used.
      
      See [gtk.widget.Widget.setHexpandSet] for more detail.
  
      Params:
        set = value for vexpand-set property
  */
  void setVexpandSet(bool set)
  {
    gtk_widget_set_vexpand_set(cast(GtkWidget*)this._cPtr, set);
  }

  /**
      Sets the visibility state of widget. Note that setting this to
      true doesn’t mean the widget is actually viewable, see
      [gtk.widget.Widget.getVisible].
      
      This function simply calls [gtk.widget.Widget.show] or [gtk.widget.Widget.hide]
      but is nicer to use when the visibility of the widget depends on
      some condition.
  
      Params:
        visible = whether the widget should be shown or not
  */
  void setVisible(bool visible)
  {
    gtk_widget_set_visible(cast(GtkWidget*)this._cPtr, visible);
  }

  /**
      Sets the visual that should be used for by widget and its children for
      creating #GdkWindows. The visual must be on the same #GdkScreen as
      returned by [gtk.widget.Widget.getScreen], so handling the
      #GtkWidget::screen-changed signal is necessary.
      
      Setting a new visual will not cause widget to recreate its windows,
      so you should call this function before widget is realized.
  
      Params:
        visual = visual to be used or null to unset a previous one
  */
  void setVisual(gdk.visual.Visual visual = null)
  {
    gtk_widget_set_visual(cast(GtkWidget*)this._cPtr, visual ? cast(GdkVisual*)visual._cPtr(No.Dup) : null);
  }

  /**
      Sets a widget’s window. This function should only be used in a
      widget’s #GtkWidget::realize implementation. The `window` passed is
      usually either new window created with [gdk.window.Window.new_], or the
      window of its parent widget as returned by
      [gtk.widget.Widget.getParentWindow].
      
      Widgets must indicate whether they will create their own #GdkWindow
      by calling [gtk.widget.Widget.setHasWindow]. This is usually done in the
      widget’s init() function.
      
      Note that this function does not add any reference to window.
  
      Params:
        window = a #GdkWindow
  */
  void setWindow(gdk.window.Window window)
  {
    gtk_widget_set_window(cast(GtkWidget*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(Yes.Dup) : null);
  }

  /**
      Sets a shape for this widget’s GDK window. This allows for
      transparent windows etc., see [gdk.window.Window.shapeCombineRegion]
      for more information.
  
      Params:
        region = shape to be added, or null to remove an existing shape
  */
  void shapeCombineRegion(cairo.region.Region region = null)
  {
    gtk_widget_shape_combine_region(cast(GtkWidget*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Flags a widget to be displayed. Any widget that isn’t shown will
      not appear on the screen. If you want to show all the widgets in a
      container, it’s easier to call [gtk.widget.Widget.showAll] on the
      container, instead of individually showing the widgets.
      
      Remember that you have to show the containers containing a widget,
      in addition to the widget itself, before it will appear onscreen.
      
      When a toplevel container is shown, it is immediately realized and
      mapped; other shown widgets are realized and mapped when their
      toplevel container is realized and mapped.
  */
  void show()
  {
    gtk_widget_show(cast(GtkWidget*)this._cPtr);
  }

  /**
      Recursively shows a widget, and any child widgets (if the widget is
      a container).
  */
  void showAll()
  {
    gtk_widget_show_all(cast(GtkWidget*)this._cPtr);
  }

  /**
      Shows a widget. If the widget is an unmapped toplevel widget
      (i.e. a #GtkWindow that has not yet been shown), enter the main
      loop and wait for the window to actually be mapped. Be careful;
      because the main loop is running, anything can happen during
      this function.
  */
  void showNow()
  {
    gtk_widget_show_now(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function is only used by #GtkContainer subclasses, to assign a size
      and position to their child widgets.
      
      In this function, the allocation may be adjusted. It will be forced
      to a 1x1 minimum size, and the adjust_size_allocation virtual
      method on the child will be used to adjust the allocation. Standard
      adjustments include removing the widget’s margins, and applying the
      widget’s #GtkWidget:halign and #GtkWidget:valign properties.
      
      For baseline support in containers you need to use [gtk.widget.Widget.sizeAllocateWithBaseline]
      instead.
  
      Params:
        allocation = position and size to be allocated to widget
  */
  void sizeAllocate(gtk.types.Allocation allocation)
  {
    gtk_widget_size_allocate(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation);
  }

  /**
      This function is only used by #GtkContainer subclasses, to assign a size,
      position and (optionally) baseline to their child widgets.
      
      In this function, the allocation and baseline may be adjusted. It
      will be forced to a 1x1 minimum size, and the
      adjust_size_allocation virtual and adjust_baseline_allocation
      methods on the child will be used to adjust the allocation and
      baseline. Standard adjustments include removing the widget's
      margins, and applying the widget’s #GtkWidget:halign and
      #GtkWidget:valign properties.
      
      If the child widget does not have a valign of [gtk.types.Align.Baseline] the
      baseline argument is ignored and -1 is used instead.
  
      Params:
        allocation = position and size to be allocated to widget
        baseline = The baseline of the child, or -1
  */
  void sizeAllocateWithBaseline(gtk.types.Allocation allocation, int baseline)
  {
    gtk_widget_size_allocate_with_baseline(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation, baseline);
  }

  /**
      This function is typically used when implementing a #GtkContainer
      subclass.  Obtains the preferred size of a widget. The container
      uses this information to arrange its child widgets and decide what
      size allocations to give them with [gtk.widget.Widget.sizeAllocate].
      
      You can also call this function from an application, with some
      caveats. Most notably, getting a size request requires the widget
      to be associated with a screen, because font information may be
      needed. Multihead-aware applications should keep this in mind.
      
      Also remember that the size request is not necessarily the size
      a widget will actually be allocated.
  
      Params:
        requisition = a #GtkRequisition to be filled in
  
      Deprecated: Use [gtk.widget.Widget.getPreferredSize] instead.
  */
  void sizeRequest(out gtk.requisition.Requisition requisition)
  {
    gtk_widget_size_request(cast(GtkWidget*)this._cPtr, cast(GtkRequisition*)&requisition);
  }

  /**
      This function attaches the widget’s #GtkStyle to the widget's
      #GdkWindow. It is a replacement for
      
      ```
      widget->style = gtk_style_attach (widget->style, widget->window);
      ```
      
      and should only ever be called in a derived widget’s “realize”
      implementation which does not chain up to its parent class'
      “realize” implementation, because one of the parent classes
      (finally #GtkWidget) would attach the style itself.
  
      Deprecated: This step is unnecessary with #GtkStyleContext.
  */
  void styleAttach()
  {
    gtk_widget_style_attach(cast(GtkWidget*)this._cPtr);
  }

  /**
      Gets the value of a style property of widget.
  
      Params:
        propertyName = the name of a style property
        value = location to return the property value
  */
  void styleGetProperty(string propertyName, gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    gtk_widget_style_get_property(cast(GtkWidget*)this._cPtr, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      Reverts the effect of a previous call to [gtk.widget.Widget.freezeChildNotify].
      This causes all queued #GtkWidget::child-notify signals on widget to be
      emitted.
  */
  void thawChildNotify()
  {
    gtk_widget_thaw_child_notify(cast(GtkWidget*)this._cPtr);
  }

  /**
      Translate coordinates relative to src_widget’s allocation to coordinates
      relative to dest_widget’s allocations. In order to perform this
      operation, both widgets must be realized, and must share a common
      toplevel.
  
      Params:
        destWidget = a #GtkWidget
        srcX = X position relative to src_widget
        srcY = Y position relative to src_widget
        destX = location to store X position relative to dest_widget
        destY = location to store Y position relative to dest_widget
      Returns: false if either widget was not realized, or there
          was no common ancestor. In this case, nothing is stored in
          *dest_x and *dest_y. Otherwise true.
  */
  bool translateCoordinates(gtk.widget.Widget destWidget, int srcX, int srcY, out int destX, out int destY)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_translate_coordinates(cast(GtkWidget*)this._cPtr, destWidget ? cast(GtkWidget*)destWidget._cPtr(No.Dup) : null, srcX, srcY, cast(int*)&destX, cast(int*)&destY);
    return _retval;
  }

  /**
      Triggers a tooltip query on the display where the toplevel of widget
      is located. See [gtk.tooltip.Tooltip.triggerTooltipQuery] for more
      information.
  */
  void triggerTooltipQuery()
  {
    gtk_widget_trigger_tooltip_query(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function is only for use in widget implementations. Causes
      a widget to be unmapped if it’s currently mapped.
  */
  void unmap()
  {
    gtk_widget_unmap(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function is only for use in widget implementations.
      Should be called by implementations of the remove method
      on #GtkContainer, to dissociate a child from the container.
  */
  void unparent()
  {
    gtk_widget_unparent(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function is only useful in widget implementations.
      Causes a widget to be unrealized (frees all GDK resources
      associated with the widget, such as widget->window).
  */
  void unrealize()
  {
    gtk_widget_unrealize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Unregisters a #GdkWindow from the widget that was previously set up with
      [gtk.widget.Widget.registerWindow]. You need to call this when the window is
      no longer used by the widget, such as when you destroy it.
  
      Params:
        window = a #GdkWindow
  */
  void unregisterWindow(gdk.window.Window window)
  {
    gtk_widget_unregister_window(cast(GtkWidget*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      This function is for use in widget implementations. Turns off flag
      values for the current widget state (insensitive, prelighted, etc.).
      See [gtk.widget.Widget.setStateFlags].
  
      Params:
        flags = State flags to turn off
  */
  void unsetStateFlags(gtk.types.StateFlags flags)
  {
    gtk_widget_unset_state_flags(cast(GtkWidget*)this._cPtr, flags);
  }

  /**
      Connect to `AccelClosuresChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAccelClosuresChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-closures-changed", closure, after);
  }

  /**
      Connect to `ButtonPressEvent` signal.
  
      The ::button-press-event signal will be emitted when a button
        (typically from a mouse) is pressed.
        
        To receive this signal, the #GdkWindow associated to the
        widget needs to enable the #GDK_BUTTON_PRESS_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_button.EventButton event, gtk.widget.Widget widget))
  
          `event` the #GdkEventButton which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectButtonPressEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-press-event", closure, after);
  }

  /**
      Connect to `ButtonReleaseEvent` signal.
  
      The ::button-release-event signal will be emitted when a button
        (typically from a mouse) is released.
        
        To receive this signal, the #GdkWindow associated to the
        widget needs to enable the #GDK_BUTTON_RELEASE_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_button.EventButton event, gtk.widget.Widget widget))
  
          `event` the #GdkEventButton which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectButtonReleaseEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-release-event", closure, after);
  }

  /**
      Connect to `CanActivateAccel` signal.
  
      Determines whether an accelerator that activates the signal
        identified by signal_id can currently be activated.
        This signal is present to allow applications and derived
        widgets to override the default #GtkWidget handling
        for determining whether an accelerator can be activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(uint signalId, gtk.widget.Widget widget))
  
          `signalId` the ID of a signal installed on widget (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if the signal can be activated.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCanActivateAccel(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("can-activate-accel", closure, after);
  }

  /**
      Connect to `ChildNotify` signal.
  
      The ::child-notify signal is emitted for each
        [child property][child-properties]  that has
        changed on an object. The signal's detail holds the property name.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.param_spec.ParamSpec childProperty, gtk.widget.Widget widget))
  
          `childProperty` the #GParamSpec of the changed child property (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChildNotify(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gobject.param_spec.ParamSpec)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `CompositedChanged` signal.
  
      The ::composited-changed signal is emitted when the composited
        status of widgets screen changes.
        See [gdk.screen.Screen.isComposited].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use GdkScreen::composited-changed instead.
  */
  ulong connectCompositedChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("composited-changed", closure, after);
  }

  /**
      Connect to `ConfigureEvent` signal.
  
      The ::configure-event signal will be emitted when the size, position or
        stacking of the widget's window has changed.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_STRUCTURE_MASK mask. GDK will enable this mask
        automatically for all new windows.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_configure.EventConfigure event, gtk.widget.Widget widget))
  
          `event` the #GdkEventConfigure which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectConfigureEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_configure.EventConfigure)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("configure-event", closure, after);
  }

  /**
      Connect to `DamageEvent` signal.
  
      Emitted when a redirected window belonging to widget gets drawn into.
        The region/area members of the event shows what area of the redirected
        drawable was drawn into.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_expose.EventExpose event, gtk.widget.Widget widget))
  
          `event` the #GdkEventExpose event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDamageEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_expose.EventExpose)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("damage-event", closure, after);
  }

  /**
      Connect to `DeleteEvent` signal.
  
      The ::delete-event signal is emitted if a user requests that
        a toplevel window is closed. The default handler for this signal
        destroys the window. Connecting [gtk.widget.Widget.hideOnDelete] to
        this signal will cause the window to be hidden instead, so that
        it can later be shown again without reconstructing it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event.Event event, gtk.widget.Widget widget))
  
          `event` the event which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-event", closure, after);
  }

  /**
      Connect to `Destroy` signal.
  
      Signals that all holders of a reference to the widget should release
        the reference that they hold. May result in finalization of the widget
        if all references are released.
        
        This signal is not suitable for saving widget state.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDestroy(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("destroy", closure, after);
  }

  /**
      Connect to `DestroyEvent` signal.
  
      The ::destroy-event signal is emitted when a #GdkWindow is destroyed.
        You rarely get this signal, because most widgets disconnect themselves
        from their window before they destroy it, so no widget owns the
        window at destroy time.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_STRUCTURE_MASK mask. GDK will enable this mask
        automatically for all new windows.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event.Event event, gtk.widget.Widget widget))
  
          `event` the event which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDestroyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("destroy-event", closure, after);
  }

  /**
      Connect to `DirectionChanged` signal.
  
      The ::direction-changed signal is emitted when the text direction
        of a widget changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.TextDirection previousDirection, gtk.widget.Widget widget))
  
          `previousDirection` the previous text direction of widget (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDirectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.TextDirection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("direction-changed", closure, after);
  }

  /**
      Connect to `DragBegin` signal.
  
      The ::drag-begin signal is emitted on the drag source when a drag is
        started. A typical reason to connect to this signal is to set up a
        custom drag icon with e.g. [gtk.widget.Widget.dragSourceSetIconPixbuf].
        
        Note that some widgets set up a drag icon in the default handler of
        this signal, so you may have to use g_signal_connect_after() to
        override what the default handler did.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_context.DragContext context, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragBegin(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
      Connect to `DragDataDelete` signal.
  
      The ::drag-data-delete signal is emitted on the drag source when a drag
        with the action [gdk.types.DragAction.Move] is successfully completed. The signal
        handler is responsible for deleting the data that has been dropped. What
        "delete" means depends on the context of the drag operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_context.DragContext context, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragDataDelete(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-data-delete", closure, after);
  }

  /**
      Connect to `DragDataGet` signal.
  
      The ::drag-data-get signal is emitted on the drag source when the drop
        site requests the data which is dragged. It is the responsibility of
        the signal handler to fill data with the data in the format which
        is indicated by info. See [gtk.selection_data.SelectionData.set] and
        [gtk.selection_data.SelectionData.setText].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_context.DragContext context, gtk.selection_data.SelectionData data, uint info, uint time, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `data` the #GtkSelectionData to be filled with the dragged data (optional)
  
          `info` the info that has been registered with the target in the
                   #GtkTargetList (optional)
  
          `time` the timestamp at which the data was requested (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragDataGet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.selection_data.SelectionData)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == uint)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-data-get", closure, after);
  }

  /**
      Connect to `DragDataReceived` signal.
  
      The ::drag-data-received signal is emitted on the drop site when the
        dragged data has been received. If the data was received in order to
        determine whether the drop will be accepted, the handler is expected
        to call [gdk.global.dragStatus] and not finish the drag.
        If the data was received in response to a #GtkWidget::drag-drop signal
        (and this is the last target to be received), the handler for this
        signal is expected to process the received data and then call
        [gtk.global.dragFinish], setting the success parameter depending on
        whether the data was processed successfully.
        
        Applications must create some means to determine why the signal was emitted
        and therefore whether to call [gdk.global.dragStatus] or [gtk.global.dragFinish].
        
        The handler may inspect the selected action with
        [gdk.drag_context.DragContext.getSelectedAction] before calling
        [gtk.global.dragFinish], e.g. to implement [gdk.types.DragAction.Ask] as
        shown in the following example:
        ```c
        void
        drag_data_received (GtkWidget          *widget,
                            GdkDragContext     *context,
                            gint                x,
                            gint                y,
                            GtkSelectionData   *data,
                            guint               info,
                            guint               time)
        {
          if ((data->length >= 0) && (data->format == 8))
            {
              GdkDragAction action;
        
              // handle data here
        
              action = gdk_drag_context_get_selected_action (context);
              if (action == GDK_ACTION_ASK)
                {
                  GtkWidget *dialog;
                  gint response;
        
                  dialog = gtk_message_dialog_new (NULL,
                                                   GTK_DIALOG_MODAL |
                                                   GTK_DIALOG_DESTROY_WITH_PARENT,
                                                   GTK_MESSAGE_INFO,
                                                   GTK_BUTTONS_YES_NO,
                                                   "Move the data ?\n");
                  response = gtk_dialog_run (GTK_DIALOG (dialog));
                  gtk_widget_destroy (dialog);
        
                  if (response == GTK_RESPONSE_YES)
                    action = GDK_ACTION_MOVE;
                  else
                    action = GDK_ACTION_COPY;
                 }
        
              gtk_drag_finish (context, TRUE, action == GDK_ACTION_MOVE, time);
            }
          else
            gtk_drag_finish (context, FALSE, FALSE, time);
         }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_context.DragContext context, int x, int y, gtk.selection_data.SelectionData data, uint info, uint time, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `x` where the drop happened (optional)
  
          `y` where the drop happened (optional)
  
          `data` the received data (optional)
  
          `info` the info that has been registered with the target in the
                   #GtkTargetList (optional)
  
          `time` the timestamp at which the data was received (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragDataReceived(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gtk.selection_data.SelectionData)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == uint)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] == uint)))
  && (Parameters!T.length < 7 || (ParameterStorageClassTuple!T[6] == ParameterStorageClass.none && is(Parameters!T[6] : gtk.widget.Widget)))
  && Parameters!T.length < 8)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 7, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);


      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[5]);


      static if (Parameters!T.length > 5)
        _paramTuple[5] = getVal!(Parameters!T[5])(&_paramVals[6]);

      static if (Parameters!T.length > 6)
        _paramTuple[6] = getVal!(Parameters!T[6])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-data-received", closure, after);
  }

  /**
      Connect to `DragDrop` signal.
  
      The ::drag-drop signal is emitted on the drop site when the user drops
        the data onto the widget. The signal handler must determine whether
        the cursor position is in a drop zone or not. If it is not in a drop
        zone, it returns false and no further processing is necessary.
        Otherwise, the handler returns true. In this case, the handler must
        ensure that [gtk.global.dragFinish] is called to let the source know that
        the drop is done. The call to [gtk.global.dragFinish] can be done either
        directly or in a #GtkWidget::drag-data-received handler which gets
        triggered by calling [gtk.widget.Widget.dragGetData] to receive the data for one
        or more of the supported targets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.drag_context.DragContext context, int x, int y, uint time, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `x` the x coordinate of the current cursor position (optional)
  
          `y` the y coordinate of the current cursor position (optional)
  
          `time` the timestamp of the motion event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` whether the cursor position is in a drop zone
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragDrop(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-drop", closure, after);
  }

  /**
      Connect to `DragEnd` signal.
  
      The ::drag-end signal is emitted on the drag source when a drag is
        finished.  A typical reason to connect to this signal is to undo
        things done in #GtkWidget::drag-begin.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_context.DragContext context, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
      Connect to `DragFailed` signal.
  
      The ::drag-failed signal is emitted on the drag source when a drag has
        failed. The signal handler may hook custom code to handle a failed DnD
        operation based on the type of error, it returns true is the failure has
        been already handled (not showing the default "drag operation failed"
        animation), otherwise it returns false.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.drag_context.DragContext context, gtk.types.DragResult result, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `result` the result of the drag operation (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if the failed drag operation has been already handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragFailed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.types.DragResult)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.widget.Widget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-failed", closure, after);
  }

  /**
      Connect to `DragLeave` signal.
  
      The ::drag-leave signal is emitted on the drop site when the cursor
        leaves the widget. A typical reason to connect to this signal is to
        undo things done in #GtkWidget::drag-motion, e.g. undo highlighting
        with [gtk.widget.Widget.dragUnhighlight].
        
        
        Likewise, the #GtkWidget::drag-leave signal is also emitted before the
        ::drag-drop signal, for instance to allow cleaning up of a preview item
        created in the #GtkWidget::drag-motion signal handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_context.DragContext context, uint time, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `time` the timestamp of the motion event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragLeave(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.widget.Widget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-leave", closure, after);
  }

  /**
      Connect to `DragMotion` signal.
  
      The ::drag-motion signal is emitted on the drop site when the user
        moves the cursor over the widget during a drag. The signal handler
        must determine whether the cursor position is in a drop zone or not.
        If it is not in a drop zone, it returns false and no further processing
        is necessary. Otherwise, the handler returns true. In this case, the
        handler is responsible for providing the necessary information for
        displaying feedback to the user, by calling [gdk.global.dragStatus].
        
        If the decision whether the drop will be accepted or rejected can't be
        made based solely on the cursor position and the type of the data, the
        handler may inspect the dragged data by calling [gtk.widget.Widget.dragGetData] and
        defer the [gdk.global.dragStatus] call to the #GtkWidget::drag-data-received
        handler. Note that you must pass #GTK_DEST_DEFAULT_DROP,
        #GTK_DEST_DEFAULT_MOTION or #GTK_DEST_DEFAULT_ALL to [gtk.widget.Widget.dragDestSet]
        when using the drag-motion signal that way.
        
        Also note that there is no drag-enter signal. The drag receiver has to
        keep track of whether he has received any drag-motion signals since the
        last #GtkWidget::drag-leave and if not, treat the drag-motion signal as
        an "enter" signal. Upon an "enter", the handler will typically highlight
        the drop site with [gtk.widget.Widget.dragHighlight].
        ```c
        static void
        drag_motion (GtkWidget      *widget,
                     GdkDragContext *context,
                     gint            x,
                     gint            y,
                     guint           time)
        {
          GdkAtom target;
        
          PrivateData *private_data = GET_PRIVATE_DATA (widget);
        
          if (!private_data->drag_highlight)
           {
             private_data->drag_highlight = 1;
             gtk_drag_highlight (widget);
           }
        
          target = gtk_drag_dest_find_target (widget, context, NULL);
          if (target == GDK_NONE)
            gdk_drag_status (context, 0, time);
          else
           {
             private_data->pending_status
                = gdk_drag_context_get_suggested_action (context);
             gtk_drag_get_data (widget, context, target, time);
           }
        
          return TRUE;
        }
        
        static void
        drag_data_received (GtkWidget        *widget,
                            GdkDragContext   *context,
                            gint              x,
                            gint              y,
                            GtkSelectionData *selection_data,
                            guint             info,
                            guint             time)
        {
          PrivateData *private_data = GET_PRIVATE_DATA (widget);
        
          if (private_data->suggested_action)
           {
             private_data->suggested_action = 0;
        
             // We are getting this data due to a request in drag_motion,
             // rather than due to a request in drag_drop, so we are just
             // supposed to call gdk_drag_status(), not actually paste in
             // the data.
        
             str = gtk_selection_data_get_text (selection_data);
             if (!data_is_acceptable (str))
               gdk_drag_status (context, 0, time);
             else
               gdk_drag_status (context,
                                private_data->suggested_action,
                                time);
           }
          else
           {
             // accept the drop
           }
        }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.drag_context.DragContext context, int x, int y, uint time, gtk.widget.Widget widget))
  
          `context` the drag context (optional)
  
          `x` the x coordinate of the current cursor position (optional)
  
          `y` the y coordinate of the current cursor position (optional)
  
          `time` the timestamp of the motion event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` whether the cursor position is in a drop zone
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragMotion(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-motion", closure, after);
  }

  /**
      Connect to `Draw` signal.
  
      This signal is emitted when a widget is supposed to render itself.
        The widget's top left corner must be painted at the origin of
        the passed in context and be sized to the values returned by
        [gtk.widget.Widget.getAllocatedWidth] and
        [gtk.widget.Widget.getAllocatedHeight].
        
        Signal handlers connected to this signal can modify the cairo
        context passed as cr in any way they like and don't need to
        restore it. The signal emission takes care of calling [cairo.context.Context.save]
        before and [cairo.context.Context.restore] after invoking the handler.
        
        The signal handler will get a cr with a clip region already set to the
        widget's dirty region, i.e. to the area that needs repainting.  Complicated
        widgets that want to avoid redrawing themselves completely can get the full
        extents of the clip region with [gdk.global.cairoGetClipRectangle], or they can
        get a finer-grained representation of the dirty region with
        [cairo.context.Context.copyClipRectangleList].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(cairo.context.Context cr, gtk.widget.Widget widget))
  
          `cr` the cairo context to draw to (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDraw(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == cairo.context.Context)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("draw", closure, after);
  }

  /**
      Connect to `EnterNotifyEvent` signal.
  
      The ::enter-notify-event will be emitted when the pointer enters
        the widget's window.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_ENTER_NOTIFY_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_crossing.EventCrossing event, gtk.widget.Widget widget))
  
          `event` the #GdkEventCrossing which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnterNotifyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_crossing.EventCrossing)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter-notify-event", closure, after);
  }

  /**
      Connect to `Event` signal.
  
      The GTK+ main loop will emit three signals for each GDK event delivered
        to a widget: one generic ::event signal, another, more specific,
        signal that matches the type of event delivered (e.g.
        #GtkWidget::key-press-event) and finally a generic
        #GtkWidget::event-after signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event.Event event, gtk.widget.Widget widget))
  
          `event` the #GdkEvent which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event
            and to cancel the emission of the second specific ::event signal.
              false to propagate the event further and to allow the emission of
              the second signal. The ::event-after signal is emitted regardless of
              the return value.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }

  /**
      Connect to `EventAfter` signal.
  
      After the emission of the #GtkWidget::event signal and (optionally)
        the second more specific signal, ::event-after will be emitted
        regardless of the previous two signals handlers return values.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.event.Event event, gtk.widget.Widget widget))
  
          `event` the #GdkEvent which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEventAfter(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event-after", closure, after);
  }

  /**
      Connect to `Focus` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.DirectionType direction, gtk.widget.Widget widget))
  
          `direction`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus", closure, after);
  }

  /**
      Connect to `FocusInEvent` signal.
  
      The ::focus-in-event signal will be emitted when the keyboard focus
        enters the widget's window.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_FOCUS_CHANGE_MASK mask.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_focus.EventFocus event, gtk.widget.Widget widget))
  
          `event` the #GdkEventFocus which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFocusInEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_focus.EventFocus)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-in-event", closure, after);
  }

  /**
      Connect to `FocusOutEvent` signal.
  
      The ::focus-out-event signal will be emitted when the keyboard focus
        leaves the widget's window.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_FOCUS_CHANGE_MASK mask.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_focus.EventFocus event, gtk.widget.Widget widget))
  
          `event` the #GdkEventFocus which triggered this
              signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFocusOutEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_focus.EventFocus)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-out-event", closure, after);
  }

  /**
      Connect to `GrabBrokenEvent` signal.
  
      Emitted when a pointer or keyboard grab on a window belonging
        to widget gets broken.
        
        On X11, this happens when the grab window becomes unviewable
        (i.e. it or one of its ancestors is unmapped), or if the same
        application grabs the pointer or keyboard again.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_grab_broken.EventGrabBroken event, gtk.widget.Widget widget))
  
          `event` the #GdkEventGrabBroken event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for
              the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGrabBrokenEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_grab_broken.EventGrabBroken)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("grab-broken-event", closure, after);
  }

  /**
      Connect to `GrabFocus` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGrabFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("grab-focus", closure, after);
  }

  /**
      Connect to `GrabNotify` signal.
  
      The ::grab-notify signal is emitted when a widget becomes
        shadowed by a GTK+ grab (not a pointer or keyboard grab) on
        another widget, or when it becomes unshadowed due to a grab
        being removed.
        
        A widget is shadowed by a [gtk.widget.Widget.grabAdd] when the topmost
        grab widget in the grab stack of its window group is not
        its ancestor.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(bool wasGrabbed, gtk.widget.Widget widget))
  
          `wasGrabbed` false if the widget becomes shadowed, true
                          if it becomes unshadowed (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGrabNotify(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("grab-notify", closure, after);
  }

  /**
      Connect to `Hide` signal.
  
      The ::hide signal is emitted when widget is hidden, for example with
        [gtk.widget.Widget.hide].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHide(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hide", closure, after);
  }

  /**
      Connect to `HierarchyChanged` signal.
  
      The ::hierarchy-changed signal is emitted when the
        anchored state of a widget changes. A widget is
        “anchored” when its toplevel
        ancestor is a #GtkWindow. This signal is emitted when
        a widget changes from un-anchored to anchored or vice-versa.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget previousToplevel, gtk.widget.Widget widget))
  
          `previousToplevel` the previous toplevel ancestor, or null
              if the widget was previously unanchored (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHierarchyChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hierarchy-changed", closure, after);
  }

  /**
      Connect to `KeyPressEvent` signal.
  
      The ::key-press-event signal is emitted when a key is pressed. The signal
        emission will reoccur at the key-repeat rate when the key is kept pressed.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_KEY_PRESS_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_key.EventKey event, gtk.widget.Widget widget))
  
          `event` the #GdkEventKey which triggered this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeyPressEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_key.EventKey)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-press-event", closure, after);
  }

  /**
      Connect to `KeyReleaseEvent` signal.
  
      The ::key-release-event signal is emitted when a key is released.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_KEY_RELEASE_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_key.EventKey event, gtk.widget.Widget widget))
  
          `event` the #GdkEventKey which triggered this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeyReleaseEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_key.EventKey)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-release-event", closure, after);
  }

  /**
      Connect to `KeynavFailed` signal.
  
      Gets emitted if keyboard navigation fails.
        See [gtk.widget.Widget.keynavFailed] for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.DirectionType direction, gtk.widget.Widget widget))
  
          `direction` the direction of movement (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if stopping keyboard navigation is fine, false
                     if the emitting widget should try to handle the keyboard
                     navigation attempt in its parent container(s).
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeynavFailed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("keynav-failed", closure, after);
  }

  /**
      Connect to `LeaveNotifyEvent` signal.
  
      The ::leave-notify-event will be emitted when the pointer leaves
        the widget's window.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_LEAVE_NOTIFY_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_crossing.EventCrossing event, gtk.widget.Widget widget))
  
          `event` the #GdkEventCrossing which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLeaveNotifyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_crossing.EventCrossing)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave-notify-event", closure, after);
  }

  /**
      Connect to `Map` signal.
  
      The ::map signal is emitted when widget is going to be mapped, that is
        when the widget is visible (which is controlled with
        [gtk.widget.Widget.setVisible]) and all its parents up to the toplevel widget
        are also visible. Once the map has occurred, #GtkWidget::map-event will
        be emitted.
        
        The ::map signal can be used to determine whether a widget will be drawn,
        for instance it can resume an animation that was stopped during the
        emission of #GtkWidget::unmap.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMap(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("map", closure, after);
  }

  /**
      Connect to `MapEvent` signal.
  
      The ::map-event signal will be emitted when the widget's window is
        mapped. A window is mapped when it becomes visible on the screen.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_STRUCTURE_MASK mask. GDK will enable this mask
        automatically for all new windows.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_any.EventAny event, gtk.widget.Widget widget))
  
          `event` the #GdkEventAny which triggered this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMapEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_any.EventAny)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("map-event", closure, after);
  }

  /**
      Connect to `MnemonicActivate` signal.
  
      The default handler for this signal activates widget if group_cycling
        is false, or just makes widget grab focus if group_cycling is true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool groupCycling, gtk.widget.Widget widget))
  
          `groupCycling` true if there are other widgets with the same mnemonic (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMnemonicActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mnemonic-activate", closure, after);
  }

  /**
      Connect to `MotionNotifyEvent` signal.
  
      The ::motion-notify-event signal is emitted when the pointer moves
        over the widget's #GdkWindow.
        
        To receive this signal, the #GdkWindow associated to the widget
        needs to enable the #GDK_POINTER_MOTION_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_motion.EventMotion event, gtk.widget.Widget widget))
  
          `event` the #GdkEventMotion which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMotionNotifyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_motion.EventMotion)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion-notify-event", closure, after);
  }

  /**
      Connect to `MoveFocus` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DirectionType direction, gtk.widget.Widget widget))
  
          `direction`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-focus", closure, after);
  }

  /**
      Connect to `ParentSet` signal.
  
      The ::parent-set signal is emitted when a new parent
        has been set on a widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget oldParent, gtk.widget.Widget widget))
  
          `oldParent` the previous parent, or null if the widget
              just got its initial parent. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectParentSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("parent-set", closure, after);
  }

  /**
      Connect to `PopupMenu` signal.
  
      This signal gets emitted whenever a widget should pop up a context
        menu. This usually happens through the standard key binding mechanism;
        by pressing a certain key while a widget is focused, the user can cause
        the widget to pop up a menu.  For example, the #GtkEntry widget creates
        a menu with clipboard commands. See the
        [Popup Menu Migration Checklist][checklist-popup-menu]
        for an example of how to use this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if a menu was activated
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopupMenu(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popup-menu", closure, after);
  }

  /**
      Connect to `PropertyNotifyEvent` signal.
  
      The ::property-notify-event signal will be emitted when a property on
        the widget's window has been changed or deleted.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_PROPERTY_CHANGE_MASK mask.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_property.EventProperty event, gtk.widget.Widget widget))
  
          `event` the #GdkEventProperty which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPropertyNotifyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_property.EventProperty)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("property-notify-event", closure, after);
  }

  /**
      Connect to `ProximityInEvent` signal.
  
      To receive this signal the #GdkWindow associated to the widget needs
        to enable the #GDK_PROXIMITY_IN_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_proximity.EventProximity event, gtk.widget.Widget widget))
  
          `event` the #GdkEventProximity which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProximityInEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_proximity.EventProximity)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("proximity-in-event", closure, after);
  }

  /**
      Connect to `ProximityOutEvent` signal.
  
      To receive this signal the #GdkWindow associated to the widget needs
        to enable the #GDK_PROXIMITY_OUT_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_proximity.EventProximity event, gtk.widget.Widget widget))
  
          `event` the #GdkEventProximity which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProximityOutEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_proximity.EventProximity)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("proximity-out-event", closure, after);
  }

  /**
      Connect to `QueryTooltip` signal.
  
      Emitted when #GtkWidget:has-tooltip is true and the hover timeout
        has expired with the cursor hovering "above" widget; or emitted when widget got
        focus in keyboard mode.
        
        Using the given coordinates, the signal handler should determine
        whether a tooltip should be shown for widget. If this is the case
        true should be returned, false otherwise.  Note that if
        keyboard_mode is true, the values of `x` and `y` are undefined and
        should not be used.
        
        The signal handler is free to manipulate tooltip with the therefore
        destined function calls.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(int x, int y, bool keyboardMode, gtk.tooltip.Tooltip tooltip, gtk.widget.Widget widget))
  
          `x` the x coordinate of the cursor position where the request has
                been emitted, relative to widget's left side (optional)
  
          `y` the y coordinate of the cursor position where the request has
                been emitted, relative to widget's top (optional)
  
          `keyboardMode` true if the tooltip was triggered using the keyboard (optional)
  
          `tooltip` a #GtkTooltip (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if tooltip should be shown right now, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.tooltip.Tooltip)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip", closure, after);
  }

  /**
      Connect to `Realize` signal.
  
      The ::realize signal is emitted when widget is associated with a
        #GdkWindow, which means that [gtk.widget.Widget.realize] has been called or the
        widget has been mapped (that is, it is going to be drawn).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRealize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("realize", closure, after);
  }

  /**
      Connect to `ScreenChanged` signal.
  
      The ::screen-changed signal gets emitted when the
        screen of a widget has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.screen.Screen previousScreen, gtk.widget.Widget widget))
  
          `previousScreen` the previous screen, or null if the
              widget was not associated with a screen before (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScreenChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.screen.Screen)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("screen-changed", closure, after);
  }

  /**
      Connect to `ScrollEvent` signal.
  
      The ::scroll-event signal is emitted when a button in the 4 to 7
        range is pressed. Wheel mice are usually configured to generate
        button press events for buttons 4 and 5 when the wheel is turned.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_SCROLL_MASK mask.
        
        This signal will be sent to the grab widget if there is one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_scroll.EventScroll event, gtk.widget.Widget widget))
  
          `event` the #GdkEventScroll which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScrollEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_scroll.EventScroll)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-event", closure, after);
  }

  /**
      Connect to `SelectionClearEvent` signal.
  
      The ::selection-clear-event signal will be emitted when the
        the widget's window has lost ownership of a selection.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_selection.EventSelection event, gtk.widget.Widget widget))
  
          `event` the #GdkEventSelection which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionClearEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_selection.EventSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-clear-event", closure, after);
  }

  /**
      Connect to `SelectionGet` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.selection_data.SelectionData data, uint info, uint time, gtk.widget.Widget widget))
  
          `data`  (optional)
  
          `info`  (optional)
  
          `time`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionGet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.selection_data.SelectionData)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == uint)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.widget.Widget)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-get", closure, after);
  }

  /**
      Connect to `SelectionNotifyEvent` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_selection.EventSelection event, gtk.widget.Widget widget))
  
          `event`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionNotifyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_selection.EventSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-notify-event", closure, after);
  }

  /**
      Connect to `SelectionReceived` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.selection_data.SelectionData data, uint time, gtk.widget.Widget widget))
  
          `data`  (optional)
  
          `time`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionReceived(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.selection_data.SelectionData)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.widget.Widget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-received", closure, after);
  }

  /**
      Connect to `SelectionRequestEvent` signal.
  
      The ::selection-request-event signal will be emitted when
        another client requests ownership of the selection owned by
        the widget's window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_selection.EventSelection event, gtk.widget.Widget widget))
  
          `event` the #GdkEventSelection which triggered
              this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionRequestEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_selection.EventSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-request-event", closure, after);
  }

  /**
      Connect to `Show` signal.
  
      The ::show signal is emitted when widget is shown, for example with
        [gtk.widget.Widget.show].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show", closure, after);
  }

  /**
      Connect to `ShowHelp` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.WidgetHelpType helpType, gtk.widget.Widget widget))
  
          `helpType`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShowHelp(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.WidgetHelpType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-help", closure, after);
  }

  /**
      Connect to `SizeAllocate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.Allocation allocation, gtk.widget.Widget widget))
  
          `allocation` the region which has been
              allocated to the widget. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSizeAllocate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.Allocation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("size-allocate", closure, after);
  }

  /**
      Connect to `StateChanged` signal.
  
      The ::state-changed signal is emitted when the widget state changes.
        See [gtk.widget.Widget.getState].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.StateType state, gtk.widget.Widget widget))
  
          `state` the previous state (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use #GtkWidget::state-flags-changed instead.
  */
  ulong connectStateChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.StateType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-changed", closure, after);
  }

  /**
      Connect to `StateFlagsChanged` signal.
  
      The ::state-flags-changed signal is emitted when the widget state
        changes, see [gtk.widget.Widget.getStateFlags].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.StateFlags flags, gtk.widget.Widget widget))
  
          `flags` The previous state flags. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStateFlagsChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.StateFlags)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-flags-changed", closure, after);
  }

  /**
      Connect to `StyleSet` signal.
  
      The ::style-set signal is emitted when a new style has been set
        on a widget. Note that style-modifying functions like
        [gtk.widget.Widget.modifyBase] also cause this signal to be emitted.
        
        Note that this signal is emitted for changes to the deprecated
        #GtkStyle. To track changes to the #GtkStyleContext associated
        with a widget, use the #GtkWidget::style-updated signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.style.Style previousStyle, gtk.widget.Widget widget))
  
          `previousStyle` the previous style, or null if the widget
              just got its initial style (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::style-updated signal
  */
  ulong connectStyleSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.style.Style)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("style-set", closure, after);
  }

  /**
      Connect to `StyleUpdated` signal.
  
      The ::style-updated signal is a convenience signal that is emitted when the
        #GtkStyleContext::changed signal is emitted on the widget's associated
        #GtkStyleContext as returned by [gtk.widget.Widget.getStyleContext].
        
        Note that style-modifying functions like [gtk.widget.Widget.overrideColor] also
        cause this signal to be emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStyleUpdated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("style-updated", closure, after);
  }

  /**
      Connect to `TouchEvent` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event.Event object, gtk.widget.Widget widget))
  
          `object`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTouchEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("touch-event", closure, after);
  }

  /**
      Connect to `Unmap` signal.
  
      The ::unmap signal is emitted when widget is going to be unmapped, which
        means that either it or any of its parents up to the toplevel widget have
        been set as hidden.
        
        As ::unmap indicates that a widget will not be shown any longer, it can be
        used to, for example, stop an animation on the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnmap(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unmap", closure, after);
  }

  /**
      Connect to `UnmapEvent` signal.
  
      The ::unmap-event signal will be emitted when the widget's window is
        unmapped. A window is unmapped when it becomes invisible on the screen.
        
        To receive this signal, the #GdkWindow associated to the widget needs
        to enable the #GDK_STRUCTURE_MASK mask. GDK will enable this mask
        automatically for all new windows.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_any.EventAny event, gtk.widget.Widget widget))
  
          `event` the #GdkEventAny which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnmapEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_any.EventAny)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unmap-event", closure, after);
  }

  /**
      Connect to `Unrealize` signal.
  
      The ::unrealize signal is emitted when the #GdkWindow associated with
        widget is destroyed, which means that [gtk.widget.Widget.unrealize] has been
        called or the widget has been unmapped (that is, it is going to be
        hidden).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget))
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnrealize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unrealize", closure, after);
  }

  /**
      Connect to `VisibilityNotifyEvent` signal.
  
      The ::visibility-notify-event will be emitted when the widget's
        window is obscured or unobscured.
        
        To receive this signal the #GdkWindow associated to the widget needs
        to enable the #GDK_VISIBILITY_NOTIFY_MASK mask.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_visibility.EventVisibility event, gtk.widget.Widget widget))
  
          `event` the #GdkEventVisibility which
              triggered this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Modern composited windowing systems with pervasive
            transparency make it impossible to track the visibility of a window
            reliably, so this signal can not be guaranteed to provide useful
            information.
  */
  ulong connectVisibilityNotifyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_visibility.EventVisibility)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("visibility-notify-event", closure, after);
  }

  /**
      Connect to `WindowStateEvent` signal.
  
      The ::window-state-event will be emitted when the state of the
        toplevel window associated to the widget changes.
        
        To receive this signal the #GdkWindow associated to the widget
        needs to enable the #GDK_STRUCTURE_MASK mask. GDK will enable
        this mask automatically for all new windows.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_window_state.EventWindowState event, gtk.widget.Widget widget))
  
          `event` the #GdkEventWindowState which
              triggered this signal. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the
              event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWindowStateEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_window_state.EventWindowState)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-state-event", closure, after);
  }
}
