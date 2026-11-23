/// Module for [Widget] class
module gid.gtk4.widget;

public import gid.core.basictypes;
import gid.cairo1.font_options;
import gid.core.utils;
import gid.gdk4.clipboard;
import gid.gdk4.cursor;
import gid.gdk4.display;
import gid.gdk4.frame_clock;
import gid.gdk4.rgba;
import gid.gio2.action_group;
import gid.gio2.list_model;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.graphene1.matrix;
import gid.graphene1.point;
import gid.graphene1.rect;
import gid.gsk4.transform;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.event_controller;
import gid.gtk4.layout_manager;
import gid.gtk4.native;
import gid.gtk4.requisition;
import gid.gtk4.root;
import gid.gtk4.settings;
import gid.gtk4.snapshot;
import gid.gtk4.style_context;
import gid.gtk4.tooltip;
import gid.gtk4.types;
import gid.pango1.context;
import gid.pango1.font_map;
import gid.pango1.layout;

/**
    The base class for all widgets.
    
    It manages the widget lifecycle, layout, states and style.
    
    ### Height-for-width Geometry Management
    
    GTK uses a height-for-width (and width-for-height) geometry management
    system. Height-for-width means that a widget can change how much
    vertical space it needs, depending on the amount of horizontal space
    that it is given (and similar for width-for-height). The most common
    example is a label that reflows to fill up the available width, wraps
    to fewer lines, and therefore needs less height.
    
    Height-for-width geometry management is implemented in GTK by way
    of two virtual methods:
    
    - `vfunc@Gtk.Widget.get_request_mode`
    - `vfunc@Gtk.Widget.measure`
    
    There are some important things to keep in mind when implementing
    height-for-width and when using it in widget implementations.
    
    If you implement a direct [gid.gtk4.widget.Widget] subclass that supports
    height-for-width or width-for-height geometry management for itself
    or its child widgets, the `vfunc@Gtk.Widget.get_request_mode` virtual
    function must be implemented as well and return the widget's preferred
    request mode. The default implementation of this virtual function
    returns [gid.gtk4.types.SizeRequestMode.ConstantSize], which means that the widget will
    only ever get -1 passed as the for_size value to its
    `vfunc@Gtk.Widget.measure` implementation.
    
    The geometry management system will query a widget hierarchy in
    only one orientation at a time. When widgets are initially queried
    for their minimum sizes it is generally done in two initial passes
    in the [gid.gtk4.types.SizeRequestMode] chosen by the toplevel.
    
    For example, when queried in the normal [gid.gtk4.types.SizeRequestMode.HeightForWidth] mode:
    
    First, the default minimum and natural width for each widget
    in the interface will be computed using [gid.gtk4.widget.Widget.measure] with an
    orientation of [gid.gtk4.types.Orientation.Horizontal] and a for_size of -1.
    Because the preferred widths for each widget depend on the preferred
    widths of their children, this information propagates up the hierarchy,
    and finally a minimum and natural width is determined for the entire
    toplevel. Next, the toplevel will use the minimum width to query for the
    minimum height contextual to that width using [gid.gtk4.widget.Widget.measure] with an
    orientation of [gid.gtk4.types.Orientation.Vertical] and a for_size of the just computed
    width. This will also be a highly recursive operation. The minimum height
    for the minimum width is normally used to set the minimum size constraint
    on the toplevel.
    
    After the toplevel window has initially requested its size in both
    dimensions it can go on to allocate itself a reasonable size (or a size
    previously specified with [gid.gtk4.window.Window.setDefaultSize]). During the
    recursive allocation process it’s important to note that request cycles
    will be recursively executed while widgets allocate their children.
    Each widget, once allocated a size, will go on to first share the
    space in one orientation among its children and then request each child's
    height for its target allocated width or its width for allocated height,
    depending. In this way a widget will typically be requested its size
    a number of times before actually being allocated a size. The size a
    widget is finally allocated can of course differ from the size it has
    requested. For this reason, [gid.gtk4.widget.Widget] caches a  small number of results
    to avoid re-querying for the same sizes in one allocation cycle.
    
    If a widget does move content around to intelligently use up the
    allocated size then it must support the request in both
    [gid.gtk4.types.SizeRequestMode]s even if the widget in question only
    trades sizes in a single orientation.
    
    For instance, a [gid.gtk4.label.Label] that does height-for-width word wrapping
    will not expect to have `vfunc@Gtk.Widget.measure` with an orientation of
    [gid.gtk4.types.Orientation.Vertical] called because that call is specific to a
    width-for-height request. In this case the label must return the height
    required for its own minimum possible width. By following this rule any
    widget that handles height-for-width or width-for-height requests will
    always be allocated at least enough space to fit its own content.
    
    Here are some examples of how a [gid.gtk4.types.SizeRequestMode.HeightForWidth] widget
    generally deals with width-for-height requests:
    
    ```c
    static void
    foo_widget_measure (GtkWidget      *widget,
                        GtkOrientation  orientation,
                        int             for_size,
                        int            *minimum_size,
                        int            *natural_size,
                        int            *minimum_baseline,
                        int            *natural_baseline)
    {
      if (orientation == GTK_ORIENTATION_HORIZONTAL)
        {
          // Calculate minimum and natural width
        }
      else // VERTICAL
        {
          if (i_am_in_height_for_width_mode)
            {
              int min_width, dummy;
    
              // First, get the minimum width of our widget
              GTK_WIDGET_GET_CLASS (widget)->measure (widget, GTK_ORIENTATION_HORIZONTAL, -1,
                                                      &min_width, &dummy, &dummy, &dummy);
    
              // Now use the minimum width to retrieve the minimum and natural height to display
              // that width.
              GTK_WIDGET_GET_CLASS (widget)->measure (widget, GTK_ORIENTATION_VERTICAL, min_width,
                                                      minimum_size, natural_size, &dummy, &dummy);
            }
          else
            {
              // ... some widgets do both.
            }
        }
    }
    ```
    
    Often a widget needs to get its own request during size request or
    allocation. For example, when computing height it may need to also
    compute width. Or when deciding how to use an allocation, the widget
    may need to know its natural size. In these cases, the widget should
    be careful to call its virtual methods directly, like in the code
    example above.
    
    It will not work to use the wrapper function [gid.gtk4.widget.Widget.measure]
    inside your own `vfunc@Gtk.Widget.size_allocate` implementation.
    These return a request adjusted by [gid.gtk4.size_group.SizeGroup], the widget's
    align and expand flags, as well as its CSS style.
    
    If a widget used the wrappers inside its virtual method implementations,
    then the adjustments (such as widget margins) would be applied
    twice. GTK therefore does not allow this and will warn if you try
    to do it.
    
    Of course if you are getting the size request for another widget, such
    as a child widget, you must use [gid.gtk4.widget.Widget.measure]; otherwise, you
    would not properly consider widget margins, [gid.gtk4.size_group.SizeGroup], and
    so forth.
    
    GTK also supports baseline vertical alignment of widgets. This
    means that widgets are positioned such that the typographical baseline of
    widgets in the same row are aligned. This happens if a widget supports
    baselines, has a vertical alignment using baselines, and is inside
    a widget that supports baselines and has a natural “row” that it aligns to
    the baseline, or a baseline assigned to it by the grandparent.
    
    Baseline alignment support for a widget is also done by the
    `vfunc@Gtk.Widget.measure` virtual function. It allows you to report
    both a minimum and natural size.
    
    If a widget ends up baseline aligned it will be allocated all the space in
    the parent as if it was [gid.gtk4.types.Align.Fill], but the selected baseline can be
    found via [gid.gtk4.widget.Widget.getBaseline]. If the baseline has a
    value other than -1 you need to align the widget such that the baseline
    appears at the position.
    
    ### GtkWidget as GtkBuildable
    
    The [gid.gtk4.widget.Widget] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports various custom elements to specify additional aspects of widgets
    that are not directly expressed as properties.
    
    If the widget uses a [gid.gtk4.layout_manager.LayoutManager], [gid.gtk4.widget.Widget] supports
    a custom `<layout>` element, used to define layout properties:
    
    ```xml
    <object class="GtkGrid" id="my_grid">
      <child>
        <object class="GtkLabel" id="label1">
          <property name="label">Description</property>
          <layout>
            <property name="column">0</property>
            <property name="row">0</property>
            <property name="row-span">1</property>
            <property name="column-span">1</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkEntry" id="description_entry">
          <layout>
            <property name="column">1</property>
            <property name="row">0</property>
            <property name="row-span">1</property>
            <property name="column-span">1</property>
          </layout>
        </object>
      </child>
    </object>
    ```
    
    [gid.gtk4.widget.Widget] allows style information such as style classes to
    be associated with widgets, using the custom `<style>` element:
    
    ```xml
    <object class="GtkButton" id="button1">
      <style>
        <class name="my-special-button-class"/>
        <class name="dark-button"/>
      </style>
    </object>
    ```
    
    [gid.gtk4.widget.Widget] allows defining accessibility information, such as properties,
    relations, and states, using the custom `<accessibility>` element:
    
    ```xml
    <object class="GtkButton" id="button1">
      <accessibility>
        <property name="label">Download</property>
        <relation name="labelled-by">label1</relation>
      </accessibility>
    </object>
    ```
    
    ### Building composite widgets from template XML
    
    `GtkWidget `exposes some facilities to automate the procedure
    of creating composite widgets using "templates".
    
    To create composite widgets with [gid.gtk4.builder.Builder] XML, one must associate
    the interface description with the widget class at class initialization
    time using [gid.gtk4.widget_class.WidgetClass.setTemplate].
    
    The interface description semantics expected in composite template descriptions
    is slightly different from regular [gid.gtk4.builder.Builder] XML.
    
    Unlike regular interface descriptions, [gid.gtk4.widget_class.WidgetClass.setTemplate]
    will expect a `<template>` tag as a direct child of the toplevel
    `<interface>` tag. The `<template>` tag must specify the “class” attribute
    which must be the type name of the widget. Optionally, the “parent”
    attribute may be specified to specify the direct parent type of the widget
    type; this is ignored by [gid.gtk4.builder.Builder] but can be used by UI design tools to
    introspect what kind of properties and internal children exist for a given
    type when the actual type does not exist.
    
    The XML which is contained inside the `<template>` tag behaves as if it were
    added to the `<object>` tag defining the widget itself. You may set properties
    on a widget by inserting `<property>` tags into the `<template>` tag, and also
    add `<child>` tags to add children and extend a widget in the normal way you
    would with `<object>` tags.
    
    Additionally, `<object>` tags can also be added before and after the initial
    `<template>` tag in the normal way, allowing one to define auxiliary objects
    which might be referenced by other widgets declared as children of the
    `<template>` tag.
    
    Since, unlike the `<object>` tag, the `<template>` tag does not contain an
    “id” attribute, if you need to refer to the instance of the object itself that
    the template will create, simply refer to the template class name in an
    applicable element content.
    
    Here is an example of a template definition, which includes an example of
    this in the `<signal>` tag:
    
    ```xml
    <interface>
      <template class="FooWidget" parent="GtkBox">
        <property name="orientation">horizontal</property>
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
    bundled with your project, using [gid.gio2.resource.Resource]. In order to load the
    template, you need to call [gid.gtk4.widget_class.WidgetClass.setTemplateFromResource]
    from the class initialization of your [gid.gtk4.widget.Widget] type:
    
    ```c
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
    
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
    }
    ```
    
    You will also need to call [gid.gtk4.widget.Widget.initTemplate] from the
    instance initialization function:
    
    ```c
    static void
    foo_widget_init (FooWidget *self)
    {
      gtk_widget_init_template (GTK_WIDGET (self));
    
      // Initialize the rest of the widget...
    }
    ```
    
    as well as calling [gid.gtk4.widget.Widget.disposeTemplate] from the dispose
    function:
    
    ```c
    static void
    foo_widget_dispose (GObject *gobject)
    {
      FooWidget *self = FOO_WIDGET (gobject);
    
      // Dispose objects for which you have a reference...
    
      // Clear the template children for this widget type
      gtk_widget_dispose_template (GTK_WIDGET (self), FOO_TYPE_WIDGET);
    
      G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);
    }
    ```
    
    You can access widgets defined in the template using the
    [gid.gtk4.widget.Widget.getTemplateChild] function, but you will typically declare
    a pointer in the instance private data structure of your type using the same
    name as the widget in the template definition, and call
    [gid.gtk4.widget_class.WidgetClass.bindTemplateChildFull] (or one of its wrapper macros
    `func@Gtk.widget_class_bind_template_child` and `func@Gtk.widget_class_bind_template_child_private`)
    with that name, e.g.
    
    ```c
    typedef struct {
      GtkWidget *hello_button;
      GtkWidget *goodbye_button;
    } FooWidgetPrivate;
    
    G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)
    
    static void
    foo_widget_dispose (GObject *gobject)
    {
      gtk_widget_dispose_template (GTK_WIDGET (gobject), FOO_TYPE_WIDGET);
    
      G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);
    }
    
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
      G_OBJECT_CLASS (klass)->dispose = foo_widget_dispose;
    
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
      gtk_widget_init_template (GTK_WIDGET (widget));
    }
    ```
    
    You can also use [gid.gtk4.widget_class.WidgetClass.bindTemplateCallbackFull] (or
    is wrapper macro `func@Gtk.widget_class_bind_template_callback`) to connect
    a signal callback defined in the template with a function visible in the
    scope of the class, e.g.
    
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
class Widget : gid.gobject2.initially_unowned.InitiallyUnowned, gid.gtk4.accessible.Accessible, gid.gtk4.buildable.Buildable, gid.gtk4.constraint_target.ConstraintTarget
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
      Get builder for [gid.gtk4.widget.Widget]
      Returns: New builder object
  */
  static WidgetGidBuilder builder() nothrow
  {
    return new WidgetGidBuilder;
  }

  /**
      Get `canFocus` property.
      Returns: Whether the widget or any of its descendents can accept
        the input focus.
        
        This property is meant to be set by widget implementations,
        typically in their instance init function.
  */
  @property bool canFocus() nothrow
  {
    return getCanFocus();
  }

  /**
      Set `canFocus` property.
      Params:
        propval = Whether the widget or any of its descendents can accept
          the input focus.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
  */
  @property void canFocus(bool propval) nothrow
  {
    setCanFocus(propval);
  }

  /**
      Get `canTarget` property.
      Returns: Whether the widget can receive pointer events.
  */
  @property bool canTarget() nothrow
  {
    return getCanTarget();
  }

  /**
      Set `canTarget` property.
      Params:
        propval = Whether the widget can receive pointer events.
  */
  @property void canTarget(bool propval) nothrow
  {
    setCanTarget(propval);
  }

  /**
      Get `cssClasses` property.
      Returns: A list of css classes applied to this widget.
  */
  @property string[] cssClasses() nothrow
  {
    return getCssClasses();
  }

  /**
      Set `cssClasses` property.
      Params:
        propval = A list of css classes applied to this widget.
  */
  @property void cssClasses(string[] propval) nothrow
  {
    setCssClasses(propval);
  }

  /**
      Get `cssName` property.
      Returns: The name of this widget in the CSS tree.
        
        This property is meant to be set by widget implementations,
        typically in their instance init function.
  */
  @property string cssName() nothrow
  {
    return getCssName();
  }

  /**
      Get `cursor` property.
      Returns: The cursor used by @widget.
  */
  @property gid.gdk4.cursor.Cursor cursor() nothrow
  {
    return getCursor();
  }

  /**
      Set `cursor` property.
      Params:
        propval = The cursor used by @widget.
  */
  @property void cursor(gid.gdk4.cursor.Cursor propval) nothrow
  {
    setCursor(propval);
  }

  /**
      Get `focusOnClick` property.
      Returns: Whether the widget should grab focus when it is clicked with the mouse.
        
        This property is only relevant for widgets that can take focus.
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
  */
  @property void focusOnClick(bool propval) nothrow
  {
    setFocusOnClick(propval);
  }

  /**
      Get `focusable` property.
      Returns: Whether this widget itself will accept the input focus.
  */
  @property bool focusable() nothrow
  {
    return getFocusable();
  }

  /**
      Set `focusable` property.
      Params:
        propval = Whether this widget itself will accept the input focus.
  */
  @property void focusable(bool propval) nothrow
  {
    setFocusable(propval);
  }

  /**
      Get `halign` property.
      Returns: How to distribute horizontal space if widget gets extra space.
  */
  @property gid.gtk4.types.Align halign() nothrow
  {
    return getHalign();
  }

  /**
      Set `halign` property.
      Params:
        propval = How to distribute horizontal space if widget gets extra space.
  */
  @property void halign(gid.gtk4.types.Align propval) nothrow
  {
    setHalign(propval);
  }

  /**
      Get `hasTooltip` property.
      Returns: Enables or disables the emission of the [gid.gtk4.widget.Widget.queryTooltip]
        signal on @widget.
        
        A true value indicates that @widget can have a tooltip, in this case
        the widget will be queried using [gid.gtk4.widget.Widget.queryTooltip] to
        determine whether it will provide a tooltip or not.
  */
  @property bool hasTooltip() nothrow
  {
    return getHasTooltip();
  }

  /**
      Set `hasTooltip` property.
      Params:
        propval = Enables or disables the emission of the [gid.gtk4.widget.Widget.queryTooltip]
          signal on @widget.
          
          A true value indicates that @widget can have a tooltip, in this case
          the widget will be queried using [gid.gtk4.widget.Widget.queryTooltip] to
          determine whether it will provide a tooltip or not.
  */
  @property void hasTooltip(bool propval) nothrow
  {
    setHasTooltip(propval);
  }

  /**
      Get `heightRequest` property.
      Returns: Overrides for height request of the widget.
        
        If this is -1, the natural request will be used.
  */
  @property int heightRequest() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("height-request");
  }

  /**
      Set `heightRequest` property.
      Params:
        propval = Overrides for height request of the widget.
          
          If this is -1, the natural request will be used.
  */
  @property void heightRequest(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("height-request", propval);
  }

  /**
      Get `hexpand` property.
      Returns: Whether to expand horizontally.
  */
  @property bool hexpand() nothrow
  {
    return getHexpand();
  }

  /**
      Set `hexpand` property.
      Params:
        propval = Whether to expand horizontally.
  */
  @property void hexpand(bool propval) nothrow
  {
    setHexpand(propval);
  }

  /**
      Get `hexpandSet` property.
      Returns: Whether to use the `hexpand` property.
  */
  @property bool hexpandSet() nothrow
  {
    return getHexpandSet();
  }

  /**
      Set `hexpandSet` property.
      Params:
        propval = Whether to use the `hexpand` property.
  */
  @property void hexpandSet(bool propval) nothrow
  {
    setHexpandSet(propval);
  }

  /**
      Get `layoutManager` property.
      Returns: The [gid.gtk4.layout_manager.LayoutManager] instance to use to compute
        the preferred size of the widget, and allocate its children.
        
        This property is meant to be set by widget implementations,
        typically in their instance init function.
  */
  @property gid.gtk4.layout_manager.LayoutManager layoutManager() nothrow
  {
    return getLayoutManager();
  }

  /**
      Set `layoutManager` property.
      Params:
        propval = The [gid.gtk4.layout_manager.LayoutManager] instance to use to compute
          the preferred size of the widget, and allocate its children.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
  */
  @property void layoutManager(gid.gtk4.layout_manager.LayoutManager propval) nothrow
  {
    setLayoutManager(propval);
  }

  /**
      Get `limitEvents` property.
      Returns: Makes this widget act like a modal dialog, with respect to
        event delivery.
        
        Global event controllers will not handle events with targets
        inside the widget, unless they are set up to ignore propagation
        limits. See [gid.gtk4.event_controller.EventController.setPropagationLimit].
  */
  @property bool limitEvents() nothrow
  {
    return getLimitEvents();
  }

  /**
      Set `limitEvents` property.
      Params:
        propval = Makes this widget act like a modal dialog, with respect to
          event delivery.
          
          Global event controllers will not handle events with targets
          inside the widget, unless they are set up to ignore propagation
          limits. See [gid.gtk4.event_controller.EventController.setPropagationLimit].
  */
  @property void limitEvents(bool propval) nothrow
  {
    setLimitEvents(propval);
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
      Returns: Margin on end of widget, horizontally.
        
        This property supports left-to-right and right-to-left text
        directions.
        
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
        propval = Margin on end of widget, horizontally.
          
          This property supports left-to-right and right-to-left text
          directions.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property void marginEnd(int propval) nothrow
  {
    setMarginEnd(propval);
  }

  /**
      Get `marginStart` property.
      Returns: Margin on start of widget, horizontally.
        
        This property supports left-to-right and right-to-left text
        directions.
        
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
        propval = Margin on start of widget, horizontally.
          
          This property supports left-to-right and right-to-left text
          directions.
          
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

  /**
      Get `name` property.
      Returns: The name of the widget.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the widget.
  */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  /**
      Get `opacity` property.
      Returns: The requested opacity of the widget.
  */
  @property double opacity() nothrow
  {
    return getOpacity();
  }

  /**
      Set `opacity` property.
      Params:
        propval = The requested opacity of the widget.
  */
  @property void opacity(double propval) nothrow
  {
    setOpacity(propval);
  }

  /**
      Get `overflow` property.
      Returns: How content outside the widget's content area is treated.
        
        This property is meant to be set by widget implementations,
        typically in their instance init function.
  */
  @property gid.gtk4.types.Overflow overflow() nothrow
  {
    return getOverflow();
  }

  /**
      Set `overflow` property.
      Params:
        propval = How content outside the widget's content area is treated.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
  */
  @property void overflow(gid.gtk4.types.Overflow propval) nothrow
  {
    setOverflow(propval);
  }

  /**
      Get `parent` property.
      Returns: The parent widget of this widget.
  */
  @property gid.gtk4.widget.Widget parent() nothrow
  {
    return getParent();
  }

  /**
      Get `receivesDefault` property.
      Returns: Whether the widget will receive the default action when it is focused.
  */
  @property bool receivesDefault() nothrow
  {
    return getReceivesDefault();
  }

  /**
      Set `receivesDefault` property.
      Params:
        propval = Whether the widget will receive the default action when it is focused.
  */
  @property void receivesDefault(bool propval) nothrow
  {
    setReceivesDefault(propval);
  }

  /**
      Get `root` property.
      Returns: The [gid.gtk4.root.Root] widget of the widget tree containing this widget.
        
        This will be `NULL` if the widget is not contained in a root widget.
  */
  @property gid.gtk4.root.Root root() nothrow
  {
    return getRoot();
  }

  /**
      Get `scaleFactor` property.
      Returns: The scale factor of the widget.
  */
  @property int scaleFactor() nothrow
  {
    return getScaleFactor();
  }

  /**
      Get `sensitive` property.
      Returns: Whether the widget responds to input.
  */
  @property bool sensitive() nothrow
  {
    return getSensitive();
  }

  /**
      Set `sensitive` property.
      Params:
        propval = Whether the widget responds to input.
  */
  @property void sensitive(bool propval) nothrow
  {
    setSensitive(propval);
  }

  /**
      Get `tooltipMarkup` property.
      Returns: Sets the text of tooltip to be the given string, which is marked up
        with Pango markup.
        
        Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not `NULL`:
        [gid.gtk4.widget.Widget.hasTooltip] will automatically be set to true
        and there will be taken care of [gid.gtk4.widget.Widget.queryTooltip] in
        the default signal handler.
        
        Note that if both [gid.gtk4.widget.Widget.tooltipText] and
        [gid.gtk4.widget.Widget.tooltipMarkup] are set, the last one wins.
  */
  @property string tooltipMarkup() nothrow
  {
    return getTooltipMarkup();
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with Pango markup.
          
          Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not `NULL`:
          [gid.gtk4.widget.Widget.hasTooltip] will automatically be set to true
          and there will be taken care of [gid.gtk4.widget.Widget.queryTooltip] in
          the default signal handler.
          
          Note that if both [gid.gtk4.widget.Widget.tooltipText] and
          [gid.gtk4.widget.Widget.tooltipMarkup] are set, the last one wins.
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
        tooltip shown if the given string is not `NULL`:
        [gid.gtk4.widget.Widget.hasTooltip] will automatically be set to true
        and there will be taken care of [gid.gtk4.widget.Widget.queryTooltip] in
        the default signal handler.
        
        Note that if both [gid.gtk4.widget.Widget.tooltipText] and
        [gid.gtk4.widget.Widget.tooltipMarkup] are set, the last one wins.
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
          tooltip shown if the given string is not `NULL`:
          [gid.gtk4.widget.Widget.hasTooltip] will automatically be set to true
          and there will be taken care of [gid.gtk4.widget.Widget.queryTooltip] in
          the default signal handler.
          
          Note that if both [gid.gtk4.widget.Widget.tooltipText] and
          [gid.gtk4.widget.Widget.tooltipMarkup] are set, the last one wins.
  */
  @property void tooltipText(string propval) nothrow
  {
    setTooltipText(propval);
  }

  /**
      Get `valign` property.
      Returns: How to distribute vertical space if widget gets extra space.
  */
  @property gid.gtk4.types.Align valign() nothrow
  {
    return getValign();
  }

  /**
      Set `valign` property.
      Params:
        propval = How to distribute vertical space if widget gets extra space.
  */
  @property void valign(gid.gtk4.types.Align propval) nothrow
  {
    setValign(propval);
  }

  /**
      Get `vexpand` property.
      Returns: Whether to expand vertically.
  */
  @property bool vexpand() nothrow
  {
    return getVexpand();
  }

  /**
      Set `vexpand` property.
      Params:
        propval = Whether to expand vertically.
  */
  @property void vexpand(bool propval) nothrow
  {
    setVexpand(propval);
  }

  /**
      Get `vexpandSet` property.
      Returns: Whether to use the `vexpand` property.
  */
  @property bool vexpandSet() nothrow
  {
    return getVexpandSet();
  }

  /**
      Set `vexpandSet` property.
      Params:
        propval = Whether to use the `vexpand` property.
  */
  @property void vexpandSet(bool propval) nothrow
  {
    setVexpandSet(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether the widget is visible.
  */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the widget is visible.
  */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  /**
      Get `widthRequest` property.
      Returns: Overrides for width request of the widget.
        
        If this is -1, the natural request will be used.
  */
  @property int widthRequest() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("width-request");
  }

  /**
      Set `widthRequest` property.
      Params:
        propval = Overrides for width request of the widget.
          
          If this is -1, the natural request will be used.
  */
  @property void widthRequest(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("width-request", propval);
  }

  mixin AccessibleT!();
  mixin BuildableT!();
  mixin ConstraintTargetT!();

  /**
  Convenience property to set `marginStart`, `marginEnd`, `marginTop`, and `marginBottom`.
  Params:
  propval = Margin for all 4 sides of the widget.
  
  This property adds margin outside of the widget's normal size
  request, the margin will be added in addition to the size from
  [gid.gtk4.widget.Widget.setSizeRequest] for example.
  */
  @property void margin(int propval) nothrow
  {
    setMarginStart(propval);
    setMarginEnd(propval);
    setMarginTop(propval);
    setMarginBottom(propval);
  }


  /**
      Obtains the default reading direction.
      
      See [gid.gtk4.widget.Widget.setDefaultDirection].
      Returns: the current default direction
  */
  static gid.gtk4.types.TextDirection getDefaultDirection() nothrow
  {
    GtkTextDirection _cretval;
    _cretval = gtk_widget_get_default_direction();
    gid.gtk4.types.TextDirection _retval = cast(gid.gtk4.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Sets the default reading direction for widgets.
      
      See [gid.gtk4.widget.Widget.setDirection].
  
      Params:
        dir = the new default direction, either [gid.gtk4.types.TextDirection.Ltr]
            or [gid.gtk4.types.TextDirection.Rtl]
  */
  static void setDefaultDirection(gid.gtk4.types.TextDirection dir) nothrow
  {
    gtk_widget_set_default_direction(dir);
  }

  /**
      Tests if a given point is contained in the widget.
      
      The coordinates for (x, y) must be in widget coordinates, so
      (0, 0) is assumed to be the top left of widget's content area.
  
      Params:
        x = X coordinate to test, relative to widget's origin
        y = Y coordinate to test, relative to widget's origin
      Returns: true if widget contains the point (x, y)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncContains` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncContains(double x, double y)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.contains)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.contains(cast(GtkWidget*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Vfunc called when the CSS used by widget was changed. Widgets
        should then discard their caches that depend on CSS and queue resizes or
        redraws accordingly. The default implementation will take care of this for
        all the default CSS properties, so implementations must chain up.
  
      Params:
        change = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCssChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncCssChanged(gid.gtk4.types.CssStyleChange change)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.cssChanged)
      return;

    _klass.cssChanged(cast(GtkWidget*)this._cPtr, change);
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
  protected void vfuncDirectionChanged(gid.gtk4.types.TextDirection previousDirection)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.directionChanged)
      return;

    _klass.directionChanged(cast(GtkWidget*)this._cPtr, previousDirection);
  }

  /**
      Vfunc for [gid.gtk4.widget.Widget.childFocus]
  
      Params:
        direction = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFocus(gid.gtk4.types.DirectionType direction)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.focus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.focus(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Gets whether the widget prefers a height-for-width layout
      or a width-for-height layout.
      
      Single-child widgets generally propagate the preference of
      their child, more complex widgets need to request something
      either in context of their children or in context of their
      allocation capabilities.
      Returns: The [gid.gtk4.types.SizeRequestMode] preferred by widget.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetRequestMode` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.types.SizeRequestMode vfuncGetRequestMode()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.getRequestMode)
      return typeof(return).init;

    GtkSizeRequestMode _cretval;
    _cretval = _klass.getRequestMode(cast(GtkWidget*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Causes widget to have the keyboard focus for the window
      that it belongs to.
      
      If widget is not focusable, or its `vfuncGtk.Widget.grab_focus`
      implementation cannot transfer the focus to a descendant of widget
      that is focusable, it will not take focus and false will be returned.
      
      Calling [gid.gtk4.widget.Widget.grabFocus] on an already focused widget
      is allowed, should not have an effect, and return true.
      Returns: true if focus is now inside widget
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGrabFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGrabFocus()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.grabFocus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.grabFocus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Reverses the effects of [method.Gtk.Widget.show].
      
      This is causing the widget to be hidden (invisible to the user).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHide` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk4.widget.Widget.setVisible] instead
  */
  protected void vfuncHide()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.hide)
      return;

    _klass.hide(cast(GtkWidget*)this._cPtr);
  }

  /**
      Emits the [gid.gtk4.widget.Widget.keynavFailed] signal on the widget.
      
      This function should be called whenever keyboard navigation
      within a single widget hits a boundary.
      
      The return value of this function should be interpreted
      in a way similar to the return value of
      [gid.gtk4.widget.Widget.childFocus]. When true is returned,
      stay in the widget, the failed keyboard navigation is ok
      and/or there is nowhere we can/should move the focus to.
      When false is returned, the caller should continue with
      keyboard navigation outside the widget, e.g. by calling
      [gid.gtk4.widget.Widget.childFocus] on the widget’s toplevel.
      
      The default [gid.gtk4.widget.Widget.keynavFailed] handler returns
      false for `enumGtk.DirectionType.tab-forward` and
      `enumGtk.DirectionType.tab-backward`. For the other values
      of [gid.gtk4.types.DirectionType] it returns true.
      
      Whenever the default handler returns true, it also calls
      [gid.gtk4.widget.Widget.errorBell] to notify the user of the
      failed keyboard navigation.
      
      A use case for providing an own implementation of `::keynav-failed`
      (either by connecting to it or by overriding it) would be a row of
      [gid.gtk4.entry.Entry] widgets where the user should be able to navigate
      the entire row with the cursor keys, as e.g. known from user
      interfaces that require entering license keys.
  
      Params:
        direction = direction of focus movement
      Returns: true if stopping keyboard navigation is fine, false
          if the emitting widget should try to handle the keyboard
          navigation attempt in its parent widget
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncKeynavFailed` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncKeynavFailed(gid.gtk4.types.DirectionType direction)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.keynavFailed)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.keynavFailed(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Causes a widget to be mapped if it isn’t already.
      
      This function is only for use in widget implementations.
  
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
      Measures widget in the orientation orientation and for the given for_size.
      
      As an example, if orientation is [gid.gtk4.types.Orientation.Horizontal] and for_size
      is 300, this functions will compute the minimum and natural width of widget
      if it is allocated at a height of 300 pixels.
      
      See [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
      a more details on implementing `GtkWidgetClass.measure()`.
  
      Params:
        orientation = the orientation to measure
        forSize = Size for the opposite of orientation, i.e.
            if orientation is [gid.gtk4.types.Orientation.Horizontal], this is
            the height the widget should be measured with. The [gid.gtk4.types.Orientation.Vertical]
            case is analogous. This way, both height-for-width and width-for-height
            requests can be implemented. If no size is known, -1 can be passed.
        minimum = location to store the minimum size
        natural = location to store the natural size
        minimumBaseline = location to store the baseline
            position for the minimum size, or -1 to report no baseline
        naturalBaseline = location to store the baseline
            position for the natural size, or -1 to report no baseline
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMeasure` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncMeasure(gid.gtk4.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.measure)
      return;

    _klass.measure(cast(GtkWidget*)this._cPtr, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }

  /**
      Emits the [gid.gtk4.widget.Widget.mnemonicActivate] signal.
  
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
      Signal emitted when a change of focus is requested
  
      Params:
        direction = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMoveFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncMoveFocus(gid.gtk4.types.DirectionType direction)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.moveFocus)
      return;

    _klass.moveFocus(cast(GtkWidget*)this._cPtr, direction);
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
  protected bool vfuncQueryTooltip(int x, int y, bool keyboardTooltip, gid.gtk4.tooltip.Tooltip tooltip)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.queryTooltip)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.queryTooltip(cast(GtkWidget*)this._cPtr, x, y, keyboardTooltip, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates the GDK resources associated with a widget.
      
      Normally realization happens implicitly; if you show a widget
      and all its parent containers, then the widget will be realized
      and mapped automatically.
      
      Realizing a widget requires all the widget’s parent widgets to be
      realized; calling this function realizes the widget’s parents
      in addition to widget itself. If a widget is not yet inside a
      toplevel window when you realize it, bad things will happen.
      
      This function is primarily used in widget implementations, and
      isn’t very useful otherwise. Many times when you think you might
      need it, a better approach is to connect to a signal that will be
      called after the widget is realized automatically, such as
      [gid.gtk4.widget.Widget.realize].
  
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
      Called when the widget gets added to a [gid.gtk4.root.Root] widget. Must
        chain up
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRoot` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRoot()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.root)
      return;

    _klass.root(cast(GtkWidget*)this._cPtr);
  }

  /**
      Set the focus child of the widget.
      
      This function is only suitable for widget implementations.
      If you want a certain widget to get the input focus, call
      [gid.gtk4.widget.Widget.grabFocus] on it.
  
      Params:
        child = a direct child widget of widget
            or `NULL` to unset the focus child
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetFocusChild` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetFocusChild(gid.gtk4.widget.Widget child = null)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.setFocusChild)
      return;

    _klass.setFocusChild(cast(GtkWidget*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Flags a widget to be displayed.
      
      Any widget that isn’t shown will not appear on the screen.
      
      Remember that you have to show the containers containing a widget,
      in addition to the widget itself, before it will appear onscreen.
      
      When a toplevel widget is shown, it is immediately realized and
      mapped; other shown widgets are realized and mapped when their
      toplevel widget is realized and mapped.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShow` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk4.widget.Widget.setVisible] instead
  */
  protected void vfuncShow()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.show)
      return;

    _klass.show(cast(GtkWidget*)this._cPtr);
  }

  /**
      Called to set the allocation, if the widget does
        not have a layout manager.
  
      Params:
        width = 
        height = 
        baseline = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSizeAllocate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSizeAllocate(int width, int height, int baseline)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.sizeAllocate)
      return;

    _klass.sizeAllocate(cast(GtkWidget*)this._cPtr, width, height, baseline);
  }

  /**
      Vfunc called when a new snapshot of the widget has to be taken.
  
      Params:
        snapshot = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSnapshot` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSnapshot(gid.gtk4.snapshot.Snapshot snapshot)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.snapshot)
      return;

    _klass.snapshot(cast(GtkWidget*)this._cPtr, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null);
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
  protected void vfuncStateFlagsChanged(gid.gtk4.types.StateFlags previousStateFlags)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.stateFlagsChanged)
      return;

    _klass.stateFlagsChanged(cast(GtkWidget*)this._cPtr, previousStateFlags);
  }

  /**
      Emitted when a system setting was changed. Must chain up.
  
      Params:
        settings = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSystemSettingChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSystemSettingChanged(gid.gtk4.types.SystemSetting settings)
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.systemSettingChanged)
      return;

    _klass.systemSettingChanged(cast(GtkWidget*)this._cPtr, settings);
  }

  /**
      Causes a widget to be unmapped if it’s currently mapped.
      
      This function is only for use in widget implementations.
  
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
      Causes a widget to be unrealized.
      
      This frees all GDK resources associated with the widget.
      
      This function is only useful in widget implementations.
  
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
      Called when the widget is about to be removed from its
        [gid.gtk4.root.Root] widget. Must chain up
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnroot` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUnroot()
  {
    auto _klass = cast(GtkWidgetClass*)_vfuncClass;
    if (!_klass.unroot)
      return;

    _klass.unroot(cast(GtkWidget*)this._cPtr);
  }

  /**
      Enables or disables an action installed with
      [gid.gtk4.widget_class.WidgetClass.installAction].
  
      Params:
        actionName = action name, such as "clipboard.paste"
        enabled = whether the action is now enabled
  */
  void actionSetEnabled(string actionName, bool enabled) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    gtk_widget_action_set_enabled(cast(GtkWidget*)this._cPtr, _actionName, enabled);
  }

  /**
      Activates the widget.
      
      The activation will emit the signal set using
      [gid.gtk4.widget_class.WidgetClass.setActivateSignal]
      during class initialization.
      
      Activation is what happens when you press <kbd>Enter</kbd>
      on a widget.
      
      If you wish to handle the activation keybinding yourself,
      it is recommended to use [gid.gtk4.widget_class.WidgetClass.addShortcut]
      with an action created with [gid.gtk4.signal_action.SignalAction.new_].
      
      If widget is not activatable, the function returns false.
      Returns: true if the widget was activated
  */
  bool activate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_activate(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Activates an action for the widget.
      
      The action is looked up in the action groups associated with
      widget and its ancestors.
      
      If the action is in an action group added with
      [gid.gtk4.widget.Widget.insertActionGroup], the name is expected
      to be prefixed with the prefix that was used when the group was
      inserted.
      
      The arguments must match the actions expected parameter type,
      as returned by [gid.gio2.action.Action.getParameterType].
  
      Params:
        name = the name of the action to activate
        args = parameters to use
      Returns: true if the action was activated
  */
  bool activateAction(string name, gid.glib2.variant.Variant args = null) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_widget_activate_action_variant(cast(GtkWidget*)this._cPtr, _name, args ? cast(GVariant*)args._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Activates the `default.activate` action for the widget.
      
      The action is looked up in the same was as for
      [gid.gtk4.widget.Widget.activateAction].
  */
  void activateDefault() nothrow
  {
    gtk_widget_activate_default(cast(GtkWidget*)this._cPtr);
  }

  /**
      Adds an event controller to the widget.
      
      The event controllers of a widget handle the events that are
      propagated to the widget.
      
      You will usually want to call this function right after
      creating any kind of [gid.gtk4.event_controller.EventController].
  
      Params:
        controller = an event controller that hasn't been
            added to a widget yet
  */
  void addController(gid.gtk4.event_controller.EventController controller) nothrow
  {
    gtk_widget_add_controller(cast(GtkWidget*)this._cPtr, controller ? cast(GtkEventController*)controller._cPtr(Yes.Dup) : null);
  }

  /**
      Adds a style class to the widget.
      
      After calling this function, the widget’s style will match
      for css_class, according to CSS matching rules.
      
      Use [gid.gtk4.widget.Widget.removeCssClass] to remove the
      style again.
  
      Params:
        cssClass = style class to add to widget, without the leading period
  */
  void addCssClass(string cssClass) nothrow
  {
    const(char)* _cssClass = cssClass.toCString!(No.Malloc, No.Nullable);
    gtk_widget_add_css_class(cast(GtkWidget*)this._cPtr, _cssClass);
  }

  /**
      Adds a widget to the list of mnemonic labels for this widget.
      
      See [gid.gtk4.widget.Widget.listMnemonicLabels].
      
      Note that the list of mnemonic labels for the widget is cleared
      when the widget is destroyed, so the caller must make sure
      to update its internal state at this point as well.
  
      Params:
        label = a widget that acts as a mnemonic label for widget
  */
  void addMnemonicLabel(gid.gtk4.widget.Widget label) nothrow
  {
    gtk_widget_add_mnemonic_label(cast(GtkWidget*)this._cPtr, label ? cast(GtkWidget*)label._cPtr(No.Dup) : null);
  }

  /**
      Queues an animation frame update and adds a callback to be called
      before each frame.
      
      Until the tick callback is removed, it will be called frequently
      (usually at the frame rate of the output device or as quickly as
      the application can be repainted, whichever is slower). For this
      reason, is most suitable for handling graphics that change every
      frame or every few frames.
      
      The tick callback does not automatically imply a relayout or repaint.
      If you want a repaint or relayout, and aren’t changing widget properties
      that would trigger that (for example, changing the text of a label),
      then you will have to call [gid.gtk4.widget.Widget.queueResize] or
      [gid.gtk4.widget.Widget.queueDraw] yourself.
      
      [gid.gdk4.frame_clock.FrameClock.getFrameTime] should generally be used
      for timing continuous animations and
      [gid.gdk4.frame_timings.FrameTimings.getPredictedPresentationTime] should be
      used if you are trying to display isolated frames at particular times.
      
      This is a more convenient alternative to connecting directly to the
      [gid.gdk4.frame_clock.FrameClock.update] signal of the frame clock, since you
      don't have to worry about when a frame clock is assigned to a widget.
      
      To remove a tick callback, pass the ID that is returned by this function
      to [gid.gtk4.widget.Widget.removeTickCallback].
  
      Params:
        callback = function
            to call for updating animations
      Returns: an ID for this callback
  */
  uint addTickCallback(gid.gtk4.types.TickCallback callback) nothrow
  {
    extern(C) gboolean _callbackCallback(GtkWidget* widget, GdkFrameClock* frameClock, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.TickCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.frame_clock.FrameClock)(cast(void*)frameClock, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.TickCallback");
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
      Assigns size, position, (optionally) a baseline and transform
      to a child widget.
      
      In this function, the allocation and baseline may be adjusted.
      The given allocation will be forced to be bigger than the
      widget's minimum size, as well as at least 0×0 in size.
      
      This function is only used by widget implementations.
      
      For a version that does not take a transform, see
      [gid.gtk4.widget.Widget.sizeAllocate].
  
      Params:
        width = new width
        height = new height
        baseline = new baseline, or -1
        transform = transformation to be applied
  */
  void allocate(int width, int height, int baseline, gid.gsk4.transform.Transform transform = null) nothrow
  {
    gtk_widget_allocate(cast(GtkWidget*)this._cPtr, width, height, baseline, transform ? cast(GskTransform*)transform._cPtr(Yes.Dup) : null);
  }

  /**
      Called by widgets as the user moves around the window using
      keyboard shortcuts.
      
      The direction argument indicates what kind of motion is taking
      place (up, down, left, right, tab forward, tab backward).
      
      This function calls the `vfuncGtk.Widget.focus` virtual function;
      widgets can override the virtual function in order to implement
      appropriate focus behavior.
      
      The default `focus()` virtual function for a widget should return
      true if moving in direction left the focus on a focusable location
      inside that widget, and false if moving in direction moved the focus
      outside the widget. When returning true, widgets normally call
      [gid.gtk4.widget.Widget.grabFocus] to place the focus accordingly;
      when returning false, they don’t modify the current focus location.
      
      This function is used by custom widget implementations; if you're
      writing an app, you’d use [gid.gtk4.widget.Widget.grabFocus] to move
      the focus to a particular widget.
  
      Params:
        direction = direction of focus movement
      Returns: true if focus ended up inside widget
  */
  bool childFocus(gid.gtk4.types.DirectionType direction) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_child_focus(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Computes the bounds for widget in the coordinate space of target.
      
      The bounds of widget are (the bounding box of) the region that it is
      expected to draw in. See the [coordinate system](coordinates.html)
      overview to learn more.
      
      If the operation is successful, true is returned. If widget has no
      bounds or the bounds cannot be expressed in target's coordinate space
      (for example if both widgets are in different windows), false is
      returned and bounds is set to the zero rectangle.
      
      It is valid for widget and target to be the same widget.
  
      Params:
        target = the target widget
        outBounds = the rectangle taking the bounds
      Returns: true if the bounds could be computed
  */
  bool computeBounds(gid.gtk4.widget.Widget target, out gid.graphene1.rect.Rect outBounds) nothrow
  {
    bool _retval;
    auto _outBounds = boxedNew!graphene_rect_t(gid.graphene1.rect.Rect._getGType);
    _retval = cast(bool)gtk_widget_compute_bounds(cast(GtkWidget*)this._cPtr, target ? cast(GtkWidget*)target._cPtr(No.Dup) : null, _outBounds);
    outBounds = new gid.graphene1.rect.Rect(cast(void*)_outBounds, Yes.Take);
    return _retval;
  }

  /**
      Computes whether a parent widget should give this widget
      extra space when possible.
      
      Widgets with children should check this, rather than looking at
      [gid.gtk4.widget.Widget.getHexpand] or [gid.gtk4.widget.Widget.getVexpand].
      
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
  bool computeExpand(gid.gtk4.types.Orientation orientation) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_compute_expand(cast(GtkWidget*)this._cPtr, orientation);
    return _retval;
  }

  /**
      Translates the given point in widget's coordinates to coordinates
      in target’s coordinate system.
      
      In order to perform this operation, both widgets must share a
      a common ancestor. If that is not the case, out_point is set
      to (0, 0) and false is returned.
  
      Params:
        target = the widget to transform into
        point = a point in widget's coordinate system
        outPoint = set to the corresponding coordinates in
            target's coordinate system
      Returns: true if src_widget and dest_widget have a common
          ancestor, false otherwise
  */
  bool computePoint(gid.gtk4.widget.Widget target, gid.graphene1.point.Point point, out gid.graphene1.point.Point outPoint) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_compute_point(cast(GtkWidget*)this._cPtr, target ? cast(GtkWidget*)target._cPtr(No.Dup) : null, cast(const(graphene_point_t)*)&point, cast(graphene_point_t*)&outPoint);
    return _retval;
  }

  /**
      Computes a matrix suitable to describe a transformation from
      widget's coordinate system into target's coordinate system.
      
      The transform can not be computed in certain cases, for example
      when widget and target do not share a common ancestor. In that
      case out_transform gets set to the identity matrix.
      
      To learn more about widget coordinate systems, see the coordinate
      system [overview](coordinates.html).
  
      Params:
        target = the target widget that the matrix will transform to
        outTransform = location to
            store the final transformation
      Returns: true if the transform could be computed
  */
  bool computeTransform(gid.gtk4.widget.Widget target, out gid.graphene1.matrix.Matrix outTransform) nothrow
  {
    bool _retval;
    auto _outTransform = boxedNew!graphene_matrix_t(gid.graphene1.matrix.Matrix._getGType);
    _retval = cast(bool)gtk_widget_compute_transform(cast(GtkWidget*)this._cPtr, target ? cast(GtkWidget*)target._cPtr(No.Dup) : null, _outTransform);
    outTransform = new gid.graphene1.matrix.Matrix(cast(void*)_outTransform, Yes.Take);
    return _retval;
  }

  /**
      Tests if a given point is contained in the widget.
      
      The coordinates for (x, y) must be in widget coordinates, so
      (0, 0) is assumed to be the top left of widget's content area.
  
      Params:
        x = X coordinate to test, relative to widget's origin
        y = Y coordinate to test, relative to widget's origin
      Returns: true if widget contains the point (x, y)
  */
  bool contains(double x, double y) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_contains(cast(GtkWidget*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Creates a new [gid.pango1.context.Context] that is configured for the widget.
      
      The [gid.pango1.context.Context] will have the appropriate font map,
      font options, font description, and base direction set.
      
      See also [gid.gtk4.widget.Widget.getPangoContext].
      Returns: the new [gid.pango1.context.Context]
  */
  gid.pango1.context.Context createPangoContext() nothrow
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_create_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gid.pango1.layout.Layout] that is configured for the widget.
      
      The [gid.pango1.layout.Layout] will have the appropriate font map,
      font description, and base direction set.
      
      If you keep a [gid.pango1.layout.Layout] created in this way around,
      you need to re-create it when the widgets [gid.pango1.context.Context]
      is replaced. This can be tracked by listening to changes
      of the [gid.gtk4.widget.Widget.root] property on the widget.
  
      Params:
        text = text to set on the layout
      Returns: the new [gid.pango1.layout.Layout]
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
      Clears the template children for the widget.
      
      This function is the opposite of [gid.gtk4.widget.Widget.initTemplate],
      and it is used to clear all the template children from a widget
      instance. If you bound a template child to a field in the instance
      structure, or in the instance private data structure, the field will
      be set to `NULL` after this function returns.
      
      You should call this function inside the `GObjectClass.dispose()`
      implementation of any widget that called [gid.gtk4.widget.Widget.initTemplate].
      Typically, you will want to call this function last, right before
      chaining up to the parent type's dispose implementation, e.g.
      
      ```c
      static void
      some_widget_dispose (GObject *gobject)
      {
        SomeWidget *self = SOME_WIDGET (gobject);
      
        // Clear the template data for SomeWidget
        gtk_widget_dispose_template (GTK_WIDGET (self), SOME_TYPE_WIDGET);
      
        G_OBJECT_CLASS (some_widget_parent_class)->dispose (gobject);
      }
      ```
  
      Params:
        widgetType = the type of the widget to finalize the template for
  */
  void disposeTemplate(gid.gobject2.types.GType widgetType) nothrow
  {
    gtk_widget_dispose_template(cast(GtkWidget*)this._cPtr, widgetType);
  }

  /**
      Checks to see if a drag movement has passed the GTK drag threshold.
  
      Params:
        startX = X coordinate of start of drag
        startY = Y coordinate of start of drag
        currentX = current X coordinate
        currentY = current Y coordinate
      Returns: true if the drag threshold has been passed
  */
  bool dragCheckThreshold(int startX, int startY, int currentX, int currentY) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_drag_check_threshold(cast(GtkWidget*)this._cPtr, startX, startY, currentX, currentY);
    return _retval;
  }

  /**
      Notifies the user about an input-related error on the widget.
      
      If the [gid.gtk4.settings.Settings.gtkErrorBell] setting is true,
      it calls [gid.gdk4.surface.Surface.beep], otherwise it does nothing.
      
      Note that the effect of [gid.gdk4.surface.Surface.beep] can be configured
      in many ways, depending on the windowing backend and the desktop
      environment or window manager that is used.
  */
  void errorBell() nothrow
  {
    gtk_widget_error_bell(cast(GtkWidget*)this._cPtr);
  }

  /**
      Returns the baseline that has currently been allocated to the widget.
      
      This function is intended to be used when implementing handlers
      for the [gid.gtk4.widget.Widget]Class.snapshot() function, and when allocating
      child widgets in [gid.gtk4.widget.Widget]Class.size_allocate().
      Returns: the baseline of the widget, or -1 if none
  
      Deprecated: Use [gid.gtk4.widget.Widget.getBaseline] instead
  */
  int getAllocatedBaseline() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_allocated_baseline(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the height that has currently been allocated to the widget.
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: the height of the widget
  
      Deprecated: Use [gid.gtk4.widget.Widget.getHeight] instead
  */
  int getAllocatedHeight() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_allocated_height(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the width that has currently been allocated to the widget.
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: the width of the widget
  
      Deprecated: Use [gid.gtk4.widget.Widget.getWidth] instead
  */
  int getAllocatedWidth() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_allocated_width(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the widget’s allocation.
      
      Note, when implementing a layout widget: a widget’s allocation
      will be its “adjusted” allocation, that is, the widget’s parent
      typically calls [gid.gtk4.widget.Widget.sizeAllocate] with an allocation,
      and that allocation is then adjusted (to handle margin
      and alignment for example) before assignment to the widget.
      [gid.gtk4.widget.Widget.getAllocation] returns the adjusted allocation that
      was actually assigned to the widget. The adjusted allocation is
      guaranteed to be completely contained within the
      [gid.gtk4.widget.Widget.sizeAllocate] allocation, however.
      
      So a layout widget is guaranteed that its children stay inside
      the assigned bounds, but not that they have exactly the bounds the
      widget assigned.
  
      Params:
        allocation = a pointer to a `GtkAllocation` to copy to
  
      Deprecated: Use [gid.gtk4.widget.Widget.computeBounds],
        [gid.gtk4.widget.Widget.getWidth] or [gid.gtk4.widget.Widget.getHeight] instead.
  */
  void getAllocation(out gid.gtk4.types.Allocation allocation) nothrow
  {
    gtk_widget_get_allocation(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation);
  }

  /**
      Gets the first ancestor of the widget with type widget_type.
      
      For example, `gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)`
      gets the first [gid.gtk4.box.Box] that’s an ancestor of widget. No
      reference will be added to the returned widget; it should
      not be unreferenced.
      
      Note that unlike [gid.gtk4.widget.Widget.isAncestor], this function
      considers widget to be an ancestor of itself.
  
      Params:
        widgetType = ancestor type
      Returns: the ancestor widget
  */
  gid.gtk4.widget.Widget getAncestor(gid.gobject2.types.GType widgetType) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_ancestor(cast(GtkWidget*)this._cPtr, widgetType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the baseline that has currently been allocated to the widget.
      
      This function is intended to be used when implementing handlers
      for the `GtkWidgetClass.snapshot()` function, and when allocating
      child widgets in `GtkWidgetClass.size_allocate()`.
      Returns: the baseline of the widget, or -1 if none
  */
  int getBaseline() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_baseline(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the input focus can enter the widget or any
      of its children.
      
      See [gid.gtk4.widget.Widget.setCanFocus].
      Returns: true if the input focus can enter widget
  */
  bool getCanFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether the widget can be the target of pointer events.
      Returns: true if widget can receive pointer events
  */
  bool getCanTarget() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_target(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set with [gid.gtk4.widget.Widget.setChildVisible].
      
      If you feel a need to use this function, your code probably
      needs reorganization.
      
      This function is only useful for widget implementations
      and should never be called by an application.
      Returns: true if the widget is mapped with the parent
  */
  bool getChildVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_child_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the clipboard object for the widget.
      
      This is a utility function to get the clipboard object for the
      display that widget is using.
      
      Note that this function always works, even when widget is not
      realized yet.
      Returns: the appropriate clipboard object
  */
  gid.gdk4.clipboard.Clipboard getClipboard() nothrow
  {
    GdkClipboard* _cretval;
    _cretval = gtk_widget_get_clipboard(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.clipboard.Clipboard)(cast(GdkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current foreground color for the widget’s style.
      
      This function should only be used in snapshot
      implementations that need to do custom drawing
      with the foreground color.
  
      Params:
        color = return location for the color
  */
  void getColor(out gid.gdk4.rgba.RGBA color) nothrow
  {
    gtk_widget_get_color(cast(GtkWidget*)this._cPtr, cast(GdkRGBA*)&color);
  }

  /**
      Returns the list of style classes applied to the widget.
      Returns: a `NULL`-terminated list of
          css classes currently applied to widget
  */
  string[] getCssClasses() nothrow
  {
    char** _cretval;
    _cretval = gtk_widget_get_css_classes(cast(GtkWidget*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the CSS name of the widget.
      Returns: the CSS name
  */
  string getCssName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_css_name(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the cursor set on the widget.
      
      See [gid.gtk4.widget.Widget.setCursor] for details.
      Returns: the cursor
          that is set on widget
  */
  gid.gdk4.cursor.Cursor getCursor() nothrow
  {
    GdkCursor* _cretval;
    _cretval = gtk_widget_get_cursor(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.cursor.Cursor)(cast(GdkCursor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the reading direction for the widget.
      
      See [gid.gtk4.widget.Widget.setDirection].
      Returns: the reading direction for the widget
  */
  gid.gtk4.types.TextDirection getDirection() nothrow
  {
    GtkTextDirection _cretval;
    _cretval = gtk_widget_get_direction(cast(GtkWidget*)this._cPtr);
    gid.gtk4.types.TextDirection _retval = cast(gid.gtk4.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Get the display for the window that the widget belongs to.
      
      This function can only be called after the widget has been
      added to a widget hierarchy with a [gid.gtk4.root.Root] at the top.
      
      In general, you should only create display-specific
      resources when a widget has been realized, and you should
      free those resources when the widget is unrealized.
      Returns: the display for this widget
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gtk_widget_get_display(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s first child.
      
      This function is primarily meant for widget implementations.
      Returns: the widget's first child
  */
  gid.gtk4.widget.Widget getFirstChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_first_child(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the focus child of the widget.
      Returns: the current focus
          child of widget
  */
  gid.gtk4.widget.Widget getFocusChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_focus_child(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the widget should grab focus when it is clicked
      with the mouse.
      
      See [gid.gtk4.widget.Widget.setFocusOnClick].
      Returns: true if the widget should grab focus when it is
          clicked with the mouse
  */
  bool getFocusOnClick() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_focus_on_click(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget can own the input focus.
      
      See [gid.gtk4.widget.Widget.setFocusable].
      Returns: true if widget can own the input focus
  */
  bool getFocusable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_focusable(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the font map of the widget.
      
      See [gid.gtk4.widget.Widget.setFontMap].
      Returns: the font map of widget
  */
  gid.pango1.font_map.FontMap getFontMap() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = gtk_widget_get_font_map(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gid.cairo1.font_options.FontOptions] of the widget.
      
      Seee [gid.gtk4.widget.Widget.setFontOptions].
      Returns: the [gid.cairo1.font_options.FontOptions] of widget
  */
  gid.cairo1.font_options.FontOptions getFontOptions() nothrow
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = gtk_widget_get_font_options(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the frame clock for a widget.
      
      The frame clock is a global “ticker” that can be used to drive
      animations and repaints. The most common reason to get the frame
      clock is to call [gid.gdk4.frame_clock.FrameClock.getFrameTime], in order
      to get a time to use for animating. For example you might record
      the start of the animation with an initial value from
      [gid.gdk4.frame_clock.FrameClock.getFrameTime], and then update the animation
      by calling [gid.gdk4.frame_clock.FrameClock.getFrameTime] again during each repaint.
      
      [gid.gdk4.frame_clock.FrameClock.requestPhase] will result in a new frame on the
      clock, but won’t necessarily repaint any widgets. To repaint a widget,
      you have to use [gid.gtk4.widget.Widget.queueDraw] which invalidates the
      widget (thus scheduling it to receive a draw on the next frame).
      [gid.gtk4.widget.Widget.queueDraw] will also end up requesting a frame
      on the appropriate frame clock.
      
      A widget’s frame clock will not change while the widget is mapped.
      Reparenting a widget (which implies a temporary unmap) can change
      the widget’s frame clock.
      
      Unrealized widgets do not have a frame clock.
      Returns: the frame clock
  */
  gid.gdk4.frame_clock.FrameClock getFrameClock() nothrow
  {
    GdkFrameClock* _cretval;
    _cretval = gtk_widget_get_frame_clock(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.frame_clock.FrameClock)(cast(GdkFrameClock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal alignment of the widget.
      
      For backwards compatibility reasons this method will never return
      one of the baseline alignments, but instead it will convert it to
      [gid.gtk4.types.Align.Fill] or [gid.gtk4.types.Align.Center].
      
      Baselines are not supported for horizontal alignment.
      Returns: the horizontal alignment of widget
  */
  gid.gtk4.types.Align getHalign() nothrow
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_halign(cast(GtkWidget*)this._cPtr);
    gid.gtk4.types.Align _retval = cast(gid.gtk4.types.Align)_cretval;
    return _retval;
  }

  /**
      Returns the current value of the `has-tooltip` property.
      Returns: current value of `has-tooltip` on widget
  */
  bool getHasTooltip() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_has_tooltip(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the content height of the widget.
      
      This function returns the height passed to its
      size-allocate implementation, which is the height you
      should be using in `vfuncGtk.Widget.snapshot`.
      
      For pointer events, see [gid.gtk4.widget.Widget.contains].
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: The height of widget
  */
  int getHeight() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_height(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the widget would like any available extra horizontal
      space.
      
      When a user resizes a window, widgets with expand set to true generally
      receive the extra space. For example, a list or scrollable area
      or document in your window would often be set to expand.
      
      Widgets with children should use [gid.gtk4.widget.Widget.computeExpand]
      rather than this function, to see whether any of its children,
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
      Gets whether the `hexpand` flag has been explicitly set.
      
      If [gid.gtk4.widget.Widget.hexpand] property is set, then it
      overrides any computed expand value based on child widgets.
      If `hexpand` is not set, then the expand value depends on
      whether any children of the widget would like to expand.
      
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
      Returns the widget’s last child.
      
      This function is primarily meant for widget implementations.
      Returns: the widget's last child
  */
  gid.gtk4.widget.Widget getLastChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_last_child(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the layout manager of the widget.
      
      See [gid.gtk4.widget.Widget.setLayoutManager].
      Returns: the layout manager of widget
  */
  gid.gtk4.layout_manager.LayoutManager getLayoutManager() nothrow
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_widget_get_layout_manager(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.layout_manager.LayoutManager)(cast(GtkLayoutManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the [gid.gtk4.widget.Widget.limitEvents] property.
      Returns: 
  */
  bool getLimitEvents() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_limit_events(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the widget is mapped.
      Returns: true if the widget is mapped
  */
  bool getMapped() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_mapped(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the bottom margin of the widget.
      Returns: The bottom margin of widget
  */
  int getMarginBottom() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_bottom(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the end margin of the widget.
      Returns: The end margin of widget
  */
  int getMarginEnd() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_end(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the start margin of the widget.
      Returns: The start margin of widget
  */
  int getMarginStart() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_start(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the top margin of the widget.
      Returns: The top margin of widget
  */
  int getMarginTop() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_margin_top(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the name of a widget.
      
      See [gid.gtk4.widget.Widget.setName] for the significance of widget names.
      Returns: name of the widget
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_name(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the nearest [gid.gtk4.native.Native] ancestor of the widget.
      
      This function will return `NULL` if the widget is not
      contained inside a widget tree with a native ancestor.
      
      [gid.gtk4.native.Native] widgets will return themselves here.
      Returns: the [gid.gtk4.native.Native] ancestor of widget
  */
  gid.gtk4.native.Native getNative() nothrow
  {
    GtkNative* _cretval;
    _cretval = gtk_widget_get_native(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.native.Native)(cast(GtkNative*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s next sibling.
      
      This function is primarily meant for widget implementations.
      Returns: the widget's next sibling
  */
  gid.gtk4.widget.Widget getNextSibling() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_next_sibling(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches the requested opacity for the widget.
      
      See [gid.gtk4.widget.Widget.setOpacity].
      Returns: the requested opacity for this widget
  */
  double getOpacity() nothrow
  {
    double _retval;
    _retval = gtk_widget_get_opacity(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the widget’s overflow value.
      Returns: The widget's overflow value
  */
  gid.gtk4.types.Overflow getOverflow() nothrow
  {
    GtkOverflow _cretval;
    _cretval = gtk_widget_get_overflow(cast(GtkWidget*)this._cPtr);
    gid.gtk4.types.Overflow _retval = cast(gid.gtk4.types.Overflow)_cretval;
    return _retval;
  }

  /**
      Gets a [gid.pango1.context.Context] that is configured for the widget.
      
      The [gid.pango1.context.Context] will have the appropriate font map, font description,
      and base direction set.
      
      Unlike the context returned by [gid.gtk4.widget.Widget.createPangoContext],
      this context is owned by the widget (it can be used until the screen
      for the widget changes or the widget is removed from its toplevel),
      and will be updated to match any changes to the widget’s attributes.
      This can be tracked by listening to changes of the
      [gid.gtk4.widget.Widget.root] property on the widget.
      Returns: the [gid.pango1.context.Context] for the widget
  */
  gid.pango1.context.Context getPangoContext() nothrow
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_get_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the parent widget of the widget.
      Returns: the parent widget of widget
  */
  gid.gtk4.widget.Widget getParent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_parent(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the minimum and natural size of a widget, taking
      into account the widget’s preference for height-for-width management.
      
      This is used to retrieve a suitable size by container widgets which do
      not impose any restrictions on the child placement. It can be used
      to deduce toplevel window and menu sizes as well as child widgets in
      free-form containers such as [gid.gtk4.fixed.Fixed].
      
      Handle with care. Note that the natural height of a height-for-width
      widget will generally be a smaller size than the minimum height, since
      the required height for the natural width is generally smaller than the
      required height for the minimum width.
      
      Use [gid.gtk4.widget.Widget.measure] if you want to support baseline alignment.
  
      Params:
        minimumSize = location for storing the minimum size
        naturalSize = location for storing the natural size
  */
  void getPreferredSize(out gid.gtk4.requisition.Requisition minimumSize, out gid.gtk4.requisition.Requisition naturalSize) nothrow
  {
    gtk_widget_get_preferred_size(cast(GtkWidget*)this._cPtr, cast(GtkRequisition*)&minimumSize, cast(GtkRequisition*)&naturalSize);
  }

  /**
      Returns the widget’s previous sibling.
      
      This function is primarily meant for widget implementations.
      Returns: the widget's previous sibling
  */
  gid.gtk4.widget.Widget getPrevSibling() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_prev_sibling(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the primary clipboard of the widget.
      
      This is a utility function to get the primary clipboard object
      for the display that widget is using.
      
      Note that this function always works, even when widget is not
      realized yet.
      Returns: the appropriate clipboard object
  */
  gid.gdk4.clipboard.Clipboard getPrimaryClipboard() nothrow
  {
    GdkClipboard* _cretval;
    _cretval = gtk_widget_get_primary_clipboard(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.clipboard.Clipboard)(cast(GdkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the widget is realized.
      Returns: true if widget is realized
  */
  bool getRealized() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_realized(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget is always treated as the default widget
      within its toplevel when it has the focus, even if another widget
      is the default.
      
      See [gid.gtk4.widget.Widget.setReceivesDefault].
      Returns: true if widget acts as the default widget when focused
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
      
      Single-child widgets generally propagate the preference of
      their child, more complex widgets need to request something
      either in context of their children or in context of their
      allocation capabilities.
      Returns: The [gid.gtk4.types.SizeRequestMode] preferred by widget.
  */
  gid.gtk4.types.SizeRequestMode getRequestMode() nothrow
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_widget_get_request_mode(cast(GtkWidget*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Returns the [gid.gtk4.root.Root] widget of the widget.
      
      This function will return `NULL` if the widget is not contained
      inside a widget tree with a root widget.
      
      [gid.gtk4.root.Root] widgets will return themselves here.
      Returns: the root widget of widget
  */
  gid.gtk4.root.Root getRoot() nothrow
  {
    GtkRoot* _cretval;
    _cretval = gtk_widget_get_root(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.root.Root)(cast(GtkRoot*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the internal scale factor that maps from window
      coordinates to the actual device pixels.
      
      On traditional systems this is 1, on high density outputs,
      it can be a higher value (typically 2).
      
      See [gid.gdk4.surface.Surface.getScaleFactor].
      
      Note that modern systems may support *fractional* scaling,
      where the scale factor is not an integer. On such systems,
      this function will return the next higher integer value,
      but you probably want to use [gid.gdk4.surface.Surface.getScale]
      to get the fractional scale value.
      Returns: the scale factor for widget
  */
  int getScaleFactor() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_scale_factor(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the widget’s sensitivity.
      
      This function returns the value that has been set using
      [gid.gtk4.widget.Widget.setSensitive]).
      
      The effective sensitivity of a widget is however determined
      by both its own and its parent widget’s sensitivity.
      See [gid.gtk4.widget.Widget.isSensitive].
      Returns: true if the widget is sensitive
  */
  bool getSensitive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_sensitive(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the settings object holding the settings used for the widget.
      
      Note that this function can only be called when the [gid.gtk4.widget.Widget]
      is attached to a toplevel, since the settings object is specific
      to a particular display. If you want to monitor the widget for
      changes in its settings, connect to the `notify::display` signal.
      Returns: the relevant settings object
  */
  gid.gtk4.settings.Settings getSettings() nothrow
  {
    GtkSettings* _cretval;
    _cretval = gtk_widget_get_settings(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the content width or height of the widget.
      
      Which dimension is returned depends on orientation.
      
      This is equivalent to calling [gid.gtk4.widget.Widget.getWidth]
      for [gid.gtk4.types.Orientation.Horizontal] or [gid.gtk4.widget.Widget.getHeight]
      for [gid.gtk4.types.Orientation.Vertical], but can be used when
      writing orientation-independent code, such as when
      implementing [gid.gtk4.orientable.Orientable] widgets.
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
  
      Params:
        orientation = the orientation to query
      Returns: the size of widget in orientation
  */
  int getSize(gid.gtk4.types.Orientation orientation) nothrow
  {
    int _retval;
    _retval = gtk_widget_get_size(cast(GtkWidget*)this._cPtr, orientation);
    return _retval;
  }

  /**
      Gets the size request that was explicitly set for the widget.
      
      A value of -1 stored in width or height indicates that that
      dimension has not been set explicitly and the natural requisition
      of the widget will be used instead.
      
      See [gid.gtk4.widget.Widget.setSizeRequest].
      
      To get the size a widget will actually request, call
      [gid.gtk4.widget.Widget.measure] instead of this function.
  
      Params:
        width = return location for width
        height = return location for height
  */
  void getSizeRequest(out int width, out int height) nothrow
  {
    gtk_widget_get_size_request(cast(GtkWidget*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the widget state as a flag set.
      
      It is worth mentioning that the effective [gid.gtk4.types.StateFlags.Insensitive]
      state will be returned, that is, also based on parent insensitivity,
      even if widget itself is sensitive.
      
      Also note that if you are looking for a way to obtain the
      [gid.gtk4.types.StateFlags] to pass to a [gid.gtk4.style_context.StyleContext]
      method, you should look at [gid.gtk4.style_context.StyleContext.getState].
      Returns: the state flags of widget
  */
  gid.gtk4.types.StateFlags getStateFlags() nothrow
  {
    GtkStateFlags _cretval;
    _cretval = gtk_widget_get_state_flags(cast(GtkWidget*)this._cPtr);
    gid.gtk4.types.StateFlags _retval = cast(gid.gtk4.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Returns the style context associated to the widget.
      
      The returned object is guaranteed to be the same
      for the lifetime of widget.
      Returns: the widgets style context
  
      Deprecated: Style contexts will be removed in GTK 5
  */
  gid.gtk4.style_context.StyleContext getStyleContext() nothrow
  {
    GtkStyleContext* _cretval;
    _cretval = gtk_widget_get_style_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.style_context.StyleContext)(cast(GtkStyleContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches an object build from the template XML for widget_type in
      the widget.
      
      This will only report children which were previously declared
      with [gid.gtk4.widget_class.WidgetClass.bindTemplateChildFull] or one of its
      variants.
      
      This function is only meant to be called for code which is private
      to the widget_type which declared the child and is meant for language
      bindings which cannot easily make use of the GObject structure offsets.
  
      Params:
        widgetType = The type of the widget class that defines the child in the template
        name = ID of the child defined in the template XML
      Returns: the object built in the template XML with
          the id name
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
      Gets the contents of the tooltip for the widget.
      
      If the tooltip has not been set using
      [gid.gtk4.widget.Widget.setTooltipMarkup], this
      function returns `NULL`.
      Returns: the tooltip text
  */
  string getTooltipMarkup() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_tooltip_markup(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for the widget.
      
      If the widget's tooltip was set using
      [gid.gtk4.widget.Widget.setTooltipMarkup],
      this function will return the escaped text.
      Returns: the tooltip text
  */
  string getTooltipText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_tooltip_text(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the vertical alignment of the widget.
      Returns: the vertical alignment of widget
  */
  gid.gtk4.types.Align getValign() nothrow
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_valign(cast(GtkWidget*)this._cPtr);
    gid.gtk4.types.Align _retval = cast(gid.gtk4.types.Align)_cretval;
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
      Gets whether the `vexpand` flag has been explicitly set.
      
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
      Determines whether the widget is visible.
      
      If you want to take into account whether the widget’s
      parent is also marked as visible, use
      [gid.gtk4.widget.Widget.isVisible] instead.
      
      This function does not check if the widget is
      obscured in any way.
      
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
      Returns the content width of the widget.
      
      This function returns the width passed to its
      size-allocate implementation, which is the width you
      should be using in `vfuncGtk.Widget.snapshot`.
      
      For pointer events, see [gid.gtk4.widget.Widget.contains].
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: The width of widget
  */
  int getWidth() nothrow
  {
    int _retval;
    _retval = gtk_widget_get_width(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Causes widget to have the keyboard focus for the window
      that it belongs to.
      
      If widget is not focusable, or its `vfuncGtk.Widget.grab_focus`
      implementation cannot transfer the focus to a descendant of widget
      that is focusable, it will not take focus and false will be returned.
      
      Calling [gid.gtk4.widget.Widget.grabFocus] on an already focused widget
      is allowed, should not have an effect, and return true.
      Returns: true if focus is now inside widget
  */
  bool grabFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_grab_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether a style class is currently applied to the widget.
  
      Params:
        cssClass = style class, without the leading period
      Returns: true if css_class is currently applied to widget
  */
  bool hasCssClass(string cssClass) nothrow
  {
    bool _retval;
    const(char)* _cssClass = cssClass.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_widget_has_css_class(cast(GtkWidget*)this._cPtr, _cssClass);
    return _retval;
  }

  /**
      Determines whether the widget is the current default widget
      within its toplevel.
      Returns: true if widget is the current default widget
          within its toplevel
  */
  bool hasDefault() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_default(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget has the global input focus.
      
      See [gid.gtk4.widget.Widget.isFocus] for the difference between
      having the global input focus, and only having the focus
      within a toplevel.
      Returns: true if the widget has the global input focus
  */
  bool hasFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget should show a visible indication that
      it has the global input focus.
      
      This is a convenience function that takes into account whether
      focus indication should currently be shown in the toplevel window
      of widget. See [gid.gtk4.window.Window.getFocusVisible] for more
      information about focus indication.
      
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
      Reverses the effects of [method.Gtk.Widget.show].
      
      This is causing the widget to be hidden (invisible to the user).
  
      Deprecated: Use [gid.gtk4.widget.Widget.setVisible] instead
  */
  void hide() nothrow
  {
    gtk_widget_hide(cast(GtkWidget*)this._cPtr);
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
      Creates and initializes child widgets defined in templates.
      
      This function must be called in the instance initializer
      for any class which assigned itself a template using
      [gid.gtk4.widget_class.WidgetClass.setTemplate].
      
      It is important to call this function in the instance initializer
      of a widget subclass and not in `GObject.constructed()` or
      `GObject.constructor()` for two reasons:
      
       - derived widgets will assume that the composite widgets
         defined by its parent classes have been created in their
         relative instance initializers
       - when calling `[gid.gobject2.object.ObjectWrap.new_]` on a widget with composite templates,
         it’s important to build the composite widgets before the construct
         properties are set. Properties passed to `[gid.gobject2.object.ObjectWrap.new_]` should
         take precedence over properties set in the private template XML
      
      A good rule of thumb is to call this function as the first thing in
      an instance initialization function.
  */
  void initTemplate() nothrow
  {
    gtk_widget_init_template(cast(GtkWidget*)this._cPtr);
  }

  /**
      Inserts an action group into the widget's actions.
      
      Children of widget that implement [gid.gtk4.actionable.Actionable] can
      then be associated with actions in group by setting their
      “action-name” to prefix.`action-name`.
      
      Note that inheritance is defined for individual actions. I.e.
      even if you insert a group with prefix prefix, actions with
      the same prefix will still be inherited from the parent, unless
      the group contains an action with the same name.
      
      If group is `NULL`, a previously inserted group for name is
      removed from widget.
  
      Params:
        name = the prefix for actions in group
        group = an action group
  */
  void insertActionGroup(string name, gid.gio2.action_group.ActionGroup group = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_widget_insert_action_group(cast(GtkWidget*)this._cPtr, _name, group ? cast(GActionGroup*)(cast(gid.gobject2.object.ObjectWrap)group)._cPtr(No.Dup) : null);
  }

  /**
      Sets the parent widget of the widget.
      
      In contrast to [gid.gtk4.widget.Widget.setParent], this function
      inserts widget at a specific position into the list of children
      of the parent widget.
      
      It will be placed after previous_sibling, or at the beginning if
      previous_sibling is `NULL`.
      
      After calling this function, `gtk_widget_get_prev_sibling (widget)`
      will return previous_sibling.
      
      If parent is already set as the parent widget of widget, this
      function can also be used to reorder widget in the child widget
      list of parent.
      
      This function is primarily meant for widget implementations; if you are
      just using a widget, you *must* use its own API for adding children.
  
      Params:
        parent = the parent widget to insert widget into
        previousSibling = the new previous sibling of widget
  */
  void insertAfter(gid.gtk4.widget.Widget parent, gid.gtk4.widget.Widget previousSibling = null) nothrow
  {
    gtk_widget_insert_after(cast(GtkWidget*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null, previousSibling ? cast(GtkWidget*)previousSibling._cPtr(No.Dup) : null);
  }

  /**
      Sets the parent widget of the widget.
      
      In contrast to [gid.gtk4.widget.Widget.setParent], this function
      inserts widget at a specific position into the list of children
      of the parent widget.
      
      It will be placed before next_sibling, or at the end if
      next_sibling is `NULL`.
      
      After calling this function, `gtk_widget_get_next_sibling (widget)`
      will return next_sibling.
      
      If parent is already set as the parent widget of widget, this function
      can also be used to reorder widget in the child widget list of parent.
      
      This function is primarily meant for widget implementations; if you are
      just using a widget, you *must* use its own API for adding children.
  
      Params:
        parent = the parent widget to insert widget into
        nextSibling = the new next sibling of widget
  */
  void insertBefore(gid.gtk4.widget.Widget parent, gid.gtk4.widget.Widget nextSibling = null) nothrow
  {
    gtk_widget_insert_before(cast(GtkWidget*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null, nextSibling ? cast(GtkWidget*)nextSibling._cPtr(No.Dup) : null);
  }

  /**
      Determines whether the widget is a descendent of ancestor.
  
      Params:
        ancestor = another [gid.gtk4.widget.Widget]
      Returns: true if ancestor contains widget as a child,
          grandchild, great grandchild, etc
  */
  bool isAncestor(gid.gtk4.widget.Widget ancestor) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_ancestor(cast(GtkWidget*)this._cPtr, ancestor ? cast(GtkWidget*)ancestor._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines whether the widget can be drawn to.
      
      A widget can be drawn if it is mapped and visible.
      Returns: true if widget is drawable
  */
  bool isDrawable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_drawable(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget is the focus widget within its
      toplevel.
      
      This does not mean that the [gid.gtk4.widget.Widget.hasFocus]
      property is necessarily set; [gid.gtk4.widget.Widget.hasFocus]
      will only be set if the toplevel widget additionally has the
      global input focus.
      Returns: true if the widget is the focus widget
  */
  bool isFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the widget’s effective sensitivity.
      
      This means it is sensitive itself and also its
      parent widget is sensitive.
      Returns: true if the widget is effectively sensitive
  */
  bool isSensitive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_sensitive(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget and all its parents are marked as
      visible.
      
      This function does not check if the widget is obscured in any way.
      
      See also [gid.gtk4.widget.Widget.getVisible] and
      [gid.gtk4.widget.Widget.setVisible].
      Returns: true if the widget and all its parents are visible
  */
  bool isVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Emits the [gid.gtk4.widget.Widget.keynavFailed] signal on the widget.
      
      This function should be called whenever keyboard navigation
      within a single widget hits a boundary.
      
      The return value of this function should be interpreted
      in a way similar to the return value of
      [gid.gtk4.widget.Widget.childFocus]. When true is returned,
      stay in the widget, the failed keyboard navigation is ok
      and/or there is nowhere we can/should move the focus to.
      When false is returned, the caller should continue with
      keyboard navigation outside the widget, e.g. by calling
      [gid.gtk4.widget.Widget.childFocus] on the widget’s toplevel.
      
      The default [gid.gtk4.widget.Widget.keynavFailed] handler returns
      false for `enumGtk.DirectionType.tab-forward` and
      `enumGtk.DirectionType.tab-backward`. For the other values
      of [gid.gtk4.types.DirectionType] it returns true.
      
      Whenever the default handler returns true, it also calls
      [gid.gtk4.widget.Widget.errorBell] to notify the user of the
      failed keyboard navigation.
      
      A use case for providing an own implementation of `::keynav-failed`
      (either by connecting to it or by overriding it) would be a row of
      [gid.gtk4.entry.Entry] widgets where the user should be able to navigate
      the entire row with the cursor keys, as e.g. known from user
      interfaces that require entering license keys.
  
      Params:
        direction = direction of focus movement
      Returns: true if stopping keyboard navigation is fine, false
          if the emitting widget should try to handle the keyboard
          navigation attempt in its parent widget
  */
  bool keynavFailed(gid.gtk4.types.DirectionType direction) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_keynav_failed(cast(GtkWidget*)this._cPtr, direction);
    return _retval;
  }

  /**
      Returns the widgets for which this widget is the target of a
      mnemonic.
      
      Typically, these widgets will be labels. See, for example,
      [gid.gtk4.label.Label.setMnemonicWidget].
      
      The widgets in the list are not individually referenced.
      If you want to iterate through the list and perform actions
      involving callbacks that might destroy the widgets, you
      must call `g_list_foreach (result, (GFunc)g_object_ref, NULL)`
      first, and then unref all the widgets afterwards.
      Returns: the list
          of mnemonic labels
  */
  gid.gtk4.widget.Widget[] listMnemonicLabels() nothrow
  {
    GList* _cretval;
    _cretval = gtk_widget_list_mnemonic_labels(cast(GtkWidget*)this._cPtr);
    auto _retval = gListToD!(gid.gtk4.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Causes a widget to be mapped if it isn’t already.
      
      This function is only for use in widget implementations.
  */
  void map() nothrow
  {
    gtk_widget_map(cast(GtkWidget*)this._cPtr);
  }

  /**
      Measures widget in the orientation orientation and for the given for_size.
      
      As an example, if orientation is [gid.gtk4.types.Orientation.Horizontal] and for_size
      is 300, this functions will compute the minimum and natural width of widget
      if it is allocated at a height of 300 pixels.
      
      See [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
      a more details on implementing `GtkWidgetClass.measure()`.
  
      Params:
        orientation = the orientation to measure
        forSize = Size for the opposite of orientation, i.e.
            if orientation is [gid.gtk4.types.Orientation.Horizontal], this is
            the height the widget should be measured with. The [gid.gtk4.types.Orientation.Vertical]
            case is analogous. This way, both height-for-width and width-for-height
            requests can be implemented. If no size is known, -1 can be passed.
        minimum = location to store the minimum size
        natural = location to store the natural size
        minimumBaseline = location to store the baseline
            position for the minimum size, or -1 to report no baseline
        naturalBaseline = location to store the baseline
            position for the natural size, or -1 to report no baseline
  */
  void measure(gid.gtk4.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline) nothrow
  {
    gtk_widget_measure(cast(GtkWidget*)this._cPtr, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }

  /**
      Emits the [gid.gtk4.widget.Widget.mnemonicActivate] signal.
  
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
      Returns a list model to track the children of the widget.
      
      Calling this function will enable extra internal bookkeeping
      to track children and emit signals on the returned listmodel.
      It may slow down operations a lot.
      
      Applications should try hard to avoid calling this function
      because of the slowdowns.
      Returns: a list model tracking widget's children
  */
  gid.gio2.list_model.ListModel observeChildren() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_widget_observe_children(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a list model to track the event controllers of the widget.
      
      Calling this function will enable extra internal bookkeeping
      to track controllers and emit signals on the returned listmodel.
      It may slow down operations a lot.
      
      Applications should try hard to avoid calling this function
      because of the slowdowns.
      Returns: a list model tracking widget's controllers
  */
  gid.gio2.list_model.ListModel observeControllers() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_widget_observe_controllers(cast(GtkWidget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finds the descendant of the widget closest to a point.
      
      The point (x, y) must be given in widget coordinates, so (0, 0)
      is assumed to be the top left of widget's content area.
      
      Usually widgets will return `NULL` if the given coordinate is not
      contained in widget checked via [gid.gtk4.widget.Widget.contains].
      Otherwise they will recursively try to find a child that does
      not return `NULL`. Widgets are however free to customize their
      picking algorithm.
      
      This function is used on the toplevel to determine the widget
      below the mouse cursor for purposes of hover highlighting and
      delivering events.
  
      Params:
        x = x coordinate to test, relative to widget's origin
        y = y coordinate to test, relative to widget's origin
        flags = flags to influence what is picked
      Returns: the widget's descendant at (x, y)
  */
  gid.gtk4.widget.Widget pick(double x, double y, gid.gtk4.types.PickFlags flags) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_pick(cast(GtkWidget*)this._cPtr, x, y, flags);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Flags the widget for a rerun of the `vfuncGtk.Widget.size_allocate`
      function.
      
      Use this function instead of [gid.gtk4.widget.Widget.queueResize]
      when the widget's size request didn't change but it wants to
      reposition its contents.
      
      An example user of this function is [gid.gtk4.widget.Widget.setHalign].
      
      This function is only for use in widget implementations.
  */
  void queueAllocate() nothrow
  {
    gtk_widget_queue_allocate(cast(GtkWidget*)this._cPtr);
  }

  /**
      Schedules this widget to be redrawn.
      
      The redraw will happen in the paint phase
      of the current or the next frame.
      
      This means widget's `vfuncGtk.Widget.snapshot`
      implementation will be called.
  */
  void queueDraw() nothrow
  {
    gtk_widget_queue_draw(cast(GtkWidget*)this._cPtr);
  }

  /**
      Flags a widget to have its size renegotiated.
      
      This should be called when a widget for some reason has a new
      size request. For example, when you change the text in a
      [gid.gtk4.label.Label], the label queues a resize to ensure there’s
      enough space for the new text.
      
      Note that you cannot call [gid.gtk4.widget.Widget.queueResize] on a widget
      from inside its implementation of the `vfuncGtk.Widget.size_allocate`
      virtual method. Calls to [gid.gtk4.widget.Widget.queueResize] from inside
      `vfuncGtk.Widget.size_allocate` will be silently ignored.
      
      This function is only for use in widget implementations.
  */
  void queueResize() nothrow
  {
    gtk_widget_queue_resize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Creates the GDK resources associated with a widget.
      
      Normally realization happens implicitly; if you show a widget
      and all its parent containers, then the widget will be realized
      and mapped automatically.
      
      Realizing a widget requires all the widget’s parent widgets to be
      realized; calling this function realizes the widget’s parents
      in addition to widget itself. If a widget is not yet inside a
      toplevel window when you realize it, bad things will happen.
      
      This function is primarily used in widget implementations, and
      isn’t very useful otherwise. Many times when you think you might
      need it, a better approach is to connect to a signal that will be
      called after the widget is realized automatically, such as
      [gid.gtk4.widget.Widget.realize].
  */
  void realize() nothrow
  {
    gtk_widget_realize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Removes an event controller from the widget.
      
      The removed event controller will not receive any more events,
      and should not be used again.
      
      Widgets will remove all event controllers automatically when they
      are destroyed, there is normally no need to call this function.
  
      Params:
        controller = an event controller
  */
  void removeController(gid.gtk4.event_controller.EventController controller) nothrow
  {
    gtk_widget_remove_controller(cast(GtkWidget*)this._cPtr, controller ? cast(GtkEventController*)controller._cPtr(No.Dup) : null);
  }

  /**
      Removes a style from the widget.
      
      After this, the style of widget will stop matching for css_class.
  
      Params:
        cssClass = style class to remove from widget, without the leading period
  */
  void removeCssClass(string cssClass) nothrow
  {
    const(char)* _cssClass = cssClass.toCString!(No.Malloc, No.Nullable);
    gtk_widget_remove_css_class(cast(GtkWidget*)this._cPtr, _cssClass);
  }

  /**
      Removes a widget from the list of mnemonic labels for this widget.
      
      See [gid.gtk4.widget.Widget.listMnemonicLabels].
      
      The widget must have previously been added to the list with
      [gid.gtk4.widget.Widget.addMnemonicLabel].
  
      Params:
        label = a widget that is a mnemonic label for widget
  */
  void removeMnemonicLabel(gid.gtk4.widget.Widget label) nothrow
  {
    gtk_widget_remove_mnemonic_label(cast(GtkWidget*)this._cPtr, label ? cast(GtkWidget*)label._cPtr(No.Dup) : null);
  }

  /**
      Removes a tick callback previously registered with
      [gid.gtk4.widget.Widget.addTickCallback].
  
      Params:
        id = an ID returned by [gid.gtk4.widget.Widget.addTickCallback]
  */
  void removeTickCallback(uint id) nothrow
  {
    gtk_widget_remove_tick_callback(cast(GtkWidget*)this._cPtr, id);
  }

  /**
      Sets whether the input focus can enter the widget or
      any of its children.
      
      Applications should set can_focus to false to mark a
      widget as for pointer/touch use only.
      
      Note that having can_focus be true is only one of the
      necessary conditions for being focusable. A widget must
      also be sensitive and focusable and not have an ancestor
      that is marked as not can-focus in order to receive input
      focus.
      
      See [gid.gtk4.widget.Widget.grabFocus] for actually setting
      the input focus on a widget.
  
      Params:
        canFocus = whether the input focus can enter
            the widget or any of its children
  */
  void setCanFocus(bool canFocus) nothrow
  {
    gtk_widget_set_can_focus(cast(GtkWidget*)this._cPtr, canFocus);
  }

  /**
      Sets whether the widget can be the target of pointer events.
  
      Params:
        canTarget = whether this widget should be able to
            receive pointer events
  */
  void setCanTarget(bool canTarget) nothrow
  {
    gtk_widget_set_can_target(cast(GtkWidget*)this._cPtr, canTarget);
  }

  /**
      Sets whether the widget should be mapped along with its parent.
      
      The child visibility can be set for widget before it is added
      to a container with [gid.gtk4.widget.Widget.setParent], to avoid
      mapping children unnecessary before immediately unmapping them.
      However it will be reset to its default state of true when the
      widget is removed from a container.
      
      Note that changing the child visibility of a widget does not
      queue a resize on the widget. Most of the time, the size of
      a widget is computed from all visible children, whether or
      not they are mapped. If this is not the case, the container
      can queue a resize itself.
      
      This function is only useful for widget implementations
      and should never be called by an application.
  
      Params:
        childVisible = whether widget should be mapped along
            with its parent
  */
  void setChildVisible(bool childVisible) nothrow
  {
    gtk_widget_set_child_visible(cast(GtkWidget*)this._cPtr, childVisible);
  }

  /**
      Replaces the current style classes of the widget with classes.
  
      Params:
        classes = `NULL`-terminated list of style classes
  */
  void setCssClasses(string[] classes) nothrow
  {
    auto _classes_arr = new char*[](classes.length + 1);
    auto _classes = cast(char**)_classes_arr.ptr;
    foreach (i, s; classes) _classes[i] = s.toCString!(No.Malloc);
    gtk_widget_set_css_classes(cast(GtkWidget*)this._cPtr, _classes);
  }

  /**
      Sets the cursor to be shown when the pointer hovers over
      the widget.
      
      If the cursor is `NULL`, widget will use the cursor
      inherited from its parent.
  
      Params:
        cursor = the new cursor
  */
  void setCursor(gid.gdk4.cursor.Cursor cursor = null) nothrow
  {
    gtk_widget_set_cursor(cast(GtkWidget*)this._cPtr, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null);
  }

  /**
      Sets the cursor to be shown when the pointer hovers over
      the widget.
      
      This is a utility function that creates a cursor via
      [gid.gdk4.cursor.Cursor.newFromName] and then sets it on widget
      with [gid.gtk4.widget.Widget.setCursor]. See those functions for
      details.
      
      On top of that, this function allows name to be `NULL`, which
      will do the same as calling [gid.gtk4.widget.Widget.setCursor]
      with a `NULL` cursor.
  
      Params:
        name = the name of the cursor
  */
  void setCursorFromName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_widget_set_cursor_from_name(cast(GtkWidget*)this._cPtr, _name);
  }

  /**
      Sets the reading direction on the widget.
      
      This direction controls the primary direction for widgets
      containing text, and also the direction in which the children
      of a container are packed. The ability to set the direction is
      present in order so that correct localization into languages with
      right-to-left reading directions can be done.
      
      Generally, applications will let the default reading direction
      prevail, except for widgets where the children are arranged in
      an order that is explicitly visual rather than logical (such as
      buttons for text justification).
      
      If the direction is set to [gid.gtk4.types.TextDirection.None], then
      the value set by [gid.gtk4.widget.Widget.setDefaultDirection] will be used.
  
      Params:
        dir = the new direction
  */
  void setDirection(gid.gtk4.types.TextDirection dir) nothrow
  {
    gtk_widget_set_direction(cast(GtkWidget*)this._cPtr, dir);
  }

  /**
      Set the focus child of the widget.
      
      This function is only suitable for widget implementations.
      If you want a certain widget to get the input focus, call
      [gid.gtk4.widget.Widget.grabFocus] on it.
  
      Params:
        child = a direct child widget of widget
            or `NULL` to unset the focus child
  */
  void setFocusChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_widget_set_focus_child(cast(GtkWidget*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the widget should grab focus when it is clicked
      with the mouse.
      
      Making mouse clicks not grab focus is useful in places like
      toolbars where you don’t want the keyboard focus removed from
      the main area of the application.
  
      Params:
        focusOnClick = whether the widget should grab focus when clicked
            with the mouse
  */
  void setFocusOnClick(bool focusOnClick) nothrow
  {
    gtk_widget_set_focus_on_click(cast(GtkWidget*)this._cPtr, focusOnClick);
  }

  /**
      Sets whether the widget can own the input focus.
      
      Widget implementations should set focusable to true in
      their init() function if they want to receive keyboard input.
      
      Note that having focusable be true is only one of the
      necessary conditions for being focusable. A widget must
      also be sensitive and can-focus and not have an ancestor
      that is marked as not can-focus in order to receive input
      focus.
      
      See [gid.gtk4.widget.Widget.grabFocus] for actually setting
      the input focus on a widget.
  
      Params:
        focusable = whether or not widget can own the input focus
  */
  void setFocusable(bool focusable) nothrow
  {
    gtk_widget_set_focusable(cast(GtkWidget*)this._cPtr, focusable);
  }

  /**
      Sets the font map to use for text rendering in the widget.
      
      The font map is the object that is used to look up fonts.
      Setting a custom font map can be useful in special situations,
      e.g. when you need to add application-specific fonts to the set
      of available fonts.
      
      When not set, the widget will inherit the font map from its parent.
  
      Params:
        fontMap = a [gid.pango1.font_map.FontMap]
  */
  void setFontMap(gid.pango1.font_map.FontMap fontMap = null) nothrow
  {
    gtk_widget_set_font_map(cast(GtkWidget*)this._cPtr, fontMap ? cast(PangoFontMap*)fontMap._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.cairo1.font_options.FontOptions] used for text rendering
      in the widget.
      
      When not set, the default font options for the [gid.gdk4.display.Display]
      will be used.
  
      Params:
        options = a [gid.cairo1.font_options.FontOptions] struct
            to unset any previously set default font options
  */
  void setFontOptions(gid.cairo1.font_options.FontOptions options = null) nothrow
  {
    gtk_widget_set_font_options(cast(GtkWidget*)this._cPtr, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
  }

  /**
      Sets the horizontal alignment of the widget.
  
      Params:
        align_ = the horizontal alignment
  */
  void setHalign(gid.gtk4.types.Align align_) nothrow
  {
    gtk_widget_set_halign(cast(GtkWidget*)this._cPtr, align_);
  }

  /**
      Sets the `has-tooltip` property on the widget.
  
      Params:
        hasTooltip = whether or not widget has a tooltip
  */
  void setHasTooltip(bool hasTooltip) nothrow
  {
    gtk_widget_set_has_tooltip(cast(GtkWidget*)this._cPtr, hasTooltip);
  }

  /**
      Sets whether the widget would like any available extra horizontal
      space.
      
      When a user resizes a window, widgets with expand set to true generally
      receive the extra space. For example, a list or scrollable area
      or document in your window would often be set to expand.
      
      Call this function to set the expand flag if you would like your
      widget to become larger horizontally when the window has extra
      room.
      
      By default, widgets automatically expand if any of their children
      want to expand. (To see if a widget will automatically expand given
      its current children and state, call [gid.gtk4.widget.Widget.computeExpand].
      A widget can decide how the expandability of children affects its
      own expansion by overriding the `compute_expand` virtual method on
      [gid.gtk4.widget.Widget].).
      
      Setting hexpand explicitly with this function will override the
      automatic expand behavior.
      
      This function forces the widget to expand or not to expand,
      regardless of children. The override occurs because
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
      Sets whether the hexpand flag will be used.
      
      The [gid.gtk4.widget.Widget.hexpandSet] property will be set
      automatically when you call [gid.gtk4.widget.Widget.setHexpand]
      to set hexpand, so the most likely reason to use this function
      would be to unset an explicit expand flag.
      
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
      Sets the layout manager to use for measuring and allocating children
      of the widget.
  
      Params:
        layoutManager = a layout manager
  */
  void setLayoutManager(gid.gtk4.layout_manager.LayoutManager layoutManager = null) nothrow
  {
    gtk_widget_set_layout_manager(cast(GtkWidget*)this._cPtr, layoutManager ? cast(GtkLayoutManager*)layoutManager._cPtr(Yes.Dup) : null);
  }

  /**
      Sets whether the widget acts like a modal dialog,
      with respect to event delivery.
  
      Params:
        limitEvents = whether to limit events
  */
  void setLimitEvents(bool limitEvents) nothrow
  {
    gtk_widget_set_limit_events(cast(GtkWidget*)this._cPtr, limitEvents);
  }

  /**
      Sets the bottom margin of the widget.
  
      Params:
        margin = the bottom margin
  */
  void setMarginBottom(int margin) nothrow
  {
    gtk_widget_set_margin_bottom(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the end margin of the widget.
  
      Params:
        margin = the end margin
  */
  void setMarginEnd(int margin) nothrow
  {
    gtk_widget_set_margin_end(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the start margin of the widget.
  
      Params:
        margin = the start margin
  */
  void setMarginStart(int margin) nothrow
  {
    gtk_widget_set_margin_start(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the top margin of the widget.
  
      Params:
        margin = the top margin
  */
  void setMarginTop(int margin) nothrow
  {
    gtk_widget_set_margin_top(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets a widgets name.
      
      Setting a name allows you to refer to the widget from a
      CSS file. You can apply a style to widgets with a particular name
      in the CSS file. See the documentation for the CSS syntax (on the
      same page as the docs for [gid.gtk4.style_context.StyleContext].
      
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
      Requests the widget to be rendered partially transparent.
      
      An opacity of 0 is fully transparent and an opacity of 1
      is fully opaque.
      
      Opacity works on both toplevel widgets and child widgets, although
      there are some limitations: For toplevel widgets, applying opacity
      depends on the capabilities of the windowing system. On X11, this
      has any effect only on X displays with a compositing manager, see
      [gid.gdk4.display.Display.isComposited]. On Windows and Wayland it will
      always work, although setting a window’s opacity after the window
      has been shown may cause some flicker.
      
      Note that the opacity is inherited through inclusion — if you set
      a toplevel to be partially translucent, all of its content will
      appear translucent, since it is ultimatively rendered on that
      toplevel. The opacity value itself is not inherited by child
      widgets (since that would make widgets deeper in the hierarchy
      progressively more translucent). As a consequence, [gid.gtk4.popover.Popover]
      instances and other [gid.gtk4.native.Native] widgets with their own surface
      will use their own opacity value, and thus by default appear
      non-translucent, even if they are attached to a toplevel that
      is translucent.
  
      Params:
        opacity = desired opacity, between 0 and 1
  */
  void setOpacity(double opacity) nothrow
  {
    gtk_widget_set_opacity(cast(GtkWidget*)this._cPtr, opacity);
  }

  /**
      Sets how the widget treats content that is drawn outside the
      it's content area.
      
      See the definition of [gid.gtk4.types.Overflow] for details.
      
      This setting is provided for widget implementations and
      should not be used by application code.
      
      The default value is [gid.gtk4.types.Overflow.Visible].
  
      Params:
        overflow = desired overflow value
  */
  void setOverflow(gid.gtk4.types.Overflow overflow) nothrow
  {
    gtk_widget_set_overflow(cast(GtkWidget*)this._cPtr, overflow);
  }

  /**
      Sets the parent widget of the widget.
      
      This takes care of details such as updating the state and style
      of the child to reflect its new location and resizing the parent.
      The opposite function is [gid.gtk4.widget.Widget.unparent].
      
      This function is useful only when implementing subclasses of
      [gid.gtk4.widget.Widget].
  
      Params:
        parent = parent widget
  */
  void setParent(gid.gtk4.widget.Widget parent) nothrow
  {
    gtk_widget_set_parent(cast(GtkWidget*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the widget will be treated as the default
      widget within its toplevel when it has the focus, even if
      another widget is the default.
  
      Params:
        receivesDefault = whether or not widget can be a default widget
  */
  void setReceivesDefault(bool receivesDefault) nothrow
  {
    gtk_widget_set_receives_default(cast(GtkWidget*)this._cPtr, receivesDefault);
  }

  /**
      Sets the sensitivity of the widget.
      
      A widget is sensitive if the user can interact with it.
      Insensitive widgets are “grayed out” and the user can’t
      interact with them. Insensitive widgets are known as
      “inactive”, “disabled”, or “ghosted” in some other toolkits.
  
      Params:
        sensitive = true to make the widget sensitive
  */
  void setSensitive(bool sensitive) nothrow
  {
    gtk_widget_set_sensitive(cast(GtkWidget*)this._cPtr, sensitive);
  }

  /**
      Sets the minimum size of the widget.
      
      That is, the widget’s size request will be at least width
      by height. You can use this function to force a widget to
      be larger than it normally would be.
      
      In most cases, [gid.gtk4.window.Window.setDefaultSize] is a better
      choice for toplevel windows than this function; setting the default
      size will still allow users to shrink the window. Setting the size
      request will force them to leave the window at least as large as
      the size request.
      
      Note the inherent danger of setting any fixed size - themes,
      translations into other languages, different fonts, and user action
      can all change the appropriate size for a given widget. So, it is
      basically impossible to hardcode a size that will always work.
      
      The size request of a widget is the smallest size a widget can
      accept while still functioning well and drawing itself correctly.
      However in some strange cases a widget may be allocated less than
      its requested size, and in many cases a widget may be allocated more
      space than it requested.
      
      If the size request in a given direction is -1 (unset), then
      the “natural” size request of the widget will be used instead.
      
      The size request set here does not include any margin from the
      properties
      [gid.gtk4.widget.Widget.marginStart],
      [gid.gtk4.widget.Widget.marginEnd],
      [gid.gtk4.widget.Widget.marginTop], and
      [gid.gtk4.widget.Widget.marginBottom], but it does include pretty
      much all other padding or border properties set by any subclass
      of [gid.gtk4.widget.Widget].
  
      Params:
        width = width widget should request, or -1 to unset
        height = height widget should request, or -1 to unset
  */
  void setSizeRequest(int width, int height) nothrow
  {
    gtk_widget_set_size_request(cast(GtkWidget*)this._cPtr, width, height);
  }

  /**
      Turns on flag values in the current widget state.
      
      Typical widget states are insensitive, prelighted, etc.
      
      This function accepts the values `flagsGtk.StateFlags.dir-ltr` and
      `flagsGtk.StateFlags.dir-rtl` but ignores them. If you want to set
      the widget's direction, use [gid.gtk4.widget.Widget.setDirection].
      
      This function is for use in widget implementations.
  
      Params:
        flags = state flags to turn on
        clear = whether to clear state before turning on flags
  */
  void setStateFlags(gid.gtk4.types.StateFlags flags, bool clear) nothrow
  {
    gtk_widget_set_state_flags(cast(GtkWidget*)this._cPtr, flags, clear);
  }

  /**
      Sets the contents of the tooltip for widget.
      
      markup must contain Pango markup.
      
      This function will take care of setting the
      [gid.gtk4.widget.Widget.hasTooltip] as a side effect, and of the
      default handler for the [gid.gtk4.widget.Widget.queryTooltip] signal.
      
      See also [gid.gtk4.tooltip.Tooltip.setMarkup].
  
      Params:
        markup = the contents of the tooltip for widget
  */
  void setTooltipMarkup(string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_widget_set_tooltip_markup(cast(GtkWidget*)this._cPtr, _markup);
  }

  /**
      Sets the contents of the tooltip for the widget.
      
      If text contains any markup, it will be escaped.
      
      This function will take care of setting
      [gid.gtk4.widget.Widget.hasTooltip] as a side effect,
      and of the default handler for the
      [gid.gtk4.widget.Widget.queryTooltip] signal.
      
      See also [gid.gtk4.tooltip.Tooltip.setText].
  
      Params:
        text = the contents of the tooltip for widget
  */
  void setTooltipText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_widget_set_tooltip_text(cast(GtkWidget*)this._cPtr, _text);
  }

  /**
      Sets the vertical alignment of the widget.
  
      Params:
        align_ = the vertical alignment
  */
  void setValign(gid.gtk4.types.Align align_) nothrow
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
      Sets whether the vexpand flag will be used.
      
      See [gid.gtk4.widget.Widget.setHexpandSet] for more detail.
  
      Params:
        set = value for vexpand-set property
  */
  void setVexpandSet(bool set) nothrow
  {
    gtk_widget_set_vexpand_set(cast(GtkWidget*)this._cPtr, set);
  }

  /**
      Sets the visibility state of widget.
      
      Note that setting this to true doesn’t mean the widget is
      actually viewable, see [gid.gtk4.widget.Widget.getVisible].
  
      Params:
        visible = whether the widget should be shown or not
  */
  void setVisible(bool visible) nothrow
  {
    gtk_widget_set_visible(cast(GtkWidget*)this._cPtr, visible);
  }

  /**
      Returns whether the widget should contribute to
      the measuring and allocation of its parent.
      
      This is false for invisible children, but also
      for children that have their own surface, such
      as [gid.gtk4.popover.Popover] instances.
      Returns: true if child should be included in
          measuring and allocating
  */
  bool shouldLayout() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_should_layout(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Flags a widget to be displayed.
      
      Any widget that isn’t shown will not appear on the screen.
      
      Remember that you have to show the containers containing a widget,
      in addition to the widget itself, before it will appear onscreen.
      
      When a toplevel widget is shown, it is immediately realized and
      mapped; other shown widgets are realized and mapped when their
      toplevel widget is realized and mapped.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setVisible] instead
  */
  void show() nothrow
  {
    gtk_widget_show(cast(GtkWidget*)this._cPtr);
  }

  /**
      Allocates widget with a transformation that translates
      the origin to the position in allocation.
      
      This is a simple form of [gid.gtk4.widget.Widget.allocate].
  
      Params:
        allocation = position and size to be allocated to widget
        baseline = the baseline of the child, or -1
  */
  void sizeAllocate(gid.gtk4.types.Allocation allocation, int baseline) nothrow
  {
    gtk_widget_size_allocate(cast(GtkWidget*)this._cPtr, cast(const(GtkAllocation)*)&allocation, baseline);
  }

  /**
      Snapshots a child of the widget.
      
      When a widget receives a call to the snapshot function,
      it must send synthetic `vfuncGtk.Widget.snapshot` calls
      to all children. This function provides a convenient way
      of doing this. A widget, when it receives a call to its
      `vfuncGtk.Widget.snapshot` function, calls
      [gid.gtk4.widget.Widget.snapshotChild] once for each child, passing in
      the snapshot the widget received.
      
      This function takes care of translating the origin of snapshot,
      and deciding whether the child needs to be snapshot.
      
      It does nothing for children that implement [gid.gtk4.native.Native].
  
      Params:
        child = a child of widget
        snapshot = snapshot as passed to the widget. In particular, no
            calls to [gid.gtk4.snapshot.Snapshot.translate] or other transform calls
            should have been made
  */
  void snapshotChild(gid.gtk4.widget.Widget child, gid.gtk4.snapshot.Snapshot snapshot) nothrow
  {
    gtk_widget_snapshot_child(cast(GtkWidget*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null);
  }

  /**
      Translates coordinates relative to src_widget’s allocation
      to coordinates relative to dest_widget’s allocations.
      
      In order to perform this operation, both widget must share
      a common ancestor. If that is not the case, dest_x and dest_y
      are set to 0 and false is returned.
  
      Params:
        destWidget = another widget
        srcX = X position in widget coordinates of src_widget
        srcY = Y position in widget coordinates of src_widget
        destX = location to store X position in widget coordinates of dest_widget
        destY = location to store Y position in widget coordinates of dest_widget
      Returns: true if src_widget and dest_widget have a common
          ancestor, false otherwise
  
      Deprecated: Use [gid.gtk4.widget.Widget.computePoint] instead
  */
  bool translateCoordinates(gid.gtk4.widget.Widget destWidget, double srcX, double srcY, out double destX, out double destY) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_translate_coordinates(cast(GtkWidget*)this._cPtr, destWidget ? cast(GtkWidget*)destWidget._cPtr(No.Dup) : null, srcX, srcY, cast(double*)&destX, cast(double*)&destY);
    return _retval;
  }

  /**
      Triggers a tooltip query on the display of the widget.
  */
  void triggerTooltipQuery() nothrow
  {
    gtk_widget_trigger_tooltip_query(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes a widget to be unmapped if it’s currently mapped.
      
      This function is only for use in widget implementations.
  */
  void unmap() nothrow
  {
    gtk_widget_unmap(cast(GtkWidget*)this._cPtr);
  }

  /**
      Removes widget from its parent.
      
      This function is only for use in widget implementations,
      typically in dispose.
  */
  void unparent() nothrow
  {
    gtk_widget_unparent(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes a widget to be unrealized.
      
      This frees all GDK resources associated with the widget.
      
      This function is only useful in widget implementations.
  */
  void unrealize() nothrow
  {
    gtk_widget_unrealize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Turns off flag values for the current widget state.
      
      See [gid.gtk4.widget.Widget.setStateFlags].
      
      This function is for use in widget implementations.
  
      Params:
        flags = state flags to turn off
  */
  void unsetStateFlags(gid.gtk4.types.StateFlags flags) nothrow
  {
    gtk_widget_unset_state_flags(cast(GtkWidget*)this._cPtr, flags);
  }

  /**
      Connect to `Destroy` signal.
  
      Signals that all holders of a reference to the widget should release
        the reference that they hold.
        
        May result in finalization of the widget if all references are released.
        
        This signal is not suitable for saving widget state.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDestroy(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.destroy");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("destroy", closure, after);
  }

  /**
      Connect to `DirectionChanged` signal.
  
      Emitted when the text direction of a widget changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.TextDirection previousDirection, gid.gtk4.widget.Widget widget)`
  
          `previousDirection` the previous text direction (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDirectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.TextDirection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.directionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("direction-changed", closure, after);
  }

  /**
      Connect to `Hide` signal.
  
      Emitted when widget is hidden.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHide(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.hide");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hide", closure, after);
  }

  /**
      Connect to `KeynavFailed` signal.
  
      Emitted if keyboard navigation fails.
        
        See [gid.gtk4.widget.Widget.keynavFailed] for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.types.DirectionType direction, gid.gtk4.widget.Widget widget)`
  
          `direction` the direction of movement (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if stopping keyboard navigation is fine, false
              if the emitting widget should try to handle the keyboard
              navigation attempt in its parent widget
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectKeynavFailed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.keynavFailed");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("keynav-failed", closure, after);
  }

  /**
      Connect to `Map` signal.
  
      Emitted when widget is going to be mapped.
        
        A widget is mapped when the widget is visible (which is controlled with
        [gid.gtk4.widget.Widget.visible]) and all its parents up to the toplevel widget
        are also visible.
        
        The `::map` signal can be used to determine whether a widget will be drawn,
        for instance it can resume an animation that was stopped during the
        emission of [gid.gtk4.widget.Widget.unmap].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMap(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.map");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("map", closure, after);
  }

  /**
      Connect to `MnemonicActivate` signal.
  
      Emitted when a widget is activated via a mnemonic.
        
        The default handler for this signal activates widget if group_cycling
        is false, or just makes widget grab focus if group_cycling is true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool groupCycling, gid.gtk4.widget.Widget widget)`
  
          `groupCycling` true if there are other widgets with the same mnemonic (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event,
              false to propagate the event further
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMnemonicActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.mnemonicActivate");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mnemonic-activate", closure, after);
  }

  /**
      Connect to `MoveFocus` signal.
  
      Emitted when the focus is moved.
        
        The `::move-focus` signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are <kbd>Tab</kbd> to move forward,
        and <kbd>Shift</kbd>+<kbd>Tab</kbd> to move backward.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.DirectionType direction, gid.gtk4.widget.Widget widget)`
  
          `direction` the direction of the focus move (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.moveFocus");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-focus", closure, after);
  }

  /**
      Connect to `QueryTooltip` signal.
  
      Emitted when the widget’s tooltip is about to be shown.
        
        This happens when the [gid.gtk4.widget.Widget.hasTooltip] property
        is true and the hover timeout has expired with the cursor hovering
        above widget; or emitted when widget got focus in keyboard mode.
        
        Using the given coordinates, the signal handler should determine
        whether a tooltip should be shown for widget. If this is the case
        true should be returned, false otherwise. Note that if keyboard_mode
        is true, the values of `x` and `y` are undefined and should not be used.
        
        The signal handler is free to manipulate tooltip with the therefore
        destined function calls.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int x, int y, bool keyboardMode, gid.gtk4.tooltip.Tooltip tooltip, gid.gtk4.widget.Widget widget)`
  
          `x` the x coordinate of the cursor position in widget coordinates (optional)
  
          `y` the y coordinate of the cursor position in widget coordinates (optional)
  
          `keyboardMode` true if the tooltip was triggered using the keyboard (optional)
  
          `tooltip` a [gid.gtk4.tooltip.Tooltip] (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if tooltip should be shown right now, false otherwise
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk4.tooltip.Tooltip)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.queryTooltip");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip", closure, after);
  }

  /**
      Connect to `Realize` signal.
  
      Emitted when widget is associated with a [gid.gdk4.surface.Surface].
        
        This means that [gid.gtk4.widget.Widget.realize] has been called
        or the widget has been mapped (that is, it is going to be drawn).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRealize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.realize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("realize", closure, after);
  }

  /**
      Connect to `Show` signal.
  
      Emitted when widget is shown.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.show");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show", closure, after);
  }

  /**
      Connect to `StateFlagsChanged` signal.
  
      Emitted when the widget state changes.
        
        See [gid.gtk4.widget.Widget.getStateFlags].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.StateFlags flags, gid.gtk4.widget.Widget widget)`
  
          `flags` the previous state flags (optional)
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStateFlagsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.StateFlags)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.stateFlagsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-flags-changed", closure, after);
  }

  /**
      Connect to `Unmap` signal.
  
      Emitted when widget is going to be unmapped.
        
        A widget is unmapped when either it or any of its parents up to the
        toplevel widget have been set as hidden.
        
        As `::unmap` indicates that a widget will not be shown any longer,
        it can be used to, for example, stop an animation on the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnmap(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.unmap");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unmap", closure, after);
  }

  /**
      Connect to `Unrealize` signal.
  
      Emitted when the [gid.gdk4.surface.Surface] associated with widget is destroyed.
        
        This means that [gid.gtk4.widget.Widget.unrealize] has been called
        or the widget has been unmapped (that is, it is going to be hidden).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.widget.Widget widget)`
  
          `widget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnrealize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.unrealize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unrealize", closure, after);
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
    static assert(is(T : gid.gtk4.widget.Widget), T.stringof ~ " is not derived from gid.gtk4.widget.Widget");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncContains", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "contains");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCssChanged", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "css_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDirectionChanged", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "direction_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocus", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRequestMode", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "get_request_mode");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGrabFocus", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "grab_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHide", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "hide");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncKeynavFailed", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "keynav_failed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMap", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "map");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMeasure", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "measure");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMnemonicActivate", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "mnemonic_activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveFocus", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "move_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryTooltip", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "query_tooltip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRealize", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "realize");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRoot", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "root");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetFocusChild", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "set_focus_child");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShow", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "show");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSizeAllocate", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "size_allocate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSnapshot", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "snapshot");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStateFlagsChanged", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "state_flags_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSystemSettingChanged", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "system_setting_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnmap", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "unmap");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnrealize", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "unrealize");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnroot", true)[0]) == gid.gtk4.widget.Widget))
      _installVfunc(klass, "unroot");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkWidgetClass*)klass;

    switch (vfunc)
    {
      case "contains":
      {
        static extern(C) gboolean _vfuncContainsTramp(GtkWidget* widget, double x, double y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.contains)
              return (cast(typeof(&_vfuncContainsTramp))_klass.contains)(widget, x, y);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncContains(x, y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncContains");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.contains = cast(typeof(_klass.contains))&_vfuncContainsTramp;
        break;
      }
      case "css_changed":
      {
        static extern(C) void _vfuncCssChangedTramp(GtkWidget* widget, GtkCssStyleChange* change) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.cssChanged)
              return (cast(typeof(&_vfuncCssChangedTramp))_klass.cssChanged)(widget, change);
            return;
          }

          try
          {
            _obj.vfuncCssChanged(change);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncCssChanged");
          }
        }

        _klass.cssChanged = cast(typeof(_klass.cssChanged))&_vfuncCssChangedTramp;
        break;
      }
      case "direction_changed":
      {
        static extern(C) void _vfuncDirectionChangedTramp(GtkWidget* widget, GtkTextDirection previousDirection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncDirectionChanged");
          }
        }

        _klass.directionChanged = cast(typeof(_klass.directionChanged))&_vfuncDirectionChangedTramp;
        break;
      }
      case "focus":
      {
        static extern(C) gboolean _vfuncFocusTramp(GtkWidget* widget, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.focus = cast(typeof(_klass.focus))&_vfuncFocusTramp;
        break;
      }
      case "get_request_mode":
      {
        static extern(C) GtkSizeRequestMode _vfuncGetRequestModeTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.getRequestMode)
              return (cast(typeof(&_vfuncGetRequestModeTramp))_klass.getRequestMode)(widget);
            return typeof(return).init;
          }

          gid.gtk4.types.SizeRequestMode _dretval;

          try
          {
            _dretval = _obj.vfuncGetRequestMode();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncGetRequestMode");
          }
          auto _retval = cast(GtkSizeRequestMode)_dretval;

          return _retval;
        }

        _klass.getRequestMode = cast(typeof(_klass.getRequestMode))&_vfuncGetRequestModeTramp;
        break;
      }
      case "grab_focus":
      {
        static extern(C) gboolean _vfuncGrabFocusTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.grabFocus)
              return (cast(typeof(&_vfuncGrabFocusTramp))_klass.grabFocus)(widget);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGrabFocus();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncGrabFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.grabFocus = cast(typeof(_klass.grabFocus))&_vfuncGrabFocusTramp;
        break;
      }
      case "hide":
      {
        static extern(C) void _vfuncHideTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncHide");
          }
        }

        _klass.hide = cast(typeof(_klass.hide))&_vfuncHideTramp;
        break;
      }
      case "keynav_failed":
      {
        static extern(C) gboolean _vfuncKeynavFailedTramp(GtkWidget* widget, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncKeynavFailed");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.keynavFailed = cast(typeof(_klass.keynavFailed))&_vfuncKeynavFailedTramp;
        break;
      }
      case "map":
      {
        static extern(C) void _vfuncMapTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncMap");
          }
        }

        _klass.map = cast(typeof(_klass.map))&_vfuncMapTramp;
        break;
      }
      case "measure":
      {
        static extern(C) void _vfuncMeasureTramp(GtkWidget* widget, GtkOrientation orientation, int forSize, int* minimum, int* natural, int* minimumBaseline, int* naturalBaseline) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.measure)
              return (cast(typeof(&_vfuncMeasureTramp))_klass.measure)(widget, orientation, forSize, minimum, natural, minimumBaseline, naturalBaseline);
            return;
          }

          typeof(*minimum) _minimumNull;
          if (!minimum)
            minimum = &_minimumNull;

          typeof(*natural) _naturalNull;
          if (!natural)
            natural = &_naturalNull;

          typeof(*minimumBaseline) _minimumBaselineNull;
          if (!minimumBaseline)
            minimumBaseline = &_minimumBaselineNull;

          typeof(*naturalBaseline) _naturalBaselineNull;
          if (!naturalBaseline)
            naturalBaseline = &_naturalBaselineNull;

          try
          {
            _obj.vfuncMeasure(orientation, forSize, *minimum, *natural, *minimumBaseline, *naturalBaseline);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncMeasure");
          }
        }

        _klass.measure = cast(typeof(_klass.measure))&_vfuncMeasureTramp;
        break;
      }
      case "mnemonic_activate":
      {
        static extern(C) gboolean _vfuncMnemonicActivateTramp(GtkWidget* widget, gboolean groupCycling) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncMnemonicActivate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.mnemonicActivate = cast(typeof(_klass.mnemonicActivate))&_vfuncMnemonicActivateTramp;
        break;
      }
      case "move_focus":
      {
        static extern(C) void _vfuncMoveFocusTramp(GtkWidget* widget, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncMoveFocus");
          }
        }

        _klass.moveFocus = cast(typeof(_klass.moveFocus))&_vfuncMoveFocusTramp;
        break;
      }
      case "query_tooltip":
      {
        static extern(C) gboolean _vfuncQueryTooltipTramp(GtkWidget* widget, int x, int y, gboolean keyboardTooltip, GtkTooltip* tooltip) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            _dretval = _obj.vfuncQueryTooltip(x, y, cast(bool)keyboardTooltip, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tooltip.Tooltip)(cast(void*)tooltip, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncQueryTooltip");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.queryTooltip = cast(typeof(_klass.queryTooltip))&_vfuncQueryTooltipTramp;
        break;
      }
      case "realize":
      {
        static extern(C) void _vfuncRealizeTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncRealize");
          }
        }

        _klass.realize = cast(typeof(_klass.realize))&_vfuncRealizeTramp;
        break;
      }
      case "root":
      {
        static extern(C) void _vfuncRootTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.root)
              return (cast(typeof(&_vfuncRootTramp))_klass.root)(widget);
            return;
          }

          try
          {
            _obj.vfuncRoot();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncRoot");
          }
        }

        _klass.root = cast(typeof(_klass.root))&_vfuncRootTramp;
        break;
      }
      case "set_focus_child":
      {
        static extern(C) void _vfuncSetFocusChildTramp(GtkWidget* widget, GtkWidget* child) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.setFocusChild)
              return (cast(typeof(&_vfuncSetFocusChildTramp))_klass.setFocusChild)(widget, child);
            return;
          }

          try
          {
            _obj.vfuncSetFocusChild(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)child, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncSetFocusChild");
          }
        }

        _klass.setFocusChild = cast(typeof(_klass.setFocusChild))&_vfuncSetFocusChildTramp;
        break;
      }
      case "show":
      {
        static extern(C) void _vfuncShowTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncShow");
          }
        }

        _klass.show = cast(typeof(_klass.show))&_vfuncShowTramp;
        break;
      }
      case "size_allocate":
      {
        static extern(C) void _vfuncSizeAllocateTramp(GtkWidget* widget, int width, int height, int baseline) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.sizeAllocate)
              return (cast(typeof(&_vfuncSizeAllocateTramp))_klass.sizeAllocate)(widget, width, height, baseline);
            return;
          }

          try
          {
            _obj.vfuncSizeAllocate(width, height, baseline);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncSizeAllocate");
          }
        }

        _klass.sizeAllocate = cast(typeof(_klass.sizeAllocate))&_vfuncSizeAllocateTramp;
        break;
      }
      case "snapshot":
      {
        static extern(C) void _vfuncSnapshotTramp(GtkWidget* widget, GtkSnapshot* snapshot) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.snapshot)
              return (cast(typeof(&_vfuncSnapshotTramp))_klass.snapshot)(widget, snapshot);
            return;
          }

          try
          {
            _obj.vfuncSnapshot(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncSnapshot");
          }
        }

        _klass.snapshot = cast(typeof(_klass.snapshot))&_vfuncSnapshotTramp;
        break;
      }
      case "state_flags_changed":
      {
        static extern(C) void _vfuncStateFlagsChangedTramp(GtkWidget* widget, GtkStateFlags previousStateFlags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncStateFlagsChanged");
          }
        }

        _klass.stateFlagsChanged = cast(typeof(_klass.stateFlagsChanged))&_vfuncStateFlagsChangedTramp;
        break;
      }
      case "system_setting_changed":
      {
        static extern(C) void _vfuncSystemSettingChangedTramp(GtkWidget* widget, GtkSystemSetting settings) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.systemSettingChanged)
              return (cast(typeof(&_vfuncSystemSettingChangedTramp))_klass.systemSettingChanged)(widget, settings);
            return;
          }

          try
          {
            _obj.vfuncSystemSettingChanged(settings);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncSystemSettingChanged");
          }
        }

        _klass.systemSettingChanged = cast(typeof(_klass.systemSettingChanged))&_vfuncSystemSettingChangedTramp;
        break;
      }
      case "unmap":
      {
        static extern(C) void _vfuncUnmapTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncUnmap");
          }
        }

        _klass.unmap = cast(typeof(_klass.unmap))&_vfuncUnmapTramp;
        break;
      }
      case "unrealize":
      {
        static extern(C) void _vfuncUnrealizeTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncUnrealize");
          }
        }

        _klass.unrealize = cast(typeof(_klass.unrealize))&_vfuncUnrealizeTramp;
        break;
      }
      case "unroot":
      {
        static extern(C) void _vfuncUnrootTramp(GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.widget.Widget)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)widget);
          if (!_obj)
          {
            auto _klass = cast(GtkWidgetClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)widget);
            if (_klass.unroot)
              return (cast(typeof(&_vfuncUnrootTramp))_klass.unroot)(widget);
            return;
          }

          try
          {
            _obj.vfuncUnroot();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.widget.Widget.vfuncUnroot");
          }
        }

        _klass.unroot = cast(typeof(_klass.unroot))&_vfuncUnrootTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.widget.Widget]
class WidgetGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T, gid.gtk4.accessible.AccessibleGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T, gid.gtk4.constraint_target.ConstraintTargetGidBuilderImpl!T
{

  mixin AccessibleGidBuilderT!();
  mixin BuildableGidBuilderT!();
  mixin ConstraintTargetGidBuilderT!();

  /**
  Convenience property to set `marginStart`, `marginEnd`, `marginTop`, and `marginBottom`.
  Params:
  propval = Margin for all 4 sides of the widget.
  
  This property adds margin outside of the widget's normal size
  request, the margin will be added in addition to the size from
  [gid.gtk4.widget.Widget.setSizeRequest] for example.
  Returns: Builder instance for fluent chaining
  */
  T margin(int propval) nothrow
  {
    setProperty("margin-start", propval);
    setProperty("margin-end", propval);
    setProperty("margin-top", propval);
    return setProperty("margin-bottom", propval);
  }

  /**
      Set `canFocus` property.
      Params:
        propval = Whether the widget or any of its descendents can accept
          the input focus.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
      Returns: Builder instance for fluent chaining
  */
  T canFocus(bool propval) nothrow
  {
    return setProperty("can-focus", propval);
  }

  /**
      Set `canTarget` property.
      Params:
        propval = Whether the widget can receive pointer events.
      Returns: Builder instance for fluent chaining
  */
  T canTarget(bool propval) nothrow
  {
    return setProperty("can-target", propval);
  }

  /**
      Set `cssClasses` property.
      Params:
        propval = A list of css classes applied to this widget.
      Returns: Builder instance for fluent chaining
  */
  T cssClasses(string[] propval) nothrow
  {
    return setProperty("css-classes", propval);
  }

  /**
      Set `cssName` property.
      Params:
        propval = The name of this widget in the CSS tree.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
      Returns: Builder instance for fluent chaining
  */
  T cssName(string propval) nothrow
  {
    return setProperty("css-name", propval);
  }

  /**
      Set `cursor` property.
      Params:
        propval = The cursor used by @widget.
      Returns: Builder instance for fluent chaining
  */
  T cursor(gid.gdk4.cursor.Cursor propval) nothrow
  {
    return setProperty("cursor", propval);
  }

  /**
      Set `focusOnClick` property.
      Params:
        propval = Whether the widget should grab focus when it is clicked with the mouse.
          
          This property is only relevant for widgets that can take focus.
      Returns: Builder instance for fluent chaining
  */
  T focusOnClick(bool propval) nothrow
  {
    return setProperty("focus-on-click", propval);
  }

  /**
      Set `focusable` property.
      Params:
        propval = Whether this widget itself will accept the input focus.
      Returns: Builder instance for fluent chaining
  */
  T focusable(bool propval) nothrow
  {
    return setProperty("focusable", propval);
  }

  /**
      Set `halign` property.
      Params:
        propval = How to distribute horizontal space if widget gets extra space.
      Returns: Builder instance for fluent chaining
  */
  T halign(gid.gtk4.types.Align propval) nothrow
  {
    return setProperty("halign", propval);
  }

  /**
      Set `hasTooltip` property.
      Params:
        propval = Enables or disables the emission of the [gid.gtk4.widget.Widget.queryTooltip]
          signal on @widget.
          
          A true value indicates that @widget can have a tooltip, in this case
          the widget will be queried using [gid.gtk4.widget.Widget.queryTooltip] to
          determine whether it will provide a tooltip or not.
      Returns: Builder instance for fluent chaining
  */
  T hasTooltip(bool propval) nothrow
  {
    return setProperty("has-tooltip", propval);
  }

  /**
      Set `heightRequest` property.
      Params:
        propval = Overrides for height request of the widget.
          
          If this is -1, the natural request will be used.
      Returns: Builder instance for fluent chaining
  */
  T heightRequest(int propval) nothrow
  {
    return setProperty("height-request", propval);
  }

  /**
      Set `hexpand` property.
      Params:
        propval = Whether to expand horizontally.
      Returns: Builder instance for fluent chaining
  */
  T hexpand(bool propval) nothrow
  {
    return setProperty("hexpand", propval);
  }

  /**
      Set `hexpandSet` property.
      Params:
        propval = Whether to use the `hexpand` property.
      Returns: Builder instance for fluent chaining
  */
  T hexpandSet(bool propval) nothrow
  {
    return setProperty("hexpand-set", propval);
  }

  /**
      Set `layoutManager` property.
      Params:
        propval = The [gid.gtk4.layout_manager.LayoutManager] instance to use to compute
          the preferred size of the widget, and allocate its children.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
      Returns: Builder instance for fluent chaining
  */
  T layoutManager(gid.gtk4.layout_manager.LayoutManager propval) nothrow
  {
    return setProperty("layout-manager", propval);
  }

  /**
      Set `limitEvents` property.
      Params:
        propval = Makes this widget act like a modal dialog, with respect to
          event delivery.
          
          Global event controllers will not handle events with targets
          inside the widget, unless they are set up to ignore propagation
          limits. See [gid.gtk4.event_controller.EventController.setPropagationLimit].
      Returns: Builder instance for fluent chaining
  */
  T limitEvents(bool propval) nothrow
  {
    return setProperty("limit-events", propval);
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
        propval = Margin on end of widget, horizontally.
          
          This property supports left-to-right and right-to-left text
          directions.
          
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
      Set `marginStart` property.
      Params:
        propval = Margin on start of widget, horizontally.
          
          This property supports left-to-right and right-to-left text
          directions.
          
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

  /**
      Set `name` property.
      Params:
        propval = The name of the widget.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `opacity` property.
      Params:
        propval = The requested opacity of the widget.
      Returns: Builder instance for fluent chaining
  */
  T opacity(double propval) nothrow
  {
    return setProperty("opacity", propval);
  }

  /**
      Set `overflow` property.
      Params:
        propval = How content outside the widget's content area is treated.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
      Returns: Builder instance for fluent chaining
  */
  T overflow(gid.gtk4.types.Overflow propval) nothrow
  {
    return setProperty("overflow", propval);
  }

  /**
      Set `receivesDefault` property.
      Params:
        propval = Whether the widget will receive the default action when it is focused.
      Returns: Builder instance for fluent chaining
  */
  T receivesDefault(bool propval) nothrow
  {
    return setProperty("receives-default", propval);
  }

  /**
      Set `sensitive` property.
      Params:
        propval = Whether the widget responds to input.
      Returns: Builder instance for fluent chaining
  */
  T sensitive(bool propval) nothrow
  {
    return setProperty("sensitive", propval);
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with Pango markup.
          
          Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not `NULL`:
          [gid.gtk4.widget.Widget.hasTooltip] will automatically be set to true
          and there will be taken care of [gid.gtk4.widget.Widget.queryTooltip] in
          the default signal handler.
          
          Note that if both [gid.gtk4.widget.Widget.tooltipText] and
          [gid.gtk4.widget.Widget.tooltipMarkup] are set, the last one wins.
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
          tooltip shown if the given string is not `NULL`:
          [gid.gtk4.widget.Widget.hasTooltip] will automatically be set to true
          and there will be taken care of [gid.gtk4.widget.Widget.queryTooltip] in
          the default signal handler.
          
          Note that if both [gid.gtk4.widget.Widget.tooltipText] and
          [gid.gtk4.widget.Widget.tooltipMarkup] are set, the last one wins.
      Returns: Builder instance for fluent chaining
  */
  T tooltipText(string propval) nothrow
  {
    return setProperty("tooltip-text", propval);
  }

  /**
      Set `valign` property.
      Params:
        propval = How to distribute vertical space if widget gets extra space.
      Returns: Builder instance for fluent chaining
  */
  T valign(gid.gtk4.types.Align propval) nothrow
  {
    return setProperty("valign", propval);
  }

  /**
      Set `vexpand` property.
      Params:
        propval = Whether to expand vertically.
      Returns: Builder instance for fluent chaining
  */
  T vexpand(bool propval) nothrow
  {
    return setProperty("vexpand", propval);
  }

  /**
      Set `vexpandSet` property.
      Params:
        propval = Whether to use the `vexpand` property.
      Returns: Builder instance for fluent chaining
  */
  T vexpandSet(bool propval) nothrow
  {
    return setProperty("vexpand-set", propval);
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the widget is visible.
      Returns: Builder instance for fluent chaining
  */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }

  /**
      Set `widthRequest` property.
      Params:
        propval = Overrides for width request of the widget.
          
          If this is -1, the natural request will be used.
      Returns: Builder instance for fluent chaining
  */
  T widthRequest(int propval) nothrow
  {
    return setProperty("width-request", propval);
  }
}

/// Fluent builder for [gid.gtk4.widget.Widget]
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
