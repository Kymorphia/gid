/// Module for [Widget] class
module gid.gtk3.widget;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.atk1.object;
import gid.cairo1.context;
import gid.cairo1.font_options;
import gid.cairo1.region;
import gid.core.utils;
import gid.gdk3.atom;
import gid.gdk3.color;
import gid.gdk3.device;
import gid.gdk3.display;
import gid.gdk3.drag_context;
import gid.gdk3.event;
import gid.gdk3.event_any;
import gid.gdk3.event_button;
import gid.gdk3.event_configure;
import gid.gdk3.event_crossing;
import gid.gdk3.event_expose;
import gid.gdk3.event_focus;
import gid.gdk3.event_grab_broken;
import gid.gdk3.event_key;
import gid.gdk3.event_motion;
import gid.gdk3.event_property;
import gid.gdk3.event_proximity;
import gid.gdk3.event_scroll;
import gid.gdk3.event_selection;
import gid.gdk3.event_touch;
import gid.gdk3.event_visibility;
import gid.gdk3.event_window_state;
import gid.gdk3.frame_clock;
import gid.gdk3.rectangle;
import gid.gdk3.rgba;
import gid.gdk3.screen;
import gid.gdk3.types;
import gid.gdk3.visual;
import gid.gdk3.window;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.action_group;
import gid.gio2.icon;
import gid.gobject2.closure;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gobject2.param_spec;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gtk3.accel_group;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.clipboard;
import gid.gtk3.container;
import gid.gtk3.rc_style;
import gid.gtk3.requisition;
import gid.gtk3.selection_data;
import gid.gtk3.settings;
import gid.gtk3.style;
import gid.gtk3.style_context;
import gid.gtk3.target_entry;
import gid.gtk3.target_list;
import gid.gtk3.tooltip;
import gid.gtk3.types;
import gid.gtk3.widget_path;
import gid.gtk3.window;
import gid.pango1.context;
import gid.pango1.font_description;
import gid.pango1.font_map;
import gid.pango1.layout;

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
    
    - #GtkWidgetClass.get_request_mode()
    - #GtkWidgetClass.get_preferred_width()
    - #GtkWidgetClass.get_preferred_height()
    - #GtkWidgetClass.get_preferred_height_for_width()
    - #GtkWidgetClass.get_preferred_width_for_height()
    - #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
    
    There are some important things to keep in mind when implementing
    height-for-width and when using it in container implementations.
    
    The geometry management system will query a widget hierarchy in
    only one orientation at a time. When widgets are initially queried
    for their minimum sizes it is generally done in two initial passes
    in the #GtkSizeRequestMode chosen by the toplevel.
    
    For example, when queried in the normal
    [gid.gtk4.types.SizeRequestMode.HeightForWidth] mode:
    First, the default minimum and natural width for each widget
    in the interface will be computed using [gid.gtk3.widget.Widget.getPreferredWidth].
    Because the preferred widths for each container depend on the preferred
    widths of their children, this information propagates up the hierarchy,
    and finally a minimum and natural width is determined for the entire
    toplevel. Next, the toplevel will use the minimum width to query for the
    minimum height contextual to that width using
    [gid.gtk3.widget.Widget.getPreferredHeightForWidth], which will also be a highly
    recursive operation. The minimum height for the minimum width is normally
    used to set the minimum size constraint on the toplevel
    (unless [gid.gtk3.window.Window.setGeometryHints] is explicitly used instead).
    
    After the toplevel window has initially requested its size in both
    dimensions it can go on to allocate itself a reasonable size (or a size
    previously specified with [gid.gtk4.window.Window.setDefaultSize]). During the
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
    
    Here are some examples of how a [gid.gtk4.types.SizeRequestMode.HeightForWidth] widget
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
    [gid.gtk3.widget.Widget.getPreferredWidth] inside your own size request
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
    has a vertical alignment of [gid.gtk4.types.Align.Baseline], and is inside a container
    that supports baselines and has a natural “row” that it aligns to the baseline,
    or a baseline assigned to it by the grandparent.
    
    Baseline alignment support for a widget is done by the #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
    virtual function. It allows you to report a baseline in combination with the
    minimum and natural height. If there is no baseline you can return -1 to indicate
    this. The default implementation of this virtual function calls into the
    #GtkWidgetClass.get_preferred_height() and #GtkWidgetClass.get_preferred_height_for_width(),
    so if baselines are not supported it doesn’t need to be implemented.
    
    If a widget ends up baseline aligned it will be allocated all the space in the parent
    as if it was [gid.gtk4.types.Align.Fill], but the selected baseline can be found via [gid.gtk4.widget.Widget.getAllocatedBaseline].
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
    
    Use [gid.gtk3.widget_class.WidgetClass.installStyleProperty] to install style properties for
    a widget class, [gid.gtk3.widget_class.WidgetClass.findStyleProperty] or
    [gid.gtk3.widget_class.WidgetClass.listStyleProperties] to get information about existing
    style properties and [gid.gtk3.widget.Widget.styleGetProperty], [gid.gtk3.widget.Widget.styleGet] or
    [gid.gtk3.widget.Widget.styleGetValist] to obtain the value of a style property.
    
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
    time using [gid.gtk4.widget_class.WidgetClass.setTemplate].
    
    The interface description semantics expected in composite template descriptions
    is slightly different from regular #GtkBuilder XML.
    
    Unlike regular interface descriptions, [gid.gtk4.widget_class.WidgetClass.setTemplate] will
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
    template, you need to call [gid.gtk4.widget_class.WidgetClass.setTemplateFromResource]
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
    
    You will also need to call [gid.gtk4.widget.Widget.initTemplate] from the instance
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
    [gid.gtk4.widget.Widget.getTemplateChild] function, but you will typically declare
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
@gidGir("Widget", "WidgetClass")
class Widget : gid.gobject2.initially_unowned.InitiallyUnowned, gid.atk1.implementor_iface.ImplementorIface, gid.gtk3.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_widget_get_type != &gidSymbolNotFound ? gtk_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWidget";
  }

  /** Returns `this`, for use in `with` statements. */
  override Widget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.widget.Widget]
      Returns: New builder object
  */
  static WidgetGidBuilder builder() nothrow
  {
    return new WidgetGidBuilder;
  }

  /** */
  @property bool appPaintable() nothrow
  {
    return getAppPaintable();
  }

  /** */
  @property void appPaintable(bool propval) nothrow
  {
    setAppPaintable(propval);
  }

  /** */
  @property bool canDefault() nothrow
  {
    return getCanDefault();
  }

  /** */
  @property void canDefault(bool propval) nothrow
  {
    setCanDefault(propval);
  }

  /** */
  @property bool canFocus() nothrow
  {
    return getCanFocus();
  }

  /** */
  @property void canFocus(bool propval) nothrow
  {
    setCanFocus(propval);
  }

  /** */
  @property bool compositeChild() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("composite-child");
  }

  /**
      Get `doubleBuffered` property.
      Returns: Whether the widget is double buffered.
  
      Deprecated: Widgets should not use this property.
  */
  @property bool doubleBuffered() nothrow
  {
    return getDoubleBuffered();
  }

  /**
      Set `doubleBuffered` property.
      Params:
        propval = Whether the widget is double buffered.
  
      Deprecated: Widgets should not use this property.
  */
  @property void doubleBuffered(bool propval) nothrow
  {
    setDoubleBuffered(propval);
  }

  /** */
  @property gid.gdk3.types.EventMask events() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.EventMask)("events");
  }

  /** */
  @property void events(gid.gdk3.types.EventMask propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.types.EventMask)("events", propval);
  }

  /**
      Get `expand` property.
      Returns: Whether to expand in both directions. Setting this sets both #GtkWidget:hexpand and #GtkWidget:vexpand
  */
  @property bool expand() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("expand");
  }

  /**
      Set `expand` property.
      Params:
        propval = Whether to expand in both directions. Setting this sets both #GtkWidget:hexpand and #GtkWidget:vexpand
  */
  @property void expand(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("expand", propval);
  }

  /**
      Get `focusOnClick` property.
      Returns: Whether the widget should grab focus when it is clicked with the mouse.
        
        This property is only relevant for widgets that can take focus.
        
        Before 3.20, several widgets (GtkButton, GtkFileChooserButton,
        GtkComboBox) implemented this property individually.
  */
  @property bool focusOnClick() nothrow
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
  @property void focusOnClick(bool propval) nothrow
  {
    setFocusOnClick(propval);
  }

  /**
      Get `halign` property.
      Returns: How to distribute horizontal space if widget gets extra space, see #GtkAlign
  */
  @property gid.gtk3.types.Align halign() nothrow
  {
    return getHalign();
  }

  /**
      Set `halign` property.
      Params:
        propval = How to distribute horizontal space if widget gets extra space, see #GtkAlign
  */
  @property void halign(gid.gtk3.types.Align propval) nothrow
  {
    setHalign(propval);
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
  @property bool hasTooltip() nothrow
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
  @property void hasTooltip(bool propval) nothrow
  {
    setHasTooltip(propval);
  }

  /** */
  @property int heightRequest() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("height-request");
  }

  /** */
  @property void heightRequest(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("height-request", propval);
  }

  /**
      Get `hexpand` property.
      Returns: Whether to expand horizontally. See [gid.gtk4.widget.Widget.setHexpand].
  */
  @property bool hexpand() nothrow
  {
    return getHexpand();
  }

  /**
      Set `hexpand` property.
      Params:
        propval = Whether to expand horizontally. See [gid.gtk4.widget.Widget.setHexpand].
  */
  @property void hexpand(bool propval) nothrow
  {
    setHexpand(propval);
  }

  /**
      Get `hexpandSet` property.
      Returns: Whether to use the #GtkWidget:hexpand property. See [gid.gtk4.widget.Widget.getHexpandSet].
  */
  @property bool hexpandSet() nothrow
  {
    return getHexpandSet();
  }

  /**
      Set `hexpandSet` property.
      Params:
        propval = Whether to use the #GtkWidget:hexpand property. See [gid.gtk4.widget.Widget.getHexpandSet].
  */
  @property void hexpandSet(bool propval) nothrow
  {
    setHexpandSet(propval);
  }

  /**
      Get `margin` property.
      Returns: Sets all four sides' margin at once. If read, returns max
        margin on any side.
  */
  @property int margin() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("margin");
  }

  /**
      Set `margin` property.
      Params:
        propval = Sets all four sides' margin at once. If read, returns max
          margin on any side.
  */
  @property void margin(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("margin", propval);
  }

  /**
      Get `marginBottom` property.
      Returns: Margin on bottom side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property int marginBottom() nothrow
  {
    return getMarginBottom();
  }

  /**
      Set `marginBottom` property.
      Params:
        propval = Margin on bottom side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property void marginBottom(int propval) nothrow
  {
    setMarginBottom(propval);
  }

  /**
      Get `marginEnd` property.
      Returns: Margin on end of widget, horizontally. This property supports
        left-to-right and right-to-left text directions.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property int marginEnd() nothrow
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
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property void marginEnd(int propval) nothrow
  {
    setMarginEnd(propval);
  }

  /**
      Get `marginLeft` property.
      Returns: Margin on left side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gid.gtk4.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-start instead.
  */
  @property int marginLeft() nothrow
  {
    return getMarginLeft();
  }

  /**
      Set `marginLeft` property.
      Params:
        propval = Margin on left side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-start instead.
  */
  @property void marginLeft(int propval) nothrow
  {
    setMarginLeft(propval);
  }

  /**
      Get `marginRight` property.
      Returns: Margin on right side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gid.gtk4.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-end instead.
  */
  @property int marginRight() nothrow
  {
    return getMarginRight();
  }

  /**
      Set `marginRight` property.
      Params:
        propval = Margin on right side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
  
      Deprecated: Use #GtkWidget:margin-end instead.
  */
  @property void marginRight(int propval) nothrow
  {
    setMarginRight(propval);
  }

  /**
      Get `marginStart` property.
      Returns: Margin on start of widget, horizontally. This property supports
        left-to-right and right-to-left text directions.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property int marginStart() nothrow
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
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property void marginStart(int propval) nothrow
  {
    setMarginStart(propval);
  }

  /**
      Get `marginTop` property.
      Returns: Margin on top side of widget.
        
        This property adds margin outside of the widget's normal size
        request, the margin will be added in addition to the size from
        [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property int marginTop() nothrow
  {
    return getMarginTop();
  }

  /**
      Set `marginTop` property.
      Params:
        propval = Margin on top side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property void marginTop(int propval) nothrow
  {
    setMarginTop(propval);
  }

  /** */
  @property string name() nothrow
  {
    return getName();
  }

  /** */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  /** */
  @property bool noShowAll() nothrow
  {
    return getNoShowAll();
  }

  /** */
  @property void noShowAll(bool propval) nothrow
  {
    setNoShowAll(propval);
  }

  /**
      Get `opacity` property.
      Returns: The requested opacity of the widget. See [gid.gtk4.widget.Widget.setOpacity] for
        more details about window opacity.
        
        Before 3.8 this was only available in GtkWindow
  */
  @property double opacity() nothrow
  {
    return getOpacity();
  }

  /**
      Set `opacity` property.
      Params:
        propval = The requested opacity of the widget. See [gid.gtk4.widget.Widget.setOpacity] for
          more details about window opacity.
          
          Before 3.8 this was only available in GtkWindow
  */
  @property void opacity(double propval) nothrow
  {
    setOpacity(propval);
  }

  /** */
  @property gid.gtk3.container.Container parent() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.container.Container)("parent");
  }

  /** */
  @property void parent(gid.gtk3.container.Container propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.container.Container)("parent", propval);
  }

  /** */
  @property bool receivesDefault() nothrow
  {
    return getReceivesDefault();
  }

  /** */
  @property void receivesDefault(bool propval) nothrow
  {
    setReceivesDefault(propval);
  }

  /**
      Get `scaleFactor` property.
      Returns: The scale factor of the widget. See [gid.gtk4.widget.Widget.getScaleFactor] for
        more details about widget scaling.
  */
  @property int scaleFactor() nothrow
  {
    return getScaleFactor();
  }

  /** */
  @property bool sensitive() nothrow
  {
    return getSensitive();
  }

  /** */
  @property void sensitive(bool propval) nothrow
  {
    setSensitive(propval);
  }

  /**
      Get `style` property.
      Returns: The style of the widget, which contains information about how it will look (colors, etc).
  
      Deprecated: Use #GtkStyleContext instead
  */
  @property gid.gtk3.style.Style style() nothrow
  {
    return getStyle();
  }

  /**
      Set `style` property.
      Params:
        propval = The style of the widget, which contains information about how it will look (colors, etc).
  
      Deprecated: Use #GtkStyleContext instead
  */
  @property void style(gid.gtk3.style.Style propval) nothrow
  {
    setStyle(propval);
  }

  /**
      Get `tooltipMarkup` property.
      Returns: Sets the text of tooltip to be the given string, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null: #GtkWidget:has-tooltip
        will automatically be set to true and there will be taken care of
        #GtkWidget::query-tooltip in the default signal handler.
        
        Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
        are set, the last one wins.
  */
  @property string tooltipMarkup() nothrow
  {
    return getTooltipMarkup();
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null: #GtkWidget:has-tooltip
          will automatically be set to true and there will be taken care of
          #GtkWidget::query-tooltip in the default signal handler.
          
          Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
          are set, the last one wins.
  */
  @property void tooltipMarkup(string propval) nothrow
  {
    setTooltipMarkup(propval);
  }

  /**
      Get `tooltipText` property.
      Returns: Sets the text of tooltip to be the given string.
        
        Also see [gid.gtk4.tooltip.Tooltip.setText].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null: #GtkWidget:has-tooltip
        will automatically be set to true and there will be taken care of
        #GtkWidget::query-tooltip in the default signal handler.
        
        Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
        are set, the last one wins.
  */
  @property string tooltipText() nothrow
  {
    return getTooltipText();
  }

  /**
      Set `tooltipText` property.
      Params:
        propval = Sets the text of tooltip to be the given string.
          
          Also see [gid.gtk4.tooltip.Tooltip.setText].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null: #GtkWidget:has-tooltip
          will automatically be set to true and there will be taken care of
          #GtkWidget::query-tooltip in the default signal handler.
          
          Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
          are set, the last one wins.
  */
  @property void tooltipText(string propval) nothrow
  {
    setTooltipText(propval);
  }

  /**
      Get `valign` property.
      Returns: How to distribute vertical space if widget gets extra space, see #GtkAlign
  */
  @property gid.gtk3.types.Align valign() nothrow
  {
    return getValign();
  }

  /**
      Set `valign` property.
      Params:
        propval = How to distribute vertical space if widget gets extra space, see #GtkAlign
  */
  @property void valign(gid.gtk3.types.Align propval) nothrow
  {
    setValign(propval);
  }

  /**
      Get `vexpand` property.
      Returns: Whether to expand vertically. See [gid.gtk4.widget.Widget.setVexpand].
  */
  @property bool vexpand() nothrow
  {
    return getVexpand();
  }

  /**
      Set `vexpand` property.
      Params:
        propval = Whether to expand vertically. See [gid.gtk4.widget.Widget.setVexpand].
  */
  @property void vexpand(bool propval) nothrow
  {
    setVexpand(propval);
  }

  /**
      Get `vexpandSet` property.
      Returns: Whether to use the #GtkWidget:vexpand property. See [gid.gtk4.widget.Widget.getVexpandSet].
  */
  @property bool vexpandSet() nothrow
  {
    return getVexpandSet();
  }

  /**
      Set `vexpandSet` property.
      Params:
        propval = Whether to use the #GtkWidget:vexpand property. See [gid.gtk4.widget.Widget.getVexpandSet].
  */
  @property void vexpandSet(bool propval) nothrow
  {
    setVexpandSet(propval);
  }

  /** */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /** */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  /** */
  @property int widthRequest() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("width-request");
  }

  /** */
  @property void widthRequest(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("width-request", propval);
  }

  /**
      Get `window` property.
      Returns: The widget's window if it is realized, null otherwise.
  */
  @property gid.gdk3.window.Window window() nothrow
  {
    return getWindow();
  }

  mixin ImplementorIfaceT!();
  mixin BuildableT!();

  /**
      Obtains the current default reading direction. See
      [gid.gtk4.widget.Widget.setDefaultDirection].
      Returns: the current default direction.
  */
  static gid.gtk3.types.TextDirection getDefaultDirection() nothrow
  {
    GtkTextDirection _cretval;
    _cretval = gtk_widget_get_default_direction();
    gid.gtk3.types.TextDirection _retval = cast(gid.gtk3.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Returns the default style used by all widgets initially.
      Returns: the default style. This #GtkStyle
            object is owned by GTK+ and should not be modified or freed.
  
      Deprecated: Use #GtkStyleContext instead, and
            [gid.gtk3.css_provider.CssProvider.getDefault] to obtain a #GtkStyleProvider
            with the default widget style information.
  */
  static gid.gtk3.style.Style getDefaultStyle() nothrow
  {
    GtkStyle* _cretval;
    _cretval = gtk_widget_get_default_style();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style.Style)(cast(GtkStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Cancels the effect of a previous call to [gid.gtk3.widget.Widget.pushCompositeChild].
  
      Deprecated: Use [gid.gtk4.widget_class.WidgetClass.setTemplate], or don’t use this API at all.
  */
  static void popCompositeChild() nothrow
  {
    gtk_widget_pop_composite_child();
  }

  /**
      Makes all newly-created widgets as composite children until
      the corresponding [gid.gtk3.widget.Widget.popCompositeChild] call.
      
      A composite child is a child that’s an implementation detail of the
      container it’s inside and should not be visible to people using the
      container. Composite children aren’t treated differently by GTK+ (but
      see [gid.gtk3.container.Container.foreach_] vs. [gid.gtk3.container.Container.forall]), but e.g. GUI
      builders might want to treat them in a different way.
  
      Deprecated: This API never really worked well and was mostly unused, now
        we have a more complete mechanism for composite children, see [gid.gtk4.widget_class.WidgetClass.setTemplate].
  */
  static void pushCompositeChild() nothrow
  {
    gtk_widget_push_composite_child();
  }

  /**
      Sets the default reading direction for widgets where the
      direction has not been explicitly set by [gid.gtk4.widget.Widget.setDirection].
  
      Params:
        dir = the new default direction. This cannot be
                 [gid.gtk4.types.TextDirection.None].
  */
  static void setDefaultDirection(gid.gtk3.types.TextDirection dir) nothrow
  {
    gtk_widget_set_default_direction(dir);
  }

  /**
      Signal will be emitted when a button
        (typically from a mouse) is pressed.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncButtonPressEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncButtonPressEvent(gid.gdk3.event_button.EventButton event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.buttonPressEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.buttonPressEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventButton*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal will be emitted when a button
        (typically from a mouse) is released.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncButtonReleaseEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncButtonReleaseEvent(gid.gdk3.event_button.EventButton event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.buttonReleaseEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.buttonReleaseEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventButton*)event._cPtr(No.Dup) : null);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCanActivateAccel` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCanActivateAccel(uint signalId)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.canActivateAccel)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canActivateAccel(cast(GtkWidget*)this._cPtr, signalId);
    return _retval;
  }

  /**
      Emits a #GtkWidget::child-notify signal for the
      [child property][child-properties] child_property
      on widget.
      
      This is the analogue of [gid.gobject2.object.ObjectWrap.notify] for child properties.
      
      Also see [gid.gtk3.container.Container.childNotify].
  
      Params:
        childProperty = the name of a child property installed on the
                           class of widget’s parent
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChildNotify` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChildNotify(gid.gobject2.param_spec.ParamSpec childProperty)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.childNotify)
      return;

    _klass.childNotify(cast(GtkWidget*)this._cPtr, childProperty ? cast(GParamSpec*)childProperty._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted when the composited status of
        widgets screen changes. See [gid.gdk3.screen.Screen.isComposited].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCompositedChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncCompositedChanged()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.compositedChanged)
      return;

    _klass.compositedChanged(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal will be emitted when the size, position or
        stacking of the widget’s window has changed.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncConfigureEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncConfigureEvent(gid.gdk3.event_configure.EventConfigure event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.configureEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.configureEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventConfigure*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal emitted when a redirected window belonging to
        widget gets drawn into.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDamageEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDamageEvent(gid.gdk3.event_expose.EventExpose event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.damageEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.damageEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventExpose*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal emitted if a user requests that a toplevel
        window is closed.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeleteEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDeleteEvent(gid.gdk3.event_any.EventAny event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.deleteEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.deleteEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventAny*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Destroys a widget.
      
      When a widget is destroyed all references it holds on other objects
      will be released:
      
       - if the widget is inside a container, it will be removed from its
       parent
       - if the widget is a container, all its children will be destroyed,
       recursively
       - if the widget is a top level, it will be removed from the list
       of top level widgets that GTK+ maintains internally
      
      It's expected that all references held on the widget will also
      be released; you should connect to the #GtkWidget::destroy signal
      if you hold a reference to widget and you wish to remove it when
      this function is called. It is not necessary to do so if you are
      implementing a #GtkContainer, as you'll be able to use the
      #GtkContainerClass.remove() virtual function for that.
      
      It's important to notice that [gid.gtk3.widget.Widget.destroy] will only cause
      the widget to be finalized if no additional references, acquired
      using [gid.gobject2.object.ObjectWrap.ref_], are held on it. In case additional references
      are in place, the widget will be in an "inert" state after calling
      this function; widget will still point to valid memory, allowing you
      to release the references you hold, but you may not query the widget's
      own state.
      
      You should typically call this function on top level widgets, and
      rarely on child widgets.
      
      See also: [gid.gtk3.container.Container.remove]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDestroy` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDestroy()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.destroy)
      return;

    _klass.destroy(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal is emitted when a #GdkWindow is destroyed.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDestroyEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDestroyEvent(gid.gdk3.event_any.EventAny event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.destroyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.destroyEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventAny*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal emitted when the text direction of a
        widget changes.
  
      Params:
        previousDirection = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDirectionChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDirectionChanged(gid.gtk3.types.TextDirection previousDirection)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.directionChanged)
      return;

    _klass.directionChanged(cast(GtkWidget*)this._cPtr, previousDirection);
  }

  /**
      Signal emitted on the drag source when a drag is
        started.
  
      Params:
        context = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragBegin` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDragBegin(gid.gdk3.drag_context.DragContext context)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragBegin)
      return;

    _klass.dragBegin(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted on the drag source when a drag
        with the action [gid.gdk4.types.DragAction.Move] is successfully completed.
  
      Params:
        context = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragDataDelete` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDragDataDelete(gid.gdk3.drag_context.DragContext context)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragDataDelete)
      return;

    _klass.dragDataDelete(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted on the drag source when the drop
        site requests the data which is dragged.
  
      Params:
        context = 
        selectionData =  (modified in place, changes are seen by the caller)
        info = 
        time = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragDataGet` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDragDataGet(gid.gdk3.drag_context.DragContext context, gid.gtk3.selection_data.SelectionData selectionData, uint info, uint time)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragDataGet)
      return;

    _klass.dragDataGet(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null, info, time);
  }

  /**
      Signal emitted on the drop site when the
        dragged data has been received.
  
      Params:
        context = 
        x = 
        y = 
        selectionData =  (modified in place, changes are seen by the caller)
        info = 
        time = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragDataReceived` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDragDataReceived(gid.gdk3.drag_context.DragContext context, int x, int y, gid.gtk3.selection_data.SelectionData selectionData, uint info, uint time)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragDataReceived)
      return;

    _klass.dragDataReceived(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, x, y, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null, info, time);
  }

  /**
      Signal emitted on the drop site when the user drops the
        data onto the widget.
  
      Params:
        context = 
        x = 
        y = 
        time = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragDrop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDragDrop(gid.gdk3.drag_context.DragContext context, int x, int y, uint time)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragDrop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.dragDrop(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, x, y, time);
    return _retval;
  }

  /**
      Signal emitted on the drag source when a drag is
        finished.
  
      Params:
        context = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragEnd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDragEnd(gid.gdk3.drag_context.DragContext context)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragEnd)
      return;

    _klass.dragEnd(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted on the drag source when a drag has
        failed.
  
      Params:
        context = 
        result = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragFailed` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDragFailed(gid.gdk3.drag_context.DragContext context, gid.gtk3.types.DragResult result)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragFailed)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.dragFailed(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, result);
    return _retval;
  }

  /**
      Signal emitted on the drop site when the cursor leaves
        the widget.
  
      Params:
        context = 
        time = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragLeave` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDragLeave(gid.gdk3.drag_context.DragContext context, uint time)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragLeave)
      return;

    _klass.dragLeave(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, time);
  }

  /**
      signal emitted on the drop site when the user moves
        the cursor over the widget during a drag.
  
      Params:
        context = 
        x = 
        y = 
        time = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDragMotion` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDragMotion(gid.gdk3.drag_context.DragContext context, int x, int y, uint time)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.dragMotion)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.dragMotion(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, x, y, time);
    return _retval;
  }

  /**
      Signal emitted when a widget is supposed to render itself.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDraw` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDraw(gid.cairo1.context.Context cr)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.draw)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.draw(cast(GtkWidget*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal event will be emitted when the pointer
        enters the widget’s window.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEnterNotifyEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncEnterNotifyEvent(gid.gdk3.event_crossing.EventCrossing event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.enterNotifyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.enterNotifyEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventCrossing*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Rarely-used function. This function is used to emit
      the event signals on a widget (those signals should never
      be emitted without using this function to do so).
      If you want to synthesize an event though, don’t use this function;
      instead, use [gid.gtk3.global.mainDoEvent] so the event will behave as if
      it were in the event queue. Don’t synthesize expose events; instead,
      use [gid.gdk3.window.Window.invalidateRect] to invalidate a region of the
      window.
  
      Params:
        event = a #GdkEvent (modified in place, changes are seen by the caller)
      Returns: return from the event signal emission (true if
                      the event was handled)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncEvent(gid.gdk3.event.Event event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.event)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.event(cast(GtkWidget*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncFocus(gid.gtk3.types.DirectionType direction)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.focus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.focus(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Signal emitted when the keyboard focus enters the
      widget’s window.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFocusInEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFocusInEvent(gid.gdk3.event_focus.EventFocus event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.focusInEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.focusInEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventFocus*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal emitted when the keyboard focus leaves the
      widget’s window.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFocusOutEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFocusOutEvent(gid.gdk3.event_focus.EventFocus event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.focusOutEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.focusOutEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventFocus*)event._cPtr(No.Dup) : null);
    return _retval;
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetAccessible` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.atk1.object.ObjectWrap vfuncGetAccessible()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getAccessible)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.getAccessible(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeight(out int minimumHeight, out int naturalHeight)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getPreferredHeight)
      return;

    _klass.getPreferredHeight(cast(GtkWidget*)this._cPtr, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeightAndBaselineForWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeightAndBaselineForWidth(int width, out int minimumHeight, out int naturalHeight, out int minimumBaseline, out int naturalBaseline)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getPreferredHeightAndBaselineForWidth)
      return;

    _klass.getPreferredHeightAndBaselineForWidth(cast(GtkWidget*)this._cPtr, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeightForWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeightForWidth(int width, out int minimumHeight, out int naturalHeight)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getPreferredHeightForWidth)
      return;

    _klass.getPreferredHeightForWidth(cast(GtkWidget*)this._cPtr, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidth(out int minimumWidth, out int naturalWidth)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getPreferredWidth)
      return;

    _klass.getPreferredWidth(cast(GtkWidget*)this._cPtr, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidthForHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidthForHeight(int height, out int minimumWidth, out int naturalWidth)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getPreferredWidthForHeight)
      return;

    _klass.getPreferredWidthForHeight(cast(GtkWidget*)this._cPtr, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the widget prefers a height-for-width layout
      or a width-for-height layout.
      
      #GtkBin widgets generally propagate the preference of
      their child, container widgets need to request something either in
      context of their children or in context of their allocation
      capabilities.
      Returns: The #GtkSizeRequestMode preferred by widget.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetRequestMode` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk3.types.SizeRequestMode vfuncGetRequestMode()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getRequestMode)
      return typeof(return).init;

    GtkSizeRequestMode _cretval;
    _cretval = _klass.getRequestMode(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.SizeRequestMode _retval = cast(gid.gtk3.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Signal emitted when a pointer or keyboard grab
        on a window belonging to widget gets broken.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGrabBrokenEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGrabBrokenEvent(gid.gdk3.event_grab_broken.EventGrabBroken event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.grabBrokenEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.grabBrokenEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventGrabBroken*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Causes widget to have the keyboard focus for the #GtkWindow it's
      inside. widget must be a focusable widget, such as a #GtkEntry;
      something like #GtkFrame won’t work.
      
      More precisely, it must have the `GTK_CAN_FOCUS` flag set. Use
      [gid.gtk4.widget.Widget.setCanFocus] to modify that flag.
      
      The widget also needs to be realized and mapped. This is indicated by the
      related signals. Grabbing the focus immediately after creating the widget
      will likely fail and cause critical warnings.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGrabFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGrabFocus()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.grabFocus)
      return;

    _klass.grabFocus(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal emitted when a widget becomes shadowed by a
        GTK+ grab (not a pointer or keyboard grab) on another widget, or
        when it becomes unshadowed due to a grab being removed.
  
      Params:
        wasGrabbed = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGrabNotify` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGrabNotify(bool wasGrabbed)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.grabNotify)
      return;

    _klass.grabNotify(cast(GtkWidget*)this._cPtr, wasGrabbed);
  }

  /**
      Reverses the effects of [gid.gtk4.widget.Widget.show], causing the widget to be
      hidden (invisible to the user).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHide` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncHide()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.hide)
      return;

    _klass.hide(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal emitted when the anchored state of a
        widget changes.
  
      Params:
        previousToplevel = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHierarchyChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncHierarchyChanged(gid.gtk3.widget.Widget previousToplevel)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.hierarchyChanged)
      return;

    _klass.hierarchyChanged(cast(GtkWidget*)this._cPtr, previousToplevel ? cast(GtkWidget*)previousToplevel._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted when a key is pressed.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncKeyPressEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncKeyPressEvent(gid.gdk3.event_key.EventKey event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.keyPressEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.keyPressEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal is emitted when a key is released.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncKeyReleaseEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncKeyReleaseEvent(gid.gdk3.event_key.EventKey event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.keyReleaseEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.keyReleaseEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function should be called whenever keyboard navigation within
      a single widget hits a boundary. The function emits the
      #GtkWidget::keynav-failed signal on the widget and its return
      value should be interpreted in a way similar to the return value of
      [gid.gtk4.widget.Widget.childFocus]:
      
      When true is returned, stay in the widget, the failed keyboard
      navigation is OK and/or there is nowhere we can/should move the
      focus to.
      
      When false is returned, the caller should continue with keyboard
      navigation outside the widget, e.g. by calling
      [gid.gtk4.widget.Widget.childFocus] on the widget’s toplevel.
      
      The default ::keynav-failed handler returns false for
      [gid.gtk4.types.DirectionType.TabForward] and [gid.gtk4.types.DirectionType.TabBackward]. For the other
      values of #GtkDirectionType it returns true.
      
      Whenever the default handler returns true, it also calls
      [gid.gtk4.widget.Widget.errorBell] to notify the user of the failed keyboard
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncKeynavFailed` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncKeynavFailed(gid.gtk3.types.DirectionType direction)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.keynavFailed)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.keynavFailed(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Will be emitted when the pointer leaves the
        widget’s window.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLeaveNotifyEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncLeaveNotifyEvent(gid.gdk3.event_crossing.EventCrossing event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.leaveNotifyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.leaveNotifyEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventCrossing*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function is only for use in widget implementations. Causes
      a widget to be mapped if it isn’t already.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMap` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncMap()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.map)
      return;

    _klass.map(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal emitted when the widget’s window is mapped.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMapEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncMapEvent(gid.gdk3.event_any.EventAny event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.mapEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.mapEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventAny*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Emits the #GtkWidget::mnemonic-activate signal.
  
      Params:
        groupCycling = true if there are other widgets with the same mnemonic
      Returns: true if the signal has been handled
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMnemonicActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncMnemonicActivate(bool groupCycling)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.mnemonicActivate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.mnemonicActivate(cast(GtkWidget*)this._cPtr, groupCycling);
    return _retval;
  }

  /**
      Signal emitted when the pointer moves over
        the widget’s #GdkWindow.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMotionNotifyEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncMotionNotifyEvent(gid.gdk3.event_motion.EventMotion event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.motionNotifyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.motionNotifyEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventMotion*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal emitted when a change of focus is requested
  
      Params:
        direction = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMoveFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncMoveFocus(gid.gtk3.types.DirectionType direction)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.moveFocus)
      return;

    _klass.moveFocus(cast(GtkWidget*)this._cPtr, direction);
  }

  /**
      Signal emitted when a new parent has been set on a
        widget.
  
      Params:
        previousParent = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncParentSet` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncParentSet(gid.gtk3.widget.Widget previousParent)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.parentSet)
      return;

    _klass.parentSet(cast(GtkWidget*)this._cPtr, previousParent ? cast(GtkWidget*)previousParent._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted whenever a widget should pop up a
        context menu.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPopupMenu` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPopupMenu()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.popupMenu)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.popupMenu(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Signal will be emitted when a property on
        the widget’s window has been changed or deleted.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPropertyNotifyEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPropertyNotifyEvent(gid.gdk3.event_property.EventProperty event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.propertyNotifyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.propertyNotifyEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventProperty*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncProximityInEvent(gid.gdk3.event_proximity.EventProximity event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.proximityInEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proximityInEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventProximity*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncProximityOutEvent(gid.gdk3.event_proximity.EventProximity event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.proximityOutEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.proximityOutEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventProximity*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal emitted when “has-tooltip” is true and the
        hover timeout has expired with the cursor hovering “above”
        widget; or emitted when widget got focus in keyboard mode.
  
      Params:
        x = 
        y = 
        keyboardTooltip = 
        tooltip = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryTooltip` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncQueryTooltip(int x, int y, bool keyboardTooltip, gid.gtk3.tooltip.Tooltip tooltip)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.queryTooltip)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.queryTooltip(cast(GtkWidget*)this._cPtr, x, y, keyboardTooltip, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Invalidates the area of widget defined by region by calling
      [gid.gdk3.window.Window.invalidateRegion] on the widget’s window and all its
      child windows. Once the main loop becomes idle (after the current
      batch of events has been processed, roughly), the window will
      receive expose events for the union of all regions that have been
      invalidated.
      
      Normally you would only use this function in widget
      implementations. You might also use it to schedule a redraw of a
      #GtkDrawingArea or some portion thereof.
  
      Params:
        region = region to draw
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueueDrawRegion` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncQueueDrawRegion(gid.cairo1.region.Region region)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.queueDrawRegion)
      return;

    _klass.queueDrawRegion(cast(GtkWidget*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      Creates the GDK (windowing system) resources associated with a
      widget.  For example, widget->window will be created when a widget
      is realized.  Normally realization happens implicitly; if you show
      a widget and all its parent containers, then the widget will be
      realized and mapped automatically.
      
      Realizing a widget requires all
      the widget’s parent widgets to be realized; calling
      [gid.gtk4.widget.Widget.realize] realizes the widget’s parents in addition to
      widget itself. If a widget is not yet inside a toplevel window
      when you realize it, bad things will happen.
      
      This function is primarily used in widget implementations, and
      isn’t very useful otherwise. Many times when you think you might
      need it, a better approach is to connect to a signal that will be
      called after the widget is realized automatically, such as
      #GtkWidget::draw. Or simply g_signal_connect () to the
      #GtkWidget::realize signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRealize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRealize()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.realize)
      return;

    _klass.realize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal emitted when the screen of a widget has
        changed.
  
      Params:
        previousScreen = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncScreenChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncScreenChanged(gid.gdk3.screen.Screen previousScreen)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.screenChanged)
      return;

    _klass.screenChanged(cast(GtkWidget*)this._cPtr, previousScreen ? cast(GdkScreen*)previousScreen._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted when a button in the 4 to 7 range is
        pressed.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncScrollEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncScrollEvent(gid.gdk3.event_scroll.EventScroll event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.scrollEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.scrollEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventScroll*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal will be emitted when the the
        widget’s window has lost ownership of a selection.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSelectionClearEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSelectionClearEvent(gid.gdk3.event_selection.EventSelection event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.selectionClearEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectionClearEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventSelection*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected void vfuncSelectionGet(gid.gtk3.selection_data.SelectionData selectionData, uint info, uint time)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.selectionGet)
      return;

    _klass.selectionGet(cast(GtkWidget*)this._cPtr, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null, info, time);
  }

  /** */
  protected bool vfuncSelectionNotifyEvent(gid.gdk3.event_selection.EventSelection event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.selectionNotifyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectionNotifyEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventSelection*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected void vfuncSelectionReceived(gid.gtk3.selection_data.SelectionData selectionData, uint time)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.selectionReceived)
      return;

    _klass.selectionReceived(cast(GtkWidget*)this._cPtr, selectionData ? cast(GtkSelectionData*)selectionData._cPtr(No.Dup) : null, time);
  }

  /**
      Signal will be emitted when another
        client requests ownership of the selection owned by the widget's
        window.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSelectionRequestEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSelectionRequestEvent(gid.gdk3.event_selection.EventSelection event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.selectionRequestEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectionRequestEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventSelection*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Flags a widget to be displayed. Any widget that isn’t shown will
      not appear on the screen. If you want to show all the widgets in a
      container, it’s easier to call [gid.gtk3.widget.Widget.showAll] on the
      container, instead of individually showing the widgets.
      
      Remember that you have to show the containers containing a widget,
      in addition to the widget itself, before it will appear onscreen.
      
      When a toplevel container is shown, it is immediately realized and
      mapped; other shown widgets are realized and mapped when their
      toplevel container is realized and mapped.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShow` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncShow()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.show)
      return;

    _klass.show(cast(GtkWidget*)this._cPtr);
  }

  /**
      Recursively shows a widget, and any child widgets (if the widget is
      a container).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShowAll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncShowAll()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.showAll)
      return;

    _klass.showAll(cast(GtkWidget*)this._cPtr);
  }

  /** */
  protected bool vfuncShowHelp(gid.gtk3.types.WidgetHelpType helpType)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.showHelp)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.showHelp(cast(GtkWidget*)this._cPtr, helpType);
    return _retval;
  }

  /**
      This function is only used by #GtkContainer subclasses, to assign a size
      and position to their child widgets.
      
      In this function, the allocation may be adjusted. It will be forced
      to a 1x1 minimum size, and the adjust_size_allocation virtual
      method on the child will be used to adjust the allocation. Standard
      adjustments include removing the widget’s margins, and applying the
      widget’s #GtkWidget:halign and #GtkWidget:valign properties.
      
      For baseline support in containers you need to use [gid.gtk3.widget.Widget.sizeAllocateWithBaseline]
      instead.
  
      Params:
        allocation = position and size to be allocated to widget
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSizeAllocate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSizeAllocate(gid.gtk3.types.Allocation allocation)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.sizeAllocate)
      return;

    _klass.sizeAllocate(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation);
  }

  /**
      Signal emitted when the widget state
        changes. Deprecated: 3.0
  
      Params:
        previousState = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStateChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncStateChanged(gid.gtk3.types.StateType previousState)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.stateChanged)
      return;

    _klass.stateChanged(cast(GtkWidget*)this._cPtr, previousState);
  }

  /**
      Signal emitted when the widget state changes,
        see [gid.gtk4.widget.Widget.getStateFlags].
  
      Params:
        previousStateFlags = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStateFlagsChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncStateFlagsChanged(gid.gtk3.types.StateFlags previousStateFlags)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.stateFlagsChanged)
      return;

    _klass.stateFlagsChanged(cast(GtkWidget*)this._cPtr, previousStateFlags);
  }

  /**
      Signal emitted when a new style has been set on a
      widget. Deprecated: 3.0
  
      Params:
        previousStyle = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStyleSet` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncStyleSet(gid.gtk3.style.Style previousStyle)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.styleSet)
      return;

    _klass.styleSet(cast(GtkWidget*)this._cPtr, previousStyle ? cast(GtkStyle*)previousStyle._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted when the GtkStyleContext of a widget
        is changed.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStyleUpdated` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncStyleUpdated()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.styleUpdated)
      return;

    _klass.styleUpdated(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal emitted when a touch event happens
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTouchEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncTouchEvent(gid.gdk3.event_touch.EventTouch event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.touchEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.touchEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventTouch*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function is only for use in widget implementations. Causes
      a widget to be unmapped if it’s currently mapped.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnmap` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUnmap()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.unmap)
      return;

    _klass.unmap(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal will be emitted when the widget’s window is
        unmapped.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnmapEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncUnmapEvent(gid.gdk3.event_any.EventAny event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.unmapEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unmapEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventAny*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function is only useful in widget implementations.
      Causes a widget to be unrealized (frees all GDK resources
      associated with the widget, such as widget->window).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnrealize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUnrealize()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.unrealize)
      return;

    _klass.unrealize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Signal emitted when the widget’s window is
        obscured or unobscured.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncVisibilityNotifyEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncVisibilityNotifyEvent(gid.gdk3.event_visibility.EventVisibility event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.visibilityNotifyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.visibilityNotifyEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventVisibility*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Signal emitted when the state of the toplevel
        window associated to the widget changes.
  
      Params:
        event =  (borrowed, only valid during the callback, use `_dup` to keep a copy)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWindowStateEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncWindowStateEvent(gid.gdk3.event_window_state.EventWindowState event)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.windowStateEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.windowStateEvent(cast(GtkWidget*)this._cPtr, event ? cast(GdkEventWindowState*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      For widgets that can be “activated” (buttons, menu items, etc.)
      this function activates them. Activation is what happens when you
      press Enter on a widget during key navigation. If widget isn't
      activatable, the function returns false.
      Returns: true if the widget was activatable
  */
  bool activate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_activate(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Installs an accelerator for this widget in accel_group that causes
      accel_signal to be emitted if the accelerator is activated.
      The accel_group needs to be added to the widget’s toplevel via
      [gid.gtk3.window.Window.addAccelGroup], and the signal must be of type [gid.gobject2.types.SignalFlags.Action].
      Accelerators added through this function are not user changeable during
      runtime. If you want to support accelerators that can be changed by the
      user, use [gid.gtk3.accel_map.AccelMap.addEntry] and [gid.gtk3.widget.Widget.setAccelPath] or
      [gid.gtk3.menu_item.MenuItem.setAccelPath] instead.
  
      Params:
        accelSignal = widget signal to emit on accelerator activation
        accelGroup = accel group for this widget, added to its toplevel
        accelKey = GDK keyval of the accelerator
        accelMods = modifier key combination of the accelerator
        accelFlags = flag accelerators, e.g. [gid.gtk3.types.AccelFlags.Visible]
  */
  void addAccelerator(string accelSignal, gid.gtk3.accel_group.AccelGroup accelGroup, uint accelKey, gid.gdk3.types.ModifierType accelMods, gid.gtk3.types.AccelFlags accelFlags) nothrow
  {
    const(char)* _accelSignal = accelSignal.toCString!(No.Malloc, No.Nullable);
    gtk_widget_add_accelerator(cast(GtkWidget*)this._cPtr, _accelSignal, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null, accelKey, accelMods, accelFlags);
  }

  /**
      Adds the device events in the bitfield events to the event mask for
      widget. See [gid.gtk3.widget.Widget.setDeviceEvents] for details.
  
      Params:
        device = a #GdkDevice
        events = an event mask, see #GdkEventMask
  */
  void addDeviceEvents(gid.gdk3.device.Device device, gid.gdk3.types.EventMask events) nothrow
  {
    gtk_widget_add_device_events(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, events);
  }

  /**
      Adds the events in the bitfield events to the event mask for
      widget. See [gid.gtk3.widget.Widget.setEvents] and the
      [input handling overview][event-masks] for details.
  
      Params:
        events = an event mask, see #GdkEventMask
  */
  void addEvents(int events) nothrow
  {
    gtk_widget_add_events(cast(GtkWidget*)this._cPtr, events);
  }

  /**
      Adds a widget to the list of mnemonic labels for
      this widget. (See [gid.gtk4.widget.Widget.listMnemonicLabels]). Note the
      list of mnemonic labels for the widget is cleared when the
      widget is destroyed, so the caller must make sure to update
      its internal state at this point as well, by using a connection
      to the #GtkWidget::destroy signal or a weak notifier.
  
      Params:
        label = a #GtkWidget that acts as a mnemonic label for widget
  */
  void addMnemonicLabel(gid.gtk3.widget.Widget label) nothrow
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
      then you will have to call [gid.gtk4.widget.Widget.queueResize] or
      [gid.gtk3.widget.Widget.queueDrawArea] yourself.
      
      [gid.gdk4.frame_clock.FrameClock.getFrameTime] should generally be used for timing
      continuous animations and
      [gid.gdk4.frame_timings.FrameTimings.getPredictedPresentationTime] if you are
      trying to display isolated frames at particular times.
      
      This is a more convenient alternative to connecting directly to the
      #GdkFrameClock::update signal of #GdkFrameClock, since you don't
      have to worry about when a #GdkFrameClock is assigned to a widget.
  
      Params:
        callback = function to call for updating animations
      Returns: an id for the connection of this callback. Remove the callback
            by passing it to [gid.gtk4.widget.Widget.removeTickCallback]
  */
  uint addTickCallback(gid.gtk3.types.TickCallback callback) nothrow
  {
    extern(C) gboolean _callbackCallback(GtkWidget* widget, GdkFrameClock* frameClock, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.TickCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.frame_clock.FrameClock)(cast(void*)frameClock, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TickCallback");
      }
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
  bool canActivateAccel(uint signalId) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_can_activate_accel(cast(GtkWidget*)this._cPtr, signalId);
    return _retval;
  }

  /**
      This function is used by custom widget implementations; if you're
      writing an app, you’d use [gid.gtk4.widget.Widget.grabFocus] to move the focus
      to a particular widget, and [gid.gtk3.container.Container.setFocusChain] to
      change the focus tab order. So you may want to investigate those
      functions instead.
      
      [gid.gtk4.widget.Widget.childFocus] is called by containers as the user moves
      around the window using keyboard shortcuts. direction indicates
      what kind of motion is taking place (up, down, left, right, tab
      forward, tab backward). [gid.gtk4.widget.Widget.childFocus] emits the
      #GtkWidget::focus signal; widgets override the default handler
      for this signal in order to implement appropriate focus behavior.
      
      The default ::focus handler for a widget should return true if
      moving in direction left the focus on a focusable location inside
      that widget, and false if moving in direction moved the focus
      outside the widget. If returning true, widgets normally
      call [gid.gtk4.widget.Widget.grabFocus] to place the focus accordingly;
      if returning false, they don’t modify the current focus location.
  
      Params:
        direction = direction of focus movement
      Returns: true if focus ended up inside widget
  */
  bool childFocus(gid.gtk3.types.DirectionType direction) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_child_focus(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Emits a #GtkWidget::child-notify signal for the
      [child property][child-properties] child_property
      on widget.
      
      This is the analogue of [gid.gobject2.object.ObjectWrap.notify] for child properties.
      
      Also see [gid.gtk3.container.Container.childNotify].
  
      Params:
        childProperty = the name of a child property installed on the
                           class of widget’s parent
  */
  void childNotify(string childProperty) nothrow
  {
    const(char)* _childProperty = childProperty.toCString!(No.Malloc, No.Nullable);
    gtk_widget_child_notify(cast(GtkWidget*)this._cPtr, _childProperty);
  }

  /**
      Same as [gid.gtk3.widget.Widget.path], but always uses the name of a widget’s type,
      never uses a custom name set with [gid.gtk4.widget.Widget.setName].
  
      Params:
        pathLength = location to store the length of the
              class path, or null
        path = location to store the class path as an
              allocated string, or null
        pathReversed = location to store the reverse
              class path as an allocated string, or null
  
      Deprecated: Use [gid.gtk3.widget.Widget.getPath] instead
  */
  void classPath(out uint pathLength, out string path, out string pathReversed) nothrow
  {
    char* _path;
    char* _pathReversed;
    gtk_widget_class_path(cast(GtkWidget*)this._cPtr, cast(uint*)&pathLength, &_path, &_pathReversed);
    path = _path.fromCString!(Yes.Free);
    pathReversed = _pathReversed.fromCString!(Yes.Free);
  }

  /**
      Computes whether a container should give this widget extra space
      when possible. Containers should check this, rather than
      looking at [gid.gtk4.widget.Widget.getHexpand] or [gid.gtk4.widget.Widget.getVexpand].
      
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
  bool computeExpand(gid.gtk3.types.Orientation orientation) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_compute_expand(cast(GtkWidget*)this._cPtr, orientation);
    return _retval;
  }

  /**
      Creates a new #PangoContext with the appropriate font map,
      font options, font description, and base direction for drawing
      text for this widget. See also [gid.gtk4.widget.Widget.getPangoContext].
      Returns: the new #PangoContext
  */
  gid.pango1.context.Context createPangoContext() nothrow
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_create_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
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
  gid.pango1.layout.Layout createPangoLayout(string text = null) nothrow
  {
    PangoLayout* _cretval;
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_widget_create_pango_layout(cast(GtkWidget*)this._cPtr, _text);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(PangoLayout*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Destroys a widget.
      
      When a widget is destroyed all references it holds on other objects
      will be released:
      
       - if the widget is inside a container, it will be removed from its
       parent
       - if the widget is a container, all its children will be destroyed,
       recursively
       - if the widget is a top level, it will be removed from the list
       of top level widgets that GTK+ maintains internally
      
      It's expected that all references held on the widget will also
      be released; you should connect to the #GtkWidget::destroy signal
      if you hold a reference to widget and you wish to remove it when
      this function is called. It is not necessary to do so if you are
      implementing a #GtkContainer, as you'll be able to use the
      #GtkContainerClass.remove() virtual function for that.
      
      It's important to notice that [gid.gtk3.widget.Widget.destroy] will only cause
      the widget to be finalized if no additional references, acquired
      using [gid.gobject2.object.ObjectWrap.ref_], are held on it. In case additional references
      are in place, the widget will be in an "inert" state after calling
      this function; widget will still point to valid memory, allowing you
      to release the references you hold, but you may not query the widget's
      own state.
      
      You should typically call this function on top level widgets, and
      rarely on child widgets.
      
      See also: [gid.gtk3.container.Container.remove]
  */
  void destroy() nothrow
  {
    gtk_widget_destroy(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function sets *widget_pointer to null if widget_pointer !=
      null.  It’s intended to be used as a callback connected to the
      “destroy” signal of a widget. You connect [gid.gtk3.widget.Widget.destroyed]
      as a signal handler, and pass the address of your widget variable
      as user data. Then when the widget is destroyed, the variable will
      be set to null. Useful for example to avoid multiple copies
      of the same dialog.
  
      Params:
        widgetPointer = address of a variable that contains widget
  */
  void destroyed(ref gid.gtk3.widget.Widget widgetPointer) nothrow
  {
    GtkWidget* _widgetPointer = widgetPointer ? cast(GtkWidget*)widgetPointer._cPtr(No.Dup) : null;
    gtk_widget_destroyed(cast(GtkWidget*)this._cPtr, &_widgetPointer);
    widgetPointer = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(_widgetPointer, No.Take);
  }

  /**
      Returns true if device has been shadowed by a GTK+
      device grab on another widget, so it would stop sending
      events to widget. This may be used in the
      #GtkWidget::grab-notify signal to check for specific
      devices. See [gid.gtk3.global.deviceGrabAdd].
  
      Params:
        device = a #GdkDevice
      Returns: true if there is an ongoing grab on device
                 by another #GtkWidget than widget.
  */
  bool deviceIsShadowed(gid.gdk3.device.Device device) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_device_is_shadowed(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function is equivalent to [gid.gtk3.widget.Widget.dragBeginWithCoordinates],
      passing -1, -1 as coordinates.
  
      Params:
        targets = The targets (data formats) in which the
             source can provide the data
        actions = A bitmask of the allowed drag actions for this drag
        button = The button the user clicked to start the drag
        event = The event that triggered the start of the drag,
             or null if none can be obtained.
      Returns: the context for this drag
  
      Deprecated: Use [gid.gtk3.widget.Widget.dragBeginWithCoordinates] instead
  */
  gid.gdk3.drag_context.DragContext dragBegin(gid.gtk3.target_list.TargetList targets, gid.gdk3.types.DragAction actions, int button, gid.gdk3.event.Event event = null) nothrow
  {
    GdkDragContext* _cretval;
    _cretval = gtk_drag_begin(cast(GtkWidget*)this._cPtr, targets ? cast(GtkTargetList*)targets._cPtr(No.Dup) : null, actions, button, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(GdkDragContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Initiates a drag on the source side. The function only needs to be used
      when the application is starting drags itself, and is not needed when
      [gid.gtk3.widget.Widget.dragSourceSet] is used.
      
      The event is used to retrieve the timestamp that will be used internally to
      grab the pointer.  If event is null, then [gid.gdk4.types.CURRENT_TIME] will be used.
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
      from the mouse, using [gid.gdk3.event.Event.copy], and pass it to this function
      (remember to free the event with [gid.gdk3.event.Event.free] when you are done).
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
  gid.gdk3.drag_context.DragContext dragBeginWithCoordinates(gid.gtk3.target_list.TargetList targets, gid.gdk3.types.DragAction actions, int button, gid.gdk3.event.Event event, int x, int y) nothrow
  {
    GdkDragContext* _cretval;
    _cretval = gtk_drag_begin_with_coordinates(cast(GtkWidget*)this._cPtr, targets ? cast(GtkTargetList*)targets._cPtr(No.Dup) : null, actions, button, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, x, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(GdkDragContext*)_cretval, No.Take);
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
  bool dragCheckThreshold(int startX, int startY, int currentX, int currentY) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_drag_check_threshold(cast(GtkWidget*)this._cPtr, startX, startY, currentX, currentY);
    return _retval;
  }

  /**
      Add the image targets supported by #GtkSelectionData to
      the target list of the drag destination. The targets
      are added with info = 0. If you need another value,
      use [gid.gtk3.target_list.TargetList.addImageTargets] and
      [gid.gtk3.widget.Widget.dragDestSetTargetList].
  */
  void dragDestAddImageTargets() nothrow
  {
    gtk_drag_dest_add_image_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the text targets supported by #GtkSelectionData to
      the target list of the drag destination. The targets
      are added with info = 0. If you need another value,
      use [gid.gtk3.target_list.TargetList.addTextTargets] and
      [gid.gtk3.widget.Widget.dragDestSetTargetList].
  */
  void dragDestAddTextTargets() nothrow
  {
    gtk_drag_dest_add_text_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the URI targets supported by #GtkSelectionData to
      the target list of the drag destination. The targets
      are added with info = 0. If you need another value,
      use [gid.gtk3.target_list.TargetList.addUriTargets] and
      [gid.gtk3.widget.Widget.dragDestSetTargetList].
  */
  void dragDestAddUriTargets() nothrow
  {
    gtk_drag_dest_add_uri_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Looks for a match between the supported targets of context and the
      dest_target_list, returning the first matching target, otherwise
      returning `GDK_NONE`. dest_target_list should usually be the return
      value from [gid.gtk3.widget.Widget.dragDestGetTargetList], but some widgets may
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
  gid.gdk3.atom.Atom dragDestFindTarget(gid.gdk3.drag_context.DragContext context, gid.gtk3.target_list.TargetList targetList = null) nothrow
  {
    GdkAtom _cretval;
    _cretval = gtk_drag_dest_find_target(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, targetList ? cast(GtkTargetList*)targetList._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gdk3.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the list of targets this widget can accept from
      drag-and-drop.
      Returns: the #GtkTargetList, or null if none
  */
  gid.gtk3.target_list.TargetList dragDestGetTargetList() nothrow
  {
    GtkTargetList* _cretval;
    _cretval = gtk_drag_dest_get_target_list(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether the widget has been configured to always
      emit #GtkWidget::drag-motion signals.
      Returns: true if the widget always emits
          #GtkWidget::drag-motion events
  */
  bool dragDestGetTrackMotion() nothrow
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
      invokations of [gid.gdk3.global.dragStatus] in the context of #GtkWidget::drag-motion,
      and invokations of [gid.gtk3.global.dragFinish] in #GtkWidget::drag-data-received.
      Especially the later is dramatic, when your own #GtkWidget::drag-motion
      handler calls [gid.gtk3.widget.Widget.dragGetData] to inspect the dragged data.
      
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
              [gid.gtk3.widget.Widget.dragDestGetTargetList] and [gid.gtk3.widget.Widget.dragDestFindTarget].
        actions = a bitmask of possible actions for a drop onto this widget.
  */
  void dragDestSet(gid.gtk3.types.DestDefaults flags, gid.gtk3.target_entry.TargetEntry[] targets, gid.gdk3.types.DragAction actions) nothrow
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    auto _targets_arr = new GtkTargetEntry[](targets.length);
    auto _targets = _targets_arr.ptr;
    foreach (i, obj; targets) _targets[i] = obj ? *cast(GtkTargetEntry*)obj._cPtr(No.Dup) : GtkTargetEntry.init;
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
  void dragDestSetProxy(gid.gdk3.window.Window proxyWindow, gid.gdk3.types.DragProtocol protocol, bool useCoordinates) nothrow
  {
    gtk_drag_dest_set_proxy(cast(GtkWidget*)this._cPtr, proxyWindow ? cast(GdkWindow*)proxyWindow._cPtr(No.Dup) : null, protocol, useCoordinates);
  }

  /**
      Sets the target types that this widget can accept from drag-and-drop.
      The widget must first be made into a drag destination with
      [gid.gtk3.widget.Widget.dragDestSet].
  
      Params:
        targetList = list of droppable targets, or null for none
  */
  void dragDestSetTargetList(gid.gtk3.target_list.TargetList targetList = null) nothrow
  {
    gtk_drag_dest_set_target_list(cast(GtkWidget*)this._cPtr, targetList ? cast(GtkTargetList*)targetList._cPtr(No.Dup) : null);
  }

  /**
      Tells the widget to emit #GtkWidget::drag-motion and
      #GtkWidget::drag-leave events regardless of the targets and the
      [gid.gtk3.types.DestDefaults.Motion] flag.
      
      This may be used when a widget wants to do generic
      actions regardless of the targets that the source offers.
  
      Params:
        trackMotion = whether to accept all targets
  */
  void dragDestSetTrackMotion(bool trackMotion) nothrow
  {
    gtk_drag_dest_set_track_motion(cast(GtkWidget*)this._cPtr, trackMotion);
  }

  /**
      Clears information about a drop destination set with
      [gid.gtk3.widget.Widget.dragDestSet]. The widget will no longer receive
      notification of drags.
  */
  void dragDestUnset() nothrow
  {
    gtk_drag_dest_unset(cast(GtkWidget*)this._cPtr);
  }

  /**
      Gets the data associated with a drag. When the data
      is received or the retrieval fails, GTK+ will emit a
      #GtkWidget::drag-data-received signal. Failure of the retrieval
      is indicated by the length field of the selection_data
      signal parameter being negative. However, when [gid.gtk3.widget.Widget.dragGetData]
      is called implicitely because the [gid.gtk3.types.DestDefaults.Drop] was set,
      then the widget will not receive notification of failed
      drops.
  
      Params:
        context = the drag context
        target = the target (form of the data) to retrieve
        time = a timestamp for retrieving the data. This will
            generally be the time received in a #GtkWidget::drag-motion
            or #GtkWidget::drag-drop signal
  */
  void dragGetData(gid.gdk3.drag_context.DragContext context, gid.gdk3.atom.Atom target, uint time) nothrow
  {
    gtk_drag_get_data(cast(GtkWidget*)this._cPtr, context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, target ? cast(GdkAtom)target._cPtr : null, time);
  }

  /**
      Highlights a widget as a currently hovered drop target.
      To end the highlight, call [gid.gtk3.widget.Widget.dragUnhighlight].
      GTK+ calls this automatically if [gid.gtk3.types.DestDefaults.Highlight] is set.
  */
  void dragHighlight() nothrow
  {
    gtk_drag_highlight(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the writable image targets supported by #GtkSelectionData to
      the target list of the drag source. The targets
      are added with info = 0. If you need another value,
      use [gid.gtk3.target_list.TargetList.addImageTargets] and
      [gid.gtk3.widget.Widget.dragSourceSetTargetList].
  */
  void dragSourceAddImageTargets() nothrow
  {
    gtk_drag_source_add_image_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the text targets supported by #GtkSelectionData to
      the target list of the drag source.  The targets
      are added with info = 0. If you need another value,
      use [gid.gtk3.target_list.TargetList.addTextTargets] and
      [gid.gtk3.widget.Widget.dragSourceSetTargetList].
  */
  void dragSourceAddTextTargets() nothrow
  {
    gtk_drag_source_add_text_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Add the URI targets supported by #GtkSelectionData to
      the target list of the drag source.  The targets
      are added with info = 0. If you need another value,
      use [gid.gtk3.target_list.TargetList.addUriTargets] and
      [gid.gtk3.widget.Widget.dragSourceSetTargetList].
  */
  void dragSourceAddUriTargets() nothrow
  {
    gtk_drag_source_add_uri_targets(cast(GtkWidget*)this._cPtr);
  }

  /**
      Gets the list of targets this widget can provide for
      drag-and-drop.
      Returns: the #GtkTargetList, or null if none
  */
  gid.gtk3.target_list.TargetList dragSourceGetTargetList() nothrow
  {
    GtkTargetList* _cretval;
    _cretval = gtk_drag_source_get_target_list(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.target_list.TargetList(cast(void*)_cretval, No.Take) : null;
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
  void dragSourceSet(gid.gdk3.types.ModifierType startButtonMask, gid.gtk3.target_entry.TargetEntry[] targets, gid.gdk3.types.DragAction actions) nothrow
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    auto _targets_arr = new GtkTargetEntry[](targets.length);
    auto _targets = _targets_arr.ptr;
    foreach (i, obj; targets) _targets[i] = obj ? *cast(GtkTargetEntry*)obj._cPtr(No.Dup) : GtkTargetEntry.init;
    gtk_drag_source_set(cast(GtkWidget*)this._cPtr, startButtonMask, _targets, _nTargets, actions);
  }

  /**
      Sets the icon that will be used for drags from a particular source
      to icon. See the docs for #GtkIconTheme for more details.
  
      Params:
        icon = A #GIcon
  */
  void dragSourceSetIconGicon(gid.gio2.icon.Icon icon) nothrow
  {
    gtk_drag_source_set_icon_gicon(cast(GtkWidget*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon that will be used for drags from a particular source
      to a themed icon. See the docs for #GtkIconTheme for more details.
  
      Params:
        iconName = name of icon to use
  */
  void dragSourceSetIconName(string iconName) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    gtk_drag_source_set_icon_name(cast(GtkWidget*)this._cPtr, _iconName);
  }

  /**
      Sets the icon that will be used for drags from a particular widget
      from a #GdkPixbuf. GTK+ retains a reference for pixbuf and will
      release it when it is no longer needed.
  
      Params:
        pixbuf = the #GdkPixbuf for the drag icon
  */
  void dragSourceSetIconPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    gtk_drag_source_set_icon_pixbuf(cast(GtkWidget*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon that will be used for drags from a particular source
      to a stock icon.
  
      Params:
        stockId = the ID of the stock icon to use
  
      Deprecated: Use [gid.gtk3.widget.Widget.dragSourceSetIconName] instead.
  */
  void dragSourceSetIconStock(string stockId) nothrow
  {
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    gtk_drag_source_set_icon_stock(cast(GtkWidget*)this._cPtr, _stockId);
  }

  /**
      Changes the target types that this widget offers for drag-and-drop.
      The widget must first be made into a drag source with
      [gid.gtk3.widget.Widget.dragSourceSet].
  
      Params:
        targetList = list of draggable targets, or null for none
  */
  void dragSourceSetTargetList(gid.gtk3.target_list.TargetList targetList = null) nothrow
  {
    gtk_drag_source_set_target_list(cast(GtkWidget*)this._cPtr, targetList ? cast(GtkTargetList*)targetList._cPtr(No.Dup) : null);
  }

  /**
      Undoes the effects of [gid.gtk3.widget.Widget.dragSourceSet].
  */
  void dragSourceUnset() nothrow
  {
    gtk_drag_source_unset(cast(GtkWidget*)this._cPtr);
  }

  /**
      Removes a highlight set by [gid.gtk3.widget.Widget.dragHighlight] from
      a widget.
  */
  void dragUnhighlight() nothrow
  {
    gtk_drag_unhighlight(cast(GtkWidget*)this._cPtr);
  }

  /**
      Draws widget to cr. The top left corner of the widget will be
      drawn to the currently set origin point of cr.
      
      You should pass a cairo context as cr argument that is in an
      original state. Otherwise the resulting drawing is undefined. For
      example changing the operator using [gid.cairo1.context.Context.setOperator] or the
      line width using [gid.cairo1.context.Context.setLineWidth] might have unwanted side
      effects.
      You may however change the context’s transform matrix - like with
      [gid.cairo1.context.Context.scale], [gid.cairo1.context.Context.translate] or [gid.cairo1.context.Context.setMatrix] and clip
      region with [gid.cairo1.context.Context.clip] prior to calling this function. Also, it
      is fine to modify the context with [gid.cairo1.context.Context.save] and
      [gid.cairo1.context.Context.pushGroup] prior to calling this function.
      
      Note that special-purpose widgets may contain special code for
      rendering to the screen and might appear differently on screen
      and when rendered using [gid.gtk3.widget.Widget.draw].
  
      Params:
        cr = a cairo context to draw to
  */
  void draw(gid.cairo1.context.Context cr) nothrow
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
  void ensureStyle() nothrow
  {
    gtk_widget_ensure_style(cast(GtkWidget*)this._cPtr);
  }

  /**
      Notifies the user about an input-related error on this widget.
      If the #GtkSettings:gtk-error-bell setting is true, it calls
      [gid.gdk3.window.Window.beep], otherwise it does nothing.
      
      Note that the effect of [gid.gdk3.window.Window.beep] can be configured in many
      ways, depending on the windowing backend and the desktop environment
      or window manager that is used.
  */
  void errorBell() nothrow
  {
    gtk_widget_error_bell(cast(GtkWidget*)this._cPtr);
  }

  /**
      Rarely-used function. This function is used to emit
      the event signals on a widget (those signals should never
      be emitted without using this function to do so).
      If you want to synthesize an event though, don’t use this function;
      instead, use [gid.gtk3.global.mainDoEvent] so the event will behave as if
      it were in the event queue. Don’t synthesize expose events; instead,
      use [gid.gdk3.window.Window.invalidateRect] to invalidate a region of the
      window.
  
      Params:
        event = a #GdkEvent
      Returns: return from the event signal emission (true if
                      the event was handled)
  */
  bool event(gid.gdk3.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_event(cast(GtkWidget*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Stops emission of #GtkWidget::child-notify signals on widget. The
      signals are queued until [gid.gtk3.widget.Widget.thawChildNotify] is called
      on widget.
      
      This is the analogue of [gid.gobject2.object.ObjectWrap.freezeNotify] for child properties.
  */
  void freezeChildNotify() nothrow
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
  gid.atk1.object.ObjectWrap getAccessible() nothrow
  {
    AtkObject* _cretval;
    _cretval = gtk_widget_get_accessible(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
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
  gid.gio2.action_group.ActionGroup getActionGroup(string prefix) nothrow
  {
    GActionGroup* _cretval;
    const(char)* _prefix = prefix.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_widget_get_action_group(cast(GtkWidget*)this._cPtr, _prefix);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.action_group.ActionGroup)(cast(GActionGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the baseline that has currently been allocated to widget.
      This function is intended to be used when implementing handlers
      for the #GtkWidget::draw function, and when allocating child
      widgets in #GtkWidget::size_allocate.
      Returns: the baseline of the widget, or -1 if none
  */
  int getAllocatedBaseline() nothrow
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
  int getAllocatedHeight() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_allocated_height(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the widget’s allocated size.
      
      This function returns the last values passed to
      [gid.gtk3.widget.Widget.sizeAllocateWithBaseline]. The value differs from
      the size returned in [gid.gtk4.widget.Widget.getAllocation] in that functions
      like [gid.gtk4.widget.Widget.setHalign] can adjust the allocation, but not
      the value returned by this function.
      
      If a widget is not visible, its allocated size is 0.
  
      Params:
        allocation = a pointer to a #GtkAllocation to copy to
        baseline = a pointer to an integer to copy to
  */
  void getAllocatedSize(out gid.gtk3.types.Allocation allocation, out int baseline) nothrow
  {
    gtk_widget_get_allocated_size(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation, cast(int*)&baseline);
  }

  /**
      Returns the width that has currently been allocated to widget.
      This function is intended to be used when implementing handlers
      for the #GtkWidget::draw function.
      Returns: the width of the widget
  */
  int getAllocatedWidth() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_allocated_width(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the widget’s allocation.
      
      Note, when implementing a #GtkContainer: a widget’s allocation will
      be its “adjusted” allocation, that is, the widget’s parent
      container typically calls [gid.gtk4.widget.Widget.sizeAllocate] with an
      allocation, and that allocation is then adjusted (to handle margin
      and alignment for example) before assignment to the widget.
      [gid.gtk4.widget.Widget.getAllocation] returns the adjusted allocation that
      was actually assigned to the widget. The adjusted allocation is
      guaranteed to be completely contained within the
      [gid.gtk4.widget.Widget.sizeAllocate] allocation, however. So a #GtkContainer
      is guaranteed that its children stay inside the assigned bounds,
      but not that they have exactly the bounds the container assigned.
      There is no way to get the original allocation assigned by
      [gid.gtk4.widget.Widget.sizeAllocate], since it isn’t stored; if a container
      implementation needs that information it will have to track it itself.
  
      Params:
        allocation = a pointer to a #GtkAllocation to copy to
  */
  void getAllocation(out gid.gtk3.types.Allocation allocation) nothrow
  {
    gtk_widget_get_allocation(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation);
  }

  /**
      Gets the first ancestor of widget with type widget_type. For example,
      `gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)` gets
      the first #GtkBox that’s an ancestor of widget. No reference will be
      added to the returned widget; it should not be unreferenced. See note
      about checking for a toplevel #GtkWindow in the docs for
      [gid.gtk3.widget.Widget.getToplevel].
      
      Note that unlike [gid.gtk4.widget.Widget.isAncestor], [gid.gtk4.widget.Widget.getAncestor]
      considers widget to be an ancestor of itself.
  
      Params:
        widgetType = ancestor type
      Returns: the ancestor widget, or null if not found
  */
  gid.gtk3.widget.Widget getAncestor(gid.gobject2.types.GType widgetType) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_ancestor(cast(GtkWidget*)this._cPtr, widgetType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the application intends to draw on the widget in
      an #GtkWidget::draw handler.
      
      See [gid.gtk3.widget.Widget.setAppPaintable]
      Returns: true if the widget is app paintable
  */
  bool getAppPaintable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_app_paintable(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget can be a default widget. See
      [gid.gtk3.widget.Widget.setCanDefault].
      Returns: true if widget can be a default widget, false otherwise
  */
  bool getCanDefault() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_default(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget can own the input focus. See
      [gid.gtk4.widget.Widget.setCanFocus].
      Returns: true if widget can own the input focus, false otherwise
  */
  bool getCanFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      This function is only for use in widget implementations. Obtains
      widget->requisition, unless someone has forced a particular
      geometry on the widget (e.g. with [gid.gtk4.widget.Widget.setSizeRequest]),
      in which case it returns that geometry instead of the widget's
      requisition.
      
      This function differs from [gid.gtk3.widget.Widget.sizeRequest] in that
      it retrieves the last size request value from widget->requisition,
      while [gid.gtk3.widget.Widget.sizeRequest] actually calls the "size_request" method
      on widget to compute the size request and fill in widget->requisition,
      and only then returns widget->requisition.
      
      Because this function does not call the “size_request” method, it
      can only be used when you know that widget->requisition is
      up-to-date, that is, [gid.gtk3.widget.Widget.sizeRequest] has been called
      since the last time a resize was queued. In general, only container
      implementations have this information; applications should use
      [gid.gtk3.widget.Widget.sizeRequest].
  
      Params:
        requisition = a #GtkRequisition to be filled in
  
      Deprecated: Use [gid.gtk4.widget.Widget.getPreferredSize] instead.
  */
  void getChildRequisition(out gid.gtk3.requisition.Requisition requisition) nothrow
  {
    gtk_widget_get_child_requisition(cast(GtkWidget*)this._cPtr, cast(GtkRequisition*)&requisition);
  }

  /**
      Gets the value set with [gid.gtk4.widget.Widget.setChildVisible].
      If you feel a need to use this function, your code probably
      needs reorganization.
      
      This function is only useful for container implementations and
      never should be called by an application.
      Returns: true if the widget is mapped with the parent.
  */
  bool getChildVisible() nothrow
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
      retrieved via [gid.gtk4.widget.Widget.getAllocation].
  
      Params:
        clip = a pointer to a #GtkAllocation to copy to
  */
  void getClip(out gid.gtk3.types.Allocation clip) nothrow
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
  gid.gtk3.clipboard.Clipboard getClipboard(gid.gdk3.atom.Atom selection) nothrow
  {
    GtkClipboard* _cretval;
    _cretval = gtk_widget_get_clipboard(cast(GtkWidget*)this._cPtr, selection ? cast(GdkAtom)selection._cPtr : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.clipboard.Clipboard)(cast(GtkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the composite name of a widget.
      Returns: the composite name of widget, or null if widget is not
          a composite child. The string should be freed when it is no
          longer needed.
  
      Deprecated: Use [gid.gtk4.widget_class.WidgetClass.setTemplate], or don’t use this API at all.
  */
  string getCompositeName() nothrow
  {
    char* _cretval;
    _cretval = gtk_widget_get_composite_name(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns whether device can interact with widget and its
      children. See [gid.gtk3.widget.Widget.setDeviceEnabled].
  
      Params:
        device = a #GdkDevice
      Returns: true is device is enabled for widget
  */
  bool getDeviceEnabled(gid.gdk3.device.Device device) nothrow
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
  gid.gdk3.types.EventMask getDeviceEvents(gid.gdk3.device.Device device) nothrow
  {
    GdkEventMask _cretval;
    _cretval = gtk_widget_get_device_events(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    gid.gdk3.types.EventMask _retval = cast(gid.gdk3.types.EventMask)_cretval;
    return _retval;
  }

  /**
      Gets the reading direction for a particular widget. See
      [gid.gtk4.widget.Widget.setDirection].
      Returns: the reading direction for the widget.
  */
  gid.gtk3.types.TextDirection getDirection() nothrow
  {
    GtkTextDirection _cretval;
    _cretval = gtk_widget_get_direction(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.TextDirection _retval = cast(gid.gtk3.types.TextDirection)_cretval;
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
  gid.gdk3.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gtk_widget_get_display(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the widget is double buffered.
      
      See [gid.gtk3.widget.Widget.setDoubleBuffered]
      Returns: true if the widget is double buffered
  */
  bool getDoubleBuffered() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_double_buffered(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the event mask (see #GdkEventMask) for the widget. These are the
      events that the widget will receive.
      
      Note: Internally, the widget event mask will be the logical OR of the event
      mask set through [gid.gtk3.widget.Widget.setEvents] or [gid.gtk3.widget.Widget.addEvents], and the
      event mask necessary to cater for every #GtkEventController created for the
      widget.
      Returns: event mask for widget
  */
  int getEvents() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_events(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the widget should grab focus when it is clicked with the mouse.
      See [gid.gtk4.widget.Widget.setFocusOnClick].
      Returns: true if the widget should grab focus when it is clicked with
                      the mouse.
  */
  bool getFocusOnClick() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_focus_on_click(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the font map that has been set with [gid.gtk4.widget.Widget.setFontMap].
      Returns: A #PangoFontMap, or null
  */
  gid.pango1.font_map.FontMap getFontMap() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = gtk_widget_get_font_map(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #cairo_font_options_t used for Pango rendering. When not set,
      the defaults font options for the #GdkScreen will be used.
      Returns: the #cairo_font_options_t or null if not set
  */
  gid.cairo1.font_options.FontOptions getFontOptions() nothrow
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = gtk_widget_get_font_options(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the frame clock for a widget. The frame clock is a global
      “ticker” that can be used to drive animations and repaints.  The
      most common reason to get the frame clock is to call
      [gid.gdk4.frame_clock.FrameClock.getFrameTime], in order to get a time to use for
      animating. For example you might record the start of the animation
      with an initial value from [gid.gdk4.frame_clock.FrameClock.getFrameTime], and
      then update the animation by calling
      [gid.gdk4.frame_clock.FrameClock.getFrameTime] again during each repaint.
      
      [gid.gdk4.frame_clock.FrameClock.requestPhase] will result in a new frame on the
      clock, but won’t necessarily repaint any widgets. To repaint a
      widget, you have to use [gid.gtk4.widget.Widget.queueDraw] which invalidates
      the widget (thus scheduling it to receive a draw on the next
      frame). [gid.gtk4.widget.Widget.queueDraw] will also end up requesting a frame
      on the appropriate frame clock.
      
      A widget’s frame clock will not change while the widget is
      mapped. Reparenting a widget (which implies a temporary unmap) can
      change the widget’s frame clock.
      
      Unrealized widgets do not have a frame clock.
      Returns: a #GdkFrameClock,
        or null if widget is unrealized
  */
  gid.gdk3.frame_clock.FrameClock getFrameClock() nothrow
  {
    GdkFrameClock* _cretval;
    _cretval = gtk_widget_get_frame_clock(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.frame_clock.FrameClock)(cast(GdkFrameClock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:halign property.
      
      For backwards compatibility reasons this method will never return
      [gid.gtk4.types.Align.Baseline], but instead it will convert it to
      [gid.gtk4.types.Align.Fill]. Baselines are not supported for horizontal
      alignment.
      Returns: the horizontal alignment of widget
  */
  gid.gtk3.types.Align getHalign() nothrow
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_halign(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.Align _retval = cast(gid.gtk3.types.Align)_cretval;
    return _retval;
  }

  /**
      Returns the current value of the has-tooltip property.  See
      #GtkWidget:has-tooltip for more information.
      Returns: current value of has-tooltip on widget.
  */
  bool getHasTooltip() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_has_tooltip(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget has a #GdkWindow of its own. See
      [gid.gtk3.widget.Widget.setHasWindow].
      Returns: true if widget has a window, false otherwise
  */
  bool getHasWindow() nothrow
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
      
      Containers should use [gid.gtk4.widget.Widget.computeExpand] rather than
      this function, to see whether a widget, or any of its children,
      has the expand flag set. If any child of a widget wants to
      expand, the parent may ask to expand also.
      
      This function only looks at the widget’s own hexpand flag, rather
      than computing whether the entire widget tree rooted at this widget
      wants to expand.
      Returns: whether hexpand flag is set
  */
  bool getHexpand() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_hexpand(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gid.gtk4.widget.Widget.setHexpand] has been used to
      explicitly set the expand flag on this widget.
      
      If hexpand is set, then it overrides any computed
      expand value based on child widgets. If hexpand is not
      set, then the expand value depends on whether any
      children of the widget would like to expand.
      
      There are few reasons to use this function, but it’s here
      for completeness and consistency.
      Returns: whether hexpand has been explicitly set
  */
  bool getHexpandSet() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_hexpand_set(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Whether the widget is mapped.
      Returns: true if the widget is mapped, false otherwise.
  */
  bool getMapped() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_mapped(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-bottom property.
      Returns: The bottom margin of widget
  */
  int getMarginBottom() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_bottom(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-end property.
      Returns: The end margin of widget
  */
  int getMarginEnd() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_end(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-left property.
      Returns: The left margin of widget
  
      Deprecated: Use [gid.gtk4.widget.Widget.getMarginStart] instead.
  */
  int getMarginLeft() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_left(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-right property.
      Returns: The right margin of widget
  
      Deprecated: Use [gid.gtk4.widget.Widget.getMarginEnd] instead.
  */
  int getMarginRight() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_right(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-start property.
      Returns: The start margin of widget
  */
  int getMarginStart() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_start(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:margin-top property.
      Returns: The top margin of widget
  */
  int getMarginTop() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_top(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the modifier mask the widget’s windowing system backend
      uses for a particular purpose.
      
      See [gid.gdk3.keymap.Keymap.getModifierMask].
  
      Params:
        intent = the use case for the modifier mask
      Returns: the modifier mask used for intent.
  */
  gid.gdk3.types.ModifierType getModifierMask(gid.gdk3.types.ModifierIntent intent) nothrow
  {
    GdkModifierType _cretval;
    _cretval = gtk_widget_get_modifier_mask(cast(GtkWidget*)this._cPtr, intent);
    gid.gdk3.types.ModifierType _retval = cast(gid.gdk3.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Returns the current modifier style for the widget. (As set by
      [gid.gtk3.widget.Widget.modifyStyle].) If no style has previously set, a new
      #GtkRcStyle will be created with all values unset, and set as the
      modifier style for the widget. If you make changes to this rc
      style, you must call [gid.gtk3.widget.Widget.modifyStyle], passing in the
      returned rc style, to make sure that your changes take effect.
      
      Caution: passing the style back to [gid.gtk3.widget.Widget.modifyStyle] will
      normally end up destroying it, because [gid.gtk3.widget.Widget.modifyStyle] copies
      the passed-in style and sets the copy as the new modifier style,
      thus dropping any reference to the old modifier style. Add a reference
      to the modifier style if you want to keep it alive.
      Returns: the modifier style for the widget.
            This rc style is owned by the widget. If you want to keep a
            pointer to value this around, you must add a refcount using
            [gid.gobject2.object.ObjectWrap.ref_].
  
      Deprecated: Use #GtkStyleContext with a custom #GtkStyleProvider instead
  */
  gid.gtk3.rc_style.RcStyle getModifierStyle() nothrow
  {
    GtkRcStyle* _cretval;
    _cretval = gtk_widget_get_modifier_style(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.rc_style.RcStyle)(cast(GtkRcStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the name of a widget. See [gid.gtk4.widget.Widget.setName] for the
      significance of widget names.
      Returns: name of the widget. This string is owned by GTK+ and
        should not be modified or freed
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_name(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the current value of the #GtkWidget:no-show-all property,
      which determines whether calls to [gid.gtk3.widget.Widget.showAll]
      will affect this widget.
      Returns: the current value of the “no-show-all” property.
  */
  bool getNoShowAll() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_no_show_all(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Fetches the requested opacity for this widget.
      See [gid.gtk4.widget.Widget.setOpacity].
      Returns: the requested opacity for this widget.
  */
  double getOpacity() nothrow
  {
    double _retval;
    _retval = gtk_widget_get_opacity(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets a #PangoContext with the appropriate font map, font description,
      and base direction for this widget. Unlike the context returned
      by [gid.gtk4.widget.Widget.createPangoContext], this context is owned by
      the widget (it can be used until the screen for the widget changes
      or the widget is removed from its toplevel), and will be updated to
      match any changes to the widget’s attributes. This can be tracked
      by using the #GtkWidget::screen-changed signal on the widget.
      Returns: the #PangoContext for the widget.
  */
  gid.pango1.context.Context getPangoContext() nothrow
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_get_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the parent container of widget.
      Returns: the parent container of widget, or null
  */
  gid.gtk3.widget.Widget getParent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_parent(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets widget’s parent window, or null if it does not have one.
      Returns: the parent window of widget, or null
        if it does not have a parent window.
  */
  gid.gdk3.window.Window getParentWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_widget_get_parent_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkWidgetPath representing widget, if the widget
      is not connected to a toplevel widget, a partial path will be
      created.
      Returns: The #GtkWidgetPath representing widget
  */
  gid.gtk3.widget_path.WidgetPath getPath() nothrow
  {
    GtkWidgetPath* _cretval;
    _cretval = gtk_widget_get_path(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.widget_path.WidgetPath(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the location of the mouse pointer in widget coordinates.
      Widget coordinates are a bit odd; for historical reasons, they are
      defined as widget->window coordinates for widgets that return true for
      [gid.gtk3.widget.Widget.getHasWindow]; and are relative to widget->allocation.x,
      widget->allocation.y otherwise.
  
      Params:
        x = return location for the X coordinate, or null
        y = return location for the Y coordinate, or null
  
      Deprecated: Use [gid.gdk3.window.Window.getDevicePosition] instead.
  */
  void getPointer(out int x, out int y) nothrow
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
  void getPreferredHeight(out int minimumHeight, out int naturalHeight) nothrow
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
  void getPreferredHeightAndBaselineForWidth(int width, out int minimumHeight, out int naturalHeight, out int minimumBaseline, out int naturalBaseline) nothrow
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
  void getPreferredHeightForWidth(int width, out int minimumHeight, out int naturalHeight) nothrow
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
      
      Use [gid.gtk3.widget.Widget.getPreferredHeightAndBaselineForWidth] if you want to support
      baseline alignment.
  
      Params:
        minimumSize = location for storing the minimum size, or null
        naturalSize = location for storing the natural size, or null
  */
  void getPreferredSize(out gid.gtk3.requisition.Requisition minimumSize, out gid.gtk3.requisition.Requisition naturalSize) nothrow
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
  void getPreferredWidth(out int minimumWidth, out int naturalWidth) nothrow
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
  void getPreferredWidthForHeight(int height, out int minimumWidth, out int naturalWidth) nothrow
  {
    gtk_widget_get_preferred_width_for_height(cast(GtkWidget*)this._cPtr, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Determines whether widget is realized.
      Returns: true if widget is realized, false otherwise
  */
  bool getRealized() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_realized(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget is always treated as the default widget
      within its toplevel when it has the focus, even if another widget
      is the default.
      
      See [gid.gtk4.widget.Widget.setReceivesDefault].
      Returns: true if widget acts as the default widget when focused,
                      false otherwise
  */
  bool getReceivesDefault() nothrow
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
  gid.gtk3.types.SizeRequestMode getRequestMode() nothrow
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_widget_get_request_mode(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.SizeRequestMode _retval = cast(gid.gtk3.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the widget’s requisition.
      
      This function should only be used by widget implementations in
      order to figure whether the widget’s requisition has actually
      changed after some internal state change (so that they can call
      [gid.gtk4.widget.Widget.queueResize] instead of [gid.gtk4.widget.Widget.queueDraw]).
      
      Normally, [gid.gtk3.widget.Widget.sizeRequest] should be used.
  
      Params:
        requisition = a pointer to a #GtkRequisition to copy to
  
      Deprecated: The #GtkRequisition cache on the widget was
        removed, If you need to cache sizes across requests and allocations,
        add an explicit cache to the widget in question instead.
  */
  void getRequisition(out gid.gtk3.requisition.Requisition requisition) nothrow
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
  
      Deprecated: Use [gid.gdk3.screen.Screen.getRootWindow] instead
  */
  gid.gdk3.window.Window getRootWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_widget_get_root_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the internal scale factor that maps from window coordinates
      to the actual device pixels. On traditional systems this is 1, on
      high density outputs, it can be a higher value (typically 2).
      
      See [gid.gdk3.window.Window.getScaleFactor].
      Returns: the scale factor for widget
  */
  int getScaleFactor() nothrow
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
  gid.gdk3.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gtk_widget_get_screen(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s sensitivity (in the sense of returning
      the value that has been set using [gid.gtk4.widget.Widget.setSensitive]).
      
      The effective sensitivity of a widget is however determined by both its
      own and its parent widget’s sensitivity. See [gid.gtk4.widget.Widget.isSensitive].
      Returns: true if the widget is sensitive
  */
  bool getSensitive() nothrow
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
  gid.gtk3.settings.Settings getSettings() nothrow
  {
    GtkSettings* _cretval;
    _cretval = gtk_widget_get_settings(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the size request that was explicitly set for the widget using
      [gid.gtk4.widget.Widget.setSizeRequest]. A value of -1 stored in width or
      height indicates that that dimension has not been set explicitly
      and the natural requisition of the widget will be used instead. See
      [gid.gtk4.widget.Widget.setSizeRequest]. To get the size a widget will
      actually request, call [gid.gtk4.widget.Widget.getPreferredSize] instead of
      this function.
  
      Params:
        width = return location for width, or null
        height = return location for height, or null
  */
  void getSizeRequest(out int width, out int height) nothrow
  {
    gtk_widget_get_size_request(cast(GtkWidget*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the widget’s state. See [gid.gtk3.widget.Widget.setState].
      Returns: the state of widget.
  
      Deprecated: Use [gid.gtk4.widget.Widget.getStateFlags] instead.
  */
  gid.gtk3.types.StateType getState() nothrow
  {
    GtkStateType _cretval;
    _cretval = gtk_widget_get_state(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.StateType _retval = cast(gid.gtk3.types.StateType)_cretval;
    return _retval;
  }

  /**
      Returns the widget state as a flag set. It is worth mentioning
      that the effective [gid.gtk4.types.StateFlags.Insensitive] state will be
      returned, that is, also based on parent insensitivity, even if
      widget itself is sensitive.
      
      Also note that if you are looking for a way to obtain the
      #GtkStateFlags to pass to a #GtkStyleContext method, you
      should look at [gid.gtk4.style_context.StyleContext.getState].
      Returns: The state flags for widget
  */
  gid.gtk3.types.StateFlags getStateFlags() nothrow
  {
    GtkStateFlags _cretval;
    _cretval = gtk_widget_get_state_flags(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.StateFlags _retval = cast(gid.gtk3.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Simply an accessor function that returns widget->style.
      Returns: the widget’s #GtkStyle
  
      Deprecated: Use #GtkStyleContext instead
  */
  gid.gtk3.style.Style getStyle() nothrow
  {
    GtkStyle* _cretval;
    _cretval = gtk_widget_get_style(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style.Style)(cast(GtkStyle*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the style context associated to widget. The returned object is
      guaranteed to be the same for the lifetime of widget.
      Returns: a #GtkStyleContext. This memory is owned by widget and
                 must not be freed.
  */
  gid.gtk3.style_context.StyleContext getStyleContext() nothrow
  {
    GtkStyleContext* _cretval;
    _cretval = gtk_widget_get_style_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style_context.StyleContext)(cast(GtkStyleContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if widget is multiple pointer aware. See
      [gid.gtk3.widget.Widget.setSupportMultidevice] for more information.
      Returns: true if widget is multidevice aware.
  */
  bool getSupportMultidevice() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_support_multidevice(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Fetch an object build from the template XML for widget_type in this widget instance.
      
      This will only report children which were previously declared with
      [gid.gtk4.widget_class.WidgetClass.bindTemplateChildFull] or one of its
      variants.
      
      This function is only meant to be called for code which is private to the widget_type which
      declared the child and is meant for language bindings which cannot easily make use
      of the GObject structure offsets.
  
      Params:
        widgetType = The #GType to get a template child for
        name = The “id” of the child defined in the template XML
      Returns: The object built in the template XML with the id name
  */
  gid.gobject2.object.ObjectWrap getTemplateChild(gid.gobject2.types.GType widgetType, string name) nothrow
  {
    GObject* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_widget_get_template_child(cast(GtkWidget*)this._cPtr, widgetType, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for widget.
      Returns: the tooltip text, or null. You should free the
          returned string with [gid.glib2.global.gfree] when done.
  */
  string getTooltipMarkup() nothrow
  {
    char* _cretval;
    _cretval = gtk_widget_get_tooltip_markup(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for widget.
      Returns: the tooltip text, or null. You should free the
          returned string with [gid.glib2.global.gfree] when done.
  */
  string getTooltipText() nothrow
  {
    char* _cretval;
    _cretval = gtk_widget_get_tooltip_text(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns the #GtkWindow of the current tooltip. This can be the
      GtkWindow created by default, or the custom tooltip window set
      using [gid.gtk3.widget.Widget.setTooltipWindow].
      Returns: The #GtkWindow of the current tooltip.
  */
  gid.gtk3.window.Window getTooltipWindow() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_widget_get_tooltip_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function returns the topmost widget in the container hierarchy
      widget is a part of. If widget has no parent widgets, it will be
      returned as the topmost widget. No reference will be added to the
      returned widget; it should not be unreferenced.
      
      Note the difference in behavior vs. [gid.gtk4.widget.Widget.getAncestor];
      `gtk_widget_get_ancestor (widget, GTK_TYPE_WINDOW)`
      would return
      null if widget wasn’t inside a toplevel window, and if the
      window was inside a #GtkWindow-derived widget which was in turn
      inside the toplevel #GtkWindow. While the second case may
      seem unlikely, it actually happens when a #GtkPlug is embedded
      inside a #GtkSocket within the same application.
      
      To reliably find the toplevel #GtkWindow, use
      [gid.gtk3.widget.Widget.getToplevel] and call GTK_IS_WINDOW()
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
  gid.gtk3.widget.Widget getToplevel() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_toplevel(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:valign property.
      
      For backwards compatibility reasons this method will never return
      [gid.gtk4.types.Align.Baseline], but instead it will convert it to
      [gid.gtk4.types.Align.Fill]. If your widget want to support baseline aligned
      children it must use [gid.gtk3.widget.Widget.getValignWithBaseline], or
      `g_object_get (widget, "valign", &value, NULL)`, which will
      also report the true value.
      Returns: the vertical alignment of widget, ignoring baseline alignment
  */
  gid.gtk3.types.Align getValign() nothrow
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_valign(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.Align _retval = cast(gid.gtk3.types.Align)_cretval;
    return _retval;
  }

  /**
      Gets the value of the #GtkWidget:valign property, including
      [gid.gtk4.types.Align.Baseline].
      Returns: the vertical alignment of widget
  */
  gid.gtk3.types.Align getValignWithBaseline() nothrow
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_valign_with_baseline(cast(GtkWidget*)this._cPtr);
    gid.gtk3.types.Align _retval = cast(gid.gtk3.types.Align)_cretval;
    return _retval;
  }

  /**
      Gets whether the widget would like any available extra vertical
      space.
      
      See [gid.gtk4.widget.Widget.getHexpand] for more detail.
      Returns: whether vexpand flag is set
  */
  bool getVexpand() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_vexpand(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gid.gtk4.widget.Widget.setVexpand] has been used to
      explicitly set the expand flag on this widget.
      
      See [gid.gtk4.widget.Widget.getHexpandSet] for more detail.
      Returns: whether vexpand has been explicitly set
  */
  bool getVexpandSet() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_vexpand_set(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget is visible. If you want to
      take into account whether the widget’s parent is also marked as
      visible, use [gid.gtk4.widget.Widget.isVisible] instead.
      
      This function does not check if the widget is obscured in any way.
      
      See [gid.gtk4.widget.Widget.setVisible].
      Returns: true if the widget is visible
  */
  bool getVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the visual that will be used to render widget.
      Returns: the visual for widget
  */
  gid.gdk3.visual.Visual getVisual() nothrow
  {
    GdkVisual* _cretval;
    _cretval = gtk_widget_get_visual(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s window if it is realized, null otherwise
      Returns: widget’s window.
  */
  gid.gdk3.window.Window getWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_widget_get_window(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
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
  void grabAdd() nothrow
  {
    gtk_grab_add(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes widget to become the default widget. widget must be able to be
      a default widget; typically you would ensure this yourself
      by calling [gid.gtk3.widget.Widget.setCanDefault] with a true value.
      The default widget is activated when
      the user presses Enter in a window. Default widgets must be
      activatable, that is, [gid.gtk4.widget.Widget.activate] should affect them. Note
      that #GtkEntry widgets require the “activates-default” property
      set to true before they activate the default widget when Enter
      is pressed and the #GtkEntry is focused.
  */
  void grabDefault() nothrow
  {
    gtk_widget_grab_default(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes widget to have the keyboard focus for the #GtkWindow it's
      inside. widget must be a focusable widget, such as a #GtkEntry;
      something like #GtkFrame won’t work.
      
      More precisely, it must have the `GTK_CAN_FOCUS` flag set. Use
      [gid.gtk4.widget.Widget.setCanFocus] to modify that flag.
      
      The widget also needs to be realized and mapped. This is indicated by the
      related signals. Grabbing the focus immediately after creating the widget
      will likely fail and cause critical warnings.
  */
  void grabFocus() nothrow
  {
    gtk_widget_grab_focus(cast(GtkWidget*)this._cPtr);
  }

  /**
      Removes the grab from the given widget.
      
      You have to pair calls to [gid.gtk3.widget.Widget.grabAdd] and [gid.gtk3.widget.Widget.grabRemove].
      
      If widget does not have the grab, this function does nothing.
  */
  void grabRemove() nothrow
  {
    gtk_grab_remove(cast(GtkWidget*)this._cPtr);
  }

  /**
      Determines whether widget is the current default widget within its
      toplevel. See [gid.gtk3.widget.Widget.setCanDefault].
      Returns: true if widget is the current default widget within
            its toplevel, false otherwise
  */
  bool hasDefault() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_default(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget has the global input focus. See
      [gid.gtk4.widget.Widget.isFocus] for the difference between having the global
      input focus, and only having the focus within a toplevel.
      Returns: true if the widget has the global input focus.
  */
  bool hasFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget is currently grabbing events, so it
      is the only widget receiving input events (keyboard and mouse).
      
      See also [gid.gtk3.widget.Widget.grabAdd].
      Returns: true if the widget is in the grab_widgets stack
  */
  bool hasGrab() nothrow
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
  bool hasRcStyle() nothrow
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
  bool hasScreen() nothrow
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
      widget. See [gid.gtk4.window.Window.getFocusVisible] for more information
      about focus indication.
      
      To find out if the widget has the global input focus, use
      [gid.gtk4.widget.Widget.hasFocus].
      Returns: true if the widget should display a “focus rectangle”
  */
  bool hasVisibleFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_visible_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Reverses the effects of [gid.gtk4.widget.Widget.show], causing the widget to be
      hidden (invisible to the user).
  */
  void hide() nothrow
  {
    gtk_widget_hide(cast(GtkWidget*)this._cPtr);
  }

  /**
      Utility function; intended to be connected to the #GtkWidget::delete-event
      signal on a #GtkWindow. The function calls [gid.gtk4.widget.Widget.hide] on its
      argument, then returns true. If connected to ::delete-event, the
      result is that clicking the close button for a window (on the
      window frame, top right corner usually) will hide but not destroy
      the window. By default, GTK+ destroys windows when ::delete-event
      is received.
      Returns: true
  */
  bool hideOnDelete() nothrow
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
  bool inDestruction() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_in_destruction(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Creates and initializes child widgets defined in templates. This
      function must be called in the instance initializer for any
      class which assigned itself a template using [gid.gtk4.widget_class.WidgetClass.setTemplate]
      
      It is important to call this function in the instance initializer
      of a #GtkWidget subclass and not in #GObject.constructed() or
      #GObject.constructor() for two reasons.
      
      One reason is that generally derived widgets will assume that parent
      class composite widgets have been created in their instance
      initializers.
      
      Another reason is that when calling [gid.gobject2.object.ObjectWrap.new_] on a widget with
      composite templates, it’s important to build the composite widgets
      before the construct properties are set. Properties passed to [gid.gobject2.object.ObjectWrap.new_]
      should take precedence over properties set in the private template XML.
  */
  void initTemplate() nothrow
  {
    gtk_widget_init_template(cast(GtkWidget*)this._cPtr);
  }

  /**
      Sets an input shape for this widget’s GDK window. This allows for
      windows which react to mouse click in a nonrectangular region, see
      [gid.gdk3.window.Window.inputShapeCombineRegion] for more information.
  
      Params:
        region = shape to be added, or null to remove an existing shape
  */
  void inputShapeCombineRegion(gid.cairo1.region.Region region = null) nothrow
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
  void insertActionGroup(string name, gid.gio2.action_group.ActionGroup group = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_widget_insert_action_group(cast(GtkWidget*)this._cPtr, _name, group ? cast(GActionGroup*)(cast(gid.gobject2.object.ObjectWrap)group)._cPtr(No.Dup) : null);
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
  bool intersect(gid.gdk3.rectangle.Rectangle area, out gid.gdk3.rectangle.Rectangle intersection) nothrow
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
  bool isAncestor(gid.gtk3.widget.Widget ancestor) nothrow
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
      window in its hierarchy (as set by [gid.gdk3.window.Window.setComposited]).
      Returns: true if the widget can rely on its alpha
        channel being drawn correctly.
  
      Deprecated: Use [gid.gdk3.screen.Screen.isComposited] instead.
  */
  bool isComposited() nothrow
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
  bool isDrawable() nothrow
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
  bool isFocus() nothrow
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
  bool isSensitive() nothrow
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
  bool isToplevel() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_toplevel(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget and all its parents are marked as
      visible.
      
      This function does not check if the widget is obscured in any way.
      
      See also [gid.gtk4.widget.Widget.getVisible] and [gid.gtk4.widget.Widget.setVisible]
      Returns: true if the widget and all its parents are visible
  */
  bool isVisible() nothrow
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
      [gid.gtk4.widget.Widget.childFocus]:
      
      When true is returned, stay in the widget, the failed keyboard
      navigation is OK and/or there is nowhere we can/should move the
      focus to.
      
      When false is returned, the caller should continue with keyboard
      navigation outside the widget, e.g. by calling
      [gid.gtk4.widget.Widget.childFocus] on the widget’s toplevel.
      
      The default ::keynav-failed handler returns false for
      [gid.gtk4.types.DirectionType.TabForward] and [gid.gtk4.types.DirectionType.TabBackward]. For the other
      values of #GtkDirectionType it returns true.
      
      Whenever the default handler returns true, it also calls
      [gid.gtk4.widget.Widget.errorBell] to notify the user of the failed keyboard
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
  bool keynavFailed(gid.gtk3.types.DirectionType direction) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_keynav_failed(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Lists the closures used by widget for accelerator group connections
      with [gid.gtk3.accel_group.AccelGroup.connectByPath] or [gid.gtk3.accel_group.AccelGroup.connect].
      The closures can be used to monitor accelerator changes on widget,
      by connecting to the GtkAccelGroup::accel-changed signal of the
      #GtkAccelGroup of a closure which can be found out with
      [gid.gtk3.accel_group.AccelGroup.fromAccelClosure].
      Returns: a newly allocated #GList of closures
  */
  gid.gobject2.closure.Closure[] listAccelClosures() nothrow
  {
    GList* _cretval;
    _cretval = gtk_widget_list_accel_closures(cast(GtkWidget*)this._cPtr);
    auto _retval = gListToD!(gid.gobject2.closure.Closure, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Retrieves a null-terminated array of strings containing the prefixes of
      #GActionGroup's available to widget.
      Returns: a null-terminated array of strings.
  */
  string[] listActionPrefixes() nothrow
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
        _retval[i] = _cretval[i].fromCString!(No.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns a newly allocated list of the widgets, normally labels, for
      which this widget is the target of a mnemonic (see for example,
      [gid.gtk4.label.Label.setMnemonicWidget]).
      
      The widgets in the list are not individually referenced. If you
      want to iterate through the list and perform actions involving
      callbacks that might destroy the widgets, you
      must call `g_list_foreach (result,
      (GFunc)g_object_ref, NULL)` first, and then unref all the
      widgets afterwards.
      Returns: the list of
         mnemonic labels; free this list
         with [gid.glib2.list.List.free] when you are done with it.
  */
  gid.gtk3.widget.Widget[] listMnemonicLabels() nothrow
  {
    GList* _cretval;
    _cretval = gtk_widget_list_mnemonic_labels(cast(GtkWidget*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      This function is only for use in widget implementations. Causes
      a widget to be mapped if it isn’t already.
  */
  void map() nothrow
  {
    gtk_widget_map(cast(GtkWidget*)this._cPtr);
  }

  /**
      Emits the #GtkWidget::mnemonic-activate signal.
  
      Params:
        groupCycling = true if there are other widgets with the same mnemonic
      Returns: true if the signal has been handled
  */
  bool mnemonicActivate(bool groupCycling) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_mnemonic_activate(cast(GtkWidget*)this._cPtr, groupCycling);
    return _retval;
  }

  /**
      Sets the base color for a widget in a particular state.
      All other style values are left untouched. The base color
      is the background color used along with the text color
      (see [gid.gtk3.widget.Widget.modifyText]) for widgets such as #GtkEntry
      and #GtkTextView. See also [gid.gtk3.widget.Widget.modifyStyle].
      
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
              calls to of [gid.gtk3.widget.Widget.modifyBase].
  
      Deprecated: Use [gid.gtk3.widget.Widget.overrideBackgroundColor] instead
  */
  void modifyBase(gid.gtk3.types.StateType state, gid.gdk3.color.Color* color = null) nothrow
  {
    gtk_widget_modify_base(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)color);
  }

  /**
      Sets the background color for a widget in a particular state.
      
      All other style values are left untouched.
      See also [gid.gtk3.widget.Widget.modifyStyle].
      
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
              calls to of [gid.gtk3.widget.Widget.modifyBg].
  
      Deprecated: Use [gid.gtk3.widget.Widget.overrideBackgroundColor] instead
  */
  void modifyBg(gid.gtk3.types.StateType state, gid.gdk3.color.Color* color = null) nothrow
  {
    gtk_widget_modify_bg(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)color);
  }

  /**
      Sets the cursor color to use in a widget, overriding the #GtkWidget
      cursor-color and secondary-cursor-color
      style properties.
      
      All other style values are left untouched.
      See also [gid.gtk3.widget.Widget.modifyStyle].
  
      Params:
        primary = the color to use for primary cursor (does not
              need to be allocated), or null to undo the effect of previous
              calls to of [gid.gtk3.widget.Widget.modifyCursor].
        secondary = the color to use for secondary cursor (does
              not need to be allocated), or null to undo the effect of
              previous calls to of [gid.gtk3.widget.Widget.modifyCursor].
  
      Deprecated: Use [gid.gtk3.widget.Widget.overrideCursor] instead.
  */
  void modifyCursor(gid.gdk3.color.Color* primary = null, gid.gdk3.color.Color* secondary = null) nothrow
  {
    gtk_widget_modify_cursor(cast(GtkWidget*)this._cPtr, cast(const(GdkColor)*)primary, cast(const(GdkColor)*)secondary);
  }

  /**
      Sets the foreground color for a widget in a particular state.
      
      All other style values are left untouched.
      See also [gid.gtk3.widget.Widget.modifyStyle].
  
      Params:
        state = the state for which to set the foreground color
        color = the color to assign (does not need to be allocated),
              or null to undo the effect of previous calls to
              of [gid.gtk3.widget.Widget.modifyFg].
  
      Deprecated: Use [gid.gtk3.widget.Widget.overrideColor] instead
  */
  void modifyFg(gid.gtk3.types.StateType state, gid.gdk3.color.Color* color = null) nothrow
  {
    gtk_widget_modify_fg(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)color);
  }

  /**
      Sets the font to use for a widget.
      
      All other style values are left untouched.
      See also [gid.gtk3.widget.Widget.modifyStyle].
  
      Params:
        fontDesc = the font description to use, or null
              to undo the effect of previous calls to [gid.gtk3.widget.Widget.modifyFont]
  
      Deprecated: Use [gid.gtk3.widget.Widget.overrideFont] instead
  */
  void modifyFont(gid.pango1.font_description.FontDescription fontDesc = null) nothrow
  {
    gtk_widget_modify_font(cast(GtkWidget*)this._cPtr, fontDesc ? cast(PangoFontDescription*)fontDesc._cPtr(No.Dup) : null);
  }

  /**
      Modifies style values on the widget.
      
      Modifications made using this technique take precedence over
      style values set via an RC file, however, they will be overridden
      if a style is explicitly set on the widget using [gid.gtk3.widget.Widget.setStyle].
      The #GtkRcStyle-struct is designed so each field can either be
      set or unset, so it is possible, using this function, to modify some
      style values and leave the others unchanged.
      
      Note that modifications made with this function are not cumulative
      with previous calls to [gid.gtk3.widget.Widget.modifyStyle] or with such
      functions as [gid.gtk3.widget.Widget.modifyFg]. If you wish to retain
      previous values, you must first call [gid.gtk3.widget.Widget.getModifierStyle],
      make your modifications to the returned style, then call
      [gid.gtk3.widget.Widget.modifyStyle] with that style. On the other hand,
      if you first call [gid.gtk3.widget.Widget.modifyStyle], subsequent calls
      to such functions [gid.gtk3.widget.Widget.modifyFg] will have a cumulative
      effect with the initial modifications.
  
      Params:
        style = the #GtkRcStyle-struct holding the style modifications
  
      Deprecated: Use #GtkStyleContext with a custom #GtkStyleProvider instead
  */
  void modifyStyle(gid.gtk3.rc_style.RcStyle style) nothrow
  {
    gtk_widget_modify_style(cast(GtkWidget*)this._cPtr, style ? cast(GtkRcStyle*)style._cPtr(No.Dup) : null);
  }

  /**
      Sets the text color for a widget in a particular state.
      
      All other style values are left untouched.
      The text color is the foreground color used along with the
      base color (see [gid.gtk3.widget.Widget.modifyBase]) for widgets such
      as #GtkEntry and #GtkTextView.
      See also [gid.gtk3.widget.Widget.modifyStyle].
  
      Params:
        state = the state for which to set the text color
        color = the color to assign (does not need to
              be allocated), or null to undo the effect of previous
              calls to of [gid.gtk3.widget.Widget.modifyText].
  
      Deprecated: Use [gid.gtk3.widget.Widget.overrideColor] instead
  */
  void modifyText(gid.gtk3.types.StateType state, gid.gdk3.color.Color* color = null) nothrow
  {
    gtk_widget_modify_text(cast(GtkWidget*)this._cPtr, state, cast(const(GdkColor)*)color);
  }

  /**
      Sets the background color to use for a widget.
      
      All other style values are left untouched.
      See [gid.gtk3.widget.Widget.overrideColor].
  
      Params:
        state = the state for which to set the background color
        color = the color to assign, or null to undo the effect
              of previous calls to [gid.gtk3.widget.Widget.overrideBackgroundColor]
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the way a widget renders its background
          you should use a custom CSS style, through an application-specific
          #GtkStyleProvider and a CSS style class. You can also override the default
          drawing of a widget through the #GtkWidget::draw signal, and use Cairo to
          draw a specific color, regardless of the CSS style.
  */
  void overrideBackgroundColor(gid.gtk3.types.StateFlags state, gid.gdk3.rgba.RGBA* color = null) nothrow
  {
    gtk_widget_override_background_color(cast(GtkWidget*)this._cPtr, state, cast(const(GdkRGBA)*)color);
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
      widget/container implementation through [gid.gtk4.style_context.StyleContext.addClass].
      
      This way, your widget library can install a #GtkCssProvider
      with the [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_FALLBACK] priority in order
      to provide a default styling for those widgets that need so, and
      this theming may fully overridden by the user’s theme.
      
      Note that for complex widgets this may bring in undesired
      results (such as uniform background color everywhere), in
      these cases it is better to fully style such widgets through a
      #GtkCssProvider with the [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_APPLICATION]
      priority.
  
      Params:
        state = the state for which to set the color
        color = the color to assign, or null to undo the effect
              of previous calls to [gid.gtk3.widget.Widget.overrideColor]
  
      Deprecated: Use a custom style provider and style classes instead
  */
  void overrideColor(gid.gtk3.types.StateFlags state, gid.gdk3.rgba.RGBA* color = null) nothrow
  {
    gtk_widget_override_color(cast(GtkWidget*)this._cPtr, state, cast(const(GdkRGBA)*)color);
  }

  /**
      Sets the cursor color to use in a widget, overriding the
      cursor-color and secondary-cursor-color
      style properties. All other style values are left untouched.
      See also [gid.gtk3.widget.Widget.modifyStyle].
      
      Note that the underlying properties have the #GdkColor type,
      so the alpha value in primary and secondary will be ignored.
  
      Params:
        cursor = the color to use for primary cursor (does not need to be
              allocated), or null to undo the effect of previous calls to
              of [gid.gtk3.widget.Widget.overrideCursor].
        secondaryCursor = the color to use for secondary cursor (does not
              need to be allocated), or null to undo the effect of previous
              calls to of [gid.gtk3.widget.Widget.overrideCursor].
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the color used to render the primary
          and secondary cursors you should use a custom CSS style, through an
          application-specific #GtkStyleProvider and a CSS style class.
  */
  void overrideCursor(gid.gdk3.rgba.RGBA* cursor = null, gid.gdk3.rgba.RGBA* secondaryCursor = null) nothrow
  {
    gtk_widget_override_cursor(cast(GtkWidget*)this._cPtr, cast(const(GdkRGBA)*)cursor, cast(const(GdkRGBA)*)secondaryCursor);
  }

  /**
      Sets the font to use for a widget. All other style values are
      left untouched. See [gid.gtk3.widget.Widget.overrideColor].
  
      Params:
        fontDesc = the font description to use, or null to undo
              the effect of previous calls to [gid.gtk3.widget.Widget.overrideFont]
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the font a widget uses to render its text
          you should use a custom CSS style, through an application-specific
          #GtkStyleProvider and a CSS style class.
  */
  void overrideFont(gid.pango1.font_description.FontDescription fontDesc = null) nothrow
  {
    gtk_widget_override_font(cast(GtkWidget*)this._cPtr, fontDesc ? cast(const(PangoFontDescription)*)fontDesc._cPtr(No.Dup) : null);
  }

  /**
      Sets a symbolic color for a widget.
      
      All other style values are left untouched.
      See [gid.gtk3.widget.Widget.overrideColor] for overriding the foreground
      or background color.
  
      Params:
        name = the name of the symbolic color to modify
        color = the color to assign (does not need
              to be allocated), or null to undo the effect of previous
              calls to [gid.gtk3.widget.Widget.overrideSymbolicColor]
  
      Deprecated: This function is not useful in the context of CSS-based
          rendering. If you wish to change the color used to render symbolic icons
          you should use a custom CSS style, through an application-specific
          #GtkStyleProvider and a CSS style class.
  */
  void overrideSymbolicColor(string name, gid.gdk3.rgba.RGBA* color = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_widget_override_symbolic_color(cast(GtkWidget*)this._cPtr, _name, cast(const(GdkRGBA)*)color);
  }

  /**
      Obtains the full path to widget. The path is simply the name of a
      widget and all its parents in the container hierarchy, separated by
      periods. The name of a widget comes from
      [gid.gtk4.widget.Widget.getName]. Paths are used to apply styles to a widget
      in gtkrc configuration files. Widget names are the type of the
      widget by default (e.g. “GtkButton”) or can be set to an
      application-specific value with [gid.gtk4.widget.Widget.setName]. By setting
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
  
      Deprecated: Use [gid.gtk3.widget.Widget.getPath] instead
  */
  void path(out uint pathLength, out string path, out string pathReversed) nothrow
  {
    char* _path;
    char* _pathReversed;
    gtk_widget_path(cast(GtkWidget*)this._cPtr, cast(uint*)&pathLength, &_path, &_pathReversed);
    path = _path.fromCString!(Yes.Free);
    pathReversed = _pathReversed.fromCString!(Yes.Free);
  }

  /**
      This function is only for use in widget implementations.
      
      Flags the widget for a rerun of the GtkWidgetClass::size_allocate
      function. Use this function instead of [gid.gtk4.widget.Widget.queueResize]
      when the widget's size request didn't change but it wants to
      reposition its contents.
      
      An example user of this function is [gid.gtk4.widget.Widget.setHalign].
  */
  void queueAllocate() nothrow
  {
    gtk_widget_queue_allocate(cast(GtkWidget*)this._cPtr);
  }

  /**
      Mark widget as needing to recompute its expand flags. Call
      this function when setting legacy expand child properties
      on the child of a container.
      
      See [gid.gtk4.widget.Widget.computeExpand].
  */
  void queueComputeExpand() nothrow
  {
    gtk_widget_queue_compute_expand(cast(GtkWidget*)this._cPtr);
  }

  /**
      Equivalent to calling [gid.gtk3.widget.Widget.queueDrawArea] for the
      entire area of a widget.
  */
  void queueDraw() nothrow
  {
    gtk_widget_queue_draw(cast(GtkWidget*)this._cPtr);
  }

  /**
      Convenience function that calls [gid.gtk3.widget.Widget.queueDrawRegion] on
      the region created from the given coordinates.
      
      The region here is specified in widget coordinates.
      Widget coordinates are a bit odd; for historical reasons, they are
      defined as widget->window coordinates for widgets that return true for
      [gid.gtk3.widget.Widget.getHasWindow], and are relative to widget->allocation.x,
      widget->allocation.y otherwise.
      
      width or height may be 0, in this case this function does
      nothing. Negative values for width and height are not allowed.
  
      Params:
        x = x coordinate of upper-left corner of rectangle to redraw
        y = y coordinate of upper-left corner of rectangle to redraw
        width = width of region to draw
        height = height of region to draw
  */
  void queueDrawArea(int x, int y, int width, int height) nothrow
  {
    gtk_widget_queue_draw_area(cast(GtkWidget*)this._cPtr, x, y, width, height);
  }

  /**
      Invalidates the area of widget defined by region by calling
      [gid.gdk3.window.Window.invalidateRegion] on the widget’s window and all its
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
  void queueDrawRegion(gid.cairo1.region.Region region) nothrow
  {
    gtk_widget_queue_draw_region(cast(GtkWidget*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      This function is only for use in widget implementations.
      Flags a widget to have its size renegotiated; should
      be called when a widget for some reason has a new size request.
      For example, when you change the text in a #GtkLabel, #GtkLabel
      queues a resize to ensure there’s enough space for the new text.
      
      Note that you cannot call [gid.gtk4.widget.Widget.queueResize] on a widget
      from inside its implementation of the GtkWidgetClass::size_allocate
      virtual method. Calls to [gid.gtk4.widget.Widget.queueResize] from inside
      GtkWidgetClass::size_allocate will be silently ignored.
  */
  void queueResize() nothrow
  {
    gtk_widget_queue_resize(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function works like [gid.gtk4.widget.Widget.queueResize],
      except that the widget is not invalidated.
  */
  void queueResizeNoRedraw() nothrow
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
      [gid.gtk4.widget.Widget.realize] realizes the widget’s parents in addition to
      widget itself. If a widget is not yet inside a toplevel window
      when you realize it, bad things will happen.
      
      This function is primarily used in widget implementations, and
      isn’t very useful otherwise. Many times when you think you might
      need it, a better approach is to connect to a signal that will be
      called after the widget is realized automatically, such as
      #GtkWidget::draw. Or simply g_signal_connect () to the
      #GtkWidget::realize signal.
  */
  void realize() nothrow
  {
    gtk_widget_realize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Computes the intersection of a widget’s area and region, returning
      the intersection. The result may be empty, use [gid.cairo1.region.Region.isEmpty] to
      check.
  
      Params:
        region = a #cairo_region_t, in the same coordinate system as
                   widget->allocation. That is, relative to widget->window
                   for widgets which return false from [gid.gtk3.widget.Widget.getHasWindow];
                   relative to the parent window of widget->window otherwise.
      Returns: A newly allocated region holding the intersection of widget
            and region.
  
      Deprecated: Use [gid.gtk4.widget.Widget.getAllocation] and
            [gid.cairo1.region.Region.intersectRectangle] to get the same behavior.
  */
  gid.cairo1.region.Region regionIntersect(gid.cairo1.region.Region region) nothrow
  {
    cairo_region_t* _cretval;
    _cretval = gtk_widget_region_intersect(cast(GtkWidget*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.cairo1.region.Region(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Registers a #GdkWindow with the widget and sets it up so that
      the widget receives events for it. Call [gid.gtk3.widget.Widget.unregisterWindow]
      when destroying the window.
      
      Before 3.8 you needed to call [gid.gdk3.window.Window.setUserData] directly to set
      this up. This is now deprecated and you should use [gid.gtk3.widget.Widget.registerWindow]
      instead. Old code will keep working as is, although some new features like
      transparency might not work perfectly.
  
      Params:
        window = a #GdkWindow
  */
  void registerWindow(gid.gdk3.window.Window window) nothrow
  {
    gtk_widget_register_window(cast(GtkWidget*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Removes an accelerator from widget, previously installed with
      [gid.gtk3.widget.Widget.addAccelerator].
  
      Params:
        accelGroup = accel group for this widget
        accelKey = GDK keyval of the accelerator
        accelMods = modifier key combination of the accelerator
      Returns: whether an accelerator was installed and could be removed
  */
  bool removeAccelerator(gid.gtk3.accel_group.AccelGroup accelGroup, uint accelKey, gid.gdk3.types.ModifierType accelMods) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_remove_accelerator(cast(GtkWidget*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null, accelKey, accelMods);
    return _retval;
  }

  /**
      Removes a widget from the list of mnemonic labels for
      this widget. (See [gid.gtk4.widget.Widget.listMnemonicLabels]). The widget
      must have previously been added to the list with
      [gid.gtk4.widget.Widget.addMnemonicLabel].
  
      Params:
        label = a #GtkWidget that was previously set as a mnemonic label for
                  widget with [gid.gtk4.widget.Widget.addMnemonicLabel].
  */
  void removeMnemonicLabel(gid.gtk3.widget.Widget label) nothrow
  {
    gtk_widget_remove_mnemonic_label(cast(GtkWidget*)this._cPtr, label ? cast(GtkWidget*)label._cPtr(No.Dup) : null);
  }

  /**
      Removes a tick callback previously registered with
      [gid.gtk4.widget.Widget.addTickCallback].
  
      Params:
        id = an id returned by [gid.gtk4.widget.Widget.addTickCallback]
  */
  void removeTickCallback(uint id) nothrow
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
      freed after use with [gid.gobject2.object.ObjectWrap.unref].
  
      Params:
        stockId = a stock ID
        size = a stock size (#GtkIconSize). A size of `(GtkIconSize)-1`
              means render at the size of the source and don’t scale (if there are
              multiple source sizes, GTK+ picks one of the available sizes).
        detail = render detail to pass to theme engine
      Returns: a new pixbuf, or null if the
            stock ID wasn’t known
  
      Deprecated: Use [gid.gtk3.widget.Widget.renderIconPixbuf] instead.
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf renderIcon(string stockId, gid.gtk3.types.IconSize size, string detail = null) nothrow
  {
    GdkPixbuf* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    const(char)* _detail = detail.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_widget_render_icon(cast(GtkWidget*)this._cPtr, _stockId, size, _detail);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
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
      after use with [gid.gobject2.object.ObjectWrap.unref].
  
      Params:
        stockId = a stock ID
        size = a stock size (#GtkIconSize). A size of `(GtkIconSize)-1`
              means render at the size of the source and don’t scale (if there are
              multiple source sizes, GTK+ picks one of the available sizes).
      Returns: a new pixbuf, or null if the
            stock ID wasn’t known
  
      Deprecated: Use [gid.gtk3.icon_theme.IconTheme.loadIcon] instead.
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf renderIconPixbuf(string stockId, gid.gtk3.types.IconSize size) nothrow
  {
    GdkPixbuf* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_widget_render_icon_pixbuf(cast(GtkWidget*)this._cPtr, _stockId, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Moves a widget from one #GtkContainer to another, handling reference
      count issues to avoid destroying the widget.
  
      Params:
        newParent = a #GtkContainer to move the widget into
  
      Deprecated: Use [gid.gtk3.container.Container.remove] and [gid.gtk3.container.Container.add].
  */
  void reparent(gid.gtk3.widget.Widget newParent) nothrow
  {
    gtk_widget_reparent(cast(GtkWidget*)this._cPtr, newParent ? cast(GtkWidget*)newParent._cPtr(No.Dup) : null);
  }

  /**
      Reset the styles of widget and all descendents, so when
      they are looked up again, they get the correct values
      for the currently loaded RC file settings.
      
      This function is not useful for applications.
  
      Deprecated: Use #GtkStyleContext instead, and [gid.gtk3.widget.Widget.resetStyle]
  */
  void resetRcStyles() nothrow
  {
    gtk_widget_reset_rc_styles(cast(GtkWidget*)this._cPtr);
  }

  /**
      Updates the style context of widget and all descendants
      by updating its widget path. #GtkContainers may want
      to use this on a child when reordering it in a way that a different
      style might apply to it. See also [gid.gtk3.container.Container.getPathForChild].
  */
  void resetStyle() nothrow
  {
    gtk_widget_reset_style(cast(GtkWidget*)this._cPtr);
  }

  /**
      Very rarely-used function. This function is used to emit
      an expose event on a widget. This function is not normally used
      directly. The only time it is used is when propagating an expose
      event to a windowless child widget ([gid.gtk3.widget.Widget.getHasWindow] is false),
      and that is normally done using [gid.gtk3.container.Container.propagateDraw].
      
      If you want to force an area of a window to be redrawn,
      use [gid.gdk3.window.Window.invalidateRect] or [gid.gdk3.window.Window.invalidateRegion].
      To cause the redraw to be done immediately, follow that call
      with a call to [gid.gdk3.window.Window.processUpdates].
  
      Params:
        event = a expose #GdkEvent
      Returns: return from the event signal emission (true if
          the event was handled)
  
      Deprecated: Application and widget code should not handle
          expose events directly; invalidation should use the #GtkWidget
          API, and drawing should only happen inside #GtkWidget::draw
          implementations
  */
  int sendExpose(gid.gdk3.event.Event event) nothrow
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
  bool sendFocusChange(gid.gdk3.event.Event event) nothrow
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
      [gid.gtk3.widget.Widget.setAccelPath]. Associating accelerators with
      paths allows them to be modified by the user and the modifications
      to be saved for future use. (See [gid.gtk3.accel_map.AccelMap.save].)
      
      This function is a low level function that would most likely
      be used by a menu creation system like #GtkUIManager. If you
      use #GtkUIManager, setting up accelerator paths will be done
      automatically.
      
      Even when you you aren’t using #GtkUIManager, if you only want to
      set up accelerators on menu items [gid.gtk3.menu_item.MenuItem.setAccelPath]
      provides a somewhat more convenient interface.
      
      Note that accel_path string will be stored in a #GQuark. Therefore, if you
      pass a static string, you can save some memory by interning it first with
      [gid.glib2.global.internStaticString].
  
      Params:
        accelPath = path used to look up the accelerator
        accelGroup = a #GtkAccelGroup.
  */
  void setAccelPath(string accelPath = null, gid.gtk3.accel_group.AccelGroup accelGroup = null) nothrow
  {
    const(char)* _accelPath = accelPath.toCString!(No.Malloc, Yes.Nullable);
    gtk_widget_set_accel_path(cast(GtkWidget*)this._cPtr, _accelPath, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  /**
      Sets the widget’s allocation.  This should not be used
      directly, but from within a widget’s size_allocate method.
      
      The allocation set should be the “adjusted” or actual
      allocation. If you’re implementing a #GtkContainer, you want to use
      [gid.gtk4.widget.Widget.sizeAllocate] instead of [gid.gtk3.widget.Widget.setAllocation].
      The GtkWidgetClass::adjust_size_allocation virtual method adjusts the
      allocation inside [gid.gtk4.widget.Widget.sizeAllocate] to create an adjusted
      allocation.
  
      Params:
        allocation = a pointer to a #GtkAllocation to copy from
  */
  void setAllocation(gid.gtk3.types.Allocation allocation) nothrow
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
  void setAppPaintable(bool appPaintable) nothrow
  {
    gtk_widget_set_app_paintable(cast(GtkWidget*)this._cPtr, appPaintable);
  }

  /**
      Specifies whether widget can be a default widget. See
      [gid.gtk3.widget.Widget.grabDefault] for details about the meaning of
      “default”.
  
      Params:
        canDefault = whether or not widget can be a default widget.
  */
  void setCanDefault(bool canDefault) nothrow
  {
    gtk_widget_set_can_default(cast(GtkWidget*)this._cPtr, canDefault);
  }

  /**
      Specifies whether widget can own the input focus. See
      [gid.gtk4.widget.Widget.grabFocus] for actually setting the input focus on a
      widget.
  
      Params:
        canFocus = whether or not widget can own the input focus.
  */
  void setCanFocus(bool canFocus) nothrow
  {
    gtk_widget_set_can_focus(cast(GtkWidget*)this._cPtr, canFocus);
  }

  /**
      Sets whether widget should be mapped along with its when its parent
      is mapped and widget has been shown with [gid.gtk4.widget.Widget.show].
      
      The child visibility can be set for widget before it is added to
      a container with [gid.gtk4.widget.Widget.setParent], to avoid mapping
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
  void setChildVisible(bool isVisible) nothrow
  {
    gtk_widget_set_child_visible(cast(GtkWidget*)this._cPtr, isVisible);
  }

  /**
      Sets the widget’s clip.  This must not be used directly,
      but from within a widget’s size_allocate method.
      It must be called after [gid.gtk3.widget.Widget.setAllocation] (or after chaining up
      to the parent class), because that function resets the clip.
      
      The clip set should be the area that widget draws on. If widget is a
      #GtkContainer, the area must contain all children's clips.
      
      If this function is not called by widget during a ::size-allocate handler,
      the clip will be set to widget's allocation.
  
      Params:
        clip = a pointer to a #GtkAllocation to copy from
  */
  void setClip(gid.gtk3.types.Allocation clip) nothrow
  {
    gtk_widget_set_clip(cast(GtkWidget*)this._cPtr, cast(const(GtkAllocation)*)&clip);
  }

  /**
      Sets a widgets composite name. The widget must be
      a composite child of its parent; see [gid.gtk3.widget.Widget.pushCompositeChild].
  
      Params:
        name = the name to set
  
      Deprecated: Use [gid.gtk4.widget_class.WidgetClass.setTemplate], or don’t use this API at all.
  */
  void setCompositeName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_widget_set_composite_name(cast(GtkWidget*)this._cPtr, _name);
  }

  /**
      Enables or disables a #GdkDevice to interact with widget
      and all its children.
      
      It does so by descending through the #GdkWindow hierarchy
      and enabling the same mask that is has for core events
      (i.e. the one that [gid.gdk3.window.Window.getEvents] returns).
  
      Params:
        device = a #GdkDevice
        enabled = whether to enable the device
  */
  void setDeviceEnabled(gid.gdk3.device.Device device, bool enabled) nothrow
  {
    gtk_widget_set_device_enabled(cast(GtkWidget*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, enabled);
  }

  /**
      Sets the device event mask (see #GdkEventMask) for a widget. The event
      mask determines which events a widget will receive from device. Keep
      in mind that different widgets have different default event masks, and by
      changing the event mask you may disrupt a widget’s functionality,
      so be careful. This function must be called while a widget is
      unrealized. Consider [gid.gtk3.widget.Widget.addDeviceEvents] for widgets that are
      already realized, or if you want to preserve the existing event
      mask. This function can’t be used with windowless widgets (which return
      false from [gid.gtk3.widget.Widget.getHasWindow]);
      to get events on those widgets, place them inside a #GtkEventBox
      and receive events on the event box.
  
      Params:
        device = a #GdkDevice
        events = event mask
  */
  void setDeviceEvents(gid.gdk3.device.Device device, gid.gdk3.types.EventMask events) nothrow
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
      
      If the direction is set to [gid.gtk4.types.TextDirection.None], then the value
      set by [gid.gtk4.widget.Widget.setDefaultDirection] will be used.
  
      Params:
        dir = the new direction
  */
  void setDirection(gid.gtk3.types.TextDirection dir) nothrow
  {
    gtk_widget_set_direction(cast(GtkWidget*)this._cPtr, dir);
  }

  /**
      Widgets are double buffered by default; you can use this function
      to turn off the buffering. “Double buffered” simply means that
      [gid.gdk3.window.Window.beginDrawFrame] and [gid.gdk3.window.Window.endDrawFrame] are called
      automatically around expose events sent to the
      widget. [gid.gdk3.window.Window.beginDrawFrame] diverts all drawing to a widget's
      window to an offscreen buffer, and [gid.gdk3.window.Window.endDrawFrame] draws the
      buffer to the screen. The result is that users see the window
      update in one smooth step, and don’t see individual graphics
      primitives being rendered.
      
      In very simple terms, double buffered widgets don’t flicker,
      so you would only use this function to turn off double buffering
      if you had special needs and really knew what you were doing.
      
      Note: if you turn off double-buffering, you have to handle
      expose events, since even the clearing to the background color or
      pixmap will not happen automatically (as it is done in
      [gid.gdk3.window.Window.beginDrawFrame]).
      
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
  void setDoubleBuffered(bool doubleBuffered) nothrow
  {
    gtk_widget_set_double_buffered(cast(GtkWidget*)this._cPtr, doubleBuffered);
  }

  /**
      Sets the event mask (see #GdkEventMask) for a widget. The event
      mask determines which events a widget will receive. Keep in mind
      that different widgets have different default event masks, and by
      changing the event mask you may disrupt a widget’s functionality,
      so be careful. This function must be called while a widget is
      unrealized. Consider [gid.gtk3.widget.Widget.addEvents] for widgets that are
      already realized, or if you want to preserve the existing event
      mask. This function can’t be used with widgets that have no window.
      (See [gid.gtk3.widget.Widget.getHasWindow]).  To get events on those widgets,
      place them inside a #GtkEventBox and receive events on the event
      box.
  
      Params:
        events = event mask
  */
  void setEvents(int events) nothrow
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
  void setFocusOnClick(bool focusOnClick) nothrow
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
  void setFontMap(gid.pango1.font_map.FontMap fontMap = null) nothrow
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
  void setFontOptions(gid.cairo1.font_options.FontOptions options = null) nothrow
  {
    gtk_widget_set_font_options(cast(GtkWidget*)this._cPtr, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
  }

  /**
      Sets the horizontal alignment of widget.
      See the #GtkWidget:halign property.
  
      Params:
        align_ = the horizontal alignment
  */
  void setHalign(gid.gtk3.types.Align align_) nothrow
  {
    gtk_widget_set_halign(cast(GtkWidget*)this._cPtr, align_);
  }

  /**
      Sets the has-tooltip property on widget to has_tooltip.  See
      #GtkWidget:has-tooltip for more information.
  
      Params:
        hasTooltip = whether or not widget has a tooltip.
  */
  void setHasTooltip(bool hasTooltip) nothrow
  {
    gtk_widget_set_has_tooltip(cast(GtkWidget*)this._cPtr, hasTooltip);
  }

  /**
      Specifies whether widget has a #GdkWindow of its own. Note that
      all realized widgets have a non-null “window” pointer
      ([gid.gtk3.widget.Widget.getWindow] never returns a null window when a widget
      is realized), but for many of them it’s actually the #GdkWindow of
      one of its parent widgets. Widgets that do not create a `window` for
      themselves in #GtkWidget::realize must announce this by
      calling this function with has_window = false.
      
      This function should only be called by widget implementations,
      and they should call it in their init() function.
  
      Params:
        hasWindow = whether or not widget has a window.
  */
  void setHasWindow(bool hasWindow) nothrow
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
      its current children and state, call [gid.gtk4.widget.Widget.computeExpand]. A
      container can decide how the expandability of children affects the
      expansion of the container by overriding the compute_expand virtual
      method on #GtkWidget.).
      
      Setting hexpand explicitly with this function will override the
      automatic expand behavior.
      
      This function forces the widget to expand or not to expand,
      regardless of children.  The override occurs because
      [gid.gtk4.widget.Widget.setHexpand] sets the hexpand-set property (see
      [gid.gtk4.widget.Widget.setHexpandSet]) which causes the widget’s hexpand
      value to be used, rather than looking at children and widget state.
  
      Params:
        expand = whether to expand
  */
  void setHexpand(bool expand) nothrow
  {
    gtk_widget_set_hexpand(cast(GtkWidget*)this._cPtr, expand);
  }

  /**
      Sets whether the hexpand flag (see [gid.gtk4.widget.Widget.getHexpand]) will
      be used.
      
      The hexpand-set property will be set automatically when you call
      [gid.gtk4.widget.Widget.setHexpand] to set hexpand, so the most likely
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
  void setHexpandSet(bool set) nothrow
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
  void setMapped(bool mapped) nothrow
  {
    gtk_widget_set_mapped(cast(GtkWidget*)this._cPtr, mapped);
  }

  /**
      Sets the bottom margin of widget.
      See the #GtkWidget:margin-bottom property.
  
      Params:
        margin = the bottom margin
  */
  void setMarginBottom(int margin) nothrow
  {
    gtk_widget_set_margin_bottom(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the end margin of widget.
      See the #GtkWidget:margin-end property.
  
      Params:
        margin = the end margin
  */
  void setMarginEnd(int margin) nothrow
  {
    gtk_widget_set_margin_end(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the left margin of widget.
      See the #GtkWidget:margin-left property.
  
      Params:
        margin = the left margin
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginStart] instead.
  */
  void setMarginLeft(int margin) nothrow
  {
    gtk_widget_set_margin_left(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the right margin of widget.
      See the #GtkWidget:margin-right property.
  
      Params:
        margin = the right margin
  
      Deprecated: Use [gid.gtk4.widget.Widget.setMarginEnd] instead.
  */
  void setMarginRight(int margin) nothrow
  {
    gtk_widget_set_margin_right(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the start margin of widget.
      See the #GtkWidget:margin-start property.
  
      Params:
        margin = the start margin
  */
  void setMarginStart(int margin) nothrow
  {
    gtk_widget_set_margin_start(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the top margin of widget.
      See the #GtkWidget:margin-top property.
  
      Params:
        margin = the top margin
  */
  void setMarginTop(int margin) nothrow
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
  void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_widget_set_name(cast(GtkWidget*)this._cPtr, _name);
  }

  /**
      Sets the #GtkWidget:no-show-all property, which determines whether
      calls to [gid.gtk3.widget.Widget.showAll] will affect this widget.
      
      This is mostly for use in constructing widget hierarchies with externally
      controlled visibility, see #GtkUIManager.
  
      Params:
        noShowAll = the new value for the “no-show-all” property
  */
  void setNoShowAll(bool noShowAll) nothrow
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
      running. See [gid.gtk3.widget.Widget.isComposited]. On Windows it should work
      always, although setting a window’s opacity after the window has been
      shown causes it to flicker once on Windows.
      
      For child widgets it doesn’t work if any affected widget has a native window, or
      disables double buffering.
  
      Params:
        opacity = desired opacity, between 0 and 1
  */
  void setOpacity(double opacity) nothrow
  {
    gtk_widget_set_opacity(cast(GtkWidget*)this._cPtr, opacity);
  }

  /**
      This function is useful only when implementing subclasses of
      #GtkContainer.
      Sets the container as the parent of widget, and takes care of
      some details such as updating the state and style of the child
      to reflect its new location. The opposite function is
      [gid.gtk4.widget.Widget.unparent].
  
      Params:
        parent = parent container
  */
  void setParent(gid.gtk3.widget.Widget parent) nothrow
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
  void setParentWindow(gid.gdk3.window.Window parentWindow) nothrow
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
  void setRealized(bool realized) nothrow
  {
    gtk_widget_set_realized(cast(GtkWidget*)this._cPtr, realized);
  }

  /**
      Specifies whether widget will be treated as the default widget
      within its toplevel when it has the focus, even if another widget
      is the default.
      
      See [gid.gtk3.widget.Widget.grabDefault] for details about the meaning of
      “default”.
  
      Params:
        receivesDefault = whether or not widget can be a default widget.
  */
  void setReceivesDefault(bool receivesDefault) nothrow
  {
    gtk_widget_set_receives_default(cast(GtkWidget*)this._cPtr, receivesDefault);
  }

  /**
      Sets whether the entire widget is queued for drawing when its size
      allocation changes. By default, this setting is true and
      the entire widget is redrawn on every size change. If your widget
      leaves the upper left unchanged when made bigger, turning this
      setting off will improve performance.
      
      Note that for widgets where [gid.gtk3.widget.Widget.getHasWindow] is false
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
  void setRedrawOnAllocate(bool redrawOnAllocate) nothrow
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
  void setSensitive(bool sensitive) nothrow
  {
    gtk_widget_set_sensitive(cast(GtkWidget*)this._cPtr, sensitive);
  }

  /**
      Sets the minimum size of a widget; that is, the widget’s size
      request will be at least width by height. You can use this
      function to force a widget to be larger than it normally would be.
      
      In most cases, [gid.gtk4.window.Window.setDefaultSize] is a better choice for
      toplevel windows than this function; setting the default size will
      still allow users to shrink the window. Setting the size request
      will force them to leave the window at least as large as the size
      request. When dealing with window sizes,
      [gid.gtk3.window.Window.setGeometryHints] can be a useful function as well.
      
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
  void setSizeRequest(int width, int height) nothrow
  {
    gtk_widget_set_size_request(cast(GtkWidget*)this._cPtr, width, height);
  }

  /**
      This function is for use in widget implementations. Sets the state
      of a widget (insensitive, prelighted, etc.) Usually you should set
      the state using wrapper functions such as [gid.gtk4.widget.Widget.setSensitive].
  
      Params:
        state = new state for widget
  
      Deprecated: Use [gid.gtk4.widget.Widget.setStateFlags] instead.
  */
  void setState(gid.gtk3.types.StateType state) nothrow
  {
    gtk_widget_set_state(cast(GtkWidget*)this._cPtr, state);
  }

  /**
      This function is for use in widget implementations. Turns on flag
      values in the current widget state (insensitive, prelighted, etc.).
      
      This function accepts the values [gid.gtk4.types.StateFlags.DirLtr] and
      [gid.gtk4.types.StateFlags.DirRtl] but ignores them. If you want to set the widget's
      direction, use [gid.gtk4.widget.Widget.setDirection].
      
      It is worth mentioning that any other state than [gid.gtk4.types.StateFlags.Insensitive],
      will be propagated down to all non-internal children if widget is a
      #GtkContainer, while [gid.gtk4.types.StateFlags.Insensitive] itself will be propagated
      down to all #GtkContainer children by different means than turning on the
      state flag down the hierarchy, both [gid.gtk4.widget.Widget.getStateFlags] and
      [gid.gtk4.widget.Widget.isSensitive] will make use of these.
  
      Params:
        flags = State flags to turn on
        clear = Whether to clear state before turning on flags
  */
  void setStateFlags(gid.gtk3.types.StateFlags flags, bool clear) nothrow
  {
    gtk_widget_set_state_flags(cast(GtkWidget*)this._cPtr, flags, clear);
  }

  /**
      Used to set the #GtkStyle for a widget (widget->style). Since
      GTK 3, this function does nothing, the passed in style is ignored.
  
      Params:
        style = a #GtkStyle, or null to remove the effect
              of a previous call to [gid.gtk3.widget.Widget.setStyle] and go back to
              the default style
  
      Deprecated: Use #GtkStyleContext instead
  */
  void setStyle(gid.gtk3.style.Style style = null) nothrow
  {
    gtk_widget_set_style(cast(GtkWidget*)this._cPtr, style ? cast(GtkStyle*)style._cPtr(No.Dup) : null);
  }

  /**
      Enables or disables multiple pointer awareness. If this setting is true,
      widget will start receiving multiple, per device enter/leave events. Note
      that if custom #GdkWindows are created in #GtkWidget::realize,
      [gid.gdk3.window.Window.setSupportMultidevice] will have to be called manually on them.
  
      Params:
        supportMultidevice = true to support input from multiple devices.
  */
  void setSupportMultidevice(bool supportMultidevice) nothrow
  {
    gtk_widget_set_support_multidevice(cast(GtkWidget*)this._cPtr, supportMultidevice);
  }

  /**
      Sets markup as the contents of the tooltip, which is marked up with
       the [Pango text markup language][PangoMarkupFormat].
      
      This function will take care of setting #GtkWidget:has-tooltip to true
      and of the default handler for the #GtkWidget::query-tooltip signal.
      
      See also the #GtkWidget:tooltip-markup property and
      [gid.gtk4.tooltip.Tooltip.setMarkup].
  
      Params:
        markup = the contents of the tooltip for widget, or null
  */
  void setTooltipMarkup(string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_widget_set_tooltip_markup(cast(GtkWidget*)this._cPtr, _markup);
  }

  /**
      Sets text as the contents of the tooltip. This function will take
      care of setting #GtkWidget:has-tooltip to true and of the default
      handler for the #GtkWidget::query-tooltip signal.
      
      See also the #GtkWidget:tooltip-text property and [gid.gtk4.tooltip.Tooltip.setText].
  
      Params:
        text = the contents of the tooltip for widget
  */
  void setTooltipText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
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
  void setTooltipWindow(gid.gtk3.window.Window customWindow = null) nothrow
  {
    gtk_widget_set_tooltip_window(cast(GtkWidget*)this._cPtr, customWindow ? cast(GtkWindow*)customWindow._cPtr(No.Dup) : null);
  }

  /**
      Sets the vertical alignment of widget.
      See the #GtkWidget:valign property.
  
      Params:
        align_ = the vertical alignment
  */
  void setValign(gid.gtk3.types.Align align_) nothrow
  {
    gtk_widget_set_valign(cast(GtkWidget*)this._cPtr, align_);
  }

  /**
      Sets whether the widget would like any available extra vertical
      space.
      
      See [gid.gtk4.widget.Widget.setHexpand] for more detail.
  
      Params:
        expand = whether to expand
  */
  void setVexpand(bool expand) nothrow
  {
    gtk_widget_set_vexpand(cast(GtkWidget*)this._cPtr, expand);
  }

  /**
      Sets whether the vexpand flag (see [gid.gtk4.widget.Widget.getVexpand]) will
      be used.
      
      See [gid.gtk4.widget.Widget.setHexpandSet] for more detail.
  
      Params:
        set = value for vexpand-set property
  */
  void setVexpandSet(bool set) nothrow
  {
    gtk_widget_set_vexpand_set(cast(GtkWidget*)this._cPtr, set);
  }

  /**
      Sets the visibility state of widget. Note that setting this to
      true doesn’t mean the widget is actually viewable, see
      [gid.gtk4.widget.Widget.getVisible].
      
      This function simply calls [gid.gtk4.widget.Widget.show] or [gid.gtk4.widget.Widget.hide]
      but is nicer to use when the visibility of the widget depends on
      some condition.
  
      Params:
        visible = whether the widget should be shown or not
  */
  void setVisible(bool visible) nothrow
  {
    gtk_widget_set_visible(cast(GtkWidget*)this._cPtr, visible);
  }

  /**
      Sets the visual that should be used for by widget and its children for
      creating #GdkWindows. The visual must be on the same #GdkScreen as
      returned by [gid.gtk3.widget.Widget.getScreen], so handling the
      #GtkWidget::screen-changed signal is necessary.
      
      Setting a new visual will not cause widget to recreate its windows,
      so you should call this function before widget is realized.
  
      Params:
        visual = visual to be used or null to unset a previous one
  */
  void setVisual(gid.gdk3.visual.Visual visual = null) nothrow
  {
    gtk_widget_set_visual(cast(GtkWidget*)this._cPtr, visual ? cast(GdkVisual*)visual._cPtr(No.Dup) : null);
  }

  /**
      Sets a widget’s window. This function should only be used in a
      widget’s #GtkWidget::realize implementation. The `window` passed is
      usually either new window created with [gid.gdk3.window.Window.new_], or the
      window of its parent widget as returned by
      [gid.gtk3.widget.Widget.getParentWindow].
      
      Widgets must indicate whether they will create their own #GdkWindow
      by calling [gid.gtk3.widget.Widget.setHasWindow]. This is usually done in the
      widget’s init() function.
      
      Note that this function does not add any reference to window.
  
      Params:
        window = a #GdkWindow
  */
  void setWindow(gid.gdk3.window.Window window) nothrow
  {
    gtk_widget_set_window(cast(GtkWidget*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(Yes.Dup) : null);
  }

  /**
      Sets a shape for this widget’s GDK window. This allows for
      transparent windows etc., see [gid.gdk3.window.Window.shapeCombineRegion]
      for more information.
  
      Params:
        region = shape to be added, or null to remove an existing shape
  */
  void shapeCombineRegion(gid.cairo1.region.Region region = null) nothrow
  {
    gtk_widget_shape_combine_region(cast(GtkWidget*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Flags a widget to be displayed. Any widget that isn’t shown will
      not appear on the screen. If you want to show all the widgets in a
      container, it’s easier to call [gid.gtk3.widget.Widget.showAll] on the
      container, instead of individually showing the widgets.
      
      Remember that you have to show the containers containing a widget,
      in addition to the widget itself, before it will appear onscreen.
      
      When a toplevel container is shown, it is immediately realized and
      mapped; other shown widgets are realized and mapped when their
      toplevel container is realized and mapped.
  */
  void show() nothrow
  {
    gtk_widget_show(cast(GtkWidget*)this._cPtr);
  }

  /**
      Recursively shows a widget, and any child widgets (if the widget is
      a container).
  */
  void showAll() nothrow
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
  void showNow() nothrow
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
      
      For baseline support in containers you need to use [gid.gtk3.widget.Widget.sizeAllocateWithBaseline]
      instead.
  
      Params:
        allocation = position and size to be allocated to widget
  */
  void sizeAllocate(gid.gtk3.types.Allocation allocation) nothrow
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
      
      If the child widget does not have a valign of [gid.gtk4.types.Align.Baseline] the
      baseline argument is ignored and -1 is used instead.
  
      Params:
        allocation = position and size to be allocated to widget
        baseline = The baseline of the child, or -1
  */
  void sizeAllocateWithBaseline(gid.gtk3.types.Allocation allocation, int baseline) nothrow
  {
    gtk_widget_size_allocate_with_baseline(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation, baseline);
  }

  /**
      This function is typically used when implementing a #GtkContainer
      subclass.  Obtains the preferred size of a widget. The container
      uses this information to arrange its child widgets and decide what
      size allocations to give them with [gid.gtk4.widget.Widget.sizeAllocate].
      
      You can also call this function from an application, with some
      caveats. Most notably, getting a size request requires the widget
      to be associated with a screen, because font information may be
      needed. Multihead-aware applications should keep this in mind.
      
      Also remember that the size request is not necessarily the size
      a widget will actually be allocated.
  
      Params:
        requisition = a #GtkRequisition to be filled in
  
      Deprecated: Use [gid.gtk4.widget.Widget.getPreferredSize] instead.
  */
  void sizeRequest(out gid.gtk3.requisition.Requisition requisition) nothrow
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
  void styleAttach() nothrow
  {
    gtk_widget_style_attach(cast(GtkWidget*)this._cPtr);
  }

  /**
      Gets the value of a style property of widget.
  
      Params:
        propertyName = the name of a style property
        value = location to return the property value
  */
  void styleGetProperty(string propertyName, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    gtk_widget_style_get_property(cast(GtkWidget*)this._cPtr, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      Reverts the effect of a previous call to [gid.gtk3.widget.Widget.freezeChildNotify].
      This causes all queued #GtkWidget::child-notify signals on widget to be
      emitted.
  */
  void thawChildNotify() nothrow
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
  bool translateCoordinates(gid.gtk3.widget.Widget destWidget, int srcX, int srcY, out int destX, out int destY) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_translate_coordinates(cast(GtkWidget*)this._cPtr, destWidget ? cast(GtkWidget*)destWidget._cPtr(No.Dup) : null, srcX, srcY, cast(int*)&destX, cast(int*)&destY);
    return _retval;
  }

  /**
      Triggers a tooltip query on the display where the toplevel of widget
      is located. See [gid.gtk3.tooltip.Tooltip.triggerTooltipQuery] for more
      information.
  */
  void triggerTooltipQuery() nothrow
  {
    gtk_widget_trigger_tooltip_query(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function is only for use in widget implementations. Causes
      a widget to be unmapped if it’s currently mapped.
  */
  void unmap() nothrow
  {
    gtk_widget_unmap(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function is only for use in widget implementations.
      Should be called by implementations of the remove method
      on #GtkContainer, to dissociate a child from the container.
  */
  void unparent() nothrow
  {
    gtk_widget_unparent(cast(GtkWidget*)this._cPtr);
  }

  /**
      This function is only useful in widget implementations.
      Causes a widget to be unrealized (frees all GDK resources
      associated with the widget, such as widget->window).
  */
  void unrealize() nothrow
  {
    gtk_widget_unrealize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Unregisters a #GdkWindow from the widget that was previously set up with
      [gid.gtk3.widget.Widget.registerWindow]. You need to call this when the window is
      no longer used by the widget, such as when you destroy it.
  
      Params:
        window = a #GdkWindow
  */
  void unregisterWindow(gid.gdk3.window.Window window) nothrow
  {
    gtk_widget_unregister_window(cast(GtkWidget*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      This function is for use in widget implementations. Turns off flag
      values for the current widget state (insensitive, prelighted, etc.).
      See [gid.gtk4.widget.Widget.setStateFlags].
  
      Params:
        flags = State flags to turn off
  */
  void unsetStateFlags(gid.gtk3.types.StateFlags flags) nothrow
  {
    gtk_widget_unset_state_flags(cast(GtkWidget*)this._cPtr, flags);
  }

  /**
      Connect to `AccelClosuresChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAccelClosuresChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.accelClosuresChanged");
      }
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
  
          `bool callback(gid.gdk3.event_button.EventButton event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventButton which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectButtonPressEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_button.EventButton(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.buttonPressEvent");
      }

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
  
          `bool callback(gid.gdk3.event_button.EventButton event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventButton which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectButtonReleaseEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_button.EventButton(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.buttonReleaseEvent");
      }

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
  
          `bool callback(uint signalId, gid.gtk3.widget.Widget widget)`
  
          `signalId` the ID of a signal installed on widget (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if the signal can be activated.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCanActivateAccel(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.canActivateAccel");
      }

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
  
          `void callback(gid.gobject2.param_spec.ParamSpec childProperty, gid.gtk3.widget.Widget widget)`
  
          `childProperty` the #GParamSpec of the changed child property (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChildNotify(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gobject2.param_spec.ParamSpec)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.childNotify");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `CompositedChanged` signal.
  
      The ::composited-changed signal is emitted when the composited
        status of widgets screen changes.
        See [gid.gdk3.screen.Screen.isComposited].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use GdkScreen::composited-changed instead.
  */
  gulong connectCompositedChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.compositedChanged");
      }
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
  
          `bool callback(gid.gdk3.event_configure.EventConfigure event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventConfigure which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectConfigureEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_configure.EventConfigure)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_configure.EventConfigure(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.configureEvent");
      }

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
  
          `bool callback(gid.gdk3.event_expose.EventExpose event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventExpose event (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDamageEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_expose.EventExpose)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_expose.EventExpose(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.damageEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("damage-event", closure, after);
  }

  /**
      Connect to `DeleteEvent` signal.
  
      The ::delete-event signal is emitted if a user requests that
        a toplevel window is closed. The default handler for this signal
        destroys the window. Connecting [gid.gtk3.widget.Widget.hideOnDelete] to
        this signal will cause the window to be hidden instead, so that
        it can later be shown again without reconstructing it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget)`
  
          `event` the event which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.deleteEvent");
      }

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
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDestroy(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.destroy");
      }
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
  
          `bool callback(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget)`
  
          `event` the event which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDestroyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.destroyEvent");
      }

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
  
          `void callback(gid.gtk3.types.TextDirection previousDirection, gid.gtk3.widget.Widget widget)`
  
          `previousDirection` the previous text direction of widget (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDirectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.TextDirection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.directionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("direction-changed", closure, after);
  }

  /**
      Connect to `DragBegin` signal.
  
      The ::drag-begin signal is emitted on the drag source when a drag is
        started. A typical reason to connect to this signal is to set up a
        custom drag icon with e.g. [gid.gtk3.widget.Widget.dragSourceSetIconPixbuf].
        
        Note that some widgets set up a drag icon in the default handler of
        this signal, so you may have to use g_signal_connect_after() to
        override what the default handler did.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.drag_context.DragContext context, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragBegin(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragBegin");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
      Connect to `DragDataDelete` signal.
  
      The ::drag-data-delete signal is emitted on the drag source when a drag
        with the action [gid.gdk4.types.DragAction.Move] is successfully completed. The signal
        handler is responsible for deleting the data that has been dropped. What
        "delete" means depends on the context of the drag operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.drag_context.DragContext context, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragDataDelete(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragDataDelete");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-data-delete", closure, after);
  }

  /**
      Connect to `DragDataGet` signal.
  
      The ::drag-data-get signal is emitted on the drag source when the drop
        site requests the data which is dragged. It is the responsibility of
        the signal handler to fill data with the data in the format which
        is indicated by info. See [gid.gtk3.selection_data.SelectionData.set] and
        [gid.gtk3.selection_data.SelectionData.setText].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.drag_context.DragContext context, gid.gtk3.selection_data.SelectionData data, uint info, uint time, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `data` the #GtkSelectionData to be filled with the dragged data (optional)
  
          `info` the info that has been registered with the target in the
                   #GtkTargetList (optional)
  
          `time` the timestamp at which the data was requested (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragDataGet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.selection_data.SelectionData)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == uint)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragDataGet");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-data-get", closure, after);
  }

  /**
      Connect to `DragDataReceived` signal.
  
      The ::drag-data-received signal is emitted on the drop site when the
        dragged data has been received. If the data was received in order to
        determine whether the drop will be accepted, the handler is expected
        to call [gid.gdk3.global.dragStatus] and not finish the drag.
        If the data was received in response to a #GtkWidget::drag-drop signal
        (and this is the last target to be received), the handler for this
        signal is expected to process the received data and then call
        [gid.gtk3.global.dragFinish], setting the success parameter depending on
        whether the data was processed successfully.
        
        Applications must create some means to determine why the signal was emitted
        and therefore whether to call [gid.gdk3.global.dragStatus] or [gid.gtk3.global.dragFinish].
        
        The handler may inspect the selected action with
        [gid.gdk3.drag_context.DragContext.getSelectedAction] before calling
        [gid.gtk3.global.dragFinish], e.g. to implement [gid.gdk4.types.DragAction.Ask] as
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
  
          `void callback(gid.gdk3.drag_context.DragContext context, int x, int y, gid.gtk3.selection_data.SelectionData data, uint info, uint time, gid.gtk3.widget.Widget widget)`
  
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
  gulong connectDragDataReceived(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gid.gtk3.selection_data.SelectionData)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == uint)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] == uint)))
  && (Parameters!T.length < 7 || (ParameterStorageClassTuple!T[6] == ParameterStorageClass.none && is(Parameters!T[6] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 8)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragDataReceived");
      }
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
        ensure that [gid.gtk3.global.dragFinish] is called to let the source know that
        the drop is done. The call to [gid.gtk3.global.dragFinish] can be done either
        directly or in a #GtkWidget::drag-data-received handler which gets
        triggered by calling [gid.gtk3.widget.Widget.dragGetData] to receive the data for one
        or more of the supported targets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.drag_context.DragContext context, int x, int y, uint time, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `x` the x coordinate of the current cursor position (optional)
  
          `y` the y coordinate of the current cursor position (optional)
  
          `time` the timestamp of the motion event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` whether the cursor position is in a drop zone
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragDrop(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

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

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragDrop");
      }

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
  
          `void callback(gid.gdk3.drag_context.DragContext context, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragEnd");
      }
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
  
          `bool callback(gid.gdk3.drag_context.DragContext context, gid.gtk3.types.DragResult result, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `result` the result of the drag operation (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if the failed drag operation has been already handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragFailed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.types.DragResult)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragFailed");
      }

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
        with [gid.gtk3.widget.Widget.dragUnhighlight].
        
        
        Likewise, the #GtkWidget::drag-leave signal is also emitted before the
        ::drag-drop signal, for instance to allow cleaning up of a preview item
        created in the #GtkWidget::drag-motion signal handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.drag_context.DragContext context, uint time, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `time` the timestamp of the motion event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragLeave(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragLeave");
      }
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
        displaying feedback to the user, by calling [gid.gdk3.global.dragStatus].
        
        If the decision whether the drop will be accepted or rejected can't be
        made based solely on the cursor position and the type of the data, the
        handler may inspect the dragged data by calling [gid.gtk3.widget.Widget.dragGetData] and
        defer the [gid.gdk3.global.dragStatus] call to the #GtkWidget::drag-data-received
        handler. Note that you must pass #GTK_DEST_DEFAULT_DROP,
        #GTK_DEST_DEFAULT_MOTION or #GTK_DEST_DEFAULT_ALL to [gid.gtk3.widget.Widget.dragDestSet]
        when using the drag-motion signal that way.
        
        Also note that there is no drag-enter signal. The drag receiver has to
        keep track of whether he has received any drag-motion signals since the
        last #GtkWidget::drag-leave and if not, treat the drag-motion signal as
        an "enter" signal. Upon an "enter", the handler will typically highlight
        the drop site with [gid.gtk3.widget.Widget.dragHighlight].
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
  
          `bool callback(gid.gdk3.drag_context.DragContext context, int x, int y, uint time, gid.gtk3.widget.Widget widget)`
  
          `context` the drag context (optional)
  
          `x` the x coordinate of the current cursor position (optional)
  
          `y` the y coordinate of the current cursor position (optional)
  
          `time` the timestamp of the motion event (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` whether the cursor position is in a drop zone
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragMotion(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.drag_context.DragContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == uint)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

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

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.dragMotion");
      }

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
        [gid.gtk4.widget.Widget.getAllocatedWidth] and
        [gid.gtk4.widget.Widget.getAllocatedHeight].
        
        Signal handlers connected to this signal can modify the cairo
        context passed as cr in any way they like and don't need to
        restore it. The signal emission takes care of calling [gid.cairo1.context.Context.save]
        before and [gid.cairo1.context.Context.restore] after invoking the handler.
        
        The signal handler will get a cr with a clip region already set to the
        widget's dirty region, i.e. to the area that needs repainting.  Complicated
        widgets that want to avoid redrawing themselves completely can get the full
        extents of the clip region with [gid.gdk3.global.cairoGetClipRectangle], or they can
        get a finer-grained representation of the dirty region with
        [gid.cairo1.context.Context.copyClipRectangleList].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.cairo1.context.Context cr, gid.gtk3.widget.Widget widget)`
  
          `cr` the cairo context to draw to (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDraw(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.cairo1.context.Context)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.draw");
      }

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
  
          `bool callback(gid.gdk3.event_crossing.EventCrossing event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventCrossing which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEnterNotifyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_crossing.EventCrossing)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_crossing.EventCrossing(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.enterNotifyEvent");
      }

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
  
          `bool callback(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget)`
  
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
  gulong connectEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.event");
      }

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
  
          `void callback(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEvent which triggered this signal (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEventAfter(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.eventAfter");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event-after", closure, after);
  }

  /**
      Connect to `Focus` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.DirectionType direction, gid.gtk3.widget.Widget widget)`
  
          `direction`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.focus");
      }

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
  
          `bool callback(gid.gdk3.event_focus.EventFocus event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventFocus which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocusInEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_focus.EventFocus)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_focus.EventFocus(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.focusInEvent");
      }

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
  
          `bool callback(gid.gdk3.event_focus.EventFocus event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventFocus which triggered this
              signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocusOutEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_focus.EventFocus)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_focus.EventFocus(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.focusOutEvent");
      }

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
  
          `bool callback(gid.gdk3.event_grab_broken.EventGrabBroken event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventGrabBroken event (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for
              the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGrabBrokenEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_grab_broken.EventGrabBroken)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_grab_broken.EventGrabBroken(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.grabBrokenEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("grab-broken-event", closure, after);
  }

  /**
      Connect to `GrabFocus` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGrabFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.grabFocus");
      }
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
        
        A widget is shadowed by a [gid.gtk3.widget.Widget.grabAdd] when the topmost
        grab widget in the grab stack of its window group is not
        its ancestor.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool wasGrabbed, gid.gtk3.widget.Widget widget)`
  
          `wasGrabbed` false if the widget becomes shadowed, true
                          if it becomes unshadowed (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGrabNotify(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.grabNotify");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("grab-notify", closure, after);
  }

  /**
      Connect to `Hide` signal.
  
      The ::hide signal is emitted when widget is hidden, for example with
        [gid.gtk4.widget.Widget.hide].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHide(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.hide");
      }
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
  
          `void callback(gid.gtk3.widget.Widget previousToplevel, gid.gtk3.widget.Widget widget)`
  
          `previousToplevel` the previous toplevel ancestor, or null
              if the widget was previously unanchored (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHierarchyChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.hierarchyChanged");
      }
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
  
          `bool callback(gid.gdk3.event_key.EventKey event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventKey which triggered this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectKeyPressEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_key.EventKey)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_key.EventKey(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.keyPressEvent");
      }

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
  
          `bool callback(gid.gdk3.event_key.EventKey event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventKey which triggered this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectKeyReleaseEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_key.EventKey)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_key.EventKey(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.keyReleaseEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-release-event", closure, after);
  }

  /**
      Connect to `KeynavFailed` signal.
  
      Gets emitted if keyboard navigation fails.
        See [gid.gtk4.widget.Widget.keynavFailed] for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.DirectionType direction, gid.gtk3.widget.Widget widget)`
  
          `direction` the direction of movement (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if stopping keyboard navigation is fine, false
                     if the emitting widget should try to handle the keyboard
                     navigation attempt in its parent container(s).
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectKeynavFailed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.keynavFailed");
      }

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
  
          `bool callback(gid.gdk3.event_crossing.EventCrossing event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventCrossing which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLeaveNotifyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_crossing.EventCrossing)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_crossing.EventCrossing(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.leaveNotifyEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave-notify-event", closure, after);
  }

  /**
      Connect to `Map` signal.
  
      The ::map signal is emitted when widget is going to be mapped, that is
        when the widget is visible (which is controlled with
        [gid.gtk4.widget.Widget.setVisible]) and all its parents up to the toplevel widget
        are also visible. Once the map has occurred, #GtkWidget::map-event will
        be emitted.
        
        The ::map signal can be used to determine whether a widget will be drawn,
        for instance it can resume an animation that was stopped during the
        emission of #GtkWidget::unmap.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMap(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.map");
      }
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
  
          `bool callback(gid.gdk3.event_any.EventAny event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventAny which triggered this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMapEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_any.EventAny)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_any.EventAny(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.mapEvent");
      }

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
  
          `bool callback(bool groupCycling, gid.gtk3.widget.Widget widget)`
  
          `groupCycling` true if there are other widgets with the same mnemonic (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMnemonicActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.mnemonicActivate");
      }

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
  
          `bool callback(gid.gdk3.event_motion.EventMotion event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventMotion which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMotionNotifyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_motion.EventMotion)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_motion.EventMotion(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.motionNotifyEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion-notify-event", closure, after);
  }

  /**
      Connect to `MoveFocus` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.DirectionType direction, gid.gtk3.widget.Widget widget)`
  
          `direction`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.moveFocus");
      }
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
  
          `void callback(gid.gtk3.widget.Widget oldParent, gid.gtk3.widget.Widget widget)`
  
          `oldParent` the previous parent, or null if the widget
              just got its initial parent. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectParentSet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.parentSet");
      }
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
  
          `bool callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if a menu was activated
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopupMenu(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.popupMenu");
      }

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
  
          `bool callback(gid.gdk3.event_property.EventProperty event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventProperty which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPropertyNotifyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_property.EventProperty)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_property.EventProperty(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.propertyNotifyEvent");
      }

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
  
          `bool callback(gid.gdk3.event_proximity.EventProximity event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventProximity which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectProximityInEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_proximity.EventProximity)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_proximity.EventProximity(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.proximityInEvent");
      }

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
  
          `bool callback(gid.gdk3.event_proximity.EventProximity event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventProximity which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectProximityOutEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_proximity.EventProximity)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_proximity.EventProximity(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.proximityOutEvent");
      }

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
  
          `bool callback(int x, int y, bool keyboardMode, gid.gtk3.tooltip.Tooltip tooltip, gid.gtk3.widget.Widget widget)`
  
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
  gulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.tooltip.Tooltip)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

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

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.queryTooltip");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip", closure, after);
  }

  /**
      Connect to `Realize` signal.
  
      The ::realize signal is emitted when widget is associated with a
        #GdkWindow, which means that [gid.gtk4.widget.Widget.realize] has been called or the
        widget has been mapped (that is, it is going to be drawn).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRealize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.realize");
      }
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
  
          `void callback(gid.gdk3.screen.Screen previousScreen, gid.gtk3.widget.Widget widget)`
  
          `previousScreen` the previous screen, or null if the
              widget was not associated with a screen before (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScreenChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.screen.Screen)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.screenChanged");
      }
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
  
          `bool callback(gid.gdk3.event_scroll.EventScroll event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventScroll which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScrollEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_scroll.EventScroll)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_scroll.EventScroll(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.scrollEvent");
      }

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
  
          `bool callback(gid.gdk3.event_selection.EventSelection event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventSelection which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionClearEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_selection.EventSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_selection.EventSelection(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.selectionClearEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-clear-event", closure, after);
  }

  /**
      Connect to `SelectionGet` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.selection_data.SelectionData data, uint info, uint time, gid.gtk3.widget.Widget widget)`
  
          `data`  (optional)
  
          `info`  (optional)
  
          `time`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionGet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.selection_data.SelectionData)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == uint)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.selectionGet");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-get", closure, after);
  }

  /**
      Connect to `SelectionNotifyEvent` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.event_selection.EventSelection event, gid.gtk3.widget.Widget widget)`
  
          `event`  (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionNotifyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_selection.EventSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_selection.EventSelection(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.selectionNotifyEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-notify-event", closure, after);
  }

  /**
      Connect to `SelectionReceived` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.selection_data.SelectionData data, uint time, gid.gtk3.widget.Widget widget)`
  
          `data`  (optional)
  
          `time`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionReceived(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.selection_data.SelectionData)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.selectionReceived");
      }
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
  
          `bool callback(gid.gdk3.event_selection.EventSelection event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventSelection which triggered
              this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionRequestEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_selection.EventSelection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_selection.EventSelection(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.selectionRequestEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-request-event", closure, after);
  }

  /**
      Connect to `Show` signal.
  
      The ::show signal is emitted when widget is shown, for example with
        [gid.gtk4.widget.Widget.show].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.show");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show", closure, after);
  }

  /**
      Connect to `ShowHelp` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.WidgetHelpType helpType, gid.gtk3.widget.Widget widget)`
  
          `helpType`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShowHelp(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.WidgetHelpType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.showHelp");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-help", closure, after);
  }

  /**
      Connect to `SizeAllocate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.Allocation allocation, gid.gtk3.widget.Widget widget)`
  
          `allocation` the region which has been
              allocated to the widget. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSizeAllocate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.Allocation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.sizeAllocate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("size-allocate", closure, after);
  }

  /**
      Connect to `StateChanged` signal.
  
      The ::state-changed signal is emitted when the widget state changes.
        See [gid.gtk3.widget.Widget.getState].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.StateType state, gid.gtk3.widget.Widget widget)`
  
          `state` the previous state (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use #GtkWidget::state-flags-changed instead.
  */
  gulong connectStateChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.StateType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.stateChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-changed", closure, after);
  }

  /**
      Connect to `StateFlagsChanged` signal.
  
      The ::state-flags-changed signal is emitted when the widget state
        changes, see [gid.gtk4.widget.Widget.getStateFlags].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.StateFlags flags, gid.gtk3.widget.Widget widget)`
  
          `flags` The previous state flags. (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStateFlagsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.StateFlags)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.stateFlagsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-flags-changed", closure, after);
  }

  /**
      Connect to `StyleSet` signal.
  
      The ::style-set signal is emitted when a new style has been set
        on a widget. Note that style-modifying functions like
        [gid.gtk3.widget.Widget.modifyBase] also cause this signal to be emitted.
        
        Note that this signal is emitted for changes to the deprecated
        #GtkStyle. To track changes to the #GtkStyleContext associated
        with a widget, use the #GtkWidget::style-updated signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.style.Style previousStyle, gid.gtk3.widget.Widget widget)`
  
          `previousStyle` the previous style, or null if the widget
              just got its initial style (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::style-updated signal
  */
  gulong connectStyleSet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.style.Style)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.styleSet");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("style-set", closure, after);
  }

  /**
      Connect to `StyleUpdated` signal.
  
      The ::style-updated signal is a convenience signal that is emitted when the
        #GtkStyleContext::changed signal is emitted on the widget's associated
        #GtkStyleContext as returned by [gid.gtk4.widget.Widget.getStyleContext].
        
        Note that style-modifying functions like [gid.gtk3.widget.Widget.overrideColor] also
        cause this signal to be emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStyleUpdated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.styleUpdated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("style-updated", closure, after);
  }

  /**
      Connect to `TouchEvent` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.event.Event object, gid.gtk3.widget.Widget widget)`
  
          `object`  (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTouchEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.touchEvent");
      }

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
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnmap(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.unmap");
      }
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
  
          `bool callback(gid.gdk3.event_any.EventAny event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventAny which triggered this signal (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnmapEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_any.EventAny)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_any.EventAny(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.unmapEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unmap-event", closure, after);
  }

  /**
      Connect to `Unrealize` signal.
  
      The ::unrealize signal is emitted when the #GdkWindow associated with
        widget is destroyed, which means that [gid.gtk4.widget.Widget.unrealize] has been
        called or the widget has been unmapped (that is, it is going to be
        hidden).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnrealize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.unrealize");
      }
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
  
          `bool callback(gid.gdk3.event_visibility.EventVisibility event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventVisibility which
              triggered this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
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
  gulong connectVisibilityNotifyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_visibility.EventVisibility)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_visibility.EventVisibility(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.visibilityNotifyEvent");
      }

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
  
          `bool callback(gid.gdk3.event_window_state.EventWindowState event, gid.gtk3.widget.Widget widget)`
  
          `event` the #GdkEventWindowState which
              triggered this signal. (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the
              event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWindowStateEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_window_state.EventWindowState)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.widget.Widget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_window_state.EventWindowState(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.windowStateEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-state-event", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Widget
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.widget.Widget), T.stringof ~ " is not derived from gid.gtk3.widget.Widget");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncButtonPressEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "button_press_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncButtonReleaseEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "button_release_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCanActivateAccel", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "can_activate_accel");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChildNotify", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "child_notify");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCompositedChanged", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "composited_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncConfigureEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "configure_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDamageEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "damage_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "delete_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDestroy", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "destroy");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDestroyEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "destroy_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDirectionChanged", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "direction_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragBegin", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_begin");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragDataDelete", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_data_delete");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragDataGet", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_data_get");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragDataReceived", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_data_received");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragDrop", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_drop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragEnd", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_end");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragFailed", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_failed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragLeave", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_leave");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDragMotion", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "drag_motion");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDraw", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "draw");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEnterNotifyEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "enter_notify_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocus", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocusInEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "focus_in_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocusOutEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "focus_out_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetAccessible", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "get_accessible");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeight", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "get_preferred_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeightAndBaselineForWidth", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "get_preferred_height_and_baseline_for_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeightForWidth", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "get_preferred_height_for_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidth", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "get_preferred_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidthForHeight", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "get_preferred_width_for_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRequestMode", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "get_request_mode");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGrabBrokenEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "grab_broken_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGrabFocus", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "grab_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGrabNotify", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "grab_notify");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHide", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "hide");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHierarchyChanged", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "hierarchy_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncKeyPressEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "key_press_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncKeyReleaseEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "key_release_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncKeynavFailed", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "keynav_failed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLeaveNotifyEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "leave_notify_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMap", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "map");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMapEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "map_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMnemonicActivate", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "mnemonic_activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMotionNotifyEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "motion_notify_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveFocus", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "move_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParentSet", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "parent_set");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopupMenu", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "popup_menu");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPropertyNotifyEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "property_notify_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProximityInEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "proximity_in_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProximityOutEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "proximity_out_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryTooltip", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "query_tooltip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueueDrawRegion", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "queue_draw_region");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRealize", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "realize");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncScreenChanged", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "screen_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncScrollEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "scroll_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionClearEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "selection_clear_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionGet", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "selection_get");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionNotifyEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "selection_notify_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionReceived", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "selection_received");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionRequestEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "selection_request_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShow", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "show");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShowAll", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "show_all");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShowHelp", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "show_help");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSizeAllocate", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "size_allocate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStateChanged", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "state_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStateFlagsChanged", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "state_flags_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStyleSet", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "style_set");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStyleUpdated", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "style_updated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTouchEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "touch_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnmap", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "unmap");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnmapEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "unmap_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnrealize", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "unrealize");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVisibilityNotifyEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "visibility_notify_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWindowStateEvent", true)[0]) == gid.gtk3.widget.Widget))
      _installVfunc(klass, "window_state_event");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkWidgetClass*)klass;

    switch (vfunc)
    {
      case "button_press_event":
      {
        static extern(C) gboolean _vfuncButtonPressEventTramp(GtkWidget* widget, GdkEventButton* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.buttonPressEvent)
              return (cast(typeof(&_vfuncButtonPressEventTramp))_klass.buttonPressEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_button.EventButton(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncButtonPressEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncButtonPressEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.buttonPressEvent = cast(typeof(_klass.buttonPressEvent))&_vfuncButtonPressEventTramp;
        break;
      }
      case "button_release_event":
      {
        static extern(C) gboolean _vfuncButtonReleaseEventTramp(GtkWidget* widget, GdkEventButton* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.buttonReleaseEvent)
              return (cast(typeof(&_vfuncButtonReleaseEventTramp))_klass.buttonReleaseEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_button.EventButton(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncButtonReleaseEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncButtonReleaseEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.buttonReleaseEvent = cast(typeof(_klass.buttonReleaseEvent))&_vfuncButtonReleaseEventTramp;
        break;
      }
      case "can_activate_accel":
      {
        static extern(C) gboolean _vfuncCanActivateAccelTramp(GtkWidget* widget, uint signalId) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.canActivateAccel)
              return (cast(typeof(&_vfuncCanActivateAccelTramp))_klass.canActivateAccel)(widget, signalId);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanActivateAccel(signalId);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncCanActivateAccel");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canActivateAccel = cast(typeof(_klass.canActivateAccel))&_vfuncCanActivateAccelTramp;
        break;
      }
      case "child_notify":
      {
        static extern(C) void _vfuncChildNotifyTramp(GtkWidget* widget, GParamSpec* childProperty) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.childNotify)
              return (cast(typeof(&_vfuncChildNotifyTramp))_klass.childNotify)(widget, childProperty);
            return;
          }

          try
          {
            _obj.vfuncChildNotify(childProperty ? new gid.gobject2.param_spec.ParamSpec(cast(void*)childProperty, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncChildNotify");
          }
        }

        _klass.childNotify = cast(typeof(_klass.childNotify))&_vfuncChildNotifyTramp;
        break;
      }
      case "composited_changed":
      {
        static extern(C) void _vfuncCompositedChangedTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.compositedChanged)
              return (cast(typeof(&_vfuncCompositedChangedTramp))_klass.compositedChanged)(widget);
            return;
          }

          try
          {
            _obj.vfuncCompositedChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncCompositedChanged");
          }
        }

        _klass.compositedChanged = cast(typeof(_klass.compositedChanged))&_vfuncCompositedChangedTramp;
        break;
      }
      case "configure_event":
      {
        static extern(C) gboolean _vfuncConfigureEventTramp(GtkWidget* widget, GdkEventConfigure* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.configureEvent)
              return (cast(typeof(&_vfuncConfigureEventTramp))_klass.configureEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_configure.EventConfigure(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncConfigureEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncConfigureEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.configureEvent = cast(typeof(_klass.configureEvent))&_vfuncConfigureEventTramp;
        break;
      }
      case "damage_event":
      {
        static extern(C) gboolean _vfuncDamageEventTramp(GtkWidget* widget, GdkEventExpose* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.damageEvent)
              return (cast(typeof(&_vfuncDamageEventTramp))_klass.damageEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_expose.EventExpose(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncDamageEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDamageEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.damageEvent = cast(typeof(_klass.damageEvent))&_vfuncDamageEventTramp;
        break;
      }
      case "delete_event":
      {
        static extern(C) gboolean _vfuncDeleteEventTramp(GtkWidget* widget, GdkEventAny* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.deleteEvent)
              return (cast(typeof(&_vfuncDeleteEventTramp))_klass.deleteEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_any.EventAny(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncDeleteEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDeleteEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.deleteEvent = cast(typeof(_klass.deleteEvent))&_vfuncDeleteEventTramp;
        break;
      }
      case "destroy":
      {
        static extern(C) void _vfuncDestroyTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.destroy)
              return (cast(typeof(&_vfuncDestroyTramp))_klass.destroy)(widget);
            return;
          }

          try
          {
            _obj.vfuncDestroy();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDestroy");
          }
        }

        _klass.destroy = cast(typeof(_klass.destroy))&_vfuncDestroyTramp;
        break;
      }
      case "destroy_event":
      {
        static extern(C) gboolean _vfuncDestroyEventTramp(GtkWidget* widget, GdkEventAny* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.destroyEvent)
              return (cast(typeof(&_vfuncDestroyEventTramp))_klass.destroyEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_any.EventAny(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncDestroyEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDestroyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.destroyEvent = cast(typeof(_klass.destroyEvent))&_vfuncDestroyEventTramp;
        break;
      }
      case "direction_changed":
      {
        static extern(C) void _vfuncDirectionChangedTramp(GtkWidget* widget, GtkTextDirection previousDirection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.directionChanged)
              return (cast(typeof(&_vfuncDirectionChangedTramp))_klass.directionChanged)(widget, previousDirection);
            return;
          }

          try
          {
            _obj.vfuncDirectionChanged(previousDirection);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDirectionChanged");
          }
        }

        _klass.directionChanged = cast(typeof(_klass.directionChanged))&_vfuncDirectionChangedTramp;
        break;
      }
      case "drag_begin":
      {
        static extern(C) void _vfuncDragBeginTramp(GtkWidget* widget, GdkDragContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragBegin)
              return (cast(typeof(&_vfuncDragBeginTramp))_klass.dragBegin)(widget, context);
            return;
          }

          try
          {
            _obj.vfuncDragBegin(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragBegin");
          }
        }

        _klass.dragBegin = cast(typeof(_klass.dragBegin))&_vfuncDragBeginTramp;
        break;
      }
      case "drag_data_delete":
      {
        static extern(C) void _vfuncDragDataDeleteTramp(GtkWidget* widget, GdkDragContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragDataDelete)
              return (cast(typeof(&_vfuncDragDataDeleteTramp))_klass.dragDataDelete)(widget, context);
            return;
          }

          try
          {
            _obj.vfuncDragDataDelete(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragDataDelete");
          }
        }

        _klass.dragDataDelete = cast(typeof(_klass.dragDataDelete))&_vfuncDragDataDeleteTramp;
        break;
      }
      case "drag_data_get":
      {
        static extern(C) void _vfuncDragDataGetTramp(GtkWidget* widget, GdkDragContext* context, GtkSelectionData* selectionData, uint info, uint time) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragDataGet)
              return (cast(typeof(&_vfuncDragDataGetTramp))_klass.dragDataGet)(widget, context, selectionData, info, time);
            return;
          }

          auto _selectionData = selectionData ? new gid.gtk3.selection_data.SelectionData(cast(void*)selectionData, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncDragDataGet(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take), _selectionData, info, time);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragDataGet");
          }
          if (_selectionData)
            _selectionData._cUnborrow;

        }

        _klass.dragDataGet = cast(typeof(_klass.dragDataGet))&_vfuncDragDataGetTramp;
        break;
      }
      case "drag_data_received":
      {
        static extern(C) void _vfuncDragDataReceivedTramp(GtkWidget* widget, GdkDragContext* context, int x, int y, GtkSelectionData* selectionData, uint info, uint time) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragDataReceived)
              return (cast(typeof(&_vfuncDragDataReceivedTramp))_klass.dragDataReceived)(widget, context, x, y, selectionData, info, time);
            return;
          }

          auto _selectionData = selectionData ? new gid.gtk3.selection_data.SelectionData(cast(void*)selectionData, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncDragDataReceived(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take), x, y, _selectionData, info, time);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragDataReceived");
          }
          if (_selectionData)
            _selectionData._cUnborrow;

        }

        _klass.dragDataReceived = cast(typeof(_klass.dragDataReceived))&_vfuncDragDataReceivedTramp;
        break;
      }
      case "drag_drop":
      {
        static extern(C) gboolean _vfuncDragDropTramp(GtkWidget* widget, GdkDragContext* context, int x, int y, uint time) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragDrop)
              return (cast(typeof(&_vfuncDragDropTramp))_klass.dragDrop)(widget, context, x, y, time);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDragDrop(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take), x, y, time);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragDrop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.dragDrop = cast(typeof(_klass.dragDrop))&_vfuncDragDropTramp;
        break;
      }
      case "drag_end":
      {
        static extern(C) void _vfuncDragEndTramp(GtkWidget* widget, GdkDragContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragEnd)
              return (cast(typeof(&_vfuncDragEndTramp))_klass.dragEnd)(widget, context);
            return;
          }

          try
          {
            _obj.vfuncDragEnd(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragEnd");
          }
        }

        _klass.dragEnd = cast(typeof(_klass.dragEnd))&_vfuncDragEndTramp;
        break;
      }
      case "drag_failed":
      {
        static extern(C) gboolean _vfuncDragFailedTramp(GtkWidget* widget, GdkDragContext* context, GtkDragResult result) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragFailed)
              return (cast(typeof(&_vfuncDragFailedTramp))_klass.dragFailed)(widget, context, result);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDragFailed(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take), result);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragFailed");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.dragFailed = cast(typeof(_klass.dragFailed))&_vfuncDragFailedTramp;
        break;
      }
      case "drag_leave":
      {
        static extern(C) void _vfuncDragLeaveTramp(GtkWidget* widget, GdkDragContext* context, uint time) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragLeave)
              return (cast(typeof(&_vfuncDragLeaveTramp))_klass.dragLeave)(widget, context, time);
            return;
          }

          try
          {
            _obj.vfuncDragLeave(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take), time);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragLeave");
          }
        }

        _klass.dragLeave = cast(typeof(_klass.dragLeave))&_vfuncDragLeaveTramp;
        break;
      }
      case "drag_motion":
      {
        static extern(C) gboolean _vfuncDragMotionTramp(GtkWidget* widget, GdkDragContext* context, int x, int y, uint time) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.dragMotion)
              return (cast(typeof(&_vfuncDragMotionTramp))_klass.dragMotion)(widget, context, x, y, time);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDragMotion(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.drag_context.DragContext)(cast(void*)context, No.Take), x, y, time);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDragMotion");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.dragMotion = cast(typeof(_klass.dragMotion))&_vfuncDragMotionTramp;
        break;
      }
      case "draw":
      {
        static extern(C) gboolean _vfuncDrawTramp(GtkWidget* widget, cairo_t* cr) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.draw)
              return (cast(typeof(&_vfuncDrawTramp))_klass.draw)(widget, cr);
            return typeof(return).init;
          }

          bool _dretval;
          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDraw(_cr);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncDraw");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_cr)
            _cr._cUnborrow;

          return _retval;
        }

        _klass.draw = cast(typeof(_klass.draw))&_vfuncDrawTramp;
        break;
      }
      case "enter_notify_event":
      {
        static extern(C) gboolean _vfuncEnterNotifyEventTramp(GtkWidget* widget, GdkEventCrossing* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.enterNotifyEvent)
              return (cast(typeof(&_vfuncEnterNotifyEventTramp))_klass.enterNotifyEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_crossing.EventCrossing(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncEnterNotifyEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncEnterNotifyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.enterNotifyEvent = cast(typeof(_klass.enterNotifyEvent))&_vfuncEnterNotifyEventTramp;
        break;
      }
      case "event":
      {
        static extern(C) gboolean _vfuncEventTramp(GtkWidget* widget, GdkEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.event)
              return (cast(typeof(&_vfuncEventTramp))_klass.event)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncEvent");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.event = cast(typeof(_klass.event))&_vfuncEventTramp;
        break;
      }
      case "focus":
      {
        static extern(C) gboolean _vfuncFocusTramp(GtkWidget* widget, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.focus)
              return (cast(typeof(&_vfuncFocusTramp))_klass.focus)(widget, direction);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFocus(direction);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.focus = cast(typeof(_klass.focus))&_vfuncFocusTramp;
        break;
      }
      case "focus_in_event":
      {
        static extern(C) gboolean _vfuncFocusInEventTramp(GtkWidget* widget, GdkEventFocus* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.focusInEvent)
              return (cast(typeof(&_vfuncFocusInEventTramp))_klass.focusInEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_focus.EventFocus(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncFocusInEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncFocusInEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.focusInEvent = cast(typeof(_klass.focusInEvent))&_vfuncFocusInEventTramp;
        break;
      }
      case "focus_out_event":
      {
        static extern(C) gboolean _vfuncFocusOutEventTramp(GtkWidget* widget, GdkEventFocus* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.focusOutEvent)
              return (cast(typeof(&_vfuncFocusOutEventTramp))_klass.focusOutEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_focus.EventFocus(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncFocusOutEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncFocusOutEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.focusOutEvent = cast(typeof(_klass.focusOutEvent))&_vfuncFocusOutEventTramp;
        break;
      }
      case "get_accessible":
      {
        static extern(C) AtkObject* _vfuncGetAccessibleTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getAccessible)
              return (cast(typeof(&_vfuncGetAccessibleTramp))_klass.getAccessible)(widget);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetAccessible();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGetAccessible");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getAccessible = cast(typeof(_klass.getAccessible))&_vfuncGetAccessibleTramp;
        break;
      }
      case "get_preferred_height":
      {
        static extern(C) void _vfuncGetPreferredHeightTramp(GtkWidget* widget, int* minimumHeight, int* naturalHeight) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getPreferredHeight)
              return (cast(typeof(&_vfuncGetPreferredHeightTramp))_klass.getPreferredHeight)(widget, minimumHeight, naturalHeight);
            return;
          }

          typeof(*minimumHeight) _minimumHeightNull;
          if (!minimumHeight)
            minimumHeight = &_minimumHeightNull;

          typeof(*naturalHeight) _naturalHeightNull;
          if (!naturalHeight)
            naturalHeight = &_naturalHeightNull;

          try
          {
            _obj.vfuncGetPreferredHeight(*minimumHeight, *naturalHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGetPreferredHeight");
          }
        }

        _klass.getPreferredHeight = cast(typeof(_klass.getPreferredHeight))&_vfuncGetPreferredHeightTramp;
        break;
      }
      case "get_preferred_height_and_baseline_for_width":
      {
        static extern(C) void _vfuncGetPreferredHeightAndBaselineForWidthTramp(GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight, int* minimumBaseline, int* naturalBaseline) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getPreferredHeightAndBaselineForWidth)
              return (cast(typeof(&_vfuncGetPreferredHeightAndBaselineForWidthTramp))_klass.getPreferredHeightAndBaselineForWidth)(widget, width, minimumHeight, naturalHeight, minimumBaseline, naturalBaseline);
            return;
          }

          typeof(*minimumHeight) _minimumHeightNull;
          if (!minimumHeight)
            minimumHeight = &_minimumHeightNull;

          typeof(*naturalHeight) _naturalHeightNull;
          if (!naturalHeight)
            naturalHeight = &_naturalHeightNull;

          typeof(*minimumBaseline) _minimumBaselineNull;
          if (!minimumBaseline)
            minimumBaseline = &_minimumBaselineNull;

          typeof(*naturalBaseline) _naturalBaselineNull;
          if (!naturalBaseline)
            naturalBaseline = &_naturalBaselineNull;

          try
          {
            _obj.vfuncGetPreferredHeightAndBaselineForWidth(width, *minimumHeight, *naturalHeight, *minimumBaseline, *naturalBaseline);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGetPreferredHeightAndBaselineForWidth");
          }
        }

        _klass.getPreferredHeightAndBaselineForWidth = cast(typeof(_klass.getPreferredHeightAndBaselineForWidth))&_vfuncGetPreferredHeightAndBaselineForWidthTramp;
        break;
      }
      case "get_preferred_height_for_width":
      {
        static extern(C) void _vfuncGetPreferredHeightForWidthTramp(GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getPreferredHeightForWidth)
              return (cast(typeof(&_vfuncGetPreferredHeightForWidthTramp))_klass.getPreferredHeightForWidth)(widget, width, minimumHeight, naturalHeight);
            return;
          }

          typeof(*minimumHeight) _minimumHeightNull;
          if (!minimumHeight)
            minimumHeight = &_minimumHeightNull;

          typeof(*naturalHeight) _naturalHeightNull;
          if (!naturalHeight)
            naturalHeight = &_naturalHeightNull;

          try
          {
            _obj.vfuncGetPreferredHeightForWidth(width, *minimumHeight, *naturalHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGetPreferredHeightForWidth");
          }
        }

        _klass.getPreferredHeightForWidth = cast(typeof(_klass.getPreferredHeightForWidth))&_vfuncGetPreferredHeightForWidthTramp;
        break;
      }
      case "get_preferred_width":
      {
        static extern(C) void _vfuncGetPreferredWidthTramp(GtkWidget* widget, int* minimumWidth, int* naturalWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getPreferredWidth)
              return (cast(typeof(&_vfuncGetPreferredWidthTramp))_klass.getPreferredWidth)(widget, minimumWidth, naturalWidth);
            return;
          }

          typeof(*minimumWidth) _minimumWidthNull;
          if (!minimumWidth)
            minimumWidth = &_minimumWidthNull;

          typeof(*naturalWidth) _naturalWidthNull;
          if (!naturalWidth)
            naturalWidth = &_naturalWidthNull;

          try
          {
            _obj.vfuncGetPreferredWidth(*minimumWidth, *naturalWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGetPreferredWidth");
          }
        }

        _klass.getPreferredWidth = cast(typeof(_klass.getPreferredWidth))&_vfuncGetPreferredWidthTramp;
        break;
      }
      case "get_preferred_width_for_height":
      {
        static extern(C) void _vfuncGetPreferredWidthForHeightTramp(GtkWidget* widget, int height, int* minimumWidth, int* naturalWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getPreferredWidthForHeight)
              return (cast(typeof(&_vfuncGetPreferredWidthForHeightTramp))_klass.getPreferredWidthForHeight)(widget, height, minimumWidth, naturalWidth);
            return;
          }

          typeof(*minimumWidth) _minimumWidthNull;
          if (!minimumWidth)
            minimumWidth = &_minimumWidthNull;

          typeof(*naturalWidth) _naturalWidthNull;
          if (!naturalWidth)
            naturalWidth = &_naturalWidthNull;

          try
          {
            _obj.vfuncGetPreferredWidthForHeight(height, *minimumWidth, *naturalWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGetPreferredWidthForHeight");
          }
        }

        _klass.getPreferredWidthForHeight = cast(typeof(_klass.getPreferredWidthForHeight))&_vfuncGetPreferredWidthForHeightTramp;
        break;
      }
      case "get_request_mode":
      {
        static extern(C) GtkSizeRequestMode _vfuncGetRequestModeTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getRequestMode)
              return (cast(typeof(&_vfuncGetRequestModeTramp))_klass.getRequestMode)(widget);
            return typeof(return).init;
          }

          gid.gtk3.types.SizeRequestMode _dretval;

          try
          {
            _dretval = _obj.vfuncGetRequestMode();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGetRequestMode");
          }
          auto _retval = cast(GtkSizeRequestMode)_dretval;

          return _retval;
        }

        _klass.getRequestMode = cast(typeof(_klass.getRequestMode))&_vfuncGetRequestModeTramp;
        break;
      }
      case "grab_broken_event":
      {
        static extern(C) gboolean _vfuncGrabBrokenEventTramp(GtkWidget* widget, GdkEventGrabBroken* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.grabBrokenEvent)
              return (cast(typeof(&_vfuncGrabBrokenEventTramp))_klass.grabBrokenEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_grab_broken.EventGrabBroken(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncGrabBrokenEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGrabBrokenEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.grabBrokenEvent = cast(typeof(_klass.grabBrokenEvent))&_vfuncGrabBrokenEventTramp;
        break;
      }
      case "grab_focus":
      {
        static extern(C) void _vfuncGrabFocusTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.grabFocus)
              return (cast(typeof(&_vfuncGrabFocusTramp))_klass.grabFocus)(widget);
            return;
          }

          try
          {
            _obj.vfuncGrabFocus();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGrabFocus");
          }
        }

        _klass.grabFocus = cast(typeof(_klass.grabFocus))&_vfuncGrabFocusTramp;
        break;
      }
      case "grab_notify":
      {
        static extern(C) void _vfuncGrabNotifyTramp(GtkWidget* widget, gboolean wasGrabbed) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.grabNotify)
              return (cast(typeof(&_vfuncGrabNotifyTramp))_klass.grabNotify)(widget, wasGrabbed);
            return;
          }

          try
          {
            _obj.vfuncGrabNotify(cast(bool)wasGrabbed);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncGrabNotify");
          }
        }

        _klass.grabNotify = cast(typeof(_klass.grabNotify))&_vfuncGrabNotifyTramp;
        break;
      }
      case "hide":
      {
        static extern(C) void _vfuncHideTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.hide)
              return (cast(typeof(&_vfuncHideTramp))_klass.hide)(widget);
            return;
          }

          try
          {
            _obj.vfuncHide();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncHide");
          }
        }

        _klass.hide = cast(typeof(_klass.hide))&_vfuncHideTramp;
        break;
      }
      case "hierarchy_changed":
      {
        static extern(C) void _vfuncHierarchyChangedTramp(GtkWidget* widget, GtkWidget* previousToplevel) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.hierarchyChanged)
              return (cast(typeof(&_vfuncHierarchyChangedTramp))_klass.hierarchyChanged)(widget, previousToplevel);
            return;
          }

          try
          {
            _obj.vfuncHierarchyChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)previousToplevel, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncHierarchyChanged");
          }
        }

        _klass.hierarchyChanged = cast(typeof(_klass.hierarchyChanged))&_vfuncHierarchyChangedTramp;
        break;
      }
      case "key_press_event":
      {
        static extern(C) gboolean _vfuncKeyPressEventTramp(GtkWidget* widget, GdkEventKey* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.keyPressEvent)
              return (cast(typeof(&_vfuncKeyPressEventTramp))_klass.keyPressEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_key.EventKey(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncKeyPressEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncKeyPressEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.keyPressEvent = cast(typeof(_klass.keyPressEvent))&_vfuncKeyPressEventTramp;
        break;
      }
      case "key_release_event":
      {
        static extern(C) gboolean _vfuncKeyReleaseEventTramp(GtkWidget* widget, GdkEventKey* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.keyReleaseEvent)
              return (cast(typeof(&_vfuncKeyReleaseEventTramp))_klass.keyReleaseEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_key.EventKey(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncKeyReleaseEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncKeyReleaseEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.keyReleaseEvent = cast(typeof(_klass.keyReleaseEvent))&_vfuncKeyReleaseEventTramp;
        break;
      }
      case "keynav_failed":
      {
        static extern(C) gboolean _vfuncKeynavFailedTramp(GtkWidget* widget, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.keynavFailed)
              return (cast(typeof(&_vfuncKeynavFailedTramp))_klass.keynavFailed)(widget, direction);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncKeynavFailed(direction);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncKeynavFailed");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.keynavFailed = cast(typeof(_klass.keynavFailed))&_vfuncKeynavFailedTramp;
        break;
      }
      case "leave_notify_event":
      {
        static extern(C) gboolean _vfuncLeaveNotifyEventTramp(GtkWidget* widget, GdkEventCrossing* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.leaveNotifyEvent)
              return (cast(typeof(&_vfuncLeaveNotifyEventTramp))_klass.leaveNotifyEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_crossing.EventCrossing(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncLeaveNotifyEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncLeaveNotifyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.leaveNotifyEvent = cast(typeof(_klass.leaveNotifyEvent))&_vfuncLeaveNotifyEventTramp;
        break;
      }
      case "map":
      {
        static extern(C) void _vfuncMapTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.map)
              return (cast(typeof(&_vfuncMapTramp))_klass.map)(widget);
            return;
          }

          try
          {
            _obj.vfuncMap();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncMap");
          }
        }

        _klass.map = cast(typeof(_klass.map))&_vfuncMapTramp;
        break;
      }
      case "map_event":
      {
        static extern(C) gboolean _vfuncMapEventTramp(GtkWidget* widget, GdkEventAny* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.mapEvent)
              return (cast(typeof(&_vfuncMapEventTramp))_klass.mapEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_any.EventAny(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncMapEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncMapEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.mapEvent = cast(typeof(_klass.mapEvent))&_vfuncMapEventTramp;
        break;
      }
      case "mnemonic_activate":
      {
        static extern(C) gboolean _vfuncMnemonicActivateTramp(GtkWidget* widget, gboolean groupCycling) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.mnemonicActivate)
              return (cast(typeof(&_vfuncMnemonicActivateTramp))_klass.mnemonicActivate)(widget, groupCycling);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMnemonicActivate(cast(bool)groupCycling);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncMnemonicActivate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.mnemonicActivate = cast(typeof(_klass.mnemonicActivate))&_vfuncMnemonicActivateTramp;
        break;
      }
      case "motion_notify_event":
      {
        static extern(C) gboolean _vfuncMotionNotifyEventTramp(GtkWidget* widget, GdkEventMotion* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.motionNotifyEvent)
              return (cast(typeof(&_vfuncMotionNotifyEventTramp))_klass.motionNotifyEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_motion.EventMotion(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncMotionNotifyEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncMotionNotifyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.motionNotifyEvent = cast(typeof(_klass.motionNotifyEvent))&_vfuncMotionNotifyEventTramp;
        break;
      }
      case "move_focus":
      {
        static extern(C) void _vfuncMoveFocusTramp(GtkWidget* widget, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.moveFocus)
              return (cast(typeof(&_vfuncMoveFocusTramp))_klass.moveFocus)(widget, direction);
            return;
          }

          try
          {
            _obj.vfuncMoveFocus(direction);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncMoveFocus");
          }
        }

        _klass.moveFocus = cast(typeof(_klass.moveFocus))&_vfuncMoveFocusTramp;
        break;
      }
      case "parent_set":
      {
        static extern(C) void _vfuncParentSetTramp(GtkWidget* widget, GtkWidget* previousParent) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.parentSet)
              return (cast(typeof(&_vfuncParentSetTramp))_klass.parentSet)(widget, previousParent);
            return;
          }

          try
          {
            _obj.vfuncParentSet(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)previousParent, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncParentSet");
          }
        }

        _klass.parentSet = cast(typeof(_klass.parentSet))&_vfuncParentSetTramp;
        break;
      }
      case "popup_menu":
      {
        static extern(C) gboolean _vfuncPopupMenuTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.popupMenu)
              return (cast(typeof(&_vfuncPopupMenuTramp))_klass.popupMenu)(widget);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPopupMenu();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncPopupMenu");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.popupMenu = cast(typeof(_klass.popupMenu))&_vfuncPopupMenuTramp;
        break;
      }
      case "property_notify_event":
      {
        static extern(C) gboolean _vfuncPropertyNotifyEventTramp(GtkWidget* widget, GdkEventProperty* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.propertyNotifyEvent)
              return (cast(typeof(&_vfuncPropertyNotifyEventTramp))_klass.propertyNotifyEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_property.EventProperty(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncPropertyNotifyEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncPropertyNotifyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.propertyNotifyEvent = cast(typeof(_klass.propertyNotifyEvent))&_vfuncPropertyNotifyEventTramp;
        break;
      }
      case "proximity_in_event":
      {
        static extern(C) gboolean _vfuncProximityInEventTramp(GtkWidget* widget, GdkEventProximity* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.proximityInEvent)
              return (cast(typeof(&_vfuncProximityInEventTramp))_klass.proximityInEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_proximity.EventProximity(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncProximityInEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncProximityInEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.proximityInEvent = cast(typeof(_klass.proximityInEvent))&_vfuncProximityInEventTramp;
        break;
      }
      case "proximity_out_event":
      {
        static extern(C) gboolean _vfuncProximityOutEventTramp(GtkWidget* widget, GdkEventProximity* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.proximityOutEvent)
              return (cast(typeof(&_vfuncProximityOutEventTramp))_klass.proximityOutEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_proximity.EventProximity(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncProximityOutEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncProximityOutEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.proximityOutEvent = cast(typeof(_klass.proximityOutEvent))&_vfuncProximityOutEventTramp;
        break;
      }
      case "query_tooltip":
      {
        static extern(C) gboolean _vfuncQueryTooltipTramp(GtkWidget* widget, int x, int y, gboolean keyboardTooltip, GtkTooltip* tooltip) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.queryTooltip)
              return (cast(typeof(&_vfuncQueryTooltipTramp))_klass.queryTooltip)(widget, x, y, keyboardTooltip, tooltip);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncQueryTooltip(x, y, cast(bool)keyboardTooltip, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tooltip.Tooltip)(cast(void*)tooltip, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncQueryTooltip");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.queryTooltip = cast(typeof(_klass.queryTooltip))&_vfuncQueryTooltipTramp;
        break;
      }
      case "queue_draw_region":
      {
        static extern(C) void _vfuncQueueDrawRegionTramp(GtkWidget* widget, const(cairo_region_t)* region) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.queueDrawRegion)
              return (cast(typeof(&_vfuncQueueDrawRegionTramp))_klass.queueDrawRegion)(widget, region);
            return;
          }

          try
          {
            _obj.vfuncQueueDrawRegion(region ? new gid.cairo1.region.Region(cast(void*)region, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncQueueDrawRegion");
          }
        }

        _klass.queueDrawRegion = cast(typeof(_klass.queueDrawRegion))&_vfuncQueueDrawRegionTramp;
        break;
      }
      case "realize":
      {
        static extern(C) void _vfuncRealizeTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.realize)
              return (cast(typeof(&_vfuncRealizeTramp))_klass.realize)(widget);
            return;
          }

          try
          {
            _obj.vfuncRealize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncRealize");
          }
        }

        _klass.realize = cast(typeof(_klass.realize))&_vfuncRealizeTramp;
        break;
      }
      case "screen_changed":
      {
        static extern(C) void _vfuncScreenChangedTramp(GtkWidget* widget, GdkScreen* previousScreen) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.screenChanged)
              return (cast(typeof(&_vfuncScreenChangedTramp))_klass.screenChanged)(widget, previousScreen);
            return;
          }

          try
          {
            _obj.vfuncScreenChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(void*)previousScreen, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncScreenChanged");
          }
        }

        _klass.screenChanged = cast(typeof(_klass.screenChanged))&_vfuncScreenChangedTramp;
        break;
      }
      case "scroll_event":
      {
        static extern(C) gboolean _vfuncScrollEventTramp(GtkWidget* widget, GdkEventScroll* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.scrollEvent)
              return (cast(typeof(&_vfuncScrollEventTramp))_klass.scrollEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_scroll.EventScroll(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncScrollEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncScrollEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.scrollEvent = cast(typeof(_klass.scrollEvent))&_vfuncScrollEventTramp;
        break;
      }
      case "selection_clear_event":
      {
        static extern(C) gboolean _vfuncSelectionClearEventTramp(GtkWidget* widget, GdkEventSelection* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.selectionClearEvent)
              return (cast(typeof(&_vfuncSelectionClearEventTramp))_klass.selectionClearEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_selection.EventSelection(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncSelectionClearEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncSelectionClearEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectionClearEvent = cast(typeof(_klass.selectionClearEvent))&_vfuncSelectionClearEventTramp;
        break;
      }
      case "selection_get":
      {
        static extern(C) void _vfuncSelectionGetTramp(GtkWidget* widget, GtkSelectionData* selectionData, uint info, uint time) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.selectionGet)
              return (cast(typeof(&_vfuncSelectionGetTramp))_klass.selectionGet)(widget, selectionData, info, time);
            return;
          }

          auto _selectionData = selectionData ? new gid.gtk3.selection_data.SelectionData(cast(void*)selectionData, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncSelectionGet(_selectionData, info, time);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncSelectionGet");
          }
          if (_selectionData)
            _selectionData._cUnborrow;

        }

        _klass.selectionGet = cast(typeof(_klass.selectionGet))&_vfuncSelectionGetTramp;
        break;
      }
      case "selection_notify_event":
      {
        static extern(C) gboolean _vfuncSelectionNotifyEventTramp(GtkWidget* widget, GdkEventSelection* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.selectionNotifyEvent)
              return (cast(typeof(&_vfuncSelectionNotifyEventTramp))_klass.selectionNotifyEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_selection.EventSelection(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncSelectionNotifyEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncSelectionNotifyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectionNotifyEvent = cast(typeof(_klass.selectionNotifyEvent))&_vfuncSelectionNotifyEventTramp;
        break;
      }
      case "selection_received":
      {
        static extern(C) void _vfuncSelectionReceivedTramp(GtkWidget* widget, GtkSelectionData* selectionData, uint time) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.selectionReceived)
              return (cast(typeof(&_vfuncSelectionReceivedTramp))_klass.selectionReceived)(widget, selectionData, time);
            return;
          }

          auto _selectionData = selectionData ? new gid.gtk3.selection_data.SelectionData(cast(void*)selectionData, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncSelectionReceived(_selectionData, time);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncSelectionReceived");
          }
          if (_selectionData)
            _selectionData._cUnborrow;

        }

        _klass.selectionReceived = cast(typeof(_klass.selectionReceived))&_vfuncSelectionReceivedTramp;
        break;
      }
      case "selection_request_event":
      {
        static extern(C) gboolean _vfuncSelectionRequestEventTramp(GtkWidget* widget, GdkEventSelection* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.selectionRequestEvent)
              return (cast(typeof(&_vfuncSelectionRequestEventTramp))_klass.selectionRequestEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_selection.EventSelection(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncSelectionRequestEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncSelectionRequestEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectionRequestEvent = cast(typeof(_klass.selectionRequestEvent))&_vfuncSelectionRequestEventTramp;
        break;
      }
      case "show":
      {
        static extern(C) void _vfuncShowTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.show)
              return (cast(typeof(&_vfuncShowTramp))_klass.show)(widget);
            return;
          }

          try
          {
            _obj.vfuncShow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncShow");
          }
        }

        _klass.show = cast(typeof(_klass.show))&_vfuncShowTramp;
        break;
      }
      case "show_all":
      {
        static extern(C) void _vfuncShowAllTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.showAll)
              return (cast(typeof(&_vfuncShowAllTramp))_klass.showAll)(widget);
            return;
          }

          try
          {
            _obj.vfuncShowAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncShowAll");
          }
        }

        _klass.showAll = cast(typeof(_klass.showAll))&_vfuncShowAllTramp;
        break;
      }
      case "show_help":
      {
        static extern(C) gboolean _vfuncShowHelpTramp(GtkWidget* widget, GtkWidgetHelpType helpType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.showHelp)
              return (cast(typeof(&_vfuncShowHelpTramp))_klass.showHelp)(widget, helpType);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncShowHelp(helpType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncShowHelp");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.showHelp = cast(typeof(_klass.showHelp))&_vfuncShowHelpTramp;
        break;
      }
      case "size_allocate":
      {
        static extern(C) void _vfuncSizeAllocateTramp(GtkWidget* widget, GtkAllocation* allocation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.sizeAllocate)
              return (cast(typeof(&_vfuncSizeAllocateTramp))_klass.sizeAllocate)(widget, allocation);
            return;
          }

          try
          {
            _obj.vfuncSizeAllocate(*cast(gid.gtk3.types.Allocation*)allocation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncSizeAllocate");
          }
        }

        _klass.sizeAllocate = cast(typeof(_klass.sizeAllocate))&_vfuncSizeAllocateTramp;
        break;
      }
      case "state_changed":
      {
        static extern(C) void _vfuncStateChangedTramp(GtkWidget* widget, GtkStateType previousState) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.stateChanged)
              return (cast(typeof(&_vfuncStateChangedTramp))_klass.stateChanged)(widget, previousState);
            return;
          }

          try
          {
            _obj.vfuncStateChanged(previousState);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncStateChanged");
          }
        }

        _klass.stateChanged = cast(typeof(_klass.stateChanged))&_vfuncStateChangedTramp;
        break;
      }
      case "state_flags_changed":
      {
        static extern(C) void _vfuncStateFlagsChangedTramp(GtkWidget* widget, GtkStateFlags previousStateFlags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.stateFlagsChanged)
              return (cast(typeof(&_vfuncStateFlagsChangedTramp))_klass.stateFlagsChanged)(widget, previousStateFlags);
            return;
          }

          try
          {
            _obj.vfuncStateFlagsChanged(previousStateFlags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncStateFlagsChanged");
          }
        }

        _klass.stateFlagsChanged = cast(typeof(_klass.stateFlagsChanged))&_vfuncStateFlagsChangedTramp;
        break;
      }
      case "style_set":
      {
        static extern(C) void _vfuncStyleSetTramp(GtkWidget* widget, GtkStyle* previousStyle) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.styleSet)
              return (cast(typeof(&_vfuncStyleSetTramp))_klass.styleSet)(widget, previousStyle);
            return;
          }

          try
          {
            _obj.vfuncStyleSet(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style.Style)(cast(void*)previousStyle, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncStyleSet");
          }
        }

        _klass.styleSet = cast(typeof(_klass.styleSet))&_vfuncStyleSetTramp;
        break;
      }
      case "style_updated":
      {
        static extern(C) void _vfuncStyleUpdatedTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.styleUpdated)
              return (cast(typeof(&_vfuncStyleUpdatedTramp))_klass.styleUpdated)(widget);
            return;
          }

          try
          {
            _obj.vfuncStyleUpdated();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncStyleUpdated");
          }
        }

        _klass.styleUpdated = cast(typeof(_klass.styleUpdated))&_vfuncStyleUpdatedTramp;
        break;
      }
      case "touch_event":
      {
        static extern(C) gboolean _vfuncTouchEventTramp(GtkWidget* widget, GdkEventTouch* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.touchEvent)
              return (cast(typeof(&_vfuncTouchEventTramp))_klass.touchEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_touch.EventTouch(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncTouchEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncTouchEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.touchEvent = cast(typeof(_klass.touchEvent))&_vfuncTouchEventTramp;
        break;
      }
      case "unmap":
      {
        static extern(C) void _vfuncUnmapTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.unmap)
              return (cast(typeof(&_vfuncUnmapTramp))_klass.unmap)(widget);
            return;
          }

          try
          {
            _obj.vfuncUnmap();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncUnmap");
          }
        }

        _klass.unmap = cast(typeof(_klass.unmap))&_vfuncUnmapTramp;
        break;
      }
      case "unmap_event":
      {
        static extern(C) gboolean _vfuncUnmapEventTramp(GtkWidget* widget, GdkEventAny* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.unmapEvent)
              return (cast(typeof(&_vfuncUnmapEventTramp))_klass.unmapEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_any.EventAny(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncUnmapEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncUnmapEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unmapEvent = cast(typeof(_klass.unmapEvent))&_vfuncUnmapEventTramp;
        break;
      }
      case "unrealize":
      {
        static extern(C) void _vfuncUnrealizeTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.unrealize)
              return (cast(typeof(&_vfuncUnrealizeTramp))_klass.unrealize)(widget);
            return;
          }

          try
          {
            _obj.vfuncUnrealize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncUnrealize");
          }
        }

        _klass.unrealize = cast(typeof(_klass.unrealize))&_vfuncUnrealizeTramp;
        break;
      }
      case "visibility_notify_event":
      {
        static extern(C) gboolean _vfuncVisibilityNotifyEventTramp(GtkWidget* widget, GdkEventVisibility* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.visibilityNotifyEvent)
              return (cast(typeof(&_vfuncVisibilityNotifyEventTramp))_klass.visibilityNotifyEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_visibility.EventVisibility(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncVisibilityNotifyEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncVisibilityNotifyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.visibilityNotifyEvent = cast(typeof(_klass.visibilityNotifyEvent))&_vfuncVisibilityNotifyEventTramp;
        break;
      }
      case "window_state_event":
      {
        static extern(C) gboolean _vfuncWindowStateEventTramp(GtkWidget* widget, GdkEventWindowState* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.windowStateEvent)
              return (cast(typeof(&_vfuncWindowStateEventTramp))_klass.windowStateEvent)(widget, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_window_state.EventWindowState(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncWindowStateEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.widget.Widget.vfuncWindowStateEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.windowStateEvent = cast(typeof(_klass.windowStateEvent))&_vfuncWindowStateEventTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.widget.Widget]
class WidgetGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T, gid.atk1.implementor_iface.ImplementorIfaceGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T
{

  mixin ImplementorIfaceGidBuilderT!();
  mixin BuildableGidBuilderT!();

  /** */
  T appPaintable(bool propval) nothrow
  {
    return setProperty("app-paintable", propval);
  }

  /** */
  T canDefault(bool propval) nothrow
  {
    return setProperty("can-default", propval);
  }

  /** */
  T canFocus(bool propval) nothrow
  {
    return setProperty("can-focus", propval);
  }

  /**
      Set `doubleBuffered` property.
      Params:
        propval = Whether the widget is double buffered.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Widgets should not use this property.
  */
  T doubleBuffered(bool propval) nothrow
  {
    return setProperty("double-buffered", propval);
  }

  /** */
  T events(gid.gdk3.types.EventMask propval) nothrow
  {
    return setProperty("events", propval);
  }

  /**
      Set `expand` property.
      Params:
        propval = Whether to expand in both directions. Setting this sets both #GtkWidget:hexpand and #GtkWidget:vexpand
      Returns: Builder instance for fluent chaining
  */
  T expand(bool propval) nothrow
  {
    return setProperty("expand", propval);
  }

  /**
      Set `focusOnClick` property.
      Params:
        propval = Whether the widget should grab focus when it is clicked with the mouse.
          
          This property is only relevant for widgets that can take focus.
          
          Before 3.20, several widgets (GtkButton, GtkFileChooserButton,
          GtkComboBox) implemented this property individually.
      Returns: Builder instance for fluent chaining
  */
  T focusOnClick(bool propval) nothrow
  {
    return setProperty("focus-on-click", propval);
  }

  /**
      Set `halign` property.
      Params:
        propval = How to distribute horizontal space if widget gets extra space, see #GtkAlign
      Returns: Builder instance for fluent chaining
  */
  T halign(gid.gtk3.types.Align propval) nothrow
  {
    return setProperty("halign", propval);
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
      Returns: Builder instance for fluent chaining
  */
  T hasTooltip(bool propval) nothrow
  {
    return setProperty("has-tooltip", propval);
  }

  /** */
  T heightRequest(int propval) nothrow
  {
    return setProperty("height-request", propval);
  }

  /**
      Set `hexpand` property.
      Params:
        propval = Whether to expand horizontally. See [gid.gtk4.widget.Widget.setHexpand].
      Returns: Builder instance for fluent chaining
  */
  T hexpand(bool propval) nothrow
  {
    return setProperty("hexpand", propval);
  }

  /**
      Set `hexpandSet` property.
      Params:
        propval = Whether to use the #GtkWidget:hexpand property. See [gid.gtk4.widget.Widget.getHexpandSet].
      Returns: Builder instance for fluent chaining
  */
  T hexpandSet(bool propval) nothrow
  {
    return setProperty("hexpand-set", propval);
  }

  /**
      Set `margin` property.
      Params:
        propval = Sets all four sides' margin at once. If read, returns max
          margin on any side.
      Returns: Builder instance for fluent chaining
  */
  T margin(int propval) nothrow
  {
    return setProperty("margin", propval);
  }

  /**
      Set `marginBottom` property.
      Params:
        propval = Margin on bottom side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
      Returns: Builder instance for fluent chaining
  */
  T marginBottom(int propval) nothrow
  {
    return setProperty("margin-bottom", propval);
  }

  /**
      Set `marginEnd` property.
      Params:
        propval = Margin on end of widget, horizontally. This property supports
          left-to-right and right-to-left text directions.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
      Returns: Builder instance for fluent chaining
  */
  T marginEnd(int propval) nothrow
  {
    return setProperty("margin-end", propval);
  }

  /**
      Set `marginLeft` property.
      Params:
        propval = Margin on left side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkWidget:margin-start instead.
  */
  T marginLeft(int propval) nothrow
  {
    return setProperty("margin-left", propval);
  }

  /**
      Set `marginRight` property.
      Params:
        propval = Margin on right side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkWidget:margin-end instead.
  */
  T marginRight(int propval) nothrow
  {
    return setProperty("margin-right", propval);
  }

  /**
      Set `marginStart` property.
      Params:
        propval = Margin on start of widget, horizontally. This property supports
          left-to-right and right-to-left text directions.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
      Returns: Builder instance for fluent chaining
  */
  T marginStart(int propval) nothrow
  {
    return setProperty("margin-start", propval);
  }

  /**
      Set `marginTop` property.
      Params:
        propval = Margin on top side of widget.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
      Returns: Builder instance for fluent chaining
  */
  T marginTop(int propval) nothrow
  {
    return setProperty("margin-top", propval);
  }

  /** */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /** */
  T noShowAll(bool propval) nothrow
  {
    return setProperty("no-show-all", propval);
  }

  /**
      Set `opacity` property.
      Params:
        propval = The requested opacity of the widget. See [gid.gtk4.widget.Widget.setOpacity] for
          more details about window opacity.
          
          Before 3.8 this was only available in GtkWindow
      Returns: Builder instance for fluent chaining
  */
  T opacity(double propval) nothrow
  {
    return setProperty("opacity", propval);
  }

  /** */
  T parent(gid.gtk3.container.Container propval) nothrow
  {
    return setProperty("parent", propval);
  }

  /** */
  T receivesDefault(bool propval) nothrow
  {
    return setProperty("receives-default", propval);
  }

  /** */
  T sensitive(bool propval) nothrow
  {
    return setProperty("sensitive", propval);
  }

  /**
      Set `style` property.
      Params:
        propval = The style of the widget, which contains information about how it will look (colors, etc).
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkStyleContext instead
  */
  T style(gid.gtk3.style.Style propval) nothrow
  {
    return setProperty("style", propval);
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null: #GtkWidget:has-tooltip
          will automatically be set to true and there will be taken care of
          #GtkWidget::query-tooltip in the default signal handler.
          
          Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
          are set, the last one wins.
      Returns: Builder instance for fluent chaining
  */
  T tooltipMarkup(string propval) nothrow
  {
    return setProperty("tooltip-markup", propval);
  }

  /**
      Set `tooltipText` property.
      Params:
        propval = Sets the text of tooltip to be the given string.
          
          Also see [gid.gtk4.tooltip.Tooltip.setText].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null: #GtkWidget:has-tooltip
          will automatically be set to true and there will be taken care of
          #GtkWidget::query-tooltip in the default signal handler.
          
          Note that if both #GtkWidget:tooltip-text and #GtkWidget:tooltip-markup
          are set, the last one wins.
      Returns: Builder instance for fluent chaining
  */
  T tooltipText(string propval) nothrow
  {
    return setProperty("tooltip-text", propval);
  }

  /**
      Set `valign` property.
      Params:
        propval = How to distribute vertical space if widget gets extra space, see #GtkAlign
      Returns: Builder instance for fluent chaining
  */
  T valign(gid.gtk3.types.Align propval) nothrow
  {
    return setProperty("valign", propval);
  }

  /**
      Set `vexpand` property.
      Params:
        propval = Whether to expand vertically. See [gid.gtk4.widget.Widget.setVexpand].
      Returns: Builder instance for fluent chaining
  */
  T vexpand(bool propval) nothrow
  {
    return setProperty("vexpand", propval);
  }

  /**
      Set `vexpandSet` property.
      Params:
        propval = Whether to use the #GtkWidget:vexpand property. See [gid.gtk4.widget.Widget.getVexpandSet].
      Returns: Builder instance for fluent chaining
  */
  T vexpandSet(bool propval) nothrow
  {
    return setProperty("vexpand-set", propval);
  }

  /** */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }

  /** */
  T widthRequest(int propval) nothrow
  {
    return setProperty("width-request", propval);
  }
}

/// Fluent builder for [gid.gtk3.widget.Widget]
final class WidgetGidBuilder : WidgetGidBuilderImpl!WidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Widget build() nothrow
  {
    return new Widget(cast(void*)createGObject(Widget._getGType), Yes.Take);
  }
}
