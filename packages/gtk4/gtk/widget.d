/// Module for [Widget] class
module gtk.widget;

import cairo.font_options;
import gdk.clipboard;
import gdk.cursor;
import gdk.display;
import gdk.frame_clock;
import gdk.rgba;
import gid.gid;
import gio.action_group;
import gio.list_model;
import glib.variant;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gobject.types;
import graphene.matrix;
import graphene.point;
import graphene.rect;
import gsk.transform;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.event_controller;
import gtk.layout_manager;
import gtk.native;
import gtk.requisition;
import gtk.root;
import gtk.settings;
import gtk.snapshot;
import gtk.style_context;
import gtk.tooltip;
import gtk.types;
import pango.context;
import pango.font_map;
import pango.layout;

/**
    The base class for all widgets.
    
    [gtk.widget.Widget] is the base class all widgets in GTK derive from. It manages the
    widget lifecycle, layout, states and style.
    
    ### Height-for-width Geometry Management
    
    GTK uses a height-for-width (and width-for-height) geometry management
    system. Height-for-width means that a widget can change how much
    vertical space it needs, depending on the amount of horizontal space
    that it is given (and similar for width-for-height). The most common
    example is a label that reflows to fill up the available width, wraps
    to fewer lines, and therefore needs less height.
    
    Height-for-width geometry management is implemented in GTK by way
    of two virtual methods:
    
    $(LIST
      * `vfunc@Gtk.Widget.get_request_mode`
      * `vfunc@Gtk.Widget.measure`
    )
      
    There are some important things to keep in mind when implementing
    height-for-width and when using it in widget implementations.
    
    If you implement a direct [gtk.widget.Widget] subclass that supports
    height-for-width or width-for-height geometry management for itself
    or its child widgets, the `vfunc@Gtk.Widget.get_request_mode` virtual
    function must be implemented as well and return the widget's preferred
    request mode. The default implementation of this virtual function
    returns [gtk.types.SizeRequestMode.ConstantSize], which means that the widget will
    only ever get -1 passed as the for_size value to its
    `vfunc@Gtk.Widget.measure` implementation.
    
    The geometry management system will query a widget hierarchy in
    only one orientation at a time. When widgets are initially queried
    for their minimum sizes it is generally done in two initial passes
    in the [gtk.types.SizeRequestMode] chosen by the toplevel.
    
    For example, when queried in the normal [gtk.types.SizeRequestMode.HeightForWidth] mode:
    
    First, the default minimum and natural width for each widget
    in the interface will be computed using [gtk.widget.Widget.measure] with an
    orientation of [gtk.types.Orientation.Horizontal] and a for_size of -1.
    Because the preferred widths for each widget depend on the preferred
    widths of their children, this information propagates up the hierarchy,
    and finally a minimum and natural width is determined for the entire
    toplevel. Next, the toplevel will use the minimum width to query for the
    minimum height contextual to that width using [gtk.widget.Widget.measure] with an
    orientation of [gtk.types.Orientation.Vertical] and a for_size of the just computed
    width. This will also be a highly recursive operation. The minimum height
    for the minimum width is normally used to set the minimum size constraint
    on the toplevel.
    
    After the toplevel window has initially requested its size in both
    dimensions it can go on to allocate itself a reasonable size (or a size
    previously specified with [gtk.window.Window.setDefaultSize]). During the
    recursive allocation process it’s important to note that request cycles
    will be recursively executed while widgets allocate their children.
    Each widget, once allocated a size, will go on to first share the
    space in one orientation among its children and then request each child's
    height for its target allocated width or its width for allocated height,
    depending. In this way a [gtk.widget.Widget] will typically be requested its size
    a number of times before actually being allocated a size. The size a
    widget is finally allocated can of course differ from the size it has
    requested. For this reason, [gtk.widget.Widget] caches a  small number of results
    to avoid re-querying for the same sizes in one allocation cycle.
    
    If a widget does move content around to intelligently use up the
    allocated size then it must support the request in both
    [gtk.types.SizeRequestMode]s even if the widget in question only
    trades sizes in a single orientation.
    
    For instance, a [gtk.label.Label] that does height-for-width word wrapping
    will not expect to have `vfunc@Gtk.Widget.measure` with an orientation of
    [gtk.types.Orientation.Vertical] called because that call is specific to a
    width-for-height request. In this case the label must return the height
    required for its own minimum possible width. By following this rule any
    widget that handles height-for-width or width-for-height requests will
    always be allocated at least enough space to fit its own content.
    
    Here are some examples of how a [gtk.types.SizeRequestMode.HeightForWidth] widget
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
    
    It will not work to use the wrapper function [gtk.widget.Widget.measure]
    inside your own `vfunc@Gtk.Widget.size_allocate` implementation.
    These return a request adjusted by [gtk.size_group.SizeGroup], the widget's
    align and expand flags, as well as its CSS style.
    
    If a widget used the wrappers inside its virtual method implementations,
    then the adjustments (such as widget margins) would be applied
    twice. GTK therefore does not allow this and will warn if you try
    to do it.
    
    Of course if you are getting the size request for another widget, such
    as a child widget, you must use [gtk.widget.Widget.measure]; otherwise, you
    would not properly consider widget margins, [gtk.size_group.SizeGroup], and
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
    the parent as if it was [gtk.types.Align.Fill], but the selected baseline can be
    found via [gtk.widget.Widget.getBaseline]. If the baseline has a
    value other than -1 you need to align the widget such that the baseline
    appears at the position.
    
    ### GtkWidget as GtkBuildable
    
    The [gtk.widget.Widget] implementation of the [gtk.buildable.Buildable] interface
    supports various custom elements to specify additional aspects of widgets
    that are not directly expressed as properties.
    
    If the widget uses a [gtk.layout_manager.LayoutManager], [gtk.widget.Widget] supports
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
    
    [gtk.widget.Widget] allows style information such as style classes to
    be associated with widgets, using the custom `<style>` element:
    
    ```xml
    <object class="GtkButton" id="button1">
      <style>
        <class name="my-special-button-class"/>
        <class name="dark-button"/>
      </style>
    </object>
    ```
    
    [gtk.widget.Widget] allows defining accessibility information, such as properties,
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
    
    To create composite widgets with [gtk.builder.Builder] XML, one must associate
    the interface description with the widget class at class initialization
    time using [gtk.widget_class.WidgetClass.setTemplate].
    
    The interface description semantics expected in composite template descriptions
    is slightly different from regular [gtk.builder.Builder] XML.
    
    Unlike regular interface descriptions, [gtk.widget_class.WidgetClass.setTemplate]
    will expect a `<template>` tag as a direct child of the toplevel
    `<interface>` tag. The `<template>` tag must specify the “class” attribute
    which must be the type name of the widget. Optionally, the “parent”
    attribute may be specified to specify the direct parent type of the widget
    type; this is ignored by [gtk.builder.Builder] but can be used by UI design tools to
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
    bundled with your project, using [gio.resource.Resource]. In order to load the
    template, you need to call [gtk.widget_class.WidgetClass.setTemplateFromResource]
    from the class initialization of your [gtk.widget.Widget] type:
    
    ```c
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
    
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
    }
    ```
    
    You will also need to call [gtk.widget.Widget.initTemplate] from the
    instance initialization function:
    
    ```c
    static void
    foo_widget_init (FooWidget *self)
    {
      gtk_widget_init_template (GTK_WIDGET (self));
    
      // Initialize the rest of the widget...
    }
    ```
    
    as well as calling [gtk.widget.Widget.disposeTemplate] from the dispose
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
    [gtk.widget.Widget.getTemplateChild] function, but you will typically declare
    a pointer in the instance private data structure of your type using the same
    name as the widget in the template definition, and call
    [gtk.widget_class.WidgetClass.bindTemplateChildFull] (or one of its wrapper macros
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
    
    You can also use [gtk.widget_class.WidgetClass.bindTemplateCallbackFull] (or
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
class Widget : gobject.initially_unowned.InitiallyUnowned, gtk.accessible.Accessible, gtk.buildable.Buildable, gtk.constraint_target.ConstraintTarget
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

  /**
      Get `canFocus` property.
      Returns: Whether the widget or any of its descendents can accept
        the input focus.
        
        This property is meant to be set by widget implementations,
        typically in their instance init function.
  */
  @property bool canFocus()
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
  @property void canFocus(bool propval)
  {
    return setCanFocus(propval);
  }

  /**
      Get `canTarget` property.
      Returns: Whether the widget can receive pointer events.
  */
  @property bool canTarget()
  {
    return getCanTarget();
  }

  /**
      Set `canTarget` property.
      Params:
        propval = Whether the widget can receive pointer events.
  */
  @property void canTarget(bool propval)
  {
    return setCanTarget(propval);
  }

  /**
      Get `cursor` property.
      Returns: The cursor used by @widget.
  */
  @property gdk.cursor.Cursor cursor()
  {
    return getCursor();
  }

  /**
      Set `cursor` property.
      Params:
        propval = The cursor used by @widget.
  */
  @property void cursor(gdk.cursor.Cursor propval)
  {
    return setCursor(propval);
  }

  /**
      Get `focusOnClick` property.
      Returns: Whether the widget should grab focus when it is clicked with the mouse.
        
        This property is only relevant for widgets that can take focus.
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
  */
  @property void focusOnClick(bool propval)
  {
    return setFocusOnClick(propval);
  }

  /**
      Get `focusable` property.
      Returns: Whether this widget itself will accept the input focus.
  */
  @property bool focusable()
  {
    return getFocusable();
  }

  /**
      Set `focusable` property.
      Params:
        propval = Whether this widget itself will accept the input focus.
  */
  @property void focusable(bool propval)
  {
    return setFocusable(propval);
  }

  /**
      Get `halign` property.
      Returns: How to distribute horizontal space if widget gets extra space.
  */
  @property gtk.types.Align halign()
  {
    return getHalign();
  }

  /**
      Set `halign` property.
      Params:
        propval = How to distribute horizontal space if widget gets extra space.
  */
  @property void halign(gtk.types.Align propval)
  {
    return setHalign(propval);
  }

  /**
      Get `hasTooltip` property.
      Returns: Enables or disables the emission of the ::query-tooltip signal on @widget.
        
        A value of true indicates that @widget can have a tooltip, in this case
        the widget will be queried using `signal@Gtk.Widget::query-tooltip` to
        determine whether it will provide a tooltip or not.
  */
  @property bool hasTooltip()
  {
    return getHasTooltip();
  }

  /**
      Set `hasTooltip` property.
      Params:
        propval = Enables or disables the emission of the ::query-tooltip signal on @widget.
          
          A value of true indicates that @widget can have a tooltip, in this case
          the widget will be queried using `signal@Gtk.Widget::query-tooltip` to
          determine whether it will provide a tooltip or not.
  */
  @property void hasTooltip(bool propval)
  {
    return setHasTooltip(propval);
  }

  /**
      Get `heightRequest` property.
      Returns: Override for height request of the widget.
        
        If this is -1, the natural request will be used.
  */
  @property int heightRequest()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("height-request");
  }

  /**
      Set `heightRequest` property.
      Params:
        propval = Override for height request of the widget.
          
          If this is -1, the natural request will be used.
  */
  @property void heightRequest(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("height-request", propval);
  }

  /**
      Get `hexpand` property.
      Returns: Whether to expand horizontally.
  */
  @property bool hexpand()
  {
    return getHexpand();
  }

  /**
      Set `hexpand` property.
      Params:
        propval = Whether to expand horizontally.
  */
  @property void hexpand(bool propval)
  {
    return setHexpand(propval);
  }

  /**
      Get `hexpandSet` property.
      Returns: Whether to use the `hexpand` property.
  */
  @property bool hexpandSet()
  {
    return getHexpandSet();
  }

  /**
      Set `hexpandSet` property.
      Params:
        propval = Whether to use the `hexpand` property.
  */
  @property void hexpandSet(bool propval)
  {
    return setHexpandSet(propval);
  }

  /**
      Get `layoutManager` property.
      Returns: The [gtk.layout_manager.LayoutManager] instance to use to compute the preferred size
        of the widget, and allocate its children.
        
        This property is meant to be set by widget implementations,
        typically in their instance init function.
  */
  @property gtk.layout_manager.LayoutManager layoutManager()
  {
    return getLayoutManager();
  }

  /**
      Set `layoutManager` property.
      Params:
        propval = The [gtk.layout_manager.LayoutManager] instance to use to compute the preferred size
          of the widget, and allocate its children.
          
          This property is meant to be set by widget implementations,
          typically in their instance init function.
  */
  @property void layoutManager(gtk.layout_manager.LayoutManager propval)
  {
    return setLayoutManager(propval);
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
      Returns: Margin on end of widget, horizontally.
        
        This property supports left-to-right and right-to-left text
        directions.
        
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
        propval = Margin on end of widget, horizontally.
          
          This property supports left-to-right and right-to-left text
          directions.
          
          This property adds margin outside of the widget's normal size
          request, the margin will be added in addition to the size from
          [gtk.widget.Widget.setSizeRequest] for example.
  */
  @property void marginEnd(int propval)
  {
    return setMarginEnd(propval);
  }

  /**
      Get `marginStart` property.
      Returns: Margin on start of widget, horizontally.
        
        This property supports left-to-right and right-to-left text
        directions.
        
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
        propval = Margin on start of widget, horizontally.
          
          This property supports left-to-right and right-to-left text
          directions.
          
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

  /**
      Get `name` property.
      Returns: The name of the widget.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the widget.
  */
  @property void name(string propval)
  {
    return setName(propval);
  }

  /**
      Get `opacity` property.
      Returns: The requested opacity of the widget.
  */
  @property double opacity()
  {
    return getOpacity();
  }

  /**
      Set `opacity` property.
      Params:
        propval = The requested opacity of the widget.
  */
  @property void opacity(double propval)
  {
    return setOpacity(propval);
  }

  /**
      Get `overflow` property.
      Returns: How content outside the widget's content area is treated.
        
        This property is meant to be set by widget implementations,
        typically in their instance init function.
  */
  @property gtk.types.Overflow overflow()
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
  @property void overflow(gtk.types.Overflow propval)
  {
    return setOverflow(propval);
  }

  /**
      Get `parent` property.
      Returns: The parent widget of this widget.
  */
  @property gtk.widget.Widget parent()
  {
    return getParent();
  }

  /**
      Get `receivesDefault` property.
      Returns: Whether the widget will receive the default action when it is focused.
  */
  @property bool receivesDefault()
  {
    return getReceivesDefault();
  }

  /**
      Set `receivesDefault` property.
      Params:
        propval = Whether the widget will receive the default action when it is focused.
  */
  @property void receivesDefault(bool propval)
  {
    return setReceivesDefault(propval);
  }

  /**
      Get `root` property.
      Returns: The [gtk.root.Root] widget of the widget tree containing this widget.
        
        This will be null if the widget is not contained in a root widget.
  */
  @property gtk.root.Root root()
  {
    return getRoot();
  }

  /**
      Get `scaleFactor` property.
      Returns: The scale factor of the widget.
  */
  @property int scaleFactor()
  {
    return getScaleFactor();
  }

  /**
      Get `sensitive` property.
      Returns: Whether the widget responds to input.
  */
  @property bool sensitive()
  {
    return getSensitive();
  }

  /**
      Set `sensitive` property.
      Params:
        propval = Whether the widget responds to input.
  */
  @property void sensitive(bool propval)
  {
    return setSensitive(propval);
  }

  /**
      Get `tooltipMarkup` property.
      Returns: Sets the text of tooltip to be the given string, which is marked up
        with Pango markup.
        
        Also see [gtk.tooltip.Tooltip.setMarkup].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null:
        `property@Gtk.Widget:has-tooltip` will automatically be set to true
        and there will be taken care of `signal@Gtk.Widget::query-tooltip` in
        the default signal handler.
        
        Note that if both `property@Gtk.Widget:tooltip-text` and
        `property@Gtk.Widget:tooltip-markup` are set, the last one wins.
  */
  @property string tooltipMarkup()
  {
    return getTooltipMarkup();
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with Pango markup.
          
          Also see [gtk.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null:
          `property@Gtk.Widget:has-tooltip` will automatically be set to true
          and there will be taken care of `signal@Gtk.Widget::query-tooltip` in
          the default signal handler.
          
          Note that if both `property@Gtk.Widget:tooltip-text` and
          `property@Gtk.Widget:tooltip-markup` are set, the last one wins.
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
        tooltip shown if the given string is not null:
        `property@Gtk.Widget:has-tooltip` will automatically be set to true
        and there will be taken care of `signal@Gtk.Widget::query-tooltip` in
        the default signal handler.
        
        Note that if both `property@Gtk.Widget:tooltip-text` and
        `property@Gtk.Widget:tooltip-markup` are set, the last one wins.
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
          tooltip shown if the given string is not null:
          `property@Gtk.Widget:has-tooltip` will automatically be set to true
          and there will be taken care of `signal@Gtk.Widget::query-tooltip` in
          the default signal handler.
          
          Note that if both `property@Gtk.Widget:tooltip-text` and
          `property@Gtk.Widget:tooltip-markup` are set, the last one wins.
  */
  @property void tooltipText(string propval)
  {
    return setTooltipText(propval);
  }

  /**
      Get `valign` property.
      Returns: How to distribute vertical space if widget gets extra space.
  */
  @property gtk.types.Align valign()
  {
    return getValign();
  }

  /**
      Set `valign` property.
      Params:
        propval = How to distribute vertical space if widget gets extra space.
  */
  @property void valign(gtk.types.Align propval)
  {
    return setValign(propval);
  }

  /**
      Get `vexpand` property.
      Returns: Whether to expand vertically.
  */
  @property bool vexpand()
  {
    return getVexpand();
  }

  /**
      Set `vexpand` property.
      Params:
        propval = Whether to expand vertically.
  */
  @property void vexpand(bool propval)
  {
    return setVexpand(propval);
  }

  /**
      Get `vexpandSet` property.
      Returns: Whether to use the `vexpand` property.
  */
  @property bool vexpandSet()
  {
    return getVexpandSet();
  }

  /**
      Set `vexpandSet` property.
      Params:
        propval = Whether to use the `vexpand` property.
  */
  @property void vexpandSet(bool propval)
  {
    return setVexpandSet(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether the widget is visible.
  */
  @property bool visible()
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the widget is visible.
  */
  @property void visible(bool propval)
  {
    return setVisible(propval);
  }

  /**
      Get `widthRequest` property.
      Returns: Override for width request of the widget.
        
        If this is -1, the natural request will be used.
  */
  @property int widthRequest()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("width-request");
  }

  /**
      Set `widthRequest` property.
      Params:
        propval = Override for width request of the widget.
          
          If this is -1, the natural request will be used.
  */
  @property void widthRequest(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("width-request", propval);
  }

  mixin AccessibleT!();
  mixin BuildableT!();
  mixin ConstraintTargetT!();

  /**
      Obtains the current default reading direction.
      
      See [gtk.widget.Widget.setDefaultDirection].
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
      Sets the default reading direction for widgets.
      
      See [gtk.widget.Widget.setDirection].
  
      Params:
        dir = the new default direction. This cannot be [gtk.types.TextDirection.None].
  */
  static void setDefaultDirection(gtk.types.TextDirection dir)
  {
    gtk_widget_set_default_direction(dir);
  }

  /**
      Enable or disable an action installed with
      [gtk.widget_class.WidgetClass.installAction].
  
      Params:
        actionName = action name, such as "clipboard.paste"
        enabled = whether the action is now enabled
  */
  void actionSetEnabled(string actionName, bool enabled)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    gtk_widget_action_set_enabled(cast(GtkWidget*)this._cPtr, _actionName, enabled);
  }

  /**
      For widgets that can be “activated” (buttons, menu items, etc.),
      this function activates them.
      
      The activation will emit the signal set using
      [gtk.widget_class.WidgetClass.setActivateSignal] during class initialization.
      
      Activation is what happens when you press <kbd>Enter</kbd>
      on a widget during key navigation.
      
      If you wish to handle the activation keybinding yourself, it is
      recommended to use [gtk.widget_class.WidgetClass.addShortcut] with an action
      created with [gtk.signal_action.SignalAction.new_].
      
      If widget isn't activatable, the function returns false.
      Returns: true if the widget was activatable
  */
  bool activate()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_activate(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Looks up the action in the action groups associated with
      widget and its ancestors, and activates it.
      
      If the action is in an action group added with
      [gtk.widget.Widget.insertActionGroup], the name is expected
      to be prefixed with the prefix that was used when the group was
      inserted.
      
      The arguments must match the actions expected parameter type,
      as returned by `[gio.action.Action.getParameterType]`.
  
      Params:
        name = the name of the action to activate
        args = parameters to use
      Returns: true if the action was activated, false if the
          action does not exist.
  */
  bool activateAction(string name, glib.variant.Variant args = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gtk_widget_activate_action_variant(cast(GtkWidget*)this._cPtr, _name, args ? cast(GVariant*)args._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Activates the `default.activate` action from widget.
  */
  void activateDefault()
  {
    gtk_widget_activate_default(cast(GtkWidget*)this._cPtr);
  }

  /**
      Adds controller to widget so that it will receive events.
      
      You will usually want to call this function right after
      creating any kind of [gtk.event_controller.EventController].
  
      Params:
        controller = a [gtk.event_controller.EventController] that hasn't been
            added to a widget yet
  */
  void addController(gtk.event_controller.EventController controller)
  {
    gtk_widget_add_controller(cast(GtkWidget*)this._cPtr, controller ? cast(GtkEventController*)controller._cPtr(Yes.Dup) : null);
  }

  /**
      Adds a style class to widget.
      
      After calling this function, the widget’s style will match
      for css_class, according to CSS matching rules.
      
      Use [gtk.widget.Widget.removeCssClass] to remove the
      style again.
  
      Params:
        cssClass = The style class to add to widget, without
            the leading '.' used for notation of style classes
  */
  void addCssClass(string cssClass)
  {
    const(char)* _cssClass = cssClass.toCString(No.Alloc);
    gtk_widget_add_css_class(cast(GtkWidget*)this._cPtr, _cssClass);
  }

  /**
      Adds a widget to the list of mnemonic labels for this widget.
      
      See [gtk.widget.Widget.listMnemonicLabels]. Note the
      list of mnemonic labels for the widget is cleared when the
      widget is destroyed, so the caller must make sure to update
      its internal state at this point as well.
  
      Params:
        label = a [gtk.widget.Widget] that acts as a mnemonic label for widget
  */
  void addMnemonicLabel(gtk.widget.Widget label)
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
      frame or every few frames. The tick callback does not automatically
      imply a relayout or repaint. If you want a repaint or relayout, and
      aren’t changing widget properties that would trigger that (for example,
      changing the text of a [gtk.label.Label]), then you will have to call
      [gtk.widget.Widget.queueResize] or [gtk.widget.Widget.queueDraw]
      yourself.
      
      [gdk.frame_clock.FrameClock.getFrameTime] should generally be used
      for timing continuous animations and
      [gdk.frame_timings.FrameTimings.getPredictedPresentationTime] if you are
      trying to display isolated frames at particular times.
      
      This is a more convenient alternative to connecting directly to the
      [gdk.frame_clock.FrameClock.update] signal of [gdk.frame_clock.FrameClock], since you
      don't have to worry about when a [gdk.frame_clock.FrameClock] is assigned to a widget.
  
      Params:
        callback = function to call for updating animations
      Returns: an id for the connection of this callback. Remove the callback
          by passing the id returned from this function to
          [gtk.widget.Widget.removeTickCallback]
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
      This function is only used by [gtk.widget.Widget] subclasses, to
      assign a size, position and (optionally) baseline to their
      child widgets.
      
      In this function, the allocation and baseline may be adjusted.
      The given allocation will be forced to be bigger than the
      widget's minimum size, as well as at least 0×0 in size.
      
      For a version that does not take a transform, see
      [gtk.widget.Widget.sizeAllocate].
  
      Params:
        width = New width of widget
        height = New height of widget
        baseline = New baseline of widget, or -1
        transform = Transformation to be applied to widget
  */
  void allocate(int width, int height, int baseline, gsk.transform.Transform transform = null)
  {
    gtk_widget_allocate(cast(GtkWidget*)this._cPtr, width, height, baseline, transform ? cast(GskTransform*)transform._cPtr(Yes.Dup) : null);
  }

  /**
      Called by widgets as the user moves around the window using
      keyboard shortcuts.
      
      The direction argument indicates what kind of motion is taking place (up,
      down, left, right, tab forward, tab backward).
      
      This function calls the `vfuncGtk.Widget.focus` virtual function; widgets
      can override the virtual function in order to implement appropriate focus
      behavior.
      
      The default `focus()` virtual function for a widget should return `TRUE` if
      moving in direction left the focus on a focusable location inside that
      widget, and `FALSE` if moving in direction moved the focus outside the
      widget. When returning `TRUE`, widgets normally call [gtk.widget.Widget.grabFocus]
      to place the focus accordingly; when returning `FALSE`, they don’t modify
      the current focus location.
      
      This function is used by custom widget implementations; if you're
      writing an app, you’d use [gtk.widget.Widget.grabFocus] to move
      the focus to a particular widget.
  
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
        target = the [gtk.widget.Widget]
        outBounds = the rectangle taking the bounds
      Returns: true if the bounds could be computed
  */
  bool computeBounds(gtk.widget.Widget target, out graphene.rect.Rect outBounds)
  {
    bool _retval;
    graphene_rect_t _outBounds;
    _retval = cast(bool)gtk_widget_compute_bounds(cast(GtkWidget*)this._cPtr, target ? cast(GtkWidget*)target._cPtr(No.Dup) : null, &_outBounds);
    outBounds = new graphene.rect.Rect(cast(void*)&_outBounds, No.Take);
    return _retval;
  }

  /**
      Computes whether a container should give this widget
      extra space when possible.
      
      Containers should check this, rather than looking at
      [gtk.widget.Widget.getHexpand] or [gtk.widget.Widget.getVexpand].
      
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
      Translates the given point in widget's coordinates to coordinates
      relative to target’s coordinate system.
      
      In order to perform this operation, both widgets must share a
      common ancestor.
  
      Params:
        target = the [gtk.widget.Widget] to transform into
        point = a point in widget's coordinate system
        outPoint = Set to the corresponding coordinates in
            target's coordinate system
      Returns: true if the point could be determined, false on failure.
          In this case, 0 is stored in out_point.
  */
  bool computePoint(gtk.widget.Widget target, graphene.point.Point point, out graphene.point.Point outPoint)
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
      Returns: true if the transform could be computed, false otherwise
  */
  bool computeTransform(gtk.widget.Widget target, out graphene.matrix.Matrix outTransform)
  {
    bool _retval;
    graphene_matrix_t _outTransform;
    _retval = cast(bool)gtk_widget_compute_transform(cast(GtkWidget*)this._cPtr, target ? cast(GtkWidget*)target._cPtr(No.Dup) : null, &_outTransform);
    outTransform = new graphene.matrix.Matrix(cast(void*)&_outTransform, No.Take);
    return _retval;
  }

  /**
      Tests if the point at (`x`, `y`) is contained in widget.
      
      The coordinates for (`x`, `y`) must be in widget coordinates, so
      (0, 0) is assumed to be the top left of widget's content area.
  
      Params:
        x = X coordinate to test, relative to widget's origin
        y = Y coordinate to test, relative to widget's origin
      Returns: true if widget contains (`x`, `y`).
  */
  bool contains(double x, double y)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_contains(cast(GtkWidget*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Creates a new [pango.context.Context] with the appropriate font map,
      font options, font description, and base direction for drawing
      text for this widget.
      
      See also [gtk.widget.Widget.getPangoContext].
      Returns: the new [pango.context.Context]
  */
  pango.context.Context createPangoContext()
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_create_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [pango.layout.Layout] with the appropriate font map,
      font description, and base direction for drawing text for
      this widget.
      
      If you keep a [pango.layout.Layout] created in this way around,
      you need to re-create it when the widget [pango.context.Context]
      is replaced. This can be tracked by listening to changes
      of the [gtk.widget.Widget.root] property on the widget.
  
      Params:
        text = text to set on the layout
      Returns: the new [pango.layout.Layout]
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
      Clears the template children for the given widget.
      
      This function is the opposite of [gtk.widget.Widget.initTemplate], and
      it is used to clear all the template children from a widget instance.
      If you bound a template child to a field in the instance structure, or
      in the instance private data structure, the field will be set to `NULL`
      after this function returns.
      
      You should call this function inside the `GObjectClass.dispose()`
      implementation of any widget that called `[gtk.widget.Widget.initTemplate]`.
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
  void disposeTemplate(gobject.types.GType widgetType)
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
      Returns: true if the drag threshold has been passed.
  */
  bool dragCheckThreshold(int startX, int startY, int currentX, int currentY)
  {
    bool _retval;
    _retval = cast(bool)gtk_drag_check_threshold(cast(GtkWidget*)this._cPtr, startX, startY, currentX, currentY);
    return _retval;
  }

  /**
      Notifies the user about an input-related error on this widget.
      
      If the `propertyGtk.Settings:gtk-error-bell` setting is true,
      it calls [gdk.surface.Surface.beep], otherwise it does nothing.
      
      Note that the effect of [gdk.surface.Surface.beep] can be configured
      in many ways, depending on the windowing backend and the desktop
      environment or window manager that is used.
  */
  void errorBell()
  {
    gtk_widget_error_bell(cast(GtkWidget*)this._cPtr);
  }

  /**
      Returns the baseline that has currently been allocated to widget.
      
      This function is intended to be used when implementing handlers
      for the [gtk.widget.Widget]Class.snapshot() function, and when allocating
      child widgets in [gtk.widget.Widget]Class.size_allocate().
      Returns: the baseline of the widget, or -1 if none
  
      Deprecated: Use [gtk.widget.Widget.getBaseline] instead
  */
  int getAllocatedBaseline()
  {
    int _retval;
    _retval = gtk_widget_get_allocated_baseline(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the height that has currently been allocated to widget.
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: the height of the widget
  
      Deprecated: Use [gtk.widget.Widget.getHeight] instead
  */
  int getAllocatedHeight()
  {
    int _retval;
    _retval = gtk_widget_get_allocated_height(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the width that has currently been allocated to widget.
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: the width of the widget
  
      Deprecated: Use [gtk.widget.Widget.getWidth] instead
  */
  int getAllocatedWidth()
  {
    int _retval;
    _retval = gtk_widget_get_allocated_width(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the widget’s allocation.
      
      Note, when implementing a layout container: a widget’s allocation
      will be its “adjusted” allocation, that is, the widget’s parent
      typically calls [gtk.widget.Widget.sizeAllocate] with an allocation,
      and that allocation is then adjusted (to handle margin
      and alignment for example) before assignment to the widget.
      [gtk.widget.Widget.getAllocation] returns the adjusted allocation that
      was actually assigned to the widget. The adjusted allocation is
      guaranteed to be completely contained within the
      [gtk.widget.Widget.sizeAllocate] allocation, however.
      
      So a layout container is guaranteed that its children stay inside
      the assigned bounds, but not that they have exactly the bounds the
      container assigned.
  
      Params:
        allocation = a pointer to a `GtkAllocation` to copy to
  
      Deprecated: Use [gtk.widget.Widget.computeBounds],
        [gtk.widget.Widget.getWidth] or [gtk.widget.Widget.getHeight] instead.
  */
  void getAllocation(out gtk.types.Allocation allocation)
  {
    gtk_widget_get_allocation(cast(GtkWidget*)this._cPtr, cast(GtkAllocation*)&allocation);
  }

  /**
      Gets the first ancestor of widget with type widget_type.
      
      For example, `gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)`
      gets the first [gtk.box.Box] that’s an ancestor of widget. No
      reference will be added to the returned widget; it should
      not be unreferenced.
      
      Note that unlike [gtk.widget.Widget.isAncestor], this function
      considers widget to be an ancestor of itself.
  
      Params:
        widgetType = ancestor type
      Returns: the ancestor widget
  */
  gtk.widget.Widget getAncestor(gobject.types.GType widgetType)
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_ancestor(cast(GtkWidget*)this._cPtr, widgetType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the baseline that has currently been allocated to widget.
      
      This function is intended to be used when implementing handlers
      for the [gtk.widget.Widget]Class.snapshot() function, and when allocating
      child widgets in [gtk.widget.Widget]Class.size_allocate().
      Returns: the baseline of the widget, or -1 if none
  */
  int getBaseline()
  {
    int _retval;
    _retval = gtk_widget_get_baseline(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the input focus can enter widget or any
      of its children.
      
      See [gtk.widget.Widget.setFocusable].
      Returns: true if the input focus can enter widget, false otherwise
  */
  bool getCanFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Queries whether widget can be the target of pointer events.
      Returns: true if widget can receive pointer events
  */
  bool getCanTarget()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_can_target(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set with [gtk.widget.Widget.setChildVisible].
      
      If you feel a need to use this function, your code probably
      needs reorganization.
      
      This function is only useful for container implementations
      and should never be called by an application.
      Returns: true if the widget is mapped with the parent.
  */
  bool getChildVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_child_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the clipboard object for widget.
      
      This is a utility function to get the clipboard object for the
      [gdk.display.Display] that widget is using.
      
      Note that this function always works, even when widget is not
      realized yet.
      Returns: the appropriate clipboard object
  */
  gdk.clipboard.Clipboard getClipboard()
  {
    GdkClipboard* _cretval;
    _cretval = gtk_widget_get_clipboard(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.clipboard.Clipboard)(cast(GdkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current foreground color for the widget’s
      CSS style.
      
      This function should only be used in snapshot
      implementations that need to do custom
      drawing with the foreground color.
  
      Params:
        color = return location for the color
  */
  void getColor(out gdk.rgba.RGBA color)
  {
    gtk_widget_get_color(cast(GtkWidget*)this._cPtr, cast(GdkRGBA*)&color);
  }

  /**
      Returns the list of style classes applied to widget.
      Returns: a null-terminated list of
          css classes currently applied to widget. The returned
          list must freed using [glib.global.strfreev].
  */
  string[] getCssClasses()
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
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns the CSS name that is used for self.
      Returns: the CSS name
  */
  string getCssName()
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_css_name(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Queries the cursor set on widget.
      
      See [gtk.widget.Widget.setCursor] for details.
      Returns: the cursor
          currently in use or null if the cursor is inherited
  */
  gdk.cursor.Cursor getCursor()
  {
    GdkCursor* _cretval;
    _cretval = gtk_widget_get_cursor(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the reading direction for a particular widget.
      
      See [gtk.widget.Widget.setDirection].
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
      Get the [gdk.display.Display] for the toplevel window associated with
      this widget.
      
      This function can only be called after the widget has been
      added to a widget hierarchy with a [gtk.window.Window] at the top.
      
      In general, you should only create display specific
      resources when a widget has been realized, and you should
      free those resources when the widget is unrealized.
      Returns: the [gdk.display.Display] for the toplevel
          for this widget.
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_widget_get_display(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s first child.
      
      This API is primarily meant for widget implementations.
      Returns: The widget's first child
  */
  gtk.widget.Widget getFirstChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_first_child(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current focus child of widget.
      Returns: The current focus
          child of widget
  */
  gtk.widget.Widget getFocusChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_focus_child(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the widget should grab focus when it is clicked
      with the mouse.
      
      See [gtk.widget.Widget.setFocusOnClick].
      Returns: true if the widget should grab focus when it is
          clicked with the mouse
  */
  bool getFocusOnClick()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_focus_on_click(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether widget can own the input focus.
      
      See [gtk.widget.Widget.setFocusable].
      Returns: true if widget can own the input focus, false otherwise
  */
  bool getFocusable()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_get_focusable(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the font map of widget.
      
      See [gtk.widget.Widget.setFontMap].
      Returns: A [pango.font_map.FontMap]
  */
  pango.font_map.FontMap getFontMap()
  {
    PangoFontMap* _cretval;
    _cretval = gtk_widget_get_font_map(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [cairo.font_options.FontOptions] of widget.
      
      Seee [gtk.widget.Widget.setFontOptions].
      Returns: the [cairo.font_options.FontOptions]
          of widget
  */
  cairo.font_options.FontOptions getFontOptions()
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = gtk_widget_get_font_options(cast(GtkWidget*)this._cPtr);
    auto _retval = _cretval ? new cairo.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the frame clock for a widget.
      
      The frame clock is a global “ticker” that can be used to drive
      animations and repaints. The most common reason to get the frame
      clock is to call [gdk.frame_clock.FrameClock.getFrameTime], in order
      to get a time to use for animating. For example you might record
      the start of the animation with an initial value from
      [gdk.frame_clock.FrameClock.getFrameTime], and then update the animation
      by calling [gdk.frame_clock.FrameClock.getFrameTime] again during each repaint.
      
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
      Returns: a [gdk.frame_clock.FrameClock]
  */
  gdk.frame_clock.FrameClock getFrameClock()
  {
    GdkFrameClock* _cretval;
    _cretval = gtk_widget_get_frame_clock(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.frame_clock.FrameClock)(cast(GdkFrameClock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal alignment of widget.
      
      For backwards compatibility reasons this method will never return
      one of the baseline alignments, but instead it will convert it to
      [gtk.types.Align.Fill] or [gtk.types.Align.Center].
      
      Baselines are not supported for horizontal alignment.
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
      Returns the current value of the `has-tooltip` property.
      Returns: current value of `has-tooltip` on widget.
  */
  bool getHasTooltip()
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
      
      For pointer events, see [gtk.widget.Widget.contains].
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: The height of widget
  */
  int getHeight()
  {
    int _retval;
    _retval = gtk_widget_get_height(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the widget would like any available extra horizontal
      space.
      
      When a user resizes a [gtk.window.Window], widgets with expand=TRUE
      generally receive the extra space. For example, a list or
      scrollable area or document in your window would often be set to
      expand.
      
      Containers should use [gtk.widget.Widget.computeExpand] rather
      than this function, to see whether a widget, or any of its children,
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
      Gets whether [gtk.widget.Widget.setHexpand] has been used
      to explicitly set the expand flag on this widget.
      
      If [gtk.widget.Widget.hexpand] property is set, then it
      overrides any computed expand value based on child widgets.
      If `hexpand` is not set, then the expand value depends on
      whether any children of the widget would like to expand.
      
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
      Returns the widget’s last child.
      
      This API is primarily meant for widget implementations.
      Returns: The widget's last child
  */
  gtk.widget.Widget getLastChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_last_child(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the layout manager used by widget.
      
      See [gtk.widget.Widget.setLayoutManager].
      Returns: a [gtk.layout_manager.LayoutManager]
  */
  gtk.layout_manager.LayoutManager getLayoutManager()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_widget_get_layout_manager(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.layout_manager.LayoutManager)(cast(GtkLayoutManager*)_cretval, No.Take);
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
      Gets the bottom margin of widget.
      Returns: The bottom margin of widget
  */
  int getMarginBottom()
  {
    int _retval;
    _retval = gtk_widget_get_margin_bottom(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the end margin of widget.
      Returns: The end margin of widget
  */
  int getMarginEnd()
  {
    int _retval;
    _retval = gtk_widget_get_margin_end(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the start margin of widget.
      Returns: The start margin of widget
  */
  int getMarginStart()
  {
    int _retval;
    _retval = gtk_widget_get_margin_start(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the top margin of widget.
      Returns: The top margin of widget
  */
  int getMarginTop()
  {
    int _retval;
    _retval = gtk_widget_get_margin_top(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the name of a widget.
      
      See [gtk.widget.Widget.setName] for the significance of widget names.
      Returns: name of the widget. This string is owned by GTK and
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
      Returns the nearest [gtk.native.Native] ancestor of widget.
      
      This function will return null if the widget is not
      contained inside a widget tree with a native ancestor.
      
      [gtk.native.Native] widgets will return themselves here.
      Returns: the [gtk.native.Native] ancestor of widget
  */
  gtk.native.Native getNative()
  {
    GtkNative* _cretval;
    _cretval = gtk_widget_get_native(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.native.Native)(cast(GtkNative*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget’s next sibling.
      
      This API is primarily meant for widget implementations.
      Returns: The widget's next sibling
  */
  gtk.widget.Widget getNextSibling()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_next_sibling(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      #Fetches the requested opacity for this widget.
      
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
      Returns the widget’s overflow value.
      Returns: The widget's overflow.
  */
  gtk.types.Overflow getOverflow()
  {
    GtkOverflow _cretval;
    _cretval = gtk_widget_get_overflow(cast(GtkWidget*)this._cPtr);
    gtk.types.Overflow _retval = cast(gtk.types.Overflow)_cretval;
    return _retval;
  }

  /**
      Gets a [pango.context.Context] with the appropriate font map, font description,
      and base direction for this widget.
      
      Unlike the context returned by [gtk.widget.Widget.createPangoContext],
      this context is owned by the widget (it can be used until the screen
      for the widget changes or the widget is removed from its toplevel),
      and will be updated to match any changes to the widget’s attributes.
      This can be tracked by listening to changes of the
      [gtk.widget.Widget.root] property on the widget.
      Returns: the [pango.context.Context] for the widget.
  */
  pango.context.Context getPangoContext()
  {
    PangoContext* _cretval;
    _cretval = gtk_widget_get_pango_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the parent widget of widget.
      Returns: the parent widget of widget
  */
  gtk.widget.Widget getParent()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_parent(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the minimum and natural size of a widget, taking
      into account the widget’s preference for height-for-width management.
      
      This is used to retrieve a suitable size by container widgets which do
      not impose any restrictions on the child placement. It can be used
      to deduce toplevel window and menu sizes as well as child widgets in
      free-form containers such as [gtk.fixed.Fixed].
      
      Handle with care. Note that the natural height of a height-for-width
      widget will generally be a smaller size than the minimum height, since
      the required height for the natural width is generally smaller than the
      required height for the minimum width.
      
      Use [gtk.widget.Widget.measure] if you want to support baseline alignment.
  
      Params:
        minimumSize = location for storing the minimum size
        naturalSize = location for storing the natural size
  */
  void getPreferredSize(out gtk.requisition.Requisition minimumSize, out gtk.requisition.Requisition naturalSize)
  {
    gtk_widget_get_preferred_size(cast(GtkWidget*)this._cPtr, cast(GtkRequisition*)&minimumSize, cast(GtkRequisition*)&naturalSize);
  }

  /**
      Returns the widget’s previous sibling.
      
      This API is primarily meant for widget implementations.
      Returns: The widget's previous sibling
  */
  gtk.widget.Widget getPrevSibling()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_get_prev_sibling(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the primary clipboard of widget.
      
      This is a utility function to get the primary clipboard object
      for the [gdk.display.Display] that widget is using.
      
      Note that this function always works, even when widget is not
      realized yet.
      Returns: the appropriate clipboard object
  */
  gdk.clipboard.Clipboard getPrimaryClipboard()
  {
    GdkClipboard* _cretval;
    _cretval = gtk_widget_get_primary_clipboard(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.clipboard.Clipboard)(cast(GdkClipboard*)_cretval, No.Take);
    return _retval;
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
      
      Single-child widgets generally propagate the preference of
      their child, more complex widgets need to request something
      either in context of their children or in context of their
      allocation capabilities.
      Returns: The [gtk.types.SizeRequestMode] preferred by widget.
  */
  gtk.types.SizeRequestMode getRequestMode()
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_widget_get_request_mode(cast(GtkWidget*)this._cPtr);
    gtk.types.SizeRequestMode _retval = cast(gtk.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Returns the [gtk.root.Root] widget of widget.
      
      This function will return null if the widget is not contained
      inside a widget tree with a root widget.
      
      [gtk.root.Root] widgets will return themselves here.
      Returns: the root widget of widget
  */
  gtk.root.Root getRoot()
  {
    GtkRoot* _cretval;
    _cretval = gtk_widget_get_root(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.root.Root)(cast(GtkRoot*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the internal scale factor that maps from window
      coordinates to the actual device pixels.
      
      On traditional systems this is 1, on high density outputs,
      it can be a higher value (typically 2).
      
      See [gdk.surface.Surface.getScaleFactor].
      Returns: the scale factor for widget
  */
  int getScaleFactor()
  {
    int _retval;
    _retval = gtk_widget_get_scale_factor(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the widget’s sensitivity.
      
      This function returns the value that has been set using
      [gtk.widget.Widget.setSensitive]).
      
      The effective sensitivity of a widget is however determined
      by both its own and its parent widget’s sensitivity.
      See [gtk.widget.Widget.isSensitive].
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
      
      Note that this function can only be called when the [gtk.widget.Widget]
      is attached to a toplevel, since the settings object is specific
      to a particular [gdk.display.Display]. If you want to monitor the widget for
      changes in its settings, connect to the `notify::display` signal.
      Returns: the relevant [gtk.settings.Settings] object
  */
  gtk.settings.Settings getSettings()
  {
    GtkSettings* _cretval;
    _cretval = gtk_widget_get_settings(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the content width or height of the widget.
      
      Which dimension is returned depends on orientation.
      
      This is equivalent to calling [gtk.widget.Widget.getWidth]
      for [gtk.types.Orientation.Horizontal] or [gtk.widget.Widget.getHeight]
      for [gtk.types.Orientation.Vertical], but can be used when
      writing orientation-independent code, such as when
      implementing [gtk.orientable.Orientable] widgets.
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
  
      Params:
        orientation = the orientation to query
      Returns: The size of widget in orientation.
  */
  int getSize(gtk.types.Orientation orientation)
  {
    int _retval;
    _retval = gtk_widget_get_size(cast(GtkWidget*)this._cPtr, orientation);
    return _retval;
  }

  /**
      Gets the size request that was explicitly set for the widget using
      [gtk.widget.Widget.setSizeRequest].
      
      A value of -1 stored in width or height indicates that that
      dimension has not been set explicitly and the natural requisition
      of the widget will be used instead. See
      [gtk.widget.Widget.setSizeRequest]. To get the size a widget will
      actually request, call [gtk.widget.Widget.measure] instead of
      this function.
  
      Params:
        width = return location for width
        height = return location for height
  */
  void getSizeRequest(out int width, out int height)
  {
    gtk_widget_get_size_request(cast(GtkWidget*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the widget state as a flag set.
      
      It is worth mentioning that the effective [gtk.types.StateFlags.Insensitive]
      state will be returned, that is, also based on parent insensitivity,
      even if widget itself is sensitive.
      
      Also note that if you are looking for a way to obtain the
      [gtk.types.StateFlags] to pass to a [gtk.style_context.StyleContext]
      method, you should look at [gtk.style_context.StyleContext.getState].
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
      Returns the style context associated to widget.
      
      The returned object is guaranteed to be the same
      for the lifetime of widget.
      Returns: the widget’s [gtk.style_context.StyleContext]
  
      Deprecated: Style contexts will be removed in GTK 5
  */
  gtk.style_context.StyleContext getStyleContext()
  {
    GtkStyleContext* _cretval;
    _cretval = gtk_widget_get_style_context(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style_context.StyleContext)(cast(GtkStyleContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetch an object build from the template XML for widget_type in
      this widget instance.
      
      This will only report children which were previously declared
      with [gtk.widget_class.WidgetClass.bindTemplateChildFull] or one of its
      variants.
      
      This function is only meant to be called for code which is private
      to the widget_type which declared the child and is meant for language
      bindings which cannot easily make use of the GObject structure offsets.
  
      Params:
        widgetType = The `GType` to get a template child for
        name = The “id” of the child defined in the template XML
      Returns: The object built in the template XML with
          the id name
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
      
      If the tooltip has not been set using
      [gtk.widget.Widget.setTooltipMarkup], this
      function returns null.
      Returns: the tooltip text
  */
  string getTooltipMarkup()
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_tooltip_markup(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for widget.
      
      If the widget's tooltip was set using
      [gtk.widget.Widget.setTooltipMarkup],
      this function will return the escaped text.
      Returns: the tooltip text
  */
  string getTooltipText()
  {
    const(char)* _cretval;
    _cretval = gtk_widget_get_tooltip_text(cast(GtkWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the vertical alignment of widget.
      Returns: the vertical alignment of widget
  */
  gtk.types.Align getValign()
  {
    GtkAlign _cretval;
    _cretval = gtk_widget_get_valign(cast(GtkWidget*)this._cPtr);
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
      Determines whether the widget is visible.
      
      If you want to take into account whether the widget’s
      parent is also marked as visible, use
      [gtk.widget.Widget.isVisible] instead.
      
      This function does not check if the widget is
      obscured in any way.
      
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
      Returns the content width of the widget.
      
      This function returns the width passed to its
      size-allocate implementation, which is the width you
      should be using in `vfuncGtk.Widget.snapshot`.
      
      For pointer events, see [gtk.widget.Widget.contains].
      
      To learn more about widget sizes, see the coordinate
      system [overview](coordinates.html).
      Returns: The width of widget
  */
  int getWidth()
  {
    int _retval;
    _retval = gtk_widget_get_width(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Causes widget to have the keyboard focus for the [gtk.window.Window] it's inside.
      
      If widget is not focusable, or its `vfuncGtk.Widget.grab_focus`
      implementation cannot transfer the focus to a descendant of widget
      that is focusable, it will not take focus and false will be returned.
      
      Calling [gtk.widget.Widget.grabFocus] on an already focused widget
      is allowed, should not have an effect, and return true.
      Returns: true if focus is now inside widget.
  */
  bool grabFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_grab_focus(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether css_class is currently applied to widget.
  
      Params:
        cssClass = A style class, without the leading '.'
            used for notation of style classes
      Returns: true if css_class is currently applied to widget,
          false otherwise.
  */
  bool hasCssClass(string cssClass)
  {
    bool _retval;
    const(char)* _cssClass = cssClass.toCString(No.Alloc);
    _retval = cast(bool)gtk_widget_has_css_class(cast(GtkWidget*)this._cPtr, _cssClass);
    return _retval;
  }

  /**
      Determines whether widget is the current default widget
      within its toplevel.
      Returns: true if widget is the current default widget
          within its toplevel, false otherwise
  */
  bool hasDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_has_default(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the widget has the global input focus.
      
      See [gtk.widget.Widget.isFocus] for the difference between
      having the global input focus, and only having the focus
      within a toplevel.
      Returns: true if the widget has the global input focus.
  */
  bool hasFocus()
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
      of widget. See [gtk.window.Window.getFocusVisible] for more
      information about focus indication.
      
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
      Reverses the effects of [gtk.widget.Widget.show].
      
      This is causing the widget to be hidden (invisible to the user).
  
      Deprecated: Use [gtk.widget.Widget.setVisible] instead
  */
  void hide()
  {
    gtk_widget_hide(cast(GtkWidget*)this._cPtr);
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
      Creates and initializes child widgets defined in templates.
      
      This function must be called in the instance initializer
      for any class which assigned itself a template using
      [gtk.widget_class.WidgetClass.setTemplate].
      
      It is important to call this function in the instance initializer
      of a [gtk.widget.Widget] subclass and not in `GObject.constructed()` or
      `GObject.constructor()` for two reasons:
      
       $(LIST
          * derived widgets will assume that the composite widgets
            defined by its parent classes have been created in their
            relative instance initializers
          * when calling `[gobject.object.ObjectWrap.new_]` on a widget with composite templates,
            it’s important to build the composite widgets before the construct
            properties are set. Properties passed to `[gobject.object.ObjectWrap.new_]` should
            take precedence over properties set in the private template XML
       )
         
      A good rule of thumb is to call this function as the first thing in
      an instance initialization function.
  */
  void initTemplate()
  {
    gtk_widget_init_template(cast(GtkWidget*)this._cPtr);
  }

  /**
      Inserts group into widget.
      
      Children of widget that implement [gtk.actionable.Actionable] can
      then be associated with actions in group by setting their
      “action-name” to prefix.`action-name`.
      
      Note that inheritance is defined for individual actions. I.e.
      even if you insert a group with prefix prefix, actions with
      the same prefix will still be inherited from the parent, unless
      the group contains an action with the same name.
      
      If group is null, a previously inserted group for name is
      removed from widget.
  
      Params:
        name = the prefix for actions in group
        group = a [gio.action_group.ActionGroup], or null to remove
            the previously inserted group for name
  */
  void insertActionGroup(string name, gio.action_group.ActionGroup group = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_insert_action_group(cast(GtkWidget*)this._cPtr, _name, group ? cast(GActionGroup*)(cast(gobject.object.ObjectWrap)group)._cPtr(No.Dup) : null);
  }

  /**
      Inserts widget into the child widget list of parent.
      
      It will be placed after previous_sibling, or at the beginning if
      previous_sibling is null.
      
      After calling this function, `gtk_widget_get_prev_sibling(widget)`
      will return previous_sibling.
      
      If parent is already set as the parent widget of widget, this
      function can also be used to reorder widget in the child widget
      list of parent.
      
      This API is primarily meant for widget implementations; if you are
      just using a widget, you *must* use its own API for adding children.
  
      Params:
        parent = the parent [gtk.widget.Widget] to insert widget into
        previousSibling = the new previous sibling of widget
  */
  void insertAfter(gtk.widget.Widget parent, gtk.widget.Widget previousSibling = null)
  {
    gtk_widget_insert_after(cast(GtkWidget*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null, previousSibling ? cast(GtkWidget*)previousSibling._cPtr(No.Dup) : null);
  }

  /**
      Inserts widget into the child widget list of parent.
      
      It will be placed before next_sibling, or at the end if
      next_sibling is null.
      
      After calling this function, `gtk_widget_get_next_sibling(widget)`
      will return next_sibling.
      
      If parent is already set as the parent widget of widget, this function
      can also be used to reorder widget in the child widget list of parent.
      
      This API is primarily meant for widget implementations; if you are
      just using a widget, you *must* use its own API for adding children.
  
      Params:
        parent = the parent [gtk.widget.Widget] to insert widget into
        nextSibling = the new next sibling of widget
  */
  void insertBefore(gtk.widget.Widget parent, gtk.widget.Widget nextSibling = null)
  {
    gtk_widget_insert_before(cast(GtkWidget*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null, nextSibling ? cast(GtkWidget*)nextSibling._cPtr(No.Dup) : null);
  }

  /**
      Determines whether widget is somewhere inside ancestor,
      possibly with intermediate containers.
  
      Params:
        ancestor = another [gtk.widget.Widget]
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
      Determines whether widget can be drawn to.
      
      A widget can be drawn if it is mapped and visible.
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
      toplevel.
      
      This does not mean that the `propertyGtk.Widget:has-focus`
      property is necessarily set; `propertyGtk.Widget:has-focus`
      will only be set if the toplevel widget additionally has the
      global input focus.
      Returns: true if the widget is the focus widget.
  */
  bool isFocus()
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
  bool isSensitive()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_sensitive(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the widget and all its parents are marked as
      visible.
      
      This function does not check if the widget is obscured in any way.
      
      See also [gtk.widget.Widget.getVisible] and
      [gtk.widget.Widget.setVisible].
      Returns: true if the widget and all its parents are visible
  */
  bool isVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_is_visible(cast(GtkWidget*)this._cPtr);
    return _retval;
  }

  /**
      Emits the `::keynav-failed` signal on the widget.
      
      This function should be called whenever keyboard navigation
      within a single widget hits a boundary.
      
      The return value of this function should be interpreted
      in a way similar to the return value of
      [gtk.widget.Widget.childFocus]. When true is returned,
      stay in the widget, the failed keyboard  navigation is OK
      and/or there is nowhere we can/should move the focus to.
      When false is returned, the caller should continue with
      keyboard navigation outside the widget, e.g. by calling
      [gtk.widget.Widget.childFocus] on the widget’s toplevel.
      
      The default `signalGtk.Widget::keynav-failed` handler returns
      false for [gtk.types.DirectionType.TabForward] and [gtk.types.DirectionType.TabBackward].
      For the other values of [gtk.types.DirectionType] it returns true.
      
      Whenever the default handler returns true, it also calls
      [gtk.widget.Widget.errorBell] to notify the user of the
      failed keyboard navigation.
      
      A use case for providing an own implementation of ::keynav-failed
      (either by connecting to it or by overriding it) would be a row of
      [gtk.entry.Entry] widgets where the user should be able to navigate
      the entire row with the cursor keys, as e.g. known from user
      interfaces that require entering license keys.
  
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
      Returns the widgets for which this widget is the target of a
      mnemonic.
      
      Typically, these widgets will be labels. See, for example,
      [gtk.label.Label.setMnemonicWidget].
      
      The widgets in the list are not individually referenced.
      If you want to iterate through the list and perform actions
      involving callbacks that might destroy the widgets, you
      must call `g_list_foreach (result, (GFunc)g_object_ref, NULL)`
      first, and then unref all the widgets afterwards.
      Returns: the list
          of mnemonic labels; free this list with [glib.list.List.free] when you
          are done with it.
  */
  gtk.widget.Widget[] listMnemonicLabels()
  {
    GList* _cretval;
    _cretval = gtk_widget_list_mnemonic_labels(cast(GtkWidget*)this._cPtr);
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Causes a widget to be mapped if it isn’t already.
      
      This function is only for use in widget implementations.
  */
  void map()
  {
    gtk_widget_map(cast(GtkWidget*)this._cPtr);
  }

  /**
      Measures widget in the orientation orientation and for the given for_size.
      
      As an example, if orientation is [gtk.types.Orientation.Horizontal] and for_size
      is 300, this functions will compute the minimum and natural width of widget
      if it is allocated at a height of 300 pixels.
      
      See [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
      a more details on implementing `GtkWidgetClass.measure()`.
  
      Params:
        orientation = the orientation to measure
        forSize = Size for the opposite of orientation, i.e.
            if orientation is [gtk.types.Orientation.Horizontal], this is
            the height the widget should be measured with. The [gtk.types.Orientation.Vertical]
            case is analogous. This way, both height-for-width and width-for-height
            requests can be implemented. If no size is known, -1 can be passed.
        minimum = location to store the minimum size
        natural = location to store the natural size
        minimumBaseline = location to store the baseline
            position for the minimum size, or -1 to report no baseline
        naturalBaseline = location to store the baseline
            position for the natural size, or -1 to report no baseline
  */
  void measure(gtk.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline)
  {
    gtk_widget_measure(cast(GtkWidget*)this._cPtr, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }

  /**
      Emits the ::mnemonic-activate signal.
      
      See `signalGtk.Widget::mnemonic-activate`.
  
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
      Returns a [gio.list_model.ListModel] to track the children of widget.
      
      Calling this function will enable extra internal bookkeeping
      to track children and emit signals on the returned listmodel.
      It may slow down operations a lot.
      
      Applications should try hard to avoid calling this function
      because of the slowdowns.
      Returns: a [gio.list_model.ListModel] tracking widget's children
  */
  gio.list_model.ListModel observeChildren()
  {
    GListModel* _cretval;
    _cretval = gtk_widget_observe_children(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] to track the [gtk.event_controller.EventController]s
      of widget.
      
      Calling this function will enable extra internal bookkeeping
      to track controllers and emit signals on the returned listmodel.
      It may slow down operations a lot.
      
      Applications should try hard to avoid calling this function
      because of the slowdowns.
      Returns: a [gio.list_model.ListModel] tracking widget's controllers
  */
  gio.list_model.ListModel observeControllers()
  {
    GListModel* _cretval;
    _cretval = gtk_widget_observe_controllers(cast(GtkWidget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finds the descendant of widget closest to the point (`x`, `y`).
      
      The point must be given in widget coordinates, so (0, 0) is assumed
      to be the top left of widget's content area.
      
      Usually widgets will return null if the given coordinate is not
      contained in widget checked via [gtk.widget.Widget.contains].
      Otherwise they will recursively try to find a child that does
      not return null. Widgets are however free to customize their
      picking algorithm.
      
      This function is used on the toplevel to determine the widget
      below the mouse cursor for purposes of hover highlighting and
      delivering events.
  
      Params:
        x = X coordinate to test, relative to widget's origin
        y = Y coordinate to test, relative to widget's origin
        flags = Flags to influence what is picked
      Returns: The widget descendant at
          the given point
  */
  gtk.widget.Widget pick(double x, double y, gtk.types.PickFlags flags)
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_pick(cast(GtkWidget*)this._cPtr, x, y, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Flags the widget for a rerun of the `vfuncGtk.Widget.size_allocate`
      function.
      
      Use this function instead of [gtk.widget.Widget.queueResize]
      when the widget's size request didn't change but it wants to
      reposition its contents.
      
      An example user of this function is [gtk.widget.Widget.setHalign].
      
      This function is only for use in widget implementations.
  */
  void queueAllocate()
  {
    gtk_widget_queue_allocate(cast(GtkWidget*)this._cPtr);
  }

  /**
      Schedules this widget to be redrawn in the paint phase
      of the current or the next frame.
      
      This means widget's `vfuncGtk.Widget.snapshot`
      implementation will be called.
  */
  void queueDraw()
  {
    gtk_widget_queue_draw(cast(GtkWidget*)this._cPtr);
  }

  /**
      Flags a widget to have its size renegotiated.
      
      This should be called when a widget for some reason has a new
      size request. For example, when you change the text in a
      [gtk.label.Label], the label queues a resize to ensure there’s
      enough space for the new text.
      
      Note that you cannot call [gtk.widget.Widget.queueResize] on a widget
      from inside its implementation of the `vfuncGtk.Widget.size_allocate`
      virtual method. Calls to [gtk.widget.Widget.queueResize] from inside
      `vfuncGtk.Widget.size_allocate` will be silently ignored.
      
      This function is only for use in widget implementations.
  */
  void queueResize()
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
      [gtk.widget.Widget.realize].
  */
  void realize()
  {
    gtk_widget_realize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Removes controller from widget, so that it doesn't process
      events anymore.
      
      It should not be used again.
      
      Widgets will remove all event controllers automatically when they
      are destroyed, there is normally no need to call this function.
  
      Params:
        controller = a [gtk.event_controller.EventController]
  */
  void removeController(gtk.event_controller.EventController controller)
  {
    gtk_widget_remove_controller(cast(GtkWidget*)this._cPtr, controller ? cast(GtkEventController*)controller._cPtr(No.Dup) : null);
  }

  /**
      Removes a style from widget.
      
      After this, the style of widget will stop matching for css_class.
  
      Params:
        cssClass = The style class to remove from widget, without
            the leading '.' used for notation of style classes
  */
  void removeCssClass(string cssClass)
  {
    const(char)* _cssClass = cssClass.toCString(No.Alloc);
    gtk_widget_remove_css_class(cast(GtkWidget*)this._cPtr, _cssClass);
  }

  /**
      Removes a widget from the list of mnemonic labels for this widget.
      
      See [gtk.widget.Widget.listMnemonicLabels]. The widget must
      have previously been added to the list with
      [gtk.widget.Widget.addMnemonicLabel].
  
      Params:
        label = a [gtk.widget.Widget] that was previously set as a mnemonic
            label for widget with [gtk.widget.Widget.addMnemonicLabel]
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
      Specifies whether the input focus can enter the widget
      or any of its children.
      
      Applications should set can_focus to false to mark a
      widget as for pointer/touch use only.
      
      Note that having can_focus be true is only one of the
      necessary conditions for being focusable. A widget must
      also be sensitive and focusable and not have an ancestor
      that is marked as not can-focus in order to receive input
      focus.
      
      See [gtk.widget.Widget.grabFocus] for actually setting
      the input focus on a widget.
  
      Params:
        canFocus = whether or not the input focus can enter
            the widget or any of its children
  */
  void setCanFocus(bool canFocus)
  {
    gtk_widget_set_can_focus(cast(GtkWidget*)this._cPtr, canFocus);
  }

  /**
      Sets whether widget can be the target of pointer events.
  
      Params:
        canTarget = whether this widget should be able to
            receive pointer events
  */
  void setCanTarget(bool canTarget)
  {
    gtk_widget_set_can_target(cast(GtkWidget*)this._cPtr, canTarget);
  }

  /**
      Sets whether widget should be mapped along with its parent.
      
      The child visibility can be set for widget before it is added
      to a container with [gtk.widget.Widget.setParent], to avoid
      mapping children unnecessary before immediately unmapping them.
      However it will be reset to its default state of true when the
      widget is removed from a container.
      
      Note that changing the child visibility of a widget does not
      queue a resize on the widget. Most of the time, the size of
      a widget is computed from all visible children, whether or
      not they are mapped. If this is not the case, the container
      can queue a resize itself.
      
      This function is only useful for container implementations
      and should never be called by an application.
  
      Params:
        childVisible = if true, widget should be mapped along
            with its parent.
  */
  void setChildVisible(bool childVisible)
  {
    gtk_widget_set_child_visible(cast(GtkWidget*)this._cPtr, childVisible);
  }

  /**
      Clear all style classes applied to widget
      and replace them with classes.
  
      Params:
        classes = null-terminated list of style classes to apply to widget.
  */
  void setCssClasses(string[] classes)
  {
    char*[] _tmpclasses;
    foreach (s; classes)
      _tmpclasses ~= s.toCString(No.Alloc);
    _tmpclasses ~= null;
    const(char*)* _classes = _tmpclasses.ptr;

    gtk_widget_set_css_classes(cast(GtkWidget*)this._cPtr, _classes);
  }

  /**
      Sets the cursor to be shown when pointer devices point
      towards widget.
      
      If the cursor is NULL, widget will use the cursor
      inherited from the parent widget.
  
      Params:
        cursor = the new cursor
  */
  void setCursor(gdk.cursor.Cursor cursor = null)
  {
    gtk_widget_set_cursor(cast(GtkWidget*)this._cPtr, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null);
  }

  /**
      Sets a named cursor to be shown when pointer devices point
      towards widget.
      
      This is a utility function that creates a cursor via
      [gdk.cursor.Cursor.newFromName] and then sets it on widget
      with [gtk.widget.Widget.setCursor]. See those functions for
      details.
      
      On top of that, this function allows name to be null, which
      will do the same as calling [gtk.widget.Widget.setCursor]
      with a null cursor.
  
      Params:
        name = The name of the cursor
  */
  void setCursorFromName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_set_cursor_from_name(cast(GtkWidget*)this._cPtr, _name);
  }

  /**
      Sets the reading direction on a particular widget.
      
      This direction controls the primary direction for widgets
      containing text, and also the direction in which the children
      of a container are packed. The ability to set the direction is
      present in order so that correct localization into languages with
      right-to-left reading directions can be done. Generally, applications
      will let the default reading direction present, except for containers
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
      Set child as the current focus child of widget.
      
      This function is only suitable for widget implementations.
      If you want a certain widget to get the input focus, call
      [gtk.widget.Widget.grabFocus] on it.
  
      Params:
        child = a direct child widget of widget or null
            to unset the focus child of widget
  */
  void setFocusChild(gtk.widget.Widget child = null)
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
  void setFocusOnClick(bool focusOnClick)
  {
    gtk_widget_set_focus_on_click(cast(GtkWidget*)this._cPtr, focusOnClick);
  }

  /**
      Specifies whether widget can own the input focus.
      
      Widget implementations should set focusable to true in
      their init() function if they want to receive keyboard input.
      
      Note that having focusable be true is only one of the
      necessary conditions for being focusable. A widget must
      also be sensitive and can-focus and not have an ancestor
      that is marked as not can-focus in order to receive input
      focus.
      
      See [gtk.widget.Widget.grabFocus] for actually setting
      the input focus on a widget.
  
      Params:
        focusable = whether or not widget can own the input focus
  */
  void setFocusable(bool focusable)
  {
    gtk_widget_set_focusable(cast(GtkWidget*)this._cPtr, focusable);
  }

  /**
      Sets the font map to use for Pango rendering.
      
      The font map is the object that is used to look up fonts.
      Setting a custom font map can be useful in special situations,
      e.g. when you need to add application-specific fonts to the set
      of available fonts.
      
      When not set, the widget will inherit the font map from its parent.
  
      Params:
        fontMap = a [pango.font_map.FontMap], or null to unset any
            previously set font map
  */
  void setFontMap(pango.font_map.FontMap fontMap = null)
  {
    gtk_widget_set_font_map(cast(GtkWidget*)this._cPtr, fontMap ? cast(PangoFontMap*)fontMap._cPtr(No.Dup) : null);
  }

  /**
      Sets the [cairo.font_options.FontOptions] used for Pango rendering
      in this widget.
      
      When not set, the default font options for the [gdk.display.Display]
      will be used.
  
      Params:
        options = a [cairo.font_options.FontOptions]
            to unset any previously set default font options
  */
  void setFontOptions(cairo.font_options.FontOptions options = null)
  {
    gtk_widget_set_font_options(cast(GtkWidget*)this._cPtr, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
  }

  /**
      Sets the horizontal alignment of widget.
  
      Params:
        align_ = the horizontal alignment
  */
  void setHalign(gtk.types.Align align_)
  {
    gtk_widget_set_halign(cast(GtkWidget*)this._cPtr, align_);
  }

  /**
      Sets the `has-tooltip` property on widget to has_tooltip.
  
      Params:
        hasTooltip = whether or not widget has a tooltip.
  */
  void setHasTooltip(bool hasTooltip)
  {
    gtk_widget_set_has_tooltip(cast(GtkWidget*)this._cPtr, hasTooltip);
  }

  /**
      Sets whether the widget would like any available extra horizontal
      space.
      
      When a user resizes a [gtk.window.Window], widgets with expand=TRUE
      generally receive the extra space. For example, a list or
      scrollable area or document in your window would often be set to
      expand.
      
      Call this function to set the expand flag if you would like your
      widget to become larger horizontally when the window has extra
      room.
      
      By default, widgets automatically expand if any of their children
      want to expand. (To see if a widget will automatically expand given
      its current children and state, call [gtk.widget.Widget.computeExpand].
      A container can decide how the expandability of children affects the
      expansion of the container by overriding the compute_expand virtual
      method on [gtk.widget.Widget].).
      
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
      Sets whether the hexpand flag will be used.
      
      The [gtk.widget.Widget.hexpand] property will be set
      automatically when you call [gtk.widget.Widget.setHexpand]
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
  void setHexpandSet(bool set)
  {
    gtk_widget_set_hexpand_set(cast(GtkWidget*)this._cPtr, set);
  }

  /**
      Sets the layout manager delegate instance that provides an
      implementation for measuring and allocating the children of widget.
  
      Params:
        layoutManager = a [gtk.layout_manager.LayoutManager]
  */
  void setLayoutManager(gtk.layout_manager.LayoutManager layoutManager = null)
  {
    gtk_widget_set_layout_manager(cast(GtkWidget*)this._cPtr, layoutManager ? cast(GtkLayoutManager*)layoutManager._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the bottom margin of widget.
  
      Params:
        margin = the bottom margin
  */
  void setMarginBottom(int margin)
  {
    gtk_widget_set_margin_bottom(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the end margin of widget.
  
      Params:
        margin = the end margin
  */
  void setMarginEnd(int margin)
  {
    gtk_widget_set_margin_end(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the start margin of widget.
  
      Params:
        margin = the start margin
  */
  void setMarginStart(int margin)
  {
    gtk_widget_set_margin_start(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets the top margin of widget.
  
      Params:
        margin = the top margin
  */
  void setMarginTop(int margin)
  {
    gtk_widget_set_margin_top(cast(GtkWidget*)this._cPtr, margin);
  }

  /**
      Sets a widgets name.
      
      Setting a name allows you to refer to the widget from a
      CSS file. You can apply a style to widgets with a particular name
      in the CSS file. See the documentation for the CSS syntax (on the
      same page as the docs for [gtk.style_context.StyleContext].
      
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
      Request the widget to be rendered partially transparent.
      
      An opacity of 0 is fully transparent and an opacity of 1
      is fully opaque.
      
      Opacity works on both toplevel widgets and child widgets, although
      there are some limitations: For toplevel widgets, applying opacity
      depends on the capabilities of the windowing system. On X11, this
      has any effect only on X displays with a compositing manager,
      see [gdk.display.Display.isComposited]. On Windows and Wayland it should
      always work, although setting a window’s opacity after the window
      has been shown may cause some flicker.
      
      Note that the opacity is inherited through inclusion — if you set
      a toplevel to be partially translucent, all of its content will
      appear translucent, since it is ultimatively rendered on that
      toplevel. The opacity value itself is not inherited by child
      widgets (since that would make widgets deeper in the hierarchy
      progressively more translucent). As a consequence, [gtk.popover.Popover]s
      and other [gtk.native.Native] widgets with their own surface will use their
      own opacity value, and thus by default appear non-translucent,
      even if they are attached to a toplevel that is translucent.
  
      Params:
        opacity = desired opacity, between 0 and 1
  */
  void setOpacity(double opacity)
  {
    gtk_widget_set_opacity(cast(GtkWidget*)this._cPtr, opacity);
  }

  /**
      Sets how widget treats content that is drawn outside the
      widget's content area.
      
      See the definition of [gtk.types.Overflow] for details.
      
      This setting is provided for widget implementations and
      should not be used by application code.
      
      The default value is [gtk.types.Overflow.Visible].
  
      Params:
        overflow = desired overflow
  */
  void setOverflow(gtk.types.Overflow overflow)
  {
    gtk_widget_set_overflow(cast(GtkWidget*)this._cPtr, overflow);
  }

  /**
      Sets parent as the parent widget of widget.
      
      This takes care of details such as updating the state and style
      of the child to reflect its new location and resizing the parent.
      The opposite function is [gtk.widget.Widget.unparent].
      
      This function is useful only when implementing subclasses of
      [gtk.widget.Widget].
  
      Params:
        parent = parent widget
  */
  void setParent(gtk.widget.Widget parent)
  {
    gtk_widget_set_parent(cast(GtkWidget*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null);
  }

  /**
      Specifies whether widget will be treated as the default
      widget within its toplevel when it has the focus, even if
      another widget is the default.
  
      Params:
        receivesDefault = whether or not widget can be a default widget.
  */
  void setReceivesDefault(bool receivesDefault)
  {
    gtk_widget_set_receives_default(cast(GtkWidget*)this._cPtr, receivesDefault);
  }

  /**
      Sets the sensitivity of a widget.
      
      A widget is sensitive if the user can interact with it.
      Insensitive widgets are “grayed out” and the user can’t
      interact with them. Insensitive widgets are known as
      “inactive”, “disabled”, or “ghosted” in some other toolkits.
  
      Params:
        sensitive = true to make the widget sensitive
  */
  void setSensitive(bool sensitive)
  {
    gtk_widget_set_sensitive(cast(GtkWidget*)this._cPtr, sensitive);
  }

  /**
      Sets the minimum size of a widget.
      
      That is, the widget’s size request will be at least width
      by height. You can use this function to force a widget to
      be larger than it normally would be.
      
      In most cases, [gtk.window.Window.setDefaultSize] is a better
      choice for toplevel windows than this function; setting the default
      size will still allow users to shrink the window. Setting the size
      request will force them to leave the window at least as large as
      the size request.
      
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
      properties
      `propertyGtk.Widget:margin-start`,
      `propertyGtk.Widget:margin-end`,
      `propertyGtk.Widget:margin-top`, and
      `propertyGtk.Widget:margin-bottom`, but it does include pretty
      much all other padding or border properties set by any subclass
      of [gtk.widget.Widget].
  
      Params:
        width = width widget should request, or -1 to unset
        height = height widget should request, or -1 to unset
  */
  void setSizeRequest(int width, int height)
  {
    gtk_widget_set_size_request(cast(GtkWidget*)this._cPtr, width, height);
  }

  /**
      Turns on flag values in the current widget state.
      
      Typical widget states are insensitive, prelighted, etc.
      
      This function accepts the values [gtk.types.StateFlags.DirLtr] and
      [gtk.types.StateFlags.DirRtl] but ignores them. If you want to set
      the widget's direction, use [gtk.widget.Widget.setDirection].
      
      This function is for use in widget implementations.
  
      Params:
        flags = State flags to turn on
        clear = Whether to clear state before turning on flags
  */
  void setStateFlags(gtk.types.StateFlags flags, bool clear)
  {
    gtk_widget_set_state_flags(cast(GtkWidget*)this._cPtr, flags, clear);
  }

  /**
      Sets markup as the contents of the tooltip, which is marked
      up with Pango markup.
      
      This function will take care of setting the
      `propertyGtk.Widget:has-tooltip` as a side effect, and of the
      default handler for the `signalGtk.Widget::query-tooltip` signal.
      
      See also [gtk.tooltip.Tooltip.setMarkup].
  
      Params:
        markup = the contents of the tooltip for widget
  */
  void setTooltipMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_widget_set_tooltip_markup(cast(GtkWidget*)this._cPtr, _markup);
  }

  /**
      Sets text as the contents of the tooltip.
      
      If text contains any markup, it will be escaped.
      
      This function will take care of setting
      `propertyGtk.Widget:has-tooltip` as a side effect,
      and of the default handler for the
      `signalGtk.Widget::query-tooltip` signal.
      
      See also [gtk.tooltip.Tooltip.setText].
  
      Params:
        text = the contents of the tooltip for widget
  */
  void setTooltipText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_widget_set_tooltip_text(cast(GtkWidget*)this._cPtr, _text);
  }

  /**
      Sets the vertical alignment of widget.
  
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
      Sets whether the vexpand flag will be used.
      
      See [gtk.widget.Widget.setHexpandSet] for more detail.
  
      Params:
        set = value for vexpand-set property
  */
  void setVexpandSet(bool set)
  {
    gtk_widget_set_vexpand_set(cast(GtkWidget*)this._cPtr, set);
  }

  /**
      Sets the visibility state of widget.
      
      Note that setting this to true doesn’t mean the widget is
      actually viewable, see [gtk.widget.Widget.getVisible].
  
      Params:
        visible = whether the widget should be shown or not
  */
  void setVisible(bool visible)
  {
    gtk_widget_set_visible(cast(GtkWidget*)this._cPtr, visible);
  }

  /**
      Returns whether widget should contribute to
      the measuring and allocation of its parent.
      
      This is false for invisible children, but also
      for children that have their own surface.
      Returns: true if child should be included in
          measuring and allocating
  */
  bool shouldLayout()
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
      
      When a toplevel container is shown, it is immediately realized and
      mapped; other shown widgets are realized and mapped when their
      toplevel container is realized and mapped.
  
      Deprecated: Use [gtk.widget.Widget.setVisible] instead
  */
  void show()
  {
    gtk_widget_show(cast(GtkWidget*)this._cPtr);
  }

  /**
      Allocates widget with a transformation that translates
      the origin to the position in allocation.
      
      This is a simple form of [gtk.widget.Widget.allocate].
  
      Params:
        allocation = position and size to be allocated to widget
        baseline = The baseline of the child, or -1
  */
  void sizeAllocate(gtk.types.Allocation allocation, int baseline)
  {
    gtk_widget_size_allocate(cast(GtkWidget*)this._cPtr, cast(const(GtkAllocation)*)&allocation, baseline);
  }

  /**
      Snapshot the a child of widget.
      
      When a widget receives a call to the snapshot function,
      it must send synthetic `vfuncGtk.Widget.snapshot` calls
      to all children. This function provides a convenient way
      of doing this. A widget, when it receives a call to its
      `vfuncGtk.Widget.snapshot` function, calls
      [gtk.widget.Widget.snapshotChild] once for each child, passing in
      the snapshot the widget received.
      
      [gtk.widget.Widget.snapshotChild] takes care of translating the origin of
      snapshot, and deciding whether the child needs to be snapshot.
      
      This function does nothing for children that implement [gtk.native.Native].
  
      Params:
        child = a child of widget
        snapshot = [gtk.snapshot.Snapshot] as passed to the widget. In particular, no
            calls to [gtk.snapshot.Snapshot.translate] or other transform calls should
            have been made.
  */
  void snapshotChild(gtk.widget.Widget child, gtk.snapshot.Snapshot snapshot)
  {
    gtk_widget_snapshot_child(cast(GtkWidget*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null);
  }

  /**
      Translate coordinates relative to src_widget’s allocation
      to coordinates relative to dest_widget’s allocations.
      
      In order to perform this operation, both widget must share
      a common ancestor.
  
      Params:
        destWidget = a [gtk.widget.Widget]
        srcX = X position relative to src_widget
        srcY = Y position relative to src_widget
        destX = location to store X position relative to dest_widget
        destY = location to store Y position relative to dest_widget
      Returns: false if src_widget and dest_widget have no common
          ancestor. In this case, 0 is stored in *dest_x and *dest_y.
          Otherwise true.
  
      Deprecated: Use [gtk.widget.Widget.computePoint] instead
  */
  bool translateCoordinates(gtk.widget.Widget destWidget, double srcX, double srcY, out double destX, out double destY)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_translate_coordinates(cast(GtkWidget*)this._cPtr, destWidget ? cast(GtkWidget*)destWidget._cPtr(No.Dup) : null, srcX, srcY, cast(double*)&destX, cast(double*)&destY);
    return _retval;
  }

  /**
      Triggers a tooltip query on the display where the toplevel
      of widget is located.
  */
  void triggerTooltipQuery()
  {
    gtk_widget_trigger_tooltip_query(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes a widget to be unmapped if it’s currently mapped.
      
      This function is only for use in widget implementations.
  */
  void unmap()
  {
    gtk_widget_unmap(cast(GtkWidget*)this._cPtr);
  }

  /**
      Dissociate widget from its parent.
      
      This function is only for use in widget implementations,
      typically in dispose.
  */
  void unparent()
  {
    gtk_widget_unparent(cast(GtkWidget*)this._cPtr);
  }

  /**
      Causes a widget to be unrealized (frees all GDK resources
      associated with the widget).
      
      This function is only useful in widget implementations.
  */
  void unrealize()
  {
    gtk_widget_unrealize(cast(GtkWidget*)this._cPtr);
  }

  /**
      Turns off flag values for the current widget state.
      
      See [gtk.widget.Widget.setStateFlags].
      
      This function is for use in widget implementations.
  
      Params:
        flags = State flags to turn off
  */
  void unsetStateFlags(gtk.types.StateFlags flags)
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
      Connect to `DirectionChanged` signal.
  
      Emitted when the text direction of a widget changes.
  
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
      Connect to `Hide` signal.
  
      Emitted when widget is hidden.
  
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
      Connect to `KeynavFailed` signal.
  
      Emitted if keyboard navigation fails.
        
        See [gtk.widget.Widget.keynavFailed] for details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.DirectionType direction, gtk.widget.Widget widget))
  
          `direction` the direction of movement (optional)
  
          `widget` the instance the signal is connected to (optional)
  
          `Returns` true if stopping keyboard navigation is fine, false
              if the emitting widget should try to handle the keyboard
              navigation attempt in its parent widget(s).
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
      Connect to `Map` signal.
  
      Emitted when widget is going to be mapped.
        
        A widget is mapped when the widget is visible (which is controlled with
        [gtk.widget.Widget.visible]) and all its parents up to the toplevel widget
        are also visible.
        
        The ::map signal can be used to determine whether a widget will be drawn,
        for instance it can resume an animation that was stopped during the
        emission of [gtk.widget.Widget.unmap].
  
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
      Connect to `MnemonicActivate` signal.
  
      Emitted when a widget is activated via a mnemonic.
        
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
      Connect to `MoveFocus` signal.
  
      Emitted when the focus is moved.
        
        The ::move-focus signal is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are <kbd>Tab</kbd> to move forward,
        and <kbd>Shift</kbd>+<kbd>Tab</kbd> to move backward.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DirectionType direction, gtk.widget.Widget widget))
  
          `direction` the direction of the focus move (optional)
  
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
      Connect to `QueryTooltip` signal.
  
      Emitted when the widget’s tooltip is about to be shown.
        
        This happens when the `propertyGtk.Widget:has-tooltip` property
        is true and the hover timeout has expired with the cursor hovering
        "above" widget; or emitted when widget got focus in keyboard mode.
        
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
  
          `tooltip` a [gtk.tooltip.Tooltip] (optional)
  
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
  
      Emitted when widget is associated with a [gdk.surface.Surface].
        
        This means that [gtk.widget.Widget.realize] has been called
        or the widget has been mapped (that is, it is going to be drawn).
  
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
      Connect to `Show` signal.
  
      Emitted when widget is shown.
  
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
      Connect to `StateFlagsChanged` signal.
  
      Emitted when the widget state changes.
        
        See [gtk.widget.Widget.getStateFlags].
  
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
      Connect to `Unmap` signal.
  
      Emitted when widget is going to be unmapped.
        
        A widget is unmapped when either it or any of its parents up to the
        toplevel widget have been set as hidden.
        
        As ::unmap indicates that a widget will not be shown any longer,
        it can be used to, for example, stop an animation on the widget.
  
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
      Connect to `Unrealize` signal.
  
      Emitted when the [gdk.surface.Surface] associated with widget is destroyed.
        
        This means that [gtk.widget.Widget.unrealize] has been called
        or the widget has been unmapped (that is, it is going to be hidden).
  
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
}
