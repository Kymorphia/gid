/// Module for [Label] class
module gtk.label;

import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_text;
import gtk.accessible_text_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;
import pango.attr_list;
import pango.layout;
import pango.tab_array;
import pango.types;

/**
    The [gtk.label.Label] widget displays a small amount of text.
    
    As the name implies, most labels are used to label another widget
    such as a `class@Button`.
    
    ![An example GtkLabel](label.png)
    
    ## CSS nodes
    
    ```
    label
    ├── [selection]
    ├── [link]
    ┊
    ╰── [link]
    ```
    
    [gtk.label.Label] has a single CSS node with the name label. A wide variety
    of style classes may be applied to labels, such as .title, .subtitle,
    .dim-label, etc. In the [gtk.shortcuts_window.ShortcutsWindow], labels are used with the
    .keycap style class.
    
    If the label has a selection, it gets a subnode with name selection.
    
    If the label has links, there is one subnode per link. These subnodes
    carry the link or visited state depending on whether they have been
    visited. In this case, label node also gets a .link style class.
    
    ## GtkLabel as GtkBuildable
    
    The GtkLabel implementation of the GtkBuildable interface supports a
    custom `<attributes>` element, which supports any number of `<attribute>`
    elements. The `<attribute>` element has attributes named “name“, “value“,
    “start“ and “end“ and allows you to specify [pango.attribute.Attribute]
    values for this label.
    
    An example of a UI definition fragment specifying Pango attributes:
    
    ```xml
    <object class="GtkLabel">
      <attributes>
        <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
        <attribute name="background" value="red" start="5" end="10"/>
      </attributes>
    </object>
    ```
    
    The start and end attributes specify the range of characters to which the
    Pango attribute applies. If start and end are not specified, the attribute is
    applied to the whole text. Note that specifying ranges does not make much
    sense with translatable attributes. Use markup embedded in the translatable
    content instead.
    
    ## Accessibility
    
    [gtk.label.Label] uses the [gtk.types.AccessibleRole.Label] role.
    
    ## Mnemonics
    
    Labels may contain “mnemonics”. Mnemonics are underlined characters in the
    label, used for keyboard navigation. Mnemonics are created by providing a
    string with an underscore before the mnemonic character, such as `"_File"`,
    to the functions [gtk.label.Label.newWithMnemonic] or
    [gtk.label.Label.setTextWithMnemonic].
    
    Mnemonics automatically activate any activatable widget the label is
    inside, such as a [gtk.button.Button]; if the label is not inside the
    mnemonic’s target widget, you have to tell the label about the target
    using [gtk.label.Label.setMnemonicWidget].
    
    Here’s a simple example where the label is inside a button:
    
    ```c
    // Pressing Alt+H will activate this button
    GtkWidget *button = gtk_button_new ();
    GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
    gtk_button_set_child (GTK_BUTTON (button), label);
    ```
    
    There’s a convenience function to create buttons with a mnemonic label
    already inside:
    
    ```c
    // Pressing Alt+H will activate this button
    GtkWidget *button = gtk_button_new_with_mnemonic ("_Hello");
    ```
    
    To create a mnemonic for a widget alongside the label, such as a
    [gtk.entry.Entry], you have to point the label at the entry with
    [gtk.label.Label.setMnemonicWidget]:
    
    ```c
    // Pressing Alt+H will focus the entry
    GtkWidget *entry = gtk_entry_new ();
    GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
    gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
    ```
    
    ## Markup (styled text)
    
    To make it easy to format text in a label (changing colors,
    fonts, etc.), label text can be provided in a simple
    markup format:
    
    Here’s how to create a label with a small font:
    ```c
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");
    ```
    
    (See the Pango manual for complete documentation] of available
    tags, `func@Pango.parse_markup`)
    
    The markup passed to [gtk.label.Label.setMarkup] must be valid; for example,
    literal `<`, `>` and `&` characters must be escaped as `&lt;`, `&gt;`, and `&amp;`.
    If you pass text obtained from the user, file, or a network to
    [gtk.label.Label.setMarkup], you’ll want to escape it with
    `func@GLib.markup_escape_text` or `func@GLib.markup_printf_escaped`.
    
    Markup strings are just a convenient way to set the [pango.attr_list.AttrList]
    on a label; [gtk.label.Label.setAttributes] may be a simpler way to set
    attributes in some cases. Be careful though; [pango.attr_list.AttrList] tends
    to cause internationalization problems, unless you’re applying attributes
    to the entire string (i.e. unless you set the range of each attribute
    to [0, `G_MAXINT`)). The reason is that specifying the start_index and
    end_index for a [pango.attribute.Attribute] requires knowledge of the exact
    string being displayed, so translations will cause problems.
    
    ## Selectable labels
    
    Labels can be made selectable with [gtk.label.Label.setSelectable].
    Selectable labels allow the user to copy the label contents to
    the clipboard. Only labels that contain useful-to-copy information—such
    as error messages—should be made selectable.
    
    ## Text layout
    
    A label can contain any number of paragraphs, but will have
    performance problems if it contains more than a small number.
    Paragraphs are separated by newlines or other paragraph separators
    understood by Pango.
    
    Labels can automatically wrap text if you call [gtk.label.Label.setWrap].
    
    [gtk.label.Label.setJustify] sets how the lines in a label align
    with one another. If you want to set how the label as a whole aligns
    in its available space, see the [gtk.widget.Widget.halign] and
    [gtk.widget.Widget.valign] properties.
    
    The `property@Gtk.Label:width-chars` and `property@Gtk.Label:max-width-chars`
    properties can be used to control the size allocation of ellipsized or
    wrapped labels. For ellipsizing labels, if either is specified (and less
    than the actual text size), it is used as the minimum width, and the actual
    text size is used as the natural width of the label. For wrapping labels,
    width-chars is used as the minimum width, if specified, and max-width-chars
    is used as the natural width. Even if max-width-chars specified, wrapping
    labels will be rewrapped to use all of the available width.
    
    ## Links
    
    GTK supports markup for clickable hyperlinks in addition to regular Pango
    markup. The markup for links is borrowed from HTML, using the `<a>` with
    “href“, “title“ and “class“ attributes. GTK renders links similar to the
    way they appear in web browsers, with colored, underlined text. The “title“
    attribute is displayed as a tooltip on the link. The “class“ attribute is
    used as style class on the CSS node for the link.
    
    An example of inline links looks like this:
    
    ```c
    const char *text =
    "Go to the "
    "<a href=\"https://www.gtk.org\" title=\"&lt;i&gt;Our&lt;/i&gt; website\">"
    "GTK website</a> for more...";
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), text);
    ```
    
    It is possible to implement custom handling for links and their tooltips
    with the `signal@Gtk.Label::activate-link` signal and the
    [gtk.label.Label.getCurrentUri] function.
*/
class Label : gtk.widget.Widget, gtk.accessible_text.AccessibleText
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
    return cast(void function())gtk_label_get_type != &gidSymbolNotFound ? gtk_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Label self()
  {
    return this;
  }

  /**
      Get `attributes` property.
      Returns: A list of style attributes to apply to the text of the label.
  */
  @property pango.attr_list.AttrList attributes()
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of style attributes to apply to the text of the label.
  */
  @property void attributes(pango.attr_list.AttrList propval)
  {
    return setAttributes(propval);
  }

  /**
      Get `ellipsize` property.
      Returns: The preferred place to ellipsize the string, if the label does
      not have enough room to display the entire string.
      
      Note that setting this property to a value other than
      [pango.types.EllipsizeMode.None] has the side-effect that the label requests
      only enough space to display the ellipsis "...". In particular, this
      means that ellipsizing labels do not work well in notebook tabs, unless
      the [gtk.notebook_page.NotebookPage.tab] child property is set to true.
      Other ways to set a label's width are [gtk.widget.Widget.setSizeRequest]
      and [gtk.label.Label.setWidthChars].
  */
  @property pango.types.EllipsizeMode ellipsize()
  {
    return getEllipsize();
  }

  /**
      Set `ellipsize` property.
      Params:
        propval = The preferred place to ellipsize the string, if the label does
        not have enough room to display the entire string.
        
        Note that setting this property to a value other than
        [pango.types.EllipsizeMode.None] has the side-effect that the label requests
        only enough space to display the ellipsis "...". In particular, this
        means that ellipsizing labels do not work well in notebook tabs, unless
        the [gtk.notebook_page.NotebookPage.tab] child property is set to true.
        Other ways to set a label's width are [gtk.widget.Widget.setSizeRequest]
        and [gtk.label.Label.setWidthChars].
  */
  @property void ellipsize(pango.types.EllipsizeMode propval)
  {
    return setEllipsize(propval);
  }

  /**
      Get `extraMenu` property.
      Returns: A menu model whose contents will be appended to the context menu.
  */
  @property gio.menu_model.MenuModel extraMenu()
  {
    return getExtraMenu();
  }

  /**
      Set `extraMenu` property.
      Params:
        propval = A menu model whose contents will be appended to the context menu.
  */
  @property void extraMenu(gio.menu_model.MenuModel propval)
  {
    return setExtraMenu(propval);
  }

  /**
      Get `justify` property.
      Returns: The alignment of the lines in the text of the label, relative to each other.
      
      This does *not* affect the alignment of the label within its allocation.
      See [gtk.label.Label.xalign] for that.
  */
  @property gtk.types.Justification justify()
  {
    return getJustify();
  }

  /**
      Set `justify` property.
      Params:
        propval = The alignment of the lines in the text of the label, relative to each other.
        
        This does *not* affect the alignment of the label within its allocation.
        See [gtk.label.Label.xalign] for that.
  */
  @property void justify(gtk.types.Justification propval)
  {
    return setJustify(propval);
  }

  /**
      Get `label` property.
      Returns: The contents of the label.
      
      If the string contains Pango markup (see `func@Pango.parse_markup`),
      you will have to set the `property@Gtk.Label:use-markup` property to
      true in order for the label to display the markup attributes. See also
      [gtk.label.Label.setMarkup] for a convenience function that sets both
      this property and the `property@Gtk.Label:use-markup` property at the
      same time.
      
      If the string contains underlines acting as mnemonics, you will have to
      set the `property@Gtk.Label:use-underline` property to true in order
      for the label to display them.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The contents of the label.
        
        If the string contains Pango markup (see `func@Pango.parse_markup`),
        you will have to set the `property@Gtk.Label:use-markup` property to
        true in order for the label to display the markup attributes. See also
        [gtk.label.Label.setMarkup] for a convenience function that sets both
        this property and the `property@Gtk.Label:use-markup` property at the
        same time.
        
        If the string contains underlines acting as mnemonics, you will have to
        set the `property@Gtk.Label:use-underline` property to true in order
        for the label to display them.
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `lines` property.
      Returns: The number of lines to which an ellipsized, wrapping label
      should be limited.
      
      This property has no effect if the label is not wrapping or ellipsized.
      Set this property to -1 if you don't want to limit the number of lines.
  */
  @property int lines()
  {
    return getLines();
  }

  /**
      Set `lines` property.
      Params:
        propval = The number of lines to which an ellipsized, wrapping label
        should be limited.
        
        This property has no effect if the label is not wrapping or ellipsized.
        Set this property to -1 if you don't want to limit the number of lines.
  */
  @property void lines(int propval)
  {
    return setLines(propval);
  }

  /**
      Get `maxWidthChars` property.
      Returns: The desired maximum width of the label, in characters.
      
      If this property is set to -1, the width will be calculated automatically.
      
      See the section on [text layout](class.Label.html#text-layout) for details of how
      `property@Gtk.Label:width-chars` and `property@Gtk.Label:max-width-chars`
      determine the width of ellipsized and wrapped labels.
  */
  @property int maxWidthChars()
  {
    return getMaxWidthChars();
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the label, in characters.
        
        If this property is set to -1, the width will be calculated automatically.
        
        See the section on [text layout](class.Label.html#text-layout) for details of how
        `property@Gtk.Label:width-chars` and `property@Gtk.Label:max-width-chars`
        determine the width of ellipsized and wrapped labels.
  */
  @property void maxWidthChars(int propval)
  {
    return setMaxWidthChars(propval);
  }

  /**
      Get `mnemonicKeyval` property.
      Returns: The mnemonic accelerator key for the label.
  */
  @property uint mnemonicKeyval()
  {
    return getMnemonicKeyval();
  }

  /**
      Get `mnemonicWidget` property.
      Returns: The widget to be activated when the labels mnemonic key is pressed.
  */
  @property gtk.widget.Widget mnemonicWidget()
  {
    return getMnemonicWidget();
  }

  /**
      Set `mnemonicWidget` property.
      Params:
        propval = The widget to be activated when the labels mnemonic key is pressed.
  */
  @property void mnemonicWidget(gtk.widget.Widget propval)
  {
    return setMnemonicWidget(propval);
  }

  /**
      Get `naturalWrapMode` property.
      Returns: Select the line wrapping for the natural size request.
      
      This only affects the natural size requested. For the actual wrapping used,
      see the [gtk.label.Label.wrap] property.
      
      The default is [gtk.types.NaturalWrapMode.Inherit], which inherits the behavior of the
      [gtk.label.Label.wrap] property.
  */
  @property gtk.types.NaturalWrapMode naturalWrapMode()
  {
    return getNaturalWrapMode();
  }

  /**
      Set `naturalWrapMode` property.
      Params:
        propval = Select the line wrapping for the natural size request.
        
        This only affects the natural size requested. For the actual wrapping used,
        see the [gtk.label.Label.wrap] property.
        
        The default is [gtk.types.NaturalWrapMode.Inherit], which inherits the behavior of the
        [gtk.label.Label.wrap] property.
  */
  @property void naturalWrapMode(gtk.types.NaturalWrapMode propval)
  {
    return setNaturalWrapMode(propval);
  }

  /**
      Get `selectable` property.
      Returns: Whether the label text can be selected with the mouse.
  */
  @property bool selectable()
  {
    return getSelectable();
  }

  /**
      Set `selectable` property.
      Params:
        propval = Whether the label text can be selected with the mouse.
  */
  @property void selectable(bool propval)
  {
    return setSelectable(propval);
  }

  /**
      Get `singleLineMode` property.
      Returns: Whether the label is in single line mode.
      
      In single line mode, the height of the label does not depend on the
      actual text, it is always set to ascent + descent of the font. This
      can be an advantage in situations where resizing the label because
      of text changes would be distracting, e.g. in a statusbar.
  */
  @property bool singleLineMode()
  {
    return getSingleLineMode();
  }

  /**
      Set `singleLineMode` property.
      Params:
        propval = Whether the label is in single line mode.
        
        In single line mode, the height of the label does not depend on the
        actual text, it is always set to ascent + descent of the font. This
        can be an advantage in situations where resizing the label because
        of text changes would be distracting, e.g. in a statusbar.
  */
  @property void singleLineMode(bool propval)
  {
    return setSingleLineMode(propval);
  }

  /**
      Get `tabs` property.
      Returns: Custom tabs for this label.
  */
  @property pango.tab_array.TabArray tabs()
  {
    return getTabs();
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this label.
  */
  @property void tabs(pango.tab_array.TabArray propval)
  {
    return setTabs(propval);
  }

  /**
      Get `useMarkup` property.
      Returns: true if the text of the label includes Pango markup.
      
      See `func@Pango.parse_markup`.
  */
  @property bool useMarkup()
  {
    return getUseMarkup();
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = true if the text of the label includes Pango markup.
        
        See `func@Pango.parse_markup`.
  */
  @property void useMarkup(bool propval)
  {
    return setUseMarkup(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: true if the text of the label indicates a mnemonic with an _
      before the mnemonic character.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = true if the text of the label indicates a mnemonic with an _
        before the mnemonic character.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Get `widthChars` property.
      Returns: The desired width of the label, in characters.
      
      If this property is set to -1, the width will be calculated automatically.
      
      See the section on [text layout](class.Label.html#text-layout) for details of how
      `property@Gtk.Label:width-chars` and `property@Gtk.Label:max-width-chars`
      determine the width of ellipsized and wrapped labels.
  */
  @property int widthChars()
  {
    return getWidthChars();
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The desired width of the label, in characters.
        
        If this property is set to -1, the width will be calculated automatically.
        
        See the section on [text layout](class.Label.html#text-layout) for details of how
        `property@Gtk.Label:width-chars` and `property@Gtk.Label:max-width-chars`
        determine the width of ellipsized and wrapped labels.
  */
  @property void widthChars(int propval)
  {
    return setWidthChars(propval);
  }

  /**
      Get `wrap` property.
      Returns: true if the label text will wrap if it gets too wide.
  */
  @property bool wrap()
  {
    return getWrap();
  }

  /**
      Set `wrap` property.
      Params:
        propval = true if the label text will wrap if it gets too wide.
  */
  @property void wrap(bool propval)
  {
    return setWrap(propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Controls how the line wrapping is done.
      
      This only affects the formatting if line wrapping is on (see the
      [gtk.label.Label.wrap] property). The default is [pango.types.WrapMode.Word],
      which means wrap on word boundaries.
      
      For sizing behavior, also consider the `property@Gtk.Label:natural-wrap-mode`
      property.
  */
  @property pango.types.WrapMode wrapMode()
  {
    return getWrapMode();
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Controls how the line wrapping is done.
        
        This only affects the formatting if line wrapping is on (see the
        [gtk.label.Label.wrap] property). The default is [pango.types.WrapMode.Word],
        which means wrap on word boundaries.
        
        For sizing behavior, also consider the `property@Gtk.Label:natural-wrap-mode`
        property.
  */
  @property void wrapMode(pango.types.WrapMode propval)
  {
    return setWrapMode(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the label text inside its size allocation.
      
      Compare this to [gtk.widget.Widget.halign], which determines how the
      labels size allocation is positioned in the space available for the label.
  */
  @property float xalign()
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the label text inside its size allocation.
        
        Compare this to [gtk.widget.Widget.halign], which determines how the
        labels size allocation is positioned in the space available for the label.
  */
  @property void xalign(float propval)
  {
    return setXalign(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the label text inside its size allocation.
      
      Compare this to [gtk.widget.Widget.valign], which determines how the
      labels size allocation is positioned in the space available for the label.
  */
  @property float yalign()
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the label text inside its size allocation.
        
        Compare this to [gtk.widget.Widget.valign], which determines how the
        labels size allocation is positioned in the space available for the label.
  */
  @property void yalign(float propval)
  {
    return setYalign(propval);
  }

  mixin AccessibleTextT!();

  /**
      Creates a new label with the given text inside it.
      
      You can pass null to get an empty label widget.
  
      Params:
        str = The text of the label
      Returns: the new [gtk.label.Label]
  */
  this(string str = null)
  {
    GtkWidget* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gtk_label_new(_str);
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.label.Label], containing the text in str.
      
      If characters in str are preceded by an underscore, they are
      underlined. If you need a literal underscore character in a label, use
      '__' (two underscores). The first underlined character represents a
      keyboard accelerator called a mnemonic. The mnemonic key can be used
      to activate another widget, chosen automatically, or explicitly using
      [gtk.label.Label.setMnemonicWidget].
      
      If [gtk.label.Label.setMnemonicWidget] is not called, then the first
      activatable ancestor of the [gtk.label.Label] will be chosen as the mnemonic
      widget. For instance, if the label is inside a button or menu item,
      the button or menu item will automatically become the mnemonic widget
      and be activated by the mnemonic.
  
      Params:
        str = The text of the label, with an underscore in front of the
            mnemonic character
      Returns: the new [gtk.label.Label]
  */
  static gtk.label.Label newWithMnemonic(string str = null)
  {
    GtkWidget* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gtk_label_new_with_mnemonic(_str);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.label.Label)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the label's attribute list.
      
      This is the [pango.attr_list.AttrList] that was set on the label using
      [gtk.label.Label.setAttributes], if any. This function does not
      reflect attributes that come from the label's markup (see
      [gtk.label.Label.setMarkup]). If you want to get the effective
      attributes for the label, use
      `pango_layout_get_attributes (gtk_label_get_layout (self))`.
      Returns: the attribute list
  */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = gtk_label_get_attributes(cast(GtkLabel*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the URI for the currently active link in the label.
      
      The active link is the one under the mouse pointer or, in a
      selectable label, the link in which the text cursor is currently
      positioned.
      
      This function is intended for use in a `signalGtk.Label::activate-link`
      handler or for use in a `signalGtk.Widget::query-tooltip` handler.
      Returns: the currently active URI
  */
  string getCurrentUri()
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_current_uri(cast(GtkLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the ellipsizing position of the label.
      
      See [gtk.label.Label.setEllipsize].
      Returns: [pango.types.EllipsizeMode]
  */
  pango.types.EllipsizeMode getEllipsize()
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_label_get_ellipsize(cast(GtkLabel*)this._cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Gets the extra menu model of label.
      
      See [gtk.label.Label.setExtraMenu].
      Returns: the menu model
  */
  gio.menu_model.MenuModel getExtraMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_label_get_extra_menu(cast(GtkLabel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the justification of the label.
      
      See [gtk.label.Label.setJustify].
      Returns: [gtk.types.Justification]
  */
  gtk.types.Justification getJustify()
  {
    GtkJustification _cretval;
    _cretval = gtk_label_get_justify(cast(GtkLabel*)this._cPtr);
    gtk.types.Justification _retval = cast(gtk.types.Justification)_cretval;
    return _retval;
  }

  /**
      Fetches the text from a label.
      
      The returned text includes any embedded underlines indicating
      mnemonics and Pango markup. (See [gtk.label.Label.getText]).
      Returns: the text of the label widget. This string is
          owned by the widget and must not be modified or freed.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_label(cast(GtkLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the [pango.layout.Layout] used to display the label.
      
      The layout is useful to e.g. convert text positions to pixel
      positions, in combination with [gtk.label.Label.getLayoutOffsets].
      The returned layout is owned by the label so need not be
      freed by the caller. The label is free to recreate its layout
      at any time, so it should be considered read-only.
      Returns: the [pango.layout.Layout] for this label
  */
  pango.layout.Layout getLayout()
  {
    PangoLayout* _cretval;
    _cretval = gtk_label_get_layout(cast(GtkLabel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the coordinates where the label will draw its [pango.layout.Layout].
      
      The coordinates are useful to convert mouse events into coordinates
      inside the [pango.layout.Layout], e.g. to take some action if some part
      of the label is clicked. Remember when using the [pango.layout.Layout]
      functions you need to convert to and from pixels using PANGO_PIXELS()
      or [pango.types.SCALE].
  
      Params:
        x = location to store X offset of layout
        y = location to store Y offset of layout
  */
  void getLayoutOffsets(out int x, out int y)
  {
    gtk_label_get_layout_offsets(cast(GtkLabel*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Gets the number of lines to which an ellipsized, wrapping
      label should be limited.
      
      See [gtk.label.Label.setLines].
      Returns: The number of lines
  */
  int getLines()
  {
    int _retval;
    _retval = gtk_label_get_lines(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the desired maximum width of label, in characters.
      
      See [gtk.label.Label.setWidthChars].
      Returns: the maximum width of the label in characters.
  */
  int getMaxWidthChars()
  {
    int _retval;
    _retval = gtk_label_get_max_width_chars(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Return the mnemonic accelerator.
      
      If the label has been set so that it has a mnemonic key this function
      returns the keyval used for the mnemonic accelerator. If there is no
      mnemonic set up it returns `GDK_KEY_VoidSymbol`.
      Returns: GDK keyval usable for accelerators, or `GDK_KEY_VoidSymbol`
  */
  uint getMnemonicKeyval()
  {
    uint _retval;
    _retval = gtk_label_get_mnemonic_keyval(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the target of the mnemonic (keyboard shortcut) of this
      label.
      
      See [gtk.label.Label.setMnemonicWidget].
      Returns: the target of the label’s mnemonic,
          or null if none has been set and the default algorithm will be used.
  */
  gtk.widget.Widget getMnemonicWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_label_get_mnemonic_widget(cast(GtkLabel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns line wrap mode used by the label.
      
      See [gtk.label.Label.setNaturalWrapMode].
      Returns: the natural line wrap mode
  */
  gtk.types.NaturalWrapMode getNaturalWrapMode()
  {
    GtkNaturalWrapMode _cretval;
    _cretval = gtk_label_get_natural_wrap_mode(cast(GtkLabel*)this._cPtr);
    gtk.types.NaturalWrapMode _retval = cast(gtk.types.NaturalWrapMode)_cretval;
    return _retval;
  }

  /**
      Returns whether the label is selectable.
      Returns: true if the user can copy text from the label
  */
  bool getSelectable()
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_selectable(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the selected range of characters in the label.
  
      Params:
        start = return location for start of selection, as a character offset
        end = return location for end of selection, as a character offset
      Returns: true if selection is non-empty
  */
  bool getSelectionBounds(out int start, out int end)
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_selection_bounds(cast(GtkLabel*)this._cPtr, cast(int*)&start, cast(int*)&end);
    return _retval;
  }

  /**
      Returns whether the label is in single line mode.
      Returns: true when the label is in single line mode.
  */
  bool getSingleLineMode()
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_single_line_mode(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tabs for self.
      
      The returned array will be null if “standard” (8-space) tabs are used.
      Free the return value with [pango.tab_array.TabArray.free].
      Returns: copy of default tab array,
          or null if standard tabs are used; must be freed with
          [pango.tab_array.TabArray.free].
  */
  pango.tab_array.TabArray getTabs()
  {
    PangoTabArray* _cretval;
    _cretval = gtk_label_get_tabs(cast(GtkLabel*)this._cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Fetches the text from a label.
      
      The returned text is as it appears on screen. This does not include
      any embedded underlines indicating mnemonics or Pango markup. (See
      [gtk.label.Label.getLabel])
      Returns: the text in the label widget. This is the internal
          string used by the label, and must not be modified.
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_text(cast(GtkLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the label’s text is interpreted as Pango markup.
      
      See [gtk.label.Label.setUseMarkup].
      Returns: true if the label’s text will be parsed for markup.
  */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_use_markup(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether an embedded underlines in the label indicate mnemonics.
      
      See [gtk.label.Label.setUseUnderline].
      Returns: true whether an embedded underline in the label indicates
          the mnemonic accelerator keys.
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_use_underline(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the desired width of label, in characters.
      
      See [gtk.label.Label.setWidthChars].
      Returns: the width of the label in characters.
  */
  int getWidthChars()
  {
    int _retval;
    _retval = gtk_label_get_width_chars(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether lines in the label are automatically wrapped.
      
      See [gtk.label.Label.setWrap].
      Returns: true if the lines of the label are automatically wrapped.
  */
  bool getWrap()
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_wrap(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Returns line wrap mode used by the label.
      
      See [gtk.label.Label.setWrapMode].
      Returns: the line wrap mode
  */
  pango.types.WrapMode getWrapMode()
  {
    PangoWrapMode _cretval;
    _cretval = gtk_label_get_wrap_mode(cast(GtkLabel*)this._cPtr);
    pango.types.WrapMode _retval = cast(pango.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Gets the `xalign` of the label.
      
      See the [gtk.label.Label.xalign] property.
      Returns: the xalign property
  */
  float getXalign()
  {
    float _retval;
    _retval = gtk_label_get_xalign(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `yalign` of the label.
      
      See the [gtk.label.Label.yalign] property.
      Returns: the yalign property
  */
  float getYalign()
  {
    float _retval;
    _retval = gtk_label_get_yalign(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Selects a range of characters in the label, if the label is selectable.
      
      See [gtk.label.Label.setSelectable]. If the label is not selectable,
      this function has no effect. If start_offset or
      end_offset are -1, then the end of the label will be substituted.
  
      Params:
        startOffset = start offset (in characters not bytes)
        endOffset = end offset (in characters not bytes)
  */
  void selectRegion(int startOffset, int endOffset)
  {
    gtk_label_select_region(cast(GtkLabel*)this._cPtr, startOffset, endOffset);
  }

  /**
      Apply attributes to the label text.
      
      The attributes set with this function will be applied and merged with
      any other attributes previously effected by way of the
      `propertyGtk.Label:use-underline` or `propertyGtk.Label:use-markup`
      properties. While it is not recommended to mix markup strings with
      manually set attributes, if you must; know that the attributes will
      be applied to the label after the markup string is parsed.
  
      Params:
        attrs = a [pango.attr_list.AttrList]
  */
  void setAttributes(pango.attr_list.AttrList attrs = null)
  {
    gtk_label_set_attributes(cast(GtkLabel*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Sets the mode used to ellipsize the text.
      
      The text will be ellipsized if there is not enough space
      to render the entire string.
  
      Params:
        mode = a [pango.types.EllipsizeMode]
  */
  void setEllipsize(pango.types.EllipsizeMode mode)
  {
    gtk_label_set_ellipsize(cast(GtkLabel*)this._cPtr, mode);
  }

  /**
      Sets a menu model to add when constructing
      the context menu for label.
  
      Params:
        model = a [gio.menu_model.MenuModel]
  */
  void setExtraMenu(gio.menu_model.MenuModel model = null)
  {
    gtk_label_set_extra_menu(cast(GtkLabel*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets the alignment of the lines in the text of the label relative to
      each other.
      
      [gtk.types.Justification.Left] is the default value when the widget is first created
      with [gtk.label.Label.new_]. If you instead want to set the alignment of
      the label as a whole, use [gtk.widget.Widget.setHalign] instead.
      [gtk.label.Label.setJustify] has no effect on labels containing
      only a single line.
  
      Params:
        jtype = a [gtk.types.Justification]
  */
  void setJustify(gtk.types.Justification jtype)
  {
    gtk_label_set_justify(cast(GtkLabel*)this._cPtr, jtype);
  }

  /**
      Sets the text of the label.
      
      The label is interpreted as including embedded underlines and/or Pango
      markup depending on the values of the `propertyGtk.Label:use-underline`
      and `propertyGtk.Label:use-markup` properties.
  
      Params:
        str = the new text to set for the label
  */
  void setLabel(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_label(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets the number of lines to which an ellipsized, wrapping label
      should be limited.
      
      This has no effect if the label is not wrapping or ellipsized.
      Set this to -1 if you don’t want to limit the number of lines.
  
      Params:
        lines = the desired number of lines, or -1
  */
  void setLines(int lines)
  {
    gtk_label_set_lines(cast(GtkLabel*)this._cPtr, lines);
  }

  /**
      Sets the labels text and attributes from markup.
      
      The string must be marked up with Pango markup
      (see `funcPango.parse_markup`).
      
      If the str is external data, you may need to escape it
      with [glib.global.markupEscapeText] or [glib.global.markupPrintfEscaped]:
      
      ```c
      GtkWidget *self = gtk_label_new (NULL);
      const char *str = "...";
      const char *format = "<span style=\"italic\">\%s</span>";
      char *markup;
      
      markup = g_markup_printf_escaped (format, str);
      gtk_label_set_markup (GTK_LABEL (self), markup);
      g_free (markup);
      ```
      
      This function will set the `propertyGtk.Label:use-markup` property
      to true as a side effect.
      
      If you set the label contents using the [gtk.label.Label.label]
      property you should also ensure that you set the
      `propertyGtk.Label:use-markup` property accordingly.
      
      See also: [gtk.label.Label.setText]
  
      Params:
        str = a markup string
  */
  void setMarkup(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_markup(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets the labels text, attributes and mnemonic from markup.
      
      Parses str which is marked up with Pango markup (see `funcPango.parse_markup`),
      setting the label’s text and attribute list based on the parse results.
      If characters in str are preceded by an underscore, they are underlined
      indicating that they represent a keyboard accelerator called a mnemonic.
      
      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [gtk.label.Label.setMnemonicWidget].
  
      Params:
        str = a markup string
  */
  void setMarkupWithMnemonic(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_markup_with_mnemonic(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets the desired maximum width in characters of label to n_chars.
  
      Params:
        nChars = the new desired maximum width, in characters.
  */
  void setMaxWidthChars(int nChars)
  {
    gtk_label_set_max_width_chars(cast(GtkLabel*)this._cPtr, nChars);
  }

  /**
      Associate the label with its mnemonic target.
      
      If the label has been set so that it has a mnemonic key (using
      i.e. [gtk.label.Label.setMarkupWithMnemonic],
      [gtk.label.Label.setTextWithMnemonic],
      [gtk.label.Label.newWithMnemonic]
      or the `propertyGtk.Label:use_underline` property) the label can be
      associated with a widget that is the target of the mnemonic. When the
      label is inside a widget (like a [gtk.button.Button] or a
      [gtk.notebook.Notebook] tab) it is automatically associated with the correct
      widget, but sometimes (i.e. when the target is a [gtk.entry.Entry] next to
      the label) you need to set it explicitly using this function.
      
      The target widget will be accelerated by emitting the
      `signalGtk.Widget::mnemonic-activate` signal on it. The default handler for
      this signal will activate the widget if there are no mnemonic collisions
      and toggle focus between the colliding widgets otherwise.
  
      Params:
        widget = the target [gtk.widget.Widget], or null to unset
  */
  void setMnemonicWidget(gtk.widget.Widget widget = null)
  {
    gtk_label_set_mnemonic_widget(cast(GtkLabel*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Select the line wrapping for the natural size request.
      
      This only affects the natural size requested, for the actual wrapping used,
      see the [gtk.label.Label.wrap] property.
  
      Params:
        wrapMode = the line wrapping mode
  */
  void setNaturalWrapMode(gtk.types.NaturalWrapMode wrapMode)
  {
    gtk_label_set_natural_wrap_mode(cast(GtkLabel*)this._cPtr, wrapMode);
  }

  /**
      Makes text in the label selectable.
      
      Selectable labels allow the user to select text from the label,
      for copy-and-paste.
  
      Params:
        setting = true to allow selecting text in the label
  */
  void setSelectable(bool setting)
  {
    gtk_label_set_selectable(cast(GtkLabel*)this._cPtr, setting);
  }

  /**
      Sets whether the label is in single line mode.
  
      Params:
        singleLineMode = true if the label should be in single line mode
  */
  void setSingleLineMode(bool singleLineMode)
  {
    gtk_label_set_single_line_mode(cast(GtkLabel*)this._cPtr, singleLineMode);
  }

  /**
      Sets the default tab stops for paragraphs in self.
  
      Params:
        tabs = tabs as a [pango.tab_array.TabArray]
  */
  void setTabs(pango.tab_array.TabArray tabs = null)
  {
    gtk_label_set_tabs(cast(GtkLabel*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets the text within the [gtk.label.Label] widget.
      
      It overwrites any text that was there before.
      
      This function will clear any previously set mnemonic accelerators,
      and set the `propertyGtk.Label:use-underline` property to false as
      a side effect.
      
      This function will set the `propertyGtk.Label:use-markup` property
      to false as a side effect.
      
      See also: [gtk.label.Label.setMarkup]
  
      Params:
        str = The text you want to set
  */
  void setText(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_text(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets the label’s text from the string str.
      
      If characters in str are preceded by an underscore, they are underlined
      indicating that they represent a keyboard accelerator called a mnemonic.
      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [gtk.label.Label.setMnemonicWidget].
  
      Params:
        str = a string
  */
  void setTextWithMnemonic(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_label_set_text_with_mnemonic(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets whether the text of the label contains markup.
      
      See [gtk.label.Label.setMarkup].
  
      Params:
        setting = true if the label’s text should be parsed for markup.
  */
  void setUseMarkup(bool setting)
  {
    gtk_label_set_use_markup(cast(GtkLabel*)this._cPtr, setting);
  }

  /**
      Sets whether underlines in the text indicate mnemonics.
  
      Params:
        setting = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool setting)
  {
    gtk_label_set_use_underline(cast(GtkLabel*)this._cPtr, setting);
  }

  /**
      Sets the desired width in characters of label to n_chars.
  
      Params:
        nChars = the new desired width, in characters.
  */
  void setWidthChars(int nChars)
  {
    gtk_label_set_width_chars(cast(GtkLabel*)this._cPtr, nChars);
  }

  /**
      Toggles line wrapping within the [gtk.label.Label] widget.
      
      true makes it break lines if text exceeds the widget’s size.
      false lets the text get cut off by the edge of the widget if
      it exceeds the widget size.
      
      Note that setting line wrapping to true does not make the label
      wrap at its parent container’s width, because GTK widgets
      conceptually can’t make their requisition depend on the parent
      container’s size. For a label that wraps at a specific position,
      set the label’s width using [gtk.widget.Widget.setSizeRequest].
  
      Params:
        wrap = the setting
  */
  void setWrap(bool wrap)
  {
    gtk_label_set_wrap(cast(GtkLabel*)this._cPtr, wrap);
  }

  /**
      Controls how line wrapping is done.
      
      This only affects the label if line wrapping is on. (See
      [gtk.label.Label.setWrap]) The default is [pango.types.WrapMode.Word]
      which means wrap on word boundaries.
      
      For sizing behavior, also consider the `propertyGtk.Label:natural-wrap-mode`
      property.
  
      Params:
        wrapMode = the line wrapping mode
  */
  void setWrapMode(pango.types.WrapMode wrapMode)
  {
    gtk_label_set_wrap_mode(cast(GtkLabel*)this._cPtr, wrapMode);
  }

  /**
      Sets the `xalign` of the label.
      
      See the [gtk.label.Label.xalign] property.
  
      Params:
        xalign = the new xalign value, between 0 and 1
  */
  void setXalign(float xalign)
  {
    gtk_label_set_xalign(cast(GtkLabel*)this._cPtr, xalign);
  }

  /**
      Sets the `yalign` of the label.
      
      See the [gtk.label.Label.yalign] property.
  
      Params:
        yalign = the new yalign value, between 0 and 1
  */
  void setYalign(float yalign)
  {
    gtk_label_set_yalign(cast(GtkLabel*)this._cPtr, yalign);
  }

  /**
      Connect to `ActivateCurrentLink` signal.
  
      Gets emitted when the user activates a link in the label.
      
      The ::activate-current-link is a [keybinding signal](class.SignalAction.html).
      
      Applications may also emit the signal with [gobject.global.signalEmitByName]
      if they need to control activation of URIs programmatically.
      
      The default bindings for this signal are all forms of the <kbd>Enter</kbd> key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.label.Label label))
  
          `label` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateCurrentLink(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.label.Label)))
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
    return connectSignalClosure("activate-current-link", closure, after);
  }

  /**
      Connect to `ActivateLink` signal.
  
      Gets emitted to activate a URI.
      
      Applications may connect to it to override the default behaviour,
      which is to call [gtk.file_launcher.FileLauncher.launch].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(string uri, gtk.label.Label label))
  
          `uri` the URI that is activated (optional)
  
          `label` the instance the signal is connected to (optional)
  
          `Returns` true if the link has been activated
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateLink(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.label.Label)))
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
    return connectSignalClosure("activate-link", closure, after);
  }

  /**
      Connect to `CopyClipboard` signal.
  
      Gets emitted to copy the selection to the clipboard.
      
      The ::copy-clipboard signal is a [keybinding signal](class.SignalAction.html).
      
      The default binding for this signal is <kbd>Ctrl</kbd>+<kbd>c</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.label.Label label))
  
          `label` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.label.Label)))
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
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      Gets emitted when the user initiates a cursor movement.
      
      The ::move-cursor signal is a [keybinding signal](class.SignalAction.html).
      If the cursor is not visible in entry, this signal causes the viewport to
      be moved instead.
      
      Applications should not connect to it, but may emit it with
      [gobject.global.signalEmitByName] if they need to control the cursor
      programmatically.
      
      The default bindings for this signal come in two variants,
      the variant with the Shift modifier extends the selection,
      the variant without the Shift modifier does not.
      There are too many key combinations to list them all here.
      
      $(LIST
        * <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
          move by individual characters/lines
        * <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
        * <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer
      )
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.MovementStep step, int count, bool extendSelection, gtk.label.Label label))
  
          `step` the granularity of the move, as a [gtk.types.MovementStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `label` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.label.Label)))
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
    return connectSignalClosure("move-cursor", closure, after);
  }
}
