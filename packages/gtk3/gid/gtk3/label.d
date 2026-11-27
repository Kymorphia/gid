/// Module for [Label] class
module gid.gtk3.label;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.menu;
import gid.gtk3.misc;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.pango1.attr_list;
import gid.pango1.layout;
import gid.pango1.types;

/**
    The #GtkLabel widget displays a small amount of text. As the name
    implies, most labels are used to label another widget such as a
    #GtkButton, a #GtkMenuItem, or a #GtkComboBox.
    
    # CSS nodes
    
    ```plain
    label
    ├── [selection]
    ├── [link]
    ┊
    ╰── [link]
    ```
    
    GtkLabel has a single CSS node with the name label. A wide variety
    of style classes may be applied to labels, such as .title, .subtitle,
    .dim-label, etc. In the #GtkShortcutsWindow, labels are used wth the
    .keycap style class.
    
    If the label has a selection, it gets a subnode with name selection.
    
    If the label has links, there is one subnode per link. These subnodes
    carry the link or visited state depending on whether they have been
    visited.
    
    # GtkLabel as GtkBuildable
    
    The GtkLabel implementation of the GtkBuildable interface supports a
    custom `<attributes>` element, which supports any number of `<attribute>`
    elements. The `<attribute>` element has attributes named “name“, “value“,
    “start“ and “end“ and allows you to specify #PangoAttribute values for
    this label.
    
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
    
    # Mnemonics
    
    Labels may contain “mnemonics”. Mnemonics are
    underlined characters in the label, used for keyboard navigation.
    Mnemonics are created by providing a string with an underscore before
    the mnemonic character, such as `"_File"`, to the
    functions [gid.gtk4.label.Label.newWithMnemonic] or
    [gid.gtk4.label.Label.setTextWithMnemonic].
    
    Mnemonics automatically activate any activatable widget the label is
    inside, such as a #GtkButton; if the label is not inside the
    mnemonic’s target widget, you have to tell the label about the target
    using [gid.gtk4.label.Label.setMnemonicWidget]. Here’s a simple example where
    the label is inside a button:
    
    ```c
      // Pressing Alt+H will activate this button
      GtkWidget *button = gtk_button_new ();
      GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
      gtk_container_add (GTK_CONTAINER (button), label);
    ```
    
    There’s a convenience function to create buttons with a mnemonic label
    already inside:
    
    ```c
      // Pressing Alt+H will activate this button
      GtkWidget *button = gtk_button_new_with_mnemonic ("_Hello");
    ```
    
    To create a mnemonic for a widget alongside the label, such as a
    #GtkEntry, you have to point the label at the entry with
    [gid.gtk4.label.Label.setMnemonicWidget]:
    
    ```c
      // Pressing Alt+H will focus the entry
      GtkWidget *entry = gtk_entry_new ();
      GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
      gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
    ```
    
    # Markup (styled text)
    
    To make it easy to format text in a label (changing colors,
    fonts, etc.), label text can be provided in a simple
    [markup format][PangoMarkupFormat].
    
    Here’s how to create a label with a small font:
    ```c
      GtkWidget *label = gtk_label_new (NULL);
      gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");
    ```
    
    (See [complete documentation][PangoMarkupFormat] of available
    tags in the Pango manual.)
    
    The markup passed to [gid.gtk4.label.Label.setMarkup] must be valid; for example,
    literal <, > and & characters must be escaped as &lt;, &gt;, and &amp;.
    If you pass text obtained from the user, file, or a network to
    [gid.gtk4.label.Label.setMarkup], you’ll want to escape it with
    [gid.glib2.global.markupEscapeText] or [gid.glib2.global.markupPrintfEscaped].
    
    Markup strings are just a convenient way to set the #PangoAttrList on
    a label; [gid.gtk4.label.Label.setAttributes] may be a simpler way to set
    attributes in some cases. Be careful though; #PangoAttrList tends to
    cause internationalization problems, unless you’re applying attributes
    to the entire string (i.e. unless you set the range of each attribute
    to [0, `G_MAXINT`)). The reason is that specifying the start_index and
    end_index for a #PangoAttribute requires knowledge of the exact string
    being displayed, so translations will cause problems.
    
    # Selectable labels
    
    Labels can be made selectable with [gid.gtk4.label.Label.setSelectable].
    Selectable labels allow the user to copy the label contents to
    the clipboard. Only labels that contain useful-to-copy information
    — such as error messages — should be made selectable.
    
    # Text layout # {#label-text-layout}
    
    A label can contain any number of paragraphs, but will have
    performance problems if it contains more than a small number.
    Paragraphs are separated by newlines or other paragraph separators
    understood by Pango.
    
    Labels can automatically wrap text if you call
    [gid.gtk3.label.Label.setLineWrap].
    
    [gid.gtk4.label.Label.setJustify] sets how the lines in a label align
    with one another. If you want to set how the label as a whole
    aligns in its available space, see the #GtkWidget:halign and
    #GtkWidget:valign properties.
    
    The #GtkLabel:width-chars and #GtkLabel:max-width-chars properties
    can be used to control the size allocation of ellipsized or wrapped
    labels. For ellipsizing labels, if either is specified (and less
    than the actual text size), it is used as the minimum width, and the actual
    text size is used as the natural width of the label. For wrapping labels,
    width-chars is used as the minimum width, if specified, and max-width-chars
    is used as the natural width. Even if max-width-chars specified, wrapping
    labels will be rewrapped to use all of the available width.
    
    Note that the interpretation of #GtkLabel:width-chars and
    #GtkLabel:max-width-chars has changed a bit with the introduction of
    [width-for-height geometry management.][geometry-management]
    
    # Links
    
    Since 2.18, GTK+ supports markup for clickable hyperlinks in addition
    to regular Pango markup. The markup for links is borrowed from HTML,
    using the `<a>` with “href“ and “title“ attributes. GTK+ renders links
    similar to the way they appear in web browsers, with colored, underlined
    text. The “title“ attribute is displayed as a tooltip on the link.
    
    An example looks like this:
    
    ```c
    const gchar *text =
    "Go to the"
    "<a href=\"http://www.gtk.org title=\"&lt;i&gt;Our&lt;/i&gt; website\">"
    "GTK+ website</a> for more...";
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), text);
    ```
    
    It is possible to implement custom handling for links and their tooltips with
    the #GtkLabel::activate-link signal and the [gid.gtk4.label.Label.getCurrentUri] function.
*/
@gidGir("Label", "LabelClass")
class Label : gid.gtk3.misc.Misc
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_label_get_type != &gidSymbolNotFound ? gtk_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLabel";
  }

  /** Returns `this`, for use in `with` statements. */
  override Label self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.label.Label]
      Returns: New builder object
  */
  static LabelGidBuilder builder() nothrow
  {
    return new LabelGidBuilder;
  }

  /**
      Get `angle` property.
      Returns: The angle that the baseline of the label makes with the horizontal,
        in degrees, measured counterclockwise. An angle of 90 reads from
        from bottom to top, an angle of 270, from top to bottom. Ignored
        if the label is selectable.
  */
  @property double angle() nothrow
  {
    return getAngle();
  }

  /**
      Set `angle` property.
      Params:
        propval = The angle that the baseline of the label makes with the horizontal,
          in degrees, measured counterclockwise. An angle of 90 reads from
          from bottom to top, an angle of 270, from top to bottom. Ignored
          if the label is selectable.
  */
  @property void angle(double propval) nothrow
  {
    setAngle(propval);
  }

  /** */
  @property gid.pango1.attr_list.AttrList attributes() nothrow
  {
    return getAttributes();
  }

  /** */
  @property void attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    setAttributes(propval);
  }

  /** */
  @property int cursorPosition() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("cursor-position");
  }

  /**
      Get `ellipsize` property.
      Returns: The preferred place to ellipsize the string, if the label does
        not have enough room to display the entire string, specified as a
        #PangoEllipsizeMode.
        
        Note that setting this property to a value other than
        [gid.pango1.types.EllipsizeMode.None] has the side-effect that the label requests
        only enough space to display the ellipsis "...". In particular, this
        means that ellipsizing labels do not work well in notebook tabs, unless
        the #GtkNotebook tab-expand child property is set to true. Other ways
        to set a label's width are [gid.gtk4.widget.Widget.setSizeRequest] and
        [gid.gtk4.label.Label.setWidthChars].
  */
  @property gid.pango1.types.EllipsizeMode ellipsize() nothrow
  {
    return getEllipsize();
  }

  /**
      Set `ellipsize` property.
      Params:
        propval = The preferred place to ellipsize the string, if the label does
          not have enough room to display the entire string, specified as a
          #PangoEllipsizeMode.
          
          Note that setting this property to a value other than
          [gid.pango1.types.EllipsizeMode.None] has the side-effect that the label requests
          only enough space to display the ellipsis "...". In particular, this
          means that ellipsizing labels do not work well in notebook tabs, unless
          the #GtkNotebook tab-expand child property is set to true. Other ways
          to set a label's width are [gid.gtk4.widget.Widget.setSizeRequest] and
          [gid.gtk4.label.Label.setWidthChars].
  */
  @property void ellipsize(gid.pango1.types.EllipsizeMode propval) nothrow
  {
    setEllipsize(propval);
  }

  /** */
  @property gid.gtk3.types.Justification justify() nothrow
  {
    return getJustify();
  }

  /** */
  @property void justify(gid.gtk3.types.Justification propval) nothrow
  {
    setJustify(propval);
  }

  /**
      Get `label` property.
      Returns: The contents of the label.
        
        If the string contains [Pango XML markup][PangoMarkupFormat], you will
        have to set the #GtkLabel:use-markup property to true in order for the
        label to display the markup attributes. See also [gid.gtk4.label.Label.setMarkup]
        for a convenience function that sets both this property and the
        #GtkLabel:use-markup property at the same time.
        
        If the string contains underlines acting as mnemonics, you will have to
        set the #GtkLabel:use-underline property to true in order for the label
        to display them.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The contents of the label.
          
          If the string contains [Pango XML markup][PangoMarkupFormat], you will
          have to set the #GtkLabel:use-markup property to true in order for the
          label to display the markup attributes. See also [gid.gtk4.label.Label.setMarkup]
          for a convenience function that sets both this property and the
          #GtkLabel:use-markup property at the same time.
          
          If the string contains underlines acting as mnemonics, you will have to
          set the #GtkLabel:use-underline property to true in order for the label
          to display them.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `lines` property.
      Returns: The number of lines to which an ellipsized, wrapping label
        should be limited. This property has no effect if the
        label is not wrapping or ellipsized. Set this property to
        -1 if you don't want to limit the number of lines.
  */
  @property int lines() nothrow
  {
    return getLines();
  }

  /**
      Set `lines` property.
      Params:
        propval = The number of lines to which an ellipsized, wrapping label
          should be limited. This property has no effect if the
          label is not wrapping or ellipsized. Set this property to
          -1 if you don't want to limit the number of lines.
  */
  @property void lines(int propval) nothrow
  {
    setLines(propval);
  }

  /**
      Get `maxWidthChars` property.
      Returns: The desired maximum width of the label, in characters. If this property
        is set to -1, the width will be calculated automatically.
        
        See the section on [text layout][label-text-layout]
        for details of how #GtkLabel:width-chars and #GtkLabel:max-width-chars
        determine the width of ellipsized and wrapped labels.
  */
  @property int maxWidthChars() nothrow
  {
    return getMaxWidthChars();
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the label, in characters. If this property
          is set to -1, the width will be calculated automatically.
          
          See the section on [text layout][label-text-layout]
          for details of how #GtkLabel:width-chars and #GtkLabel:max-width-chars
          determine the width of ellipsized and wrapped labels.
  */
  @property void maxWidthChars(int propval) nothrow
  {
    setMaxWidthChars(propval);
  }

  /** */
  @property uint mnemonicKeyval() nothrow
  {
    return getMnemonicKeyval();
  }

  /** */
  @property gid.gtk3.widget.Widget mnemonicWidget() nothrow
  {
    return getMnemonicWidget();
  }

  /** */
  @property void mnemonicWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    setMnemonicWidget(propval);
  }

  /** */
  @property void pattern(string propval) nothrow
  {
    setPattern(propval);
  }

  /** */
  @property bool selectable() nothrow
  {
    return getSelectable();
  }

  /** */
  @property void selectable(bool propval) nothrow
  {
    setSelectable(propval);
  }

  /** */
  @property int selectionBound() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("selection-bound");
  }

  /**
      Get `singleLineMode` property.
      Returns: Whether the label is in single line mode. In single line mode,
        the height of the label does not depend on the actual text, it
        is always set to ascent + descent of the font. This can be an
        advantage in situations where resizing the label because of text
        changes would be distracting, e.g. in a statusbar.
  */
  @property bool singleLineMode() nothrow
  {
    return getSingleLineMode();
  }

  /**
      Set `singleLineMode` property.
      Params:
        propval = Whether the label is in single line mode. In single line mode,
          the height of the label does not depend on the actual text, it
          is always set to ascent + descent of the font. This can be an
          advantage in situations where resizing the label because of text
          changes would be distracting, e.g. in a statusbar.
  */
  @property void singleLineMode(bool propval) nothrow
  {
    setSingleLineMode(propval);
  }

  /**
      Get `trackVisitedLinks` property.
      Returns: Set this property to true to make the label track which links
        have been visited. It will then apply the #GTK_STATE_FLAG_VISITED
        when rendering this link, in addition to #GTK_STATE_FLAG_LINK.
  */
  @property bool trackVisitedLinks() nothrow
  {
    return getTrackVisitedLinks();
  }

  /**
      Set `trackVisitedLinks` property.
      Params:
        propval = Set this property to true to make the label track which links
          have been visited. It will then apply the #GTK_STATE_FLAG_VISITED
          when rendering this link, in addition to #GTK_STATE_FLAG_LINK.
  */
  @property void trackVisitedLinks(bool propval) nothrow
  {
    setTrackVisitedLinks(propval);
  }

  /** */
  @property bool useMarkup() nothrow
  {
    return getUseMarkup();
  }

  /** */
  @property void useMarkup(bool propval) nothrow
  {
    setUseMarkup(propval);
  }

  /** */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /** */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Get `widthChars` property.
      Returns: The desired width of the label, in characters. If this property is set to
        -1, the width will be calculated automatically.
        
        See the section on [text layout][label-text-layout]
        for details of how #GtkLabel:width-chars and #GtkLabel:max-width-chars
        determine the width of ellipsized and wrapped labels.
  */
  @property int widthChars() nothrow
  {
    return getWidthChars();
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The desired width of the label, in characters. If this property is set to
          -1, the width will be calculated automatically.
          
          See the section on [text layout][label-text-layout]
          for details of how #GtkLabel:width-chars and #GtkLabel:max-width-chars
          determine the width of ellipsized and wrapped labels.
  */
  @property void widthChars(int propval) nothrow
  {
    setWidthChars(propval);
  }

  /** */
  @property bool wrap() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("wrap");
  }

  /** */
  @property void wrap(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("wrap", propval);
  }

  /**
      Get `wrapMode` property.
      Returns: If line wrapping is on (see the #GtkLabel:wrap property) this controls
        how the line wrapping is done. The default is [gid.pango1.types.WrapMode.Word], which
        means wrap on word boundaries.
  */
  @property gid.pango1.types.WrapMode wrapMode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.WrapMode)("wrap-mode");
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = If line wrapping is on (see the #GtkLabel:wrap property) this controls
          how the line wrapping is done. The default is [gid.pango1.types.WrapMode.Word], which
          means wrap on word boundaries.
  */
  @property void wrapMode(gid.pango1.types.WrapMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.WrapMode)("wrap-mode", propval);
  }

  /**
      Get `xalign` property.
      Returns: The xalign property determines the horizontal aligment of the label text
        inside the labels size allocation. Compare this to #GtkWidget:halign,
        which determines how the labels size allocation is positioned in the
        space available for the label.
  */
  override @property float xalign() nothrow
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The xalign property determines the horizontal aligment of the label text
          inside the labels size allocation. Compare this to #GtkWidget:halign,
          which determines how the labels size allocation is positioned in the
          space available for the label.
  */
  override @property void xalign(float propval) nothrow
  {
    setXalign(propval);
  }

  /**
      Get `yalign` property.
      Returns: The yalign property determines the vertical aligment of the label text
        inside the labels size allocation. Compare this to #GtkWidget:valign,
        which determines how the labels size allocation is positioned in the
        space available for the label.
  */
  override @property float yalign() nothrow
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The yalign property determines the vertical aligment of the label text
          inside the labels size allocation. Compare this to #GtkWidget:valign,
          which determines how the labels size allocation is positioned in the
          space available for the label.
  */
  override @property void yalign(float propval) nothrow
  {
    setYalign(propval);
  }

  /**
      Creates a new label with the given text inside it. You can
      pass null to get an empty label widget.
  
      Params:
        str = The text of the label
      Returns: the new #GtkLabel
  */
  this(string str = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, str !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _str = str.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_label_new(_str);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkLabel, containing the text in str.
      
      If characters in str are preceded by an underscore, they are
      underlined. If you need a literal underscore character in a label, use
      '__' (two underscores). The first underlined character represents a
      keyboard accelerator called a mnemonic. The mnemonic key can be used
      to activate another widget, chosen automatically, or explicitly using
      [gid.gtk4.label.Label.setMnemonicWidget].
      
      If [gid.gtk4.label.Label.setMnemonicWidget] is not called, then the first
      activatable ancestor of the #GtkLabel will be chosen as the mnemonic
      widget. For instance, if the label is inside a button or menu item,
      the button or menu item will automatically become the mnemonic widget
      and be activated by the mnemonic.
  
      Params:
        str = The text of the label, with an underscore in front of the
                mnemonic character
      Returns: the new #GtkLabel
  */
  static gid.gtk3.label.Label newWithMnemonic(string str = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _str = str.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_label_new_with_mnemonic(_str);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.label.Label)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected bool vfuncActivateLink(string uri)
  {
    auto _klass = cast(GtkLabelClass*)_vfuncClass;
    if (!_klass.activateLink)
      return typeof(return).init;

    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.activateLink(cast(GtkLabel*)this._cPtr, _uri);
    return _retval;
  }

  /** */
  protected void vfuncCopyClipboard()
  {
    auto _klass = cast(GtkLabelClass*)_vfuncClass;
    if (!_klass.copyClipboard)
      return;

    _klass.copyClipboard(cast(GtkLabel*)this._cPtr);
  }

  /** */
  protected void vfuncMoveCursor(gid.gtk3.types.MovementStep step, int count, bool extendSelection)
  {
    auto _klass = cast(GtkLabelClass*)_vfuncClass;
    if (!_klass.moveCursor)
      return;

    _klass.moveCursor(cast(GtkLabel*)this._cPtr, step, count, extendSelection);
  }

  /** */
  protected void vfuncPopulatePopup(gid.gtk3.menu.Menu menu)
  {
    auto _klass = cast(GtkLabelClass*)_vfuncClass;
    if (!_klass.populatePopup)
      return;

    _klass.populatePopup(cast(GtkLabel*)this._cPtr, menu ? cast(GtkMenu*)menu._cPtr(No.Dup) : null);
  }

  /**
      Gets the angle of rotation for the label. See
      [gid.gtk3.label.Label.setAngle].
      Returns: the angle of rotation for the label
  */
  double getAngle() nothrow
  {
    double _retval;
    _retval = gtk_label_get_angle(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the attribute list that was set on the label using
      [gid.gtk4.label.Label.setAttributes], if any. This function does
      not reflect attributes that come from the labels markup
      (see [gid.gtk4.label.Label.setMarkup]). If you want to get the
      effective attributes for the label, use
      pango_layout_get_attribute (gtk_label_get_layout (label)).
      Returns: the attribute list, or null
            if none was set.
  */
  gid.pango1.attr_list.AttrList getAttributes() nothrow
  {
    PangoAttrList* _cretval;
    _cretval = gtk_label_get_attributes(cast(GtkLabel*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the URI for the currently active link in the label.
      The active link is the one under the mouse pointer or, in a
      selectable label, the link in which the text cursor is currently
      positioned.
      
      This function is intended for use in a #GtkLabel::activate-link handler
      or for use in a #GtkWidget::query-tooltip handler.
      Returns: the currently active URI. The string is owned by GTK+ and must
          not be freed or modified.
  */
  string getCurrentUri() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_current_uri(cast(GtkLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the ellipsizing position of the label. See [gid.gtk4.label.Label.setEllipsize].
      Returns: #PangoEllipsizeMode
  */
  gid.pango1.types.EllipsizeMode getEllipsize() nothrow
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_label_get_ellipsize(cast(GtkLabel*)this._cPtr);
    gid.pango1.types.EllipsizeMode _retval = cast(gid.pango1.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Returns the justification of the label. See [gid.gtk4.label.Label.setJustify].
      Returns: #GtkJustification
  */
  gid.gtk3.types.Justification getJustify() nothrow
  {
    GtkJustification _cretval;
    _cretval = gtk_label_get_justify(cast(GtkLabel*)this._cPtr);
    gid.gtk3.types.Justification _retval = cast(gid.gtk3.types.Justification)_cretval;
    return _retval;
  }

  /**
      Fetches the text from a label widget including any embedded
      underlines indicating mnemonics and Pango markup. (See
      [gid.gtk4.label.Label.getText]).
      Returns: the text of the label widget. This string is
          owned by the widget and must not be modified or freed.
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_label(cast(GtkLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the #PangoLayout used to display the label.
      The layout is useful to e.g. convert text positions to
      pixel positions, in combination with [gid.gtk4.label.Label.getLayoutOffsets].
      The returned layout is owned by the label so need not be
      freed by the caller. The label is free to recreate its layout at
      any time, so it should be considered read-only.
      Returns: the #PangoLayout for this label
  */
  gid.pango1.layout.Layout getLayout() nothrow
  {
    PangoLayout* _cretval;
    _cretval = gtk_label_get_layout(cast(GtkLabel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the coordinates where the label will draw the #PangoLayout
      representing the text in the label; useful to convert mouse events
      into coordinates inside the #PangoLayout, e.g. to take some action
      if some part of the label is clicked. Of course you will need to
      create a #GtkEventBox to receive the events, and pack the label
      inside it, since labels are windowless (they return false from
      [gid.gtk3.widget.Widget.getHasWindow]). Remember
      when using the #PangoLayout functions you need to convert to
      and from pixels using PANGO_PIXELS() or #PANGO_SCALE.
  
      Params:
        x = location to store X offset of layout, or null
        y = location to store Y offset of layout, or null
  */
  void getLayoutOffsets(out int x, out int y) nothrow
  {
    gtk_label_get_layout_offsets(cast(GtkLabel*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Returns whether lines in the label are automatically wrapped.
      See [gid.gtk3.label.Label.setLineWrap].
      Returns: true if the lines of the label are automatically wrapped.
  */
  bool getLineWrap() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_line_wrap(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Returns line wrap mode used by the label. See [gid.gtk3.label.Label.setLineWrapMode].
      Returns: true if the lines of the label are automatically wrapped.
  */
  gid.pango1.types.WrapMode getLineWrapMode() nothrow
  {
    PangoWrapMode _cretval;
    _cretval = gtk_label_get_line_wrap_mode(cast(GtkLabel*)this._cPtr);
    gid.pango1.types.WrapMode _retval = cast(gid.pango1.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Gets the number of lines to which an ellipsized, wrapping
      label should be limited. See [gid.gtk4.label.Label.setLines].
      Returns: The number of lines
  */
  int getLines() nothrow
  {
    int _retval;
    _retval = gtk_label_get_lines(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the desired maximum width of label, in characters. See
      [gid.gtk4.label.Label.setWidthChars].
      Returns: the maximum width of the label in characters.
  */
  int getMaxWidthChars() nothrow
  {
    int _retval;
    _retval = gtk_label_get_max_width_chars(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      If the label has been set so that it has an mnemonic key this function
      returns the keyval used for the mnemonic accelerator. If there is no
      mnemonic set up it returns #GDK_KEY_VoidSymbol.
      Returns: GDK keyval usable for accelerators, or #GDK_KEY_VoidSymbol
  */
  uint getMnemonicKeyval() nothrow
  {
    uint _retval;
    _retval = gtk_label_get_mnemonic_keyval(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the target of the mnemonic (keyboard shortcut) of this
      label. See [gid.gtk4.label.Label.setMnemonicWidget].
      Returns: the target of the label’s mnemonic,
            or null if none has been set and the default algorithm will be used.
  */
  gid.gtk3.widget.Widget getMnemonicWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_label_get_mnemonic_widget(cast(GtkLabel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.label.Label.setSelectable].
      Returns: true if the user can copy text from the label
  */
  bool getSelectable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_selectable(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the selected range of characters in the label, returning true
      if there’s a selection.
  
      Params:
        start = return location for start of selection, as a character offset
        end = return location for end of selection, as a character offset
      Returns: true if selection is non-empty
  */
  bool getSelectionBounds(out int start, out int end) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_selection_bounds(cast(GtkLabel*)this._cPtr, cast(int*)&start, cast(int*)&end);
    return _retval;
  }

  /**
      Returns whether the label is in single line mode.
      Returns: true when the label is in single line mode.
  */
  bool getSingleLineMode() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_single_line_mode(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Fetches the text from a label widget, as displayed on the
      screen. This does not include any embedded underlines
      indicating mnemonics or Pango markup. (See [gid.gtk4.label.Label.getLabel])
      Returns: the text in the label widget. This is the internal
          string used by the label, and must not be modified.
  */
  string getText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_label_get_text(cast(GtkLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the label is currently keeping track
      of clicked links.
      Returns: true if clicked links are remembered
  */
  bool getTrackVisitedLinks() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_track_visited_links(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the label’s text is interpreted as marked up with
      the [Pango text markup language][PangoMarkupFormat].
      See gtk_label_set_use_markup ().
      Returns: true if the label’s text will be parsed for markup.
  */
  bool getUseMarkup() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_use_markup(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether an embedded underline in the label indicates a
      mnemonic. See [gid.gtk4.label.Label.setUseUnderline].
      Returns: true whether an embedded underline in the label indicates
                      the mnemonic accelerator keys.
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_label_get_use_underline(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the desired width of label, in characters. See
      [gid.gtk4.label.Label.setWidthChars].
      Returns: the width of the label in characters.
  */
  int getWidthChars() nothrow
  {
    int _retval;
    _retval = gtk_label_get_width_chars(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GtkLabel:xalign property for label.
      Returns: the xalign property
  */
  float getXalign() nothrow
  {
    float _retval;
    _retval = gtk_label_get_xalign(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GtkLabel:yalign property for label.
      Returns: the yalign property
  */
  float getYalign() nothrow
  {
    float _retval;
    _retval = gtk_label_get_yalign(cast(GtkLabel*)this._cPtr);
    return _retval;
  }

  /**
      Selects a range of characters in the label, if the label is selectable.
      See [gid.gtk4.label.Label.setSelectable]. If the label is not selectable,
      this function has no effect. If start_offset or
      end_offset are -1, then the end of the label will be substituted.
  
      Params:
        startOffset = start offset (in characters not bytes)
        endOffset = end offset (in characters not bytes)
  */
  void selectRegion(int startOffset, int endOffset) nothrow
  {
    gtk_label_select_region(cast(GtkLabel*)this._cPtr, startOffset, endOffset);
  }

  /**
      Sets the angle of rotation for the label. An angle of 90 reads from
      from bottom to top, an angle of 270, from top to bottom. The angle
      setting for the label is ignored if the label is selectable,
      wrapped, or ellipsized.
  
      Params:
        angle = the angle that the baseline of the label makes with
            the horizontal, in degrees, measured counterclockwise
  */
  void setAngle(double angle) nothrow
  {
    gtk_label_set_angle(cast(GtkLabel*)this._cPtr, angle);
  }

  /**
      Sets a #PangoAttrList; the attributes in the list are applied to the
      label text.
      
      The attributes set with this function will be applied
      and merged with any other attributes previously effected by way
      of the #GtkLabel:use-underline or #GtkLabel:use-markup properties.
      While it is not recommended to mix markup strings with manually set
      attributes, if you must; know that the attributes will be applied
      to the label after the markup string is parsed.
  
      Params:
        attrs = a #PangoAttrList, or null
  */
  void setAttributes(gid.pango1.attr_list.AttrList attrs = null) nothrow
  {
    gtk_label_set_attributes(cast(GtkLabel*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Sets the mode used to ellipsize (add an ellipsis: "...") to the text
      if there is not enough space to render the entire string.
  
      Params:
        mode = a #PangoEllipsizeMode
  */
  void setEllipsize(gid.pango1.types.EllipsizeMode mode) nothrow
  {
    gtk_label_set_ellipsize(cast(GtkLabel*)this._cPtr, mode);
  }

  /**
      Sets the alignment of the lines in the text of the label relative to
      each other. [gid.gtk4.types.Justification.Left] is the default value when the widget is
      first created with [gid.gtk4.label.Label.new_]. If you instead want to set the
      alignment of the label as a whole, use [gid.gtk4.widget.Widget.setHalign] instead.
      [gid.gtk4.label.Label.setJustify] has no effect on labels containing only a
      single line.
  
      Params:
        jtype = a #GtkJustification
  */
  void setJustify(gid.gtk3.types.Justification jtype) nothrow
  {
    gtk_label_set_justify(cast(GtkLabel*)this._cPtr, jtype);
  }

  /**
      Sets the text of the label. The label is interpreted as
      including embedded underlines and/or Pango markup depending
      on the values of the #GtkLabel:use-underline and
      #GtkLabel:use-markup properties.
  
      Params:
        str = the new text to set for the label
  */
  void setLabel(string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    gtk_label_set_label(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Toggles line wrapping within the #GtkLabel widget. true makes it break
      lines if text exceeds the widget’s size. false lets the text get cut off
      by the edge of the widget if it exceeds the widget size.
      
      Note that setting line wrapping to true does not make the label
      wrap at its parent container’s width, because GTK+ widgets
      conceptually can’t make their requisition depend on the parent
      container’s size. For a label that wraps at a specific position,
      set the label’s width using [gid.gtk4.widget.Widget.setSizeRequest].
  
      Params:
        wrap = the setting
  */
  void setLineWrap(bool wrap) nothrow
  {
    gtk_label_set_line_wrap(cast(GtkLabel*)this._cPtr, wrap);
  }

  /**
      If line wrapping is on (see [gid.gtk3.label.Label.setLineWrap]) this controls how
      the line wrapping is done. The default is [gid.pango1.types.WrapMode.Word] which means
      wrap on word boundaries.
  
      Params:
        wrapMode = the line wrapping mode
  */
  void setLineWrapMode(gid.pango1.types.WrapMode wrapMode) nothrow
  {
    gtk_label_set_line_wrap_mode(cast(GtkLabel*)this._cPtr, wrapMode);
  }

  /**
      Sets the number of lines to which an ellipsized, wrapping label
      should be limited. This has no effect if the label is not wrapping
      or ellipsized. Set this to -1 if you don’t want to limit the
      number of lines.
  
      Params:
        lines = the desired number of lines, or -1
  */
  void setLines(int lines) nothrow
  {
    gtk_label_set_lines(cast(GtkLabel*)this._cPtr, lines);
  }

  /**
      Parses str which is marked up with the
      [Pango text markup language][PangoMarkupFormat], setting the
      label’s text and attribute list based on the parse results.
      
      If the str is external data, you may need to escape it with
      [gid.glib2.global.markupEscapeText] or [gid.glib2.global.markupPrintfEscaped]:
      
      ```c
      GtkWidget *label = gtk_label_new (NULL);
      const char *str = "some text";
      const char *format = "<span style=\"italic\">\%s</span>";
      char *markup;
      
      markup = g_markup_printf_escaped (format, str);
      gtk_label_set_markup (GTK_LABEL (label), markup);
      g_free (markup);
      ```
      
      This function will set the #GtkLabel:use-markup property to true as
      a side effect.
      
      If you set the label contents using the #GtkLabel:label property you
      should also ensure that you set the #GtkLabel:use-markup property
      accordingly.
      
      See also: [gid.gtk4.label.Label.setText]
  
      Params:
        str = a markup string (see [Pango markup format][PangoMarkupFormat])
  */
  void setMarkup(string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    gtk_label_set_markup(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Parses str which is marked up with the
      [Pango text markup language][PangoMarkupFormat],
      setting the label’s text and attribute list based on the parse results.
      If characters in str are preceded by an underscore, they are underlined
      indicating that they represent a keyboard accelerator called a mnemonic.
      
      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [gid.gtk4.label.Label.setMnemonicWidget].
  
      Params:
        str = a markup string (see
              [Pango markup format][PangoMarkupFormat])
  */
  void setMarkupWithMnemonic(string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    gtk_label_set_markup_with_mnemonic(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets the desired maximum width in characters of label to n_chars.
  
      Params:
        nChars = the new desired maximum width, in characters.
  */
  void setMaxWidthChars(int nChars) nothrow
  {
    gtk_label_set_max_width_chars(cast(GtkLabel*)this._cPtr, nChars);
  }

  /**
      If the label has been set so that it has an mnemonic key (using
      i.e. [gid.gtk4.label.Label.setMarkupWithMnemonic],
      [gid.gtk4.label.Label.setTextWithMnemonic], [gid.gtk4.label.Label.newWithMnemonic]
      or the “use_underline” property) the label can be associated with a
      widget that is the target of the mnemonic. When the label is inside
      a widget (like a #GtkButton or a #GtkNotebook tab) it is
      automatically associated with the correct widget, but sometimes
      (i.e. when the target is a #GtkEntry next to the label) you need to
      set it explicitly using this function.
      
      The target widget will be accelerated by emitting the
      GtkWidget::mnemonic-activate signal on it. The default handler for
      this signal will activate the widget if there are no mnemonic collisions
      and toggle focus between the colliding widgets otherwise.
  
      Params:
        widget = the target #GtkWidget, or null to unset
  */
  void setMnemonicWidget(gid.gtk3.widget.Widget widget = null) nothrow
  {
    gtk_label_set_mnemonic_widget(cast(GtkLabel*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      The pattern of underlines you want under the existing text within the
      #GtkLabel widget.  For example if the current text of the label says
      “FooBarBaz” passing a pattern of “___   ___” will underline
      “Foo” and “Baz” but not “Bar”.
  
      Params:
        pattern = The pattern as described above.
  */
  void setPattern(string pattern) nothrow
  {
    const(char)* _pattern = pattern.toCString!(No.Malloc, No.Nullable);
    gtk_label_set_pattern(cast(GtkLabel*)this._cPtr, _pattern);
  }

  /**
      Selectable labels allow the user to select text from the label, for
      copy-and-paste.
  
      Params:
        setting = true to allow selecting text in the label
  */
  void setSelectable(bool setting) nothrow
  {
    gtk_label_set_selectable(cast(GtkLabel*)this._cPtr, setting);
  }

  /**
      Sets whether the label is in single line mode.
  
      Params:
        singleLineMode = true if the label should be in single line mode
  */
  void setSingleLineMode(bool singleLineMode) nothrow
  {
    gtk_label_set_single_line_mode(cast(GtkLabel*)this._cPtr, singleLineMode);
  }

  /**
      Sets the text within the #GtkLabel widget. It overwrites any text that
      was there before.
      
      This function will clear any previously set mnemonic accelerators, and
      set the #GtkLabel:use-underline property to false as a side effect.
      
      This function will set the #GtkLabel:use-markup property to false
      as a side effect.
      
      See also: [gid.gtk4.label.Label.setMarkup]
  
      Params:
        str = The text you want to set
  */
  void setText(string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    gtk_label_set_text(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets the label’s text from the string str.
      If characters in str are preceded by an underscore, they are underlined
      indicating that they represent a keyboard accelerator called a mnemonic.
      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [gid.gtk4.label.Label.setMnemonicWidget].
  
      Params:
        str = a string
  */
  void setTextWithMnemonic(string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    gtk_label_set_text_with_mnemonic(cast(GtkLabel*)this._cPtr, _str);
  }

  /**
      Sets whether the label should keep track of clicked
      links (and use a different color for them).
  
      Params:
        trackLinks = true to track visited links
  */
  void setTrackVisitedLinks(bool trackLinks) nothrow
  {
    gtk_label_set_track_visited_links(cast(GtkLabel*)this._cPtr, trackLinks);
  }

  /**
      Sets whether the text of the label contains markup in
      [Pango’s text markup language][PangoMarkupFormat].
      See [gid.gtk4.label.Label.setMarkup].
  
      Params:
        setting = true if the label’s text should be parsed for markup.
  */
  void setUseMarkup(bool setting) nothrow
  {
    gtk_label_set_use_markup(cast(GtkLabel*)this._cPtr, setting);
  }

  /**
      If true, an underline in the text indicates the next character should be
      used for the mnemonic accelerator key.
  
      Params:
        setting = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool setting) nothrow
  {
    gtk_label_set_use_underline(cast(GtkLabel*)this._cPtr, setting);
  }

  /**
      Sets the desired width in characters of label to n_chars.
  
      Params:
        nChars = the new desired width, in characters.
  */
  void setWidthChars(int nChars) nothrow
  {
    gtk_label_set_width_chars(cast(GtkLabel*)this._cPtr, nChars);
  }

  /**
      Sets the #GtkLabel:xalign property for label.
  
      Params:
        xalign = the new xalign value, between 0 and 1
  */
  void setXalign(float xalign) nothrow
  {
    gtk_label_set_xalign(cast(GtkLabel*)this._cPtr, xalign);
  }

  /**
      Sets the #GtkLabel:yalign property for label.
  
      Params:
        yalign = the new yalign value, between 0 and 1
  */
  void setYalign(float yalign) nothrow
  {
    gtk_label_set_yalign(cast(GtkLabel*)this._cPtr, yalign);
  }

  /**
      Connect to `ActivateCurrentLink` signal.
  
      A [keybinding signal][GtkBindingSignal]
        which gets emitted when the user activates a link in the label.
        
        Applications may also emit the signal with [gid.gobject2.global.signalEmitByName]
        if they need to control activation of URIs programmatically.
        
        The default bindings for this signal are all forms of the Enter key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.label.Label label)`
  
          `label` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateCurrentLink(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.label.Label)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.activateCurrentLink");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-current-link", closure, after);
  }

  /**
      Connect to `ActivateLink` signal.
  
      The signal which gets emitted to activate a URI.
        Applications may connect to it to override the default behaviour,
        which is to call [gid.gtk3.global.showUriOnWindow].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(string uri, gid.gtk3.label.Label label)`
  
          `uri` the URI that is activated (optional)
  
          `label` the instance the signal is connected to (optional)
  
          `Returns` true if the link has been activated
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateLink(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.label.Label)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.activateLink");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }

  /**
      Connect to `CopyClipboard` signal.
  
      The ::copy-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to copy the selection to the clipboard.
        
        The default binding for this signal is Ctrl-c.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.label.Label label)`
  
          `label` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.label.Label)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.copyClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      The ::move-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a cursor movement.
        If the cursor is not visible in entry, this signal causes
        the viewport to be moved instead.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        The default bindings for this signal come in two variants,
        the variant with the Shift modifier extends the selection,
        the variant without the Shift modifer does not.
        There are too many key combinations to list them all here.
        - Arrow keys move by individual characters/lines
        - Ctrl-arrow key combinations move by words/paragraphs
        - Home/End keys move to the ends of the buffer
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.MovementStep step, int count, bool extendSelection, gid.gtk3.label.Label label)`
  
          `step` the granularity of the move, as a #GtkMovementStep (optional)
  
          `count` the number of step units to move (optional)
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `label` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.label.Label)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.moveCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `PopulatePopup` signal.
  
      The ::populate-popup signal gets emitted before showing the
        context menu of the label. Note that only selectable labels
        have context menus.
        
        If you need to add items to the context menu, connect
        to this signal and append your menuitems to the menu.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu.Menu menu, gid.gtk3.label.Label label)`
  
          `menu` the menu that is being populated (optional)
  
          `label` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu.Menu)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.label.Label)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.populatePopup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Label
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.label.Label), T.stringof ~ " is not derived from gid.gtk3.label.Label");

    gid.gtk3.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateLink", true)[0]) == gid.gtk3.label.Label))
      _installVfunc(klass, "activate_link");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopyClipboard", true)[0]) == gid.gtk3.label.Label))
      _installVfunc(klass, "copy_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCursor", true)[0]) == gid.gtk3.label.Label))
      _installVfunc(klass, "move_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopulatePopup", true)[0]) == gid.gtk3.label.Label))
      _installVfunc(klass, "populate_popup");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkLabelClass*)klass;

    switch (vfunc)
    {
      case "activate_link":
      {
        static extern(C) gboolean _vfuncActivateLinkTramp(GtkLabel* label, const(char)* uri) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.label.Label)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)label);
          if (!_obj)
          {
            auto _klass = cast(GtkLabelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)label);
            if (_klass.activateLink)
              return (cast(typeof(&_vfuncActivateLinkTramp))_klass.activateLink)(label, uri);
            return typeof(return).init;
          }

          bool _dretval;
          string _uri = uri.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncActivateLink(_uri);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.vfuncActivateLink");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activateLink = cast(typeof(_klass.activateLink))&_vfuncActivateLinkTramp;
        break;
      }
      case "copy_clipboard":
      {
        static extern(C) void _vfuncCopyClipboardTramp(GtkLabel* label) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.label.Label)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)label);
          if (!_obj)
          {
            auto _klass = cast(GtkLabelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)label);
            if (_klass.copyClipboard)
              return (cast(typeof(&_vfuncCopyClipboardTramp))_klass.copyClipboard)(label);
            return;
          }

          try
          {
            _obj.vfuncCopyClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.vfuncCopyClipboard");
          }
        }

        _klass.copyClipboard = cast(typeof(_klass.copyClipboard))&_vfuncCopyClipboardTramp;
        break;
      }
      case "move_cursor":
      {
        static extern(C) void _vfuncMoveCursorTramp(GtkLabel* label, GtkMovementStep step, int count, gboolean extendSelection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.label.Label)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)label);
          if (!_obj)
          {
            auto _klass = cast(GtkLabelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)label);
            if (_klass.moveCursor)
              return (cast(typeof(&_vfuncMoveCursorTramp))_klass.moveCursor)(label, step, count, extendSelection);
            return;
          }

          try
          {
            _obj.vfuncMoveCursor(step, count, cast(bool)extendSelection);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.vfuncMoveCursor");
          }
        }

        _klass.moveCursor = cast(typeof(_klass.moveCursor))&_vfuncMoveCursorTramp;
        break;
      }
      case "populate_popup":
      {
        static extern(C) void _vfuncPopulatePopupTramp(GtkLabel* label, GtkMenu* menu) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.label.Label)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)label);
          if (!_obj)
          {
            auto _klass = cast(GtkLabelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)label);
            if (_klass.populatePopup)
              return (cast(typeof(&_vfuncPopulatePopupTramp))_klass.populatePopup)(label, menu);
            return;
          }

          try
          {
            _obj.vfuncPopulatePopup(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu.Menu)(cast(void*)menu, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.label.Label.vfuncPopulatePopup");
          }
        }

        _klass.populatePopup = cast(typeof(_klass.populatePopup))&_vfuncPopulatePopupTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.label.Label]
class LabelGidBuilderImpl(T) : gid.gtk3.misc.MiscGidBuilderImpl!T
{


  /**
      Set `angle` property.
      Params:
        propval = The angle that the baseline of the label makes with the horizontal,
          in degrees, measured counterclockwise. An angle of 90 reads from
          from bottom to top, an angle of 270, from top to bottom. Ignored
          if the label is selectable.
      Returns: Builder instance for fluent chaining
  */
  T angle(double propval) nothrow
  {
    return setProperty("angle", propval);
  }

  /** */
  T attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    return setProperty("attributes", propval);
  }

  /**
      Set `ellipsize` property.
      Params:
        propval = The preferred place to ellipsize the string, if the label does
          not have enough room to display the entire string, specified as a
          #PangoEllipsizeMode.
          
          Note that setting this property to a value other than
          [gid.pango1.types.EllipsizeMode.None] has the side-effect that the label requests
          only enough space to display the ellipsis "...". In particular, this
          means that ellipsizing labels do not work well in notebook tabs, unless
          the #GtkNotebook tab-expand child property is set to true. Other ways
          to set a label's width are [gid.gtk4.widget.Widget.setSizeRequest] and
          [gid.gtk4.label.Label.setWidthChars].
      Returns: Builder instance for fluent chaining
  */
  T ellipsize(gid.pango1.types.EllipsizeMode propval) nothrow
  {
    return setProperty("ellipsize", propval);
  }

  /** */
  T justify(gid.gtk3.types.Justification propval) nothrow
  {
    return setProperty("justify", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = The contents of the label.
          
          If the string contains [Pango XML markup][PangoMarkupFormat], you will
          have to set the #GtkLabel:use-markup property to true in order for the
          label to display the markup attributes. See also [gid.gtk4.label.Label.setMarkup]
          for a convenience function that sets both this property and the
          #GtkLabel:use-markup property at the same time.
          
          If the string contains underlines acting as mnemonics, you will have to
          set the #GtkLabel:use-underline property to true in order for the label
          to display them.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `lines` property.
      Params:
        propval = The number of lines to which an ellipsized, wrapping label
          should be limited. This property has no effect if the
          label is not wrapping or ellipsized. Set this property to
          -1 if you don't want to limit the number of lines.
      Returns: Builder instance for fluent chaining
  */
  T lines(int propval) nothrow
  {
    return setProperty("lines", propval);
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the label, in characters. If this property
          is set to -1, the width will be calculated automatically.
          
          See the section on [text layout][label-text-layout]
          for details of how #GtkLabel:width-chars and #GtkLabel:max-width-chars
          determine the width of ellipsized and wrapped labels.
      Returns: Builder instance for fluent chaining
  */
  T maxWidthChars(int propval) nothrow
  {
    return setProperty("max-width-chars", propval);
  }

  /** */
  T mnemonicWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("mnemonic-widget", propval);
  }

  /** */
  T pattern(string propval) nothrow
  {
    return setProperty("pattern", propval);
  }

  /** */
  T selectable(bool propval) nothrow
  {
    return setProperty("selectable", propval);
  }

  /**
      Set `singleLineMode` property.
      Params:
        propval = Whether the label is in single line mode. In single line mode,
          the height of the label does not depend on the actual text, it
          is always set to ascent + descent of the font. This can be an
          advantage in situations where resizing the label because of text
          changes would be distracting, e.g. in a statusbar.
      Returns: Builder instance for fluent chaining
  */
  T singleLineMode(bool propval) nothrow
  {
    return setProperty("single-line-mode", propval);
  }

  /**
      Set `trackVisitedLinks` property.
      Params:
        propval = Set this property to true to make the label track which links
          have been visited. It will then apply the #GTK_STATE_FLAG_VISITED
          when rendering this link, in addition to #GTK_STATE_FLAG_LINK.
      Returns: Builder instance for fluent chaining
  */
  T trackVisitedLinks(bool propval) nothrow
  {
    return setProperty("track-visited-links", propval);
  }

  /** */
  T useMarkup(bool propval) nothrow
  {
    return setProperty("use-markup", propval);
  }

  /** */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The desired width of the label, in characters. If this property is set to
          -1, the width will be calculated automatically.
          
          See the section on [text layout][label-text-layout]
          for details of how #GtkLabel:width-chars and #GtkLabel:max-width-chars
          determine the width of ellipsized and wrapped labels.
      Returns: Builder instance for fluent chaining
  */
  T widthChars(int propval) nothrow
  {
    return setProperty("width-chars", propval);
  }

  /** */
  T wrap(bool propval) nothrow
  {
    return setProperty("wrap", propval);
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = If line wrapping is on (see the #GtkLabel:wrap property) this controls
          how the line wrapping is done. The default is [gid.pango1.types.WrapMode.Word], which
          means wrap on word boundaries.
      Returns: Builder instance for fluent chaining
  */
  T wrapMode(gid.pango1.types.WrapMode propval) nothrow
  {
    return setProperty("wrap-mode", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The xalign property determines the horizontal aligment of the label text
          inside the labels size allocation. Compare this to #GtkWidget:halign,
          which determines how the labels size allocation is positioned in the
          space available for the label.
      Returns: Builder instance for fluent chaining
  */
  override T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = The yalign property determines the vertical aligment of the label text
          inside the labels size allocation. Compare this to #GtkWidget:valign,
          which determines how the labels size allocation is positioned in the
          space available for the label.
      Returns: Builder instance for fluent chaining
  */
  override T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }
}

/// Fluent builder for [gid.gtk3.label.Label]
final class LabelGidBuilder : LabelGidBuilderImpl!LabelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Label build() nothrow
  {
    return new Label(cast(void*)createGObject(Label._getGType), Yes.Take);
  }
}
