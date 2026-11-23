/// Module for [Entry] class
module gid.gtk3.entry;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.event;
import gid.gdk3.event_key;
import gid.gdk3.rectangle;
import gid.gdk3.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.border;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_editable;
import gid.gtk3.cell_editable_mixin;
import gid.gtk3.editable;
import gid.gtk3.editable_mixin;
import gid.gtk3.entry_buffer;
import gid.gtk3.entry_completion;
import gid.gtk3.target_list;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.pango1.attr_list;
import gid.pango1.layout;
import gid.pango1.tab_array;

/**
    The #GtkEntry widget is a single line text entry
    widget. A fairly large set of key bindings are supported
    by default. If the entered text is longer than the allocation
    of the widget, the widget will scroll so that the cursor
    position is visible.
    
    When using an entry for passwords and other sensitive information,
    it can be put into “password mode” using [gid.gtk4.entry.Entry.setVisibility].
    In this mode, entered text is displayed using a “invisible” character.
    By default, GTK+ picks the best invisible character that is available
    in the current font, but it can be changed with
    [gid.gtk4.entry.Entry.setInvisibleChar]. Since 2.16, GTK+ displays a warning
    when Caps Lock or input methods might interfere with entering text in
    a password entry. The warning can be turned off with the
    #GtkEntry:caps-lock-warning property.
    
    Since 2.16, GtkEntry has the ability to display progress or activity
    information behind the text. To make an entry display such information,
    use [gid.gtk4.entry.Entry.setProgressFraction] or [gid.gtk4.entry.Entry.setProgressPulseStep].
    
    Additionally, GtkEntry can show icons at either side of the entry. These
    icons can be activatable by clicking, can be set up as drag source and
    can have tooltips. To add an icon, use [gid.gtk4.entry.Entry.setIconFromGicon] or
    one of the various other functions that set an icon from a stock id, an
    icon name or a pixbuf. To trigger an action when the user clicks an icon,
    connect to the #GtkEntry::icon-press signal. To allow DND operations
    from an icon, use [gid.gtk4.entry.Entry.setIconDragSource]. To set a tooltip on
    an icon, use [gid.gtk4.entry.Entry.setIconTooltipText] or the corresponding function
    for markup.
    
    Note that functionality or information that is only available by clicking
    on an icon in an entry may not be accessible at all to users which are not
    able to use a mouse or other pointing device. It is therefore recommended
    that any such functionality should also be available by other means, e.g.
    via the context menu of the entry.
    
    # CSS nodes
    
    ```plain
    entry[.read-only][.flat][.warning][.error]
    ├── image.left
    ├── image.right
    ├── undershoot.left
    ├── undershoot.right
    ├── [selection]
    ├── [progress[.pulse]]
    ╰── [window.popup]
    ```
    
    GtkEntry has a main node with the name entry. Depending on the properties
    of the entry, the style classes .read-only and .flat may appear. The style
    classes .warning and .error may also be used with entries.
    
    When the entry shows icons, it adds subnodes with the name image and the
    style class .left or .right, depending on where the icon appears.
    
    When the entry has a selection, it adds a subnode with the name selection.
    
    When the entry shows progress, it adds a subnode with the name progress.
    The node has the style class .pulse when the shown progress is pulsing.
    
    The CSS node for a context menu is added as a subnode below entry as well.
    
    The undershoot nodes are used to draw the underflow indication when content
    is scrolled out of view. These nodes get the .left and .right style classes
    added depending on where the indication is drawn.
    
    When touch is used and touch selection handles are shown, they are using
    CSS nodes with name cursor-handle. They get the .top or .bottom style class
    depending on where they are shown in relation to the selection. If there is
    just a single handle for the text cursor, it gets the style class
    .insertion-cursor.
*/
class Entry : gid.gtk3.widget.Widget, gid.gtk3.cell_editable.CellEditable, gid.gtk3.editable.Editable
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
    return cast(void function())gtk_entry_get_type != &gidSymbolNotFound ? gtk_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEntry";
  }

  /** Returns `this`, for use in `with` statements. */
  override Entry self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.entry.Entry]
      Returns: New builder object
  */
  static EntryGidBuilder builder() nothrow
  {
    return new EntryGidBuilder;
  }

  /** */
  @property bool activatesDefault() nothrow
  {
    return getActivatesDefault();
  }

  /** */
  @property void activatesDefault(bool propval) nothrow
  {
    setActivatesDefault(propval);
  }

  /**
      Get `attributes` property.
      Returns: A list of Pango attributes to apply to the text of the entry.
        
        This is mainly useful to change the size or weight of the text.
        
        The #PangoAttribute's @start_index and @end_index must refer to the
        #GtkEntryBuffer text, i.e. without the preedit string.
  */
  @property gid.pango1.attr_list.AttrList attributes() nothrow
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of Pango attributes to apply to the text of the entry.
          
          This is mainly useful to change the size or weight of the text.
          
          The #PangoAttribute's @start_index and @end_index must refer to the
          #GtkEntryBuffer text, i.e. without the preedit string.
  */
  @property void attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    setAttributes(propval);
  }

  /** */
  @property gid.gtk3.entry_buffer.EntryBuffer buffer() nothrow
  {
    return getBuffer();
  }

  /** */
  @property void buffer(gid.gtk3.entry_buffer.EntryBuffer propval) nothrow
  {
    setBuffer(propval);
  }

  /**
      Get `capsLockWarning` property.
      Returns: Whether password entries will show a warning when Caps Lock is on.
        
        Note that the warning is shown using a secondary icon, and thus
        does not work if you are using the secondary icon position for some
        other purpose.
  */
  @property bool capsLockWarning() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("caps-lock-warning");
  }

  /**
      Set `capsLockWarning` property.
      Params:
        propval = Whether password entries will show a warning when Caps Lock is on.
          
          Note that the warning is shown using a secondary icon, and thus
          does not work if you are using the secondary icon position for some
          other purpose.
  */
  @property void capsLockWarning(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("caps-lock-warning", propval);
  }

  /**
      Get `completion` property.
      Returns: The auxiliary completion object to use with the entry.
  */
  @property gid.gtk3.entry_completion.EntryCompletion completion() nothrow
  {
    return getCompletion();
  }

  /**
      Set `completion` property.
      Params:
        propval = The auxiliary completion object to use with the entry.
  */
  @property void completion(gid.gtk3.entry_completion.EntryCompletion propval) nothrow
  {
    setCompletion(propval);
  }

  /** */
  @property int cursorPosition() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("cursor-position");
  }

  /** */
  @property bool editable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /** */
  @property void editable(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("editable", propval);
  }

  /** */
  @property bool enableEmojiCompletion() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("enable-emoji-completion");
  }

  /** */
  @property void enableEmojiCompletion(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("enable-emoji-completion", propval);
  }

  /** */
  @property bool hasFrame() nothrow
  {
    return getHasFrame();
  }

  /** */
  @property void hasFrame(bool propval) nothrow
  {
    setHasFrame(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this entry.
        See #GtkIMContext.
        
        Setting this to a non-null value overrides the
        system-wide IM module setting. See the GtkSettings
        #GtkSettings:gtk-im-module property.
  */
  @property string imModule() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("im-module");
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this entry.
          See #GtkIMContext.
          
          Setting this to a non-null value overrides the
          system-wide IM module setting. See the GtkSettings
          #GtkSettings:gtk-im-module property.
  */
  @property void imModule(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /**
      Get `innerBorder` property.
      Returns: Sets the text area's border between the text and the frame.
  
      Deprecated: Use the standard border and padding CSS properties
          (through objects like #GtkStyleContext and #GtkCssProvider); the value
          of this style property is ignored.
  */
  @property gid.gtk3.border.Border innerBorder() nothrow
  {
    return getInnerBorder();
  }

  /**
      Set `innerBorder` property.
      Params:
        propval = Sets the text area's border between the text and the frame.
  
      Deprecated: Use the standard border and padding CSS properties
          (through objects like #GtkStyleContext and #GtkCssProvider); the value
          of this style property is ignored.
  */
  @property void innerBorder(gid.gtk3.border.Border propval) nothrow
  {
    setInnerBorder(&propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints (beyond #GtkEntry:input-purpose) that
        allow input methods to fine-tune their behaviour.
  */
  @property gid.gtk3.types.InputHints inputHints() nothrow
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond #GtkEntry:input-purpose) that
          allow input methods to fine-tune their behaviour.
  */
  @property void inputHints(gid.gtk3.types.InputHints propval) nothrow
  {
    setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of this text field.
        
        This property can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
        
        Note that setting the purpose to [gid.gtk4.types.InputPurpose.Password] or
        [gid.gtk4.types.InputPurpose.Pin] is independent from setting
        #GtkEntry:visibility.
  */
  @property gid.gtk3.types.InputPurpose inputPurpose() nothrow
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of this text field.
          
          This property can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
          
          Note that setting the purpose to [gid.gtk4.types.InputPurpose.Password] or
          [gid.gtk4.types.InputPurpose.Pin] is independent from setting
          #GtkEntry:visibility.
  */
  @property void inputPurpose(gid.gtk3.types.InputPurpose propval) nothrow
  {
    setInputPurpose(propval);
  }

  /**
      Get `invisibleChar` property.
      Returns: The invisible character is used when masking entry contents (in
        \"password mode\")"). When it is not explicitly set with the
        #GtkEntry:invisible-char property, GTK+ determines the character
        to use from a list of possible candidates, depending on availability
        in the current font.
        
        This style property allows the theme to prepend a character
        to the list of candidates.
  */
  @property uint invisibleChar() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("invisible-char");
  }

  /**
      Set `invisibleChar` property.
      Params:
        propval = The invisible character is used when masking entry contents (in
          \"password mode\")"). When it is not explicitly set with the
          #GtkEntry:invisible-char property, GTK+ determines the character
          to use from a list of possible candidates, depending on availability
          in the current font.
          
          This style property allows the theme to prepend a character
          to the list of candidates.
  */
  @property void invisibleChar(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("invisible-char", propval);
  }

  /**
      Get `invisibleCharSet` property.
      Returns: Whether the invisible char has been set for the #GtkEntry.
  */
  @property bool invisibleCharSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("invisible-char-set");
  }

  /**
      Set `invisibleCharSet` property.
      Params:
        propval = Whether the invisible char has been set for the #GtkEntry.
  */
  @property void invisibleCharSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("invisible-char-set", propval);
  }

  /** */
  @property int maxLength() nothrow
  {
    return getMaxLength();
  }

  /** */
  @property void maxLength(int propval) nothrow
  {
    setMaxLength(propval);
  }

  /**
      Get `maxWidthChars` property.
      Returns: The desired maximum width of the entry, in characters.
        If this property is set to -1, the width will be calculated
        automatically.
  */
  @property int maxWidthChars() nothrow
  {
    return getMaxWidthChars();
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the entry, in characters.
          If this property is set to -1, the width will be calculated
          automatically.
  */
  @property void maxWidthChars(int propval) nothrow
  {
    setMaxWidthChars(propval);
  }

  /**
      Get `overwriteMode` property.
      Returns: If text is overwritten when typing in the #GtkEntry.
  */
  @property bool overwriteMode() nothrow
  {
    return getOverwriteMode();
  }

  /**
      Set `overwriteMode` property.
      Params:
        propval = If text is overwritten when typing in the #GtkEntry.
  */
  @property void overwriteMode(bool propval) nothrow
  {
    setOverwriteMode(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the #GtkEntry when it is empty
        and unfocused.
  */
  @property string placeholderText() nothrow
  {
    return getPlaceholderText();
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the #GtkEntry when it is empty
          and unfocused.
  */
  @property void placeholderText(string propval) nothrow
  {
    setPlaceholderText(propval);
  }

  /**
      Get `populateAll` property.
      Returns: If :populate-all is true, the #GtkEntry::populate-popup
        signal is also emitted for touch popups.
  */
  @property bool populateAll() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("populate-all");
  }

  /**
      Set `populateAll` property.
      Params:
        propval = If :populate-all is true, the #GtkEntry::populate-popup
          signal is also emitted for touch popups.
  */
  @property void populateAll(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("populate-all", propval);
  }

  /**
      Get `primaryIconActivatable` property.
      Returns: Whether the primary icon is activatable.
        
        GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
        signals only on sensitive, activatable icons.
        
        Sensitive, but non-activatable icons can be used for purely
        informational purposes.
  */
  @property bool primaryIconActivatable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("primary-icon-activatable");
  }

  /**
      Set `primaryIconActivatable` property.
      Params:
        propval = Whether the primary icon is activatable.
          
          GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
          signals only on sensitive, activatable icons.
          
          Sensitive, but non-activatable icons can be used for purely
          informational purposes.
  */
  @property void primaryIconActivatable(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("primary-icon-activatable", propval);
  }

  /**
      Get `primaryIconGicon` property.
      Returns: The #GIcon to use for the primary icon for the entry.
  */
  @property gid.gio2.icon.Icon primaryIconGicon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("primary-icon-gicon");
  }

  /**
      Set `primaryIconGicon` property.
      Params:
        propval = The #GIcon to use for the primary icon for the entry.
  */
  @property void primaryIconGicon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("primary-icon-gicon", propval);
  }

  /**
      Get `primaryIconName` property.
      Returns: The icon name to use for the primary icon for the entry.
  */
  @property string primaryIconName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("primary-icon-name");
  }

  /**
      Set `primaryIconName` property.
      Params:
        propval = The icon name to use for the primary icon for the entry.
  */
  @property void primaryIconName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("primary-icon-name", propval);
  }

  /**
      Get `primaryIconPixbuf` property.
      Returns: A pixbuf to use as the primary icon for the entry.
  */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf primaryIconPixbuf() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("primary-icon-pixbuf");
  }

  /**
      Set `primaryIconPixbuf` property.
      Params:
        propval = A pixbuf to use as the primary icon for the entry.
  */
  @property void primaryIconPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("primary-icon-pixbuf", propval);
  }

  /**
      Get `primaryIconSensitive` property.
      Returns: Whether the primary icon is sensitive.
        
        An insensitive icon appears grayed out. GTK+ does not emit the
        #GtkEntry::icon-press and #GtkEntry::icon-release signals and
        does not allow DND from insensitive icons.
        
        An icon should be set insensitive if the action that would trigger
        when clicked is currently not available.
  */
  @property bool primaryIconSensitive() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("primary-icon-sensitive");
  }

  /**
      Set `primaryIconSensitive` property.
      Params:
        propval = Whether the primary icon is sensitive.
          
          An insensitive icon appears grayed out. GTK+ does not emit the
          #GtkEntry::icon-press and #GtkEntry::icon-release signals and
          does not allow DND from insensitive icons.
          
          An icon should be set insensitive if the action that would trigger
          when clicked is currently not available.
  */
  @property void primaryIconSensitive(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("primary-icon-sensitive", propval);
  }

  /**
      Get `primaryIconStock` property.
      Returns: The stock id to use for the primary icon for the entry.
  
      Deprecated: Use #GtkEntry:primary-icon-name instead.
  */
  @property string primaryIconStock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("primary-icon-stock");
  }

  /**
      Set `primaryIconStock` property.
      Params:
        propval = The stock id to use for the primary icon for the entry.
  
      Deprecated: Use #GtkEntry:primary-icon-name instead.
  */
  @property void primaryIconStock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("primary-icon-stock", propval);
  }

  /**
      Get `primaryIconStorageType` property.
      Returns: The representation which is used for the primary icon of the entry.
  */
  @property gid.gtk3.types.ImageType primaryIconStorageType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ImageType)("primary-icon-storage-type");
  }

  /**
      Get `primaryIconTooltipMarkup` property.
      Returns: The contents of the tooltip on the primary icon, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        
        Also see [gid.gtk4.entry.Entry.setIconTooltipMarkup].
  */
  @property string primaryIconTooltipMarkup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("primary-icon-tooltip-markup");
  }

  /**
      Set `primaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the primary icon, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipMarkup].
  */
  @property void primaryIconTooltipMarkup(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("primary-icon-tooltip-markup", propval);
  }

  /**
      Get `primaryIconTooltipText` property.
      Returns: The contents of the tooltip on the primary icon.
        
        Also see [gid.gtk4.entry.Entry.setIconTooltipText].
  */
  @property string primaryIconTooltipText() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("primary-icon-tooltip-text");
  }

  /**
      Set `primaryIconTooltipText` property.
      Params:
        propval = The contents of the tooltip on the primary icon.
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipText].
  */
  @property void primaryIconTooltipText(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("primary-icon-tooltip-text", propval);
  }

  /**
      Get `progressFraction` property.
      Returns: The current fraction of the task that's been completed.
  */
  @property double progressFraction() nothrow
  {
    return getProgressFraction();
  }

  /**
      Set `progressFraction` property.
      Params:
        propval = The current fraction of the task that's been completed.
  */
  @property void progressFraction(double propval) nothrow
  {
    setProgressFraction(propval);
  }

  /**
      Get `progressPulseStep` property.
      Returns: The fraction of total entry width to move the progress
        bouncing block for each call to [gid.gtk4.entry.Entry.progressPulse].
  */
  @property double progressPulseStep() nothrow
  {
    return getProgressPulseStep();
  }

  /**
      Set `progressPulseStep` property.
      Params:
        propval = The fraction of total entry width to move the progress
          bouncing block for each call to [gid.gtk4.entry.Entry.progressPulse].
  */
  @property void progressPulseStep(double propval) nothrow
  {
    setProgressPulseStep(propval);
  }

  /** */
  @property int scrollOffset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("scroll-offset");
  }

  /**
      Get `secondaryIconActivatable` property.
      Returns: Whether the secondary icon is activatable.
        
        GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
        signals only on sensitive, activatable icons.
        
        Sensitive, but non-activatable icons can be used for purely
        informational purposes.
  */
  @property bool secondaryIconActivatable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("secondary-icon-activatable");
  }

  /**
      Set `secondaryIconActivatable` property.
      Params:
        propval = Whether the secondary icon is activatable.
          
          GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
          signals only on sensitive, activatable icons.
          
          Sensitive, but non-activatable icons can be used for purely
          informational purposes.
  */
  @property void secondaryIconActivatable(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("secondary-icon-activatable", propval);
  }

  /**
      Get `secondaryIconGicon` property.
      Returns: The #GIcon to use for the secondary icon for the entry.
  */
  @property gid.gio2.icon.Icon secondaryIconGicon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("secondary-icon-gicon");
  }

  /**
      Set `secondaryIconGicon` property.
      Params:
        propval = The #GIcon to use for the secondary icon for the entry.
  */
  @property void secondaryIconGicon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("secondary-icon-gicon", propval);
  }

  /**
      Get `secondaryIconName` property.
      Returns: The icon name to use for the secondary icon for the entry.
  */
  @property string secondaryIconName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("secondary-icon-name");
  }

  /**
      Set `secondaryIconName` property.
      Params:
        propval = The icon name to use for the secondary icon for the entry.
  */
  @property void secondaryIconName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("secondary-icon-name", propval);
  }

  /**
      Get `secondaryIconPixbuf` property.
      Returns: An pixbuf to use as the secondary icon for the entry.
  */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf secondaryIconPixbuf() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("secondary-icon-pixbuf");
  }

  /**
      Set `secondaryIconPixbuf` property.
      Params:
        propval = An pixbuf to use as the secondary icon for the entry.
  */
  @property void secondaryIconPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("secondary-icon-pixbuf", propval);
  }

  /**
      Get `secondaryIconSensitive` property.
      Returns: Whether the secondary icon is sensitive.
        
        An insensitive icon appears grayed out. GTK+ does not emit the
        #GtkEntry::icon-press and #GtkEntry::icon-release signals and
        does not allow DND from insensitive icons.
        
        An icon should be set insensitive if the action that would trigger
        when clicked is currently not available.
  */
  @property bool secondaryIconSensitive() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("secondary-icon-sensitive");
  }

  /**
      Set `secondaryIconSensitive` property.
      Params:
        propval = Whether the secondary icon is sensitive.
          
          An insensitive icon appears grayed out. GTK+ does not emit the
          #GtkEntry::icon-press and #GtkEntry::icon-release signals and
          does not allow DND from insensitive icons.
          
          An icon should be set insensitive if the action that would trigger
          when clicked is currently not available.
  */
  @property void secondaryIconSensitive(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("secondary-icon-sensitive", propval);
  }

  /**
      Get `secondaryIconStock` property.
      Returns: The stock id to use for the secondary icon for the entry.
  
      Deprecated: Use #GtkEntry:secondary-icon-name instead.
  */
  @property string secondaryIconStock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("secondary-icon-stock");
  }

  /**
      Set `secondaryIconStock` property.
      Params:
        propval = The stock id to use for the secondary icon for the entry.
  
      Deprecated: Use #GtkEntry:secondary-icon-name instead.
  */
  @property void secondaryIconStock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("secondary-icon-stock", propval);
  }

  /**
      Get `secondaryIconStorageType` property.
      Returns: The representation which is used for the secondary icon of the entry.
  */
  @property gid.gtk3.types.ImageType secondaryIconStorageType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ImageType)("secondary-icon-storage-type");
  }

  /**
      Get `secondaryIconTooltipMarkup` property.
      Returns: The contents of the tooltip on the secondary icon, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        
        Also see [gid.gtk4.entry.Entry.setIconTooltipMarkup].
  */
  @property string secondaryIconTooltipMarkup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("secondary-icon-tooltip-markup");
  }

  /**
      Set `secondaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the secondary icon, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipMarkup].
  */
  @property void secondaryIconTooltipMarkup(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("secondary-icon-tooltip-markup", propval);
  }

  /**
      Get `secondaryIconTooltipText` property.
      Returns: The contents of the tooltip on the secondary icon.
        
        Also see [gid.gtk4.entry.Entry.setIconTooltipText].
  */
  @property string secondaryIconTooltipText() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("secondary-icon-tooltip-text");
  }

  /**
      Set `secondaryIconTooltipText` property.
      Params:
        propval = The contents of the tooltip on the secondary icon.
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipText].
  */
  @property void secondaryIconTooltipText(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("secondary-icon-tooltip-text", propval);
  }

  /** */
  @property int selectionBound() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("selection-bound");
  }

  /**
      Get `shadowType` property.
      Returns: Which kind of shadow to draw around the entry when
        #GtkEntry:has-frame is set to true.
  
      Deprecated: Use CSS to determine the style of the border;
            the value of this style property is ignored.
  */
  @property gid.gtk3.types.ShadowType shadowType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ShadowType)("shadow-type");
  }

  /**
      Set `shadowType` property.
      Params:
        propval = Which kind of shadow to draw around the entry when
          #GtkEntry:has-frame is set to true.
  
      Deprecated: Use CSS to determine the style of the border;
            the value of this style property is ignored.
  */
  @property void shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.ShadowType)("shadow-type", propval);
  }

  /** */
  @property bool showEmojiIcon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-emoji-icon");
  }

  /** */
  @property void showEmojiIcon(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-emoji-icon", propval);
  }

  /** */
  @property gid.pango1.tab_array.TabArray tabs() nothrow
  {
    return getTabs();
  }

  /** */
  @property void tabs(gid.pango1.tab_array.TabArray propval) nothrow
  {
    setTabs(propval);
  }

  /** */
  @property string text() nothrow
  {
    return getText();
  }

  /** */
  @property void text(string propval) nothrow
  {
    setText(propval);
  }

  /**
      Get `textLength` property.
      Returns: The length of the text in the #GtkEntry.
  */
  @property uint textLength() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("text-length");
  }

  /**
      Get `truncateMultiline` property.
      Returns: When true, pasted multi-line text is truncated to the first line.
  */
  @property bool truncateMultiline() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("truncate-multiline");
  }

  /**
      Set `truncateMultiline` property.
      Params:
        propval = When true, pasted multi-line text is truncated to the first line.
  */
  @property void truncateMultiline(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("truncate-multiline", propval);
  }

  /** */
  @property bool visibility() nothrow
  {
    return getVisibility();
  }

  /** */
  @property void visibility(bool propval) nothrow
  {
    setVisibility(propval);
  }

  /** */
  @property int widthChars() nothrow
  {
    return getWidthChars();
  }

  /** */
  @property void widthChars(int propval) nothrow
  {
    setWidthChars(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment, from 0 (left) to 1 (right).
        Reversed for RTL layouts.
  */
  @property float xalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment, from 0 (left) to 1 (right).
          Reversed for RTL layouts.
  */
  @property void xalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  mixin CellEditableT!();
  mixin EditableT!();

  /**
      Creates a new entry.
      Returns: a new #GtkEntry.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_entry_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new entry with the specified text buffer.
  
      Params:
        buffer = The buffer to use for the new #GtkEntry.
      Returns: a new #GtkEntry
  */
  static gid.gtk3.entry.Entry newWithBuffer(gid.gtk3.entry_buffer.EntryBuffer buffer) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_entry_new_with_buffer(buffer ? cast(GtkEntryBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.entry.Entry)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Class handler for the #GtkEntry::activate signal. The default
        implementation calls [gid.gtk3.window.Window.activateDefault] on the entry’s top-level
        window.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncActivate()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkEntry*)this._cPtr);
  }

  /**
      Class handler for the #GtkEntry::backspace signal. The default
        implementation deletes the selection or a single character or word.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncBackspace` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncBackspace()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.backspace)
      return;

    _klass.backspace(cast(GtkEntry*)this._cPtr);
  }

  /**
      Class handler for the #GtkEntry::copy-clipboard signal. The
        default implementation copies the selection, if one exists.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCopyClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncCopyClipboard()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.copyClipboard)
      return;

    _klass.copyClipboard(cast(GtkEntry*)this._cPtr);
  }

  /**
      Class handler for the #GtkEntry::cut-clipboard signal. The
        default implementation cuts the selection, if one exists.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCutClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncCutClipboard()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.cutClipboard)
      return;

    _klass.cutClipboard(cast(GtkEntry*)this._cPtr);
  }

  /**
      Class handler for the #GtkEntry::delete-from-cursor
        signal. The default implementation deletes the selection or the specified
        number of characters or words.
  
      Params:
        type = 
        count = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeleteFromCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncDeleteFromCursor(gid.gtk3.types.DeleteType type, int count)
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.deleteFromCursor)
      return;

    _klass.deleteFromCursor(cast(GtkEntry*)this._cPtr, type, count);
  }

  /**
      Class handler for the #GtkEntry::insert-at-cursor signal.
        The default implementation inserts text at the cursor.
  
      Params:
        str = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsertAtCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncInsertAtCursor(string str)
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.insertAtCursor)
      return;

    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _klass.insertAtCursor(cast(GtkEntry*)this._cPtr, _str);
  }

  /** */
  protected void vfuncInsertEmoji()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.insertEmoji)
      return;

    _klass.insertEmoji(cast(GtkEntry*)this._cPtr);
  }

  /**
      Class handler for the #GtkEntry::move-cursor signal. The
        default implementation specifies the standard #GtkEntry cursor movement
        behavior.
  
      Params:
        step = 
        count = 
        extendSelection = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMoveCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncMoveCursor(gid.gtk3.types.MovementStep step, int count, bool extendSelection)
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.moveCursor)
      return;

    _klass.moveCursor(cast(GtkEntry*)this._cPtr, step, count, extendSelection);
  }

  /**
      Class handler for the #GtkEntry::paste-clipboard signal.
        The default implementation pastes at the current cursor position or over
        the current selection if one exists.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPasteClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncPasteClipboard()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.pasteClipboard)
      return;

    _klass.pasteClipboard(cast(GtkEntry*)this._cPtr);
  }

  /**
      Class handler for the #GtkEntry::populate-popup signal. If
        non-null, this will be called to add additional entries to the context
        menu when it is displayed.
  
      Params:
        popup = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPopulatePopup` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncPopulatePopup(gid.gtk3.widget.Widget popup)
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.populatePopup)
      return;

    _klass.populatePopup(cast(GtkEntry*)this._cPtr, popup ? cast(GtkWidget*)popup._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncToggleDirection()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.toggleDirection)
      return;

    _klass.toggleDirection(cast(GtkEntry*)this._cPtr);
  }

  /**
      Class handler for the #GtkEntry::toggle-overwrite signal.
        The default implementation toggles overwrite mode and blinks the cursor.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggleOverwrite` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncToggleOverwrite()
  {
    auto _klass = cast(GtkEntryClass*)_vfuncClass;
    if (!_klass.toggleOverwrite)
      return;

    _klass.toggleOverwrite(cast(GtkEntry*)this._cPtr);
  }

  /**
      Retrieves the value set by [gid.gtk4.entry.Entry.setActivatesDefault].
      Returns: true if the entry will activate the default widget
  */
  bool getActivatesDefault() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_activates_default(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.entry.Entry.setAlignment].
      Returns: the alignment
  */
  float getAlignment() nothrow
  {
    float _retval;
    _retval = gtk_entry_get_alignment(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the attribute list that was set on the entry using
      [gid.gtk4.entry.Entry.setAttributes], if any.
      Returns: the attribute list, or null
            if none was set.
  */
  gid.pango1.attr_list.AttrList getAttributes() nothrow
  {
    PangoAttrList* _cretval;
    _cretval = gtk_entry_get_attributes(cast(GtkEntry*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the #GtkEntryBuffer object which holds the text for
      this widget.
      Returns: A #GtkEntryBuffer object.
  */
  gid.gtk3.entry_buffer.EntryBuffer getBuffer() nothrow
  {
    GtkEntryBuffer* _cretval;
    _cretval = gtk_entry_get_buffer(cast(GtkEntry*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.entry_buffer.EntryBuffer)(cast(GtkEntryBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the auxiliary completion object currently in use by entry.
      Returns: The auxiliary completion object currently
            in use by entry.
  */
  gid.gtk3.entry_completion.EntryCompletion getCompletion() nothrow
  {
    GtkEntryCompletion* _cretval;
    _cretval = gtk_entry_get_completion(cast(GtkEntry*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.entry_completion.EntryCompletion)(cast(GtkEntryCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the index of the icon which is the source of the current
      DND operation, or -1.
      
      This function is meant to be used in a #GtkWidget::drag-data-get
      callback.
      Returns: index of the icon which is the source of the current
                 DND operation, or -1.
  */
  int getCurrentIconDragSource() nothrow
  {
    int _retval;
    _retval = gtk_entry_get_current_icon_drag_source(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the horizontal cursor adjustment for the entry.
      See [gid.gtk3.entry.Entry.setCursorHadjustment].
      Returns: the horizontal cursor adjustment, or null
          if none has been set.
  */
  gid.gtk3.adjustment.Adjustment getCursorHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_entry_get_cursor_hadjustment(cast(GtkEntry*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.entry.Entry.setHasFrame].
      Returns: whether the entry has a beveled frame
  */
  bool getHasFrame() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_has_frame(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the icon is activatable.
  
      Params:
        iconPos = Icon position
      Returns: true if the icon is activatable.
  */
  bool getIconActivatable(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_icon_activatable(cast(GtkEntry*)this._cPtr, iconPos);
    return _retval;
  }

  /**
      Gets the area where entry’s icon at icon_pos is drawn.
      This function is useful when drawing something to the
      entry in a draw callback.
      
      If the entry is not realized or has no icon at the given position,
      icon_area is filled with zeros. Otherwise, icon_area will be filled
      with the icon’s allocation, relative to entry’s allocation.
      
      See also [gid.gtk3.entry.Entry.getTextArea]
  
      Params:
        iconPos = Icon position
        iconArea = Return location for the icon’s area
  */
  void getIconArea(gid.gtk3.types.EntryIconPosition iconPos, out gid.gdk3.rectangle.Rectangle iconArea) nothrow
  {
    gtk_entry_get_icon_area(cast(GtkEntry*)this._cPtr, iconPos, cast(GdkRectangle*)&iconArea);
  }

  /**
      Finds the icon at the given position and return its index. The
      position’s coordinates are relative to the entry’s top left corner.
      If `x`, `y` doesn’t lie inside an icon, -1 is returned.
      This function is intended for use in a #GtkWidget::query-tooltip
      signal handler.
  
      Params:
        x = the x coordinate of the position to find
        y = the y coordinate of the position to find
      Returns: the index of the icon at the given position, or -1
  */
  int getIconAtPos(int x, int y) nothrow
  {
    int _retval;
    _retval = gtk_entry_get_icon_at_pos(cast(GtkEntry*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Retrieves the #GIcon used for the icon, or null if there is
      no icon or if the icon was set by some other method (e.g., by
      stock, pixbuf, or icon name).
  
      Params:
        iconPos = Icon position
      Returns: A #GIcon, or null if no icon is set
            or if the icon is not a #GIcon
  */
  gid.gio2.icon.Icon getIconGicon(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_entry_get_icon_gicon(cast(GtkEntry*)this._cPtr, iconPos);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the icon name used for the icon, or null if there is
      no icon or if the icon was set by some other method (e.g., by
      pixbuf, stock or gicon).
  
      Params:
        iconPos = Icon position
      Returns: An icon name, or null if no icon is set or if the icon
                 wasn’t set from an icon name
  */
  string getIconName(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_icon_name(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the image used for the icon.
      
      Unlike the other methods of setting and getting icon data, this
      method will work regardless of whether the icon was set using a
      #GdkPixbuf, a #GIcon, a stock item, or an icon name.
  
      Params:
        iconPos = Icon position
      Returns: A #GdkPixbuf, or null if no icon is
            set for this position.
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getIconPixbuf(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_entry_get_icon_pixbuf(cast(GtkEntry*)this._cPtr, iconPos);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the icon appears sensitive or insensitive.
  
      Params:
        iconPos = Icon position
      Returns: true if the icon is sensitive.
  */
  bool getIconSensitive(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_icon_sensitive(cast(GtkEntry*)this._cPtr, iconPos);
    return _retval;
  }

  /**
      Retrieves the stock id used for the icon, or null if there is
      no icon or if the icon was set by some other method (e.g., by
      pixbuf, icon name or gicon).
  
      Params:
        iconPos = Icon position
      Returns: A stock id, or null if no icon is set or if the icon
                 wasn’t set from a stock id
  
      Deprecated: Use [gid.gtk4.entry.Entry.getIconName] instead.
  */
  string getIconStock(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_icon_stock(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the type of representation being used by the icon
      to store image data. If the icon has no image data,
      the return value will be [gid.gtk4.types.ImageType.Empty].
  
      Params:
        iconPos = Icon position
      Returns: image representation being used
  */
  gid.gtk3.types.ImageType getIconStorageType(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    GtkImageType _cretval;
    _cretval = gtk_entry_get_icon_storage_type(cast(GtkEntry*)this._cPtr, iconPos);
    gid.gtk3.types.ImageType _retval = cast(gid.gtk3.types.ImageType)_cretval;
    return _retval;
  }

  /**
      Gets the contents of the tooltip on the icon at the specified
      position in entry.
  
      Params:
        iconPos = the icon position
      Returns: the tooltip text, or null. Free the returned
            string with [gid.glib2.global.gfree] when done.
  */
  string getIconTooltipMarkup(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    char* _cretval;
    _cretval = gtk_entry_get_icon_tooltip_markup(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip on the icon at the specified
      position in entry.
  
      Params:
        iconPos = the icon position
      Returns: the tooltip text, or null. Free the returned
            string with [gid.glib2.global.gfree] when done.
  */
  string getIconTooltipText(gid.gtk3.types.EntryIconPosition iconPos) nothrow
  {
    char* _cretval;
    _cretval = gtk_entry_get_icon_tooltip_text(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      This function returns the entry’s #GtkEntry:inner-border property. See
      [gid.gtk3.entry.Entry.setInnerBorder] for more information.
      Returns: the entry’s #GtkBorder, or
          null if none was set.
  
      Deprecated: Use the standard border and padding CSS properties (through
          objects like #GtkStyleContext and #GtkCssProvider); the value returned by
          this function is ignored by #GtkEntry.
  */
  gid.gtk3.border.Border getInnerBorder() nothrow
  {
    const(GtkBorder)* _cretval;
    _cretval = gtk_entry_get_inner_border(cast(GtkEntry*)this._cPtr);
    gid.gtk3.border.Border _retval;
    if (_cretval)
      _retval = *cast(gid.gtk3.border.Border*)_cretval;
    return _retval;
  }

  /**
      Gets the value of the #GtkEntry:input-hints property.
      Returns: 
  */
  gid.gtk3.types.InputHints getInputHints() nothrow
  {
    GtkInputHints _cretval;
    _cretval = gtk_entry_get_input_hints(cast(GtkEntry*)this._cPtr);
    gid.gtk3.types.InputHints _retval = cast(gid.gtk3.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the value of the #GtkEntry:input-purpose property.
      Returns: 
  */
  gid.gtk3.types.InputPurpose getInputPurpose() nothrow
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_entry_get_input_purpose(cast(GtkEntry*)this._cPtr);
    gid.gtk3.types.InputPurpose _retval = cast(gid.gtk3.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Retrieves the character displayed in place of the real characters
      for entries with visibility set to false. See [gid.gtk4.entry.Entry.setInvisibleChar].
      Returns: the current invisible char, or 0, if the entry does not
                      show invisible text at all.
  */
  dchar getInvisibleChar() nothrow
  {
    dchar _retval;
    _retval = gtk_entry_get_invisible_char(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #PangoLayout used to display the entry.
      The layout is useful to e.g. convert text positions to
      pixel positions, in combination with [gid.gtk3.entry.Entry.getLayoutOffsets].
      The returned layout is owned by the entry and must not be
      modified or freed by the caller.
      
      Keep in mind that the layout text may contain a preedit string, so
      [gid.gtk3.entry.Entry.layoutIndexToTextIndex] and
      [gid.gtk3.entry.Entry.textIndexToLayoutIndex] are needed to convert byte
      indices in the layout to byte indices in the entry contents.
      Returns: the #PangoLayout for this entry
  */
  gid.pango1.layout.Layout getLayout() nothrow
  {
    PangoLayout* _cretval;
    _cretval = gtk_entry_get_layout(cast(GtkEntry*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the #PangoLayout used to render text
      in the entry, in widget coordinates. Useful if you want to line
      up the text in an entry with some other text, e.g. when using the
      entry to implement editable cells in a sheet widget.
      
      Also useful to convert mouse events into coordinates inside the
      #PangoLayout, e.g. to take some action if some part of the entry text
      is clicked.
      
      Note that as the user scrolls around in the entry the offsets will
      change; you’ll need to connect to the “notify::scroll-offset”
      signal to track this. Remember when using the #PangoLayout
      functions you need to convert to and from pixels using
      PANGO_PIXELS() or #PANGO_SCALE.
      
      Keep in mind that the layout text may contain a preedit string, so
      [gid.gtk3.entry.Entry.layoutIndexToTextIndex] and
      [gid.gtk3.entry.Entry.textIndexToLayoutIndex] are needed to convert byte
      indices in the layout to byte indices in the entry contents.
  
      Params:
        x = location to store X offset of layout, or null
        y = location to store Y offset of layout, or null
  */
  void getLayoutOffsets(out int x, out int y) nothrow
  {
    gtk_entry_get_layout_offsets(cast(GtkEntry*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Retrieves the maximum allowed length of the text in
      entry. See [gid.gtk4.entry.Entry.setMaxLength].
      
      This is equivalent to getting entry's #GtkEntryBuffer and
      calling [gid.gtk4.entry_buffer.EntryBuffer.getMaxLength] on it.
      Returns: the maximum allowed number of characters
                      in #GtkEntry, or 0 if there is no maximum.
  */
  int getMaxLength() nothrow
  {
    int _retval;
    _retval = gtk_entry_get_max_length(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the desired maximum width of entry, in characters.
      See [gid.gtk3.entry.Entry.setMaxWidthChars].
      Returns: the maximum width of the entry, in characters
  */
  int getMaxWidthChars() nothrow
  {
    int _retval;
    _retval = gtk_entry_get_max_width_chars(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.entry.Entry.setOverwriteMode].
      Returns: whether the text is overwritten when typing.
  */
  bool getOverwriteMode() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_overwrite_mode(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the text that will be displayed when entry is empty and unfocused
      Returns: a pointer to the placeholder text as a string. This string points to internally allocated
        storage in the widget and must not be freed, modified or stored.
  */
  string getPlaceholderText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_placeholder_text(cast(GtkEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the current fraction of the task that’s been completed.
      See [gid.gtk4.entry.Entry.setProgressFraction].
      Returns: a fraction from 0.0 to 1.0
  */
  double getProgressFraction() nothrow
  {
    double _retval;
    _retval = gtk_entry_get_progress_fraction(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the pulse step set with [gid.gtk4.entry.Entry.setProgressPulseStep].
      Returns: a fraction from 0.0 to 1.0
  */
  double getProgressPulseStep() nothrow
  {
    double _retval;
    _retval = gtk_entry_get_progress_pulse_step(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tabstops that were set on the entry using [gid.gtk4.entry.Entry.setTabs], if
      any.
      Returns: the tabstops, or null if none was set.
  */
  gid.pango1.tab_array.TabArray getTabs() nothrow
  {
    PangoTabArray* _cretval;
    _cretval = gtk_entry_get_tabs(cast(GtkEntry*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.tab_array.TabArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the contents of the entry widget.
      See also [gid.gtk4.editable.Editable.getChars].
      
      This is equivalent to getting entry's #GtkEntryBuffer and calling
      [gid.gtk4.entry_buffer.EntryBuffer.getText] on it.
      Returns: a pointer to the contents of the widget as a
             string. This string points to internally allocated
             storage in the widget and must not be freed, modified or
             stored.
  */
  string getText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_text(cast(GtkEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the area where the entry’s text is drawn. This function is
      useful when drawing something to the entry in a draw callback.
      
      If the entry is not realized, text_area is filled with zeros.
      
      See also [gid.gtk4.entry.Entry.getIconArea].
  
      Params:
        textArea = Return location for the text area.
  */
  void getTextArea(out gid.gdk3.rectangle.Rectangle textArea) nothrow
  {
    gtk_entry_get_text_area(cast(GtkEntry*)this._cPtr, cast(GdkRectangle*)&textArea);
  }

  /**
      Retrieves the current length of the text in
      entry.
      
      This is equivalent to getting entry's #GtkEntryBuffer and
      calling [gid.gtk4.entry_buffer.EntryBuffer.getLength] on it.
      Returns: the current number of characters
                      in #GtkEntry, or 0 if there are none.
  */
  ushort getTextLength() nothrow
  {
    ushort _retval;
    _retval = gtk_entry_get_text_length(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the text in entry is visible. See
      [gid.gtk4.entry.Entry.setVisibility].
      Returns: true if the text is currently visible
  */
  bool getVisibility() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_visibility(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk3.entry.Entry.setWidthChars].
      Returns: number of chars to request space for, or negative if unset
  */
  int getWidthChars() nothrow
  {
    int _retval;
    _retval = gtk_entry_get_width_chars(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Causes entry to have keyboard focus.
      
      It behaves like [gid.gtk4.widget.Widget.grabFocus],
      except that it doesn't select the contents of the entry.
      You only want to call this on some special entries
      which the user usually doesn't want to replace all text in,
      such as search-as-you-type entries.
  */
  void grabFocusWithoutSelecting() nothrow
  {
    gtk_entry_grab_focus_without_selecting(cast(GtkEntry*)this._cPtr);
  }

  /**
      Allow the #GtkEntry input method to internally handle key press
      and release events. If this function returns true, then no further
      processing should be done for this key event. See
      [gid.gtk4.imcontext.IMContext.filterKeypress].
      
      Note that you are expected to call this function from your handler
      when overriding key event handling. This is needed in the case when
      you need to insert your own key handling between the input method
      and the default key event handling of the #GtkEntry.
      See [gid.gtk4.text_view.TextView.resetImContext] for an example of use.
  
      Params:
        event = the key event
      Returns: true if the input method handled the key event.
  */
  bool imContextFilterKeypress(gid.gdk3.event_key.EventKey event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_im_context_filter_keypress(cast(GtkEntry*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts from a position in the entry’s #PangoLayout (returned by
      [gid.gtk3.entry.Entry.getLayout]) to a position in the entry contents
      (returned by [gid.gtk3.entry.Entry.getText]).
  
      Params:
        layoutIndex = byte index into the entry layout text
      Returns: byte index into the entry contents
  */
  int layoutIndexToTextIndex(int layoutIndex) nothrow
  {
    int _retval;
    _retval = gtk_entry_layout_index_to_text_index(cast(GtkEntry*)this._cPtr, layoutIndex);
    return _retval;
  }

  /**
      Indicates that some progress is made, but you don’t know how much.
      Causes the entry’s progress indicator to enter “activity mode,”
      where a block bounces back and forth. Each call to
      [gid.gtk4.entry.Entry.progressPulse] causes the block to move by a little bit
      (the amount of movement per pulse is determined by
      [gid.gtk4.entry.Entry.setProgressPulseStep]).
  */
  void progressPulse() nothrow
  {
    gtk_entry_progress_pulse(cast(GtkEntry*)this._cPtr);
  }

  /**
      Reset the input method context of the entry if needed.
      
      This can be necessary in the case where modifying the buffer
      would confuse on-going input method behavior.
  */
  void resetImContext() nothrow
  {
    gtk_entry_reset_im_context(cast(GtkEntry*)this._cPtr);
  }

  /**
      If setting is true, pressing Enter in the entry will activate the default
      widget for the window containing the entry. This usually means that
      the dialog box containing the entry will be closed, since the default
      widget is usually one of the dialog buttons.
      
      (For experts: if setting is true, the entry calls
      [gid.gtk3.window.Window.activateDefault] on the window containing the entry, in
      the default handler for the #GtkEntry::activate signal.)
  
      Params:
        setting = true to activate window’s default widget on Enter keypress
  */
  void setActivatesDefault(bool setting) nothrow
  {
    gtk_entry_set_activates_default(cast(GtkEntry*)this._cPtr, setting);
  }

  /**
      Sets the alignment for the contents of the entry. This controls
      the horizontal positioning of the contents when the displayed
      text is shorter than the width of the entry.
  
      Params:
        xalign = The horizontal alignment, from 0 (left) to 1 (right).
                   Reversed for RTL layouts
  */
  void setAlignment(float xalign) nothrow
  {
    gtk_entry_set_alignment(cast(GtkEntry*)this._cPtr, xalign);
  }

  /**
      Sets a #PangoAttrList; the attributes in the list are applied to the
      entry text.
  
      Params:
        attrs = a #PangoAttrList
  */
  void setAttributes(gid.pango1.attr_list.AttrList attrs) nothrow
  {
    gtk_entry_set_attributes(cast(GtkEntry*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Set the #GtkEntryBuffer object which holds the text for
      this widget.
  
      Params:
        buffer = a #GtkEntryBuffer
  */
  void setBuffer(gid.gtk3.entry_buffer.EntryBuffer buffer) nothrow
  {
    gtk_entry_set_buffer(cast(GtkEntry*)this._cPtr, buffer ? cast(GtkEntryBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Sets completion to be the auxiliary completion object to use with entry.
      All further configuration of the completion mechanism is done on
      completion using the #GtkEntryCompletion API. Completion is disabled if
      completion is set to null.
  
      Params:
        completion = The #GtkEntryCompletion or null
  */
  void setCompletion(gid.gtk3.entry_completion.EntryCompletion completion = null) nothrow
  {
    gtk_entry_set_completion(cast(GtkEntry*)this._cPtr, completion ? cast(GtkEntryCompletion*)completion._cPtr(No.Dup) : null);
  }

  /**
      Hooks up an adjustment to the cursor position in an entry, so that when
      the cursor is moved, the adjustment is scrolled to show that position.
      See [gid.gtk4.scrolled_window.ScrolledWindow.getHadjustment] for a typical way of obtaining
      the adjustment.
      
      The adjustment has to be in pixel units and in the same coordinate system
      as the entry.
  
      Params:
        adjustment = an adjustment which should be adjusted when the cursor
                       is moved, or null
  */
  void setCursorHadjustment(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_entry_set_cursor_hadjustment(cast(GtkEntry*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the entry has a beveled frame around it.
  
      Params:
        setting = new value
  */
  void setHasFrame(bool setting) nothrow
  {
    gtk_entry_set_has_frame(cast(GtkEntry*)this._cPtr, setting);
  }

  /**
      Sets whether the icon is activatable.
  
      Params:
        iconPos = Icon position
        activatable = true if the icon should be activatable
  */
  void setIconActivatable(gid.gtk3.types.EntryIconPosition iconPos, bool activatable) nothrow
  {
    gtk_entry_set_icon_activatable(cast(GtkEntry*)this._cPtr, iconPos, activatable);
  }

  /**
      Sets up the icon at the given position so that GTK+ will start a drag
      operation when the user clicks and drags the icon.
      
      To handle the drag operation, you need to connect to the usual
      #GtkWidget::drag-data-get (or possibly #GtkWidget::drag-data-delete)
      signal, and use [gid.gtk4.entry.Entry.getCurrentIconDragSource] in
      your signal handler to find out if the drag was started from
      an icon.
      
      By default, GTK+ uses the icon as the drag icon. You can use the
      #GtkWidget::drag-begin signal to set a different icon. Note that you
      have to use g_signal_connect_after() to ensure that your signal handler
      gets executed after the default handler.
  
      Params:
        iconPos = icon position
        targetList = the targets (data formats) in which the data can be provided
        actions = a bitmask of the allowed drag actions
  */
  void setIconDragSource(gid.gtk3.types.EntryIconPosition iconPos, gid.gtk3.target_list.TargetList targetList, gid.gdk3.types.DragAction actions) nothrow
  {
    gtk_entry_set_icon_drag_source(cast(GtkEntry*)this._cPtr, iconPos, targetList ? cast(GtkTargetList*)targetList._cPtr(No.Dup) : null, actions);
  }

  /**
      Sets the icon shown in the entry at the specified position
      from the current icon theme.
      If the icon isn’t known, a “broken image” icon will be displayed
      instead.
      
      If icon is null, no icon will be shown in the specified position.
  
      Params:
        iconPos = The position at which to set the icon
        icon = The icon to set, or null
  */
  void setIconFromGicon(gid.gtk3.types.EntryIconPosition iconPos, gid.gio2.icon.Icon icon = null) nothrow
  {
    gtk_entry_set_icon_from_gicon(cast(GtkEntry*)this._cPtr, iconPos, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon shown in the entry at the specified position
      from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be displayed
      instead.
      
      If icon_name is null, no icon will be shown in the specified position.
  
      Params:
        iconPos = The position at which to set the icon
        iconName = An icon name, or null
  */
  void setIconFromIconName(gid.gtk3.types.EntryIconPosition iconPos, string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    gtk_entry_set_icon_from_icon_name(cast(GtkEntry*)this._cPtr, iconPos, _iconName);
  }

  /**
      Sets the icon shown in the specified position using a pixbuf.
      
      If pixbuf is null, no icon will be shown in the specified position.
  
      Params:
        iconPos = Icon position
        pixbuf = A #GdkPixbuf, or null
  */
  void setIconFromPixbuf(gid.gtk3.types.EntryIconPosition iconPos, gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    gtk_entry_set_icon_from_pixbuf(cast(GtkEntry*)this._cPtr, iconPos, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon shown in the entry at the specified position from
      a stock image.
      
      If stock_id is null, no icon will be shown in the specified position.
  
      Params:
        iconPos = Icon position
        stockId = The name of the stock item, or null
  
      Deprecated: Use [gid.gtk4.entry.Entry.setIconFromIconName] instead.
  */
  void setIconFromStock(gid.gtk3.types.EntryIconPosition iconPos, string stockId = null) nothrow
  {
    const(char)* _stockId = stockId.toCString!(No.Malloc, Yes.Nullable);
    gtk_entry_set_icon_from_stock(cast(GtkEntry*)this._cPtr, iconPos, _stockId);
  }

  /**
      Sets the sensitivity for the specified icon.
  
      Params:
        iconPos = Icon position
        sensitive = Specifies whether the icon should appear
                      sensitive or insensitive
  */
  void setIconSensitive(gid.gtk3.types.EntryIconPosition iconPos, bool sensitive) nothrow
  {
    gtk_entry_set_icon_sensitive(cast(GtkEntry*)this._cPtr, iconPos, sensitive);
  }

  /**
      Sets tooltip as the contents of the tooltip for the icon at
      the specified position. tooltip is assumed to be marked up with
      the [Pango text markup language][PangoMarkupFormat].
      
      Use null for tooltip to remove an existing tooltip.
      
      See also [gid.gtk4.widget.Widget.setTooltipMarkup] and
      [gid.gtk4.entry.Entry.setIconTooltipText].
  
      Params:
        iconPos = the icon position
        tooltip = the contents of the tooltip for the icon, or null
  */
  void setIconTooltipMarkup(gid.gtk3.types.EntryIconPosition iconPos, string tooltip = null) nothrow
  {
    const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
    gtk_entry_set_icon_tooltip_markup(cast(GtkEntry*)this._cPtr, iconPos, _tooltip);
  }

  /**
      Sets tooltip as the contents of the tooltip for the icon
      at the specified position.
      
      Use null for tooltip to remove an existing tooltip.
      
      See also [gid.gtk4.widget.Widget.setTooltipText] and
      [gid.gtk4.entry.Entry.setIconTooltipMarkup].
      
      If you unset the widget tooltip via [gid.gtk4.widget.Widget.setTooltipText] or
      [gid.gtk4.widget.Widget.setTooltipMarkup], this sets GtkWidget:has-tooltip to false,
      which suppresses icon tooltips too. You can resolve this by then calling
      [gid.gtk4.widget.Widget.setHasTooltip] to set GtkWidget:has-tooltip back to true, or
      setting at least one non-empty tooltip on any icon achieves the same result.
  
      Params:
        iconPos = the icon position
        tooltip = the contents of the tooltip for the icon, or null
  */
  void setIconTooltipText(gid.gtk3.types.EntryIconPosition iconPos, string tooltip = null) nothrow
  {
    const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
    gtk_entry_set_icon_tooltip_text(cast(GtkEntry*)this._cPtr, iconPos, _tooltip);
  }

  /**
      Sets `entry`’s inner-border property to border, or clears it if null
      is passed. The inner-border is the area around the entry’s text, but
      inside its frame.
      
      If set, this property overrides the inner-border style property.
      Overriding the style-provided border is useful when you want to do
      in-place editing of some text in a canvas or list widget, where
      pixel-exact positioning of the entry is important.
  
      Params:
        border = a #GtkBorder, or null
  
      Deprecated: Use the standard border and padding CSS properties (through
          objects like #GtkStyleContext and #GtkCssProvider); the value set with
          this function is ignored by #GtkEntry.
  */
  void setInnerBorder(gid.gtk3.border.Border* border = null) nothrow
  {
    gtk_entry_set_inner_border(cast(GtkEntry*)this._cPtr, cast(const(GtkBorder)*)border);
  }

  /**
      Sets the #GtkEntry:input-hints property, which
      allows input methods to fine-tune their behaviour.
  
      Params:
        hints = the hints
  */
  void setInputHints(gid.gtk3.types.InputHints hints) nothrow
  {
    gtk_entry_set_input_hints(cast(GtkEntry*)this._cPtr, hints);
  }

  /**
      Sets the #GtkEntry:input-purpose property which
      can be used by on-screen keyboards and other input
      methods to adjust their behaviour.
  
      Params:
        purpose = the purpose
  */
  void setInputPurpose(gid.gtk3.types.InputPurpose purpose) nothrow
  {
    gtk_entry_set_input_purpose(cast(GtkEntry*)this._cPtr, purpose);
  }

  /**
      Sets the character to use in place of the actual text when
      [gid.gtk4.entry.Entry.setVisibility] has been called to set text visibility
      to false. i.e. this is the character used in “password mode” to
      show the user how many characters have been typed. By default, GTK+
      picks the best invisible char available in the current font. If you
      set the invisible char to 0, then the user will get no feedback
      at all; there will be no text on the screen as they type.
  
      Params:
        ch = a Unicode character
  */
  void setInvisibleChar(dchar ch) nothrow
  {
    gtk_entry_set_invisible_char(cast(GtkEntry*)this._cPtr, ch);
  }

  /**
      Sets the maximum allowed length of the contents of the widget. If
      the current contents are longer than the given length, then they
      will be truncated to fit.
      
      This is equivalent to getting entry's #GtkEntryBuffer and
      calling [gid.gtk4.entry_buffer.EntryBuffer.setMaxLength] on it.
      ]|
  
      Params:
        max = the maximum length of the entry, or 0 for no maximum.
            (other than the maximum length of entries.) The value passed in will
            be clamped to the range 0-65536.
  */
  void setMaxLength(int max) nothrow
  {
    gtk_entry_set_max_length(cast(GtkEntry*)this._cPtr, max);
  }

  /**
      Sets the desired maximum width in characters of entry.
  
      Params:
        nChars = the new desired maximum width, in characters
  */
  void setMaxWidthChars(int nChars) nothrow
  {
    gtk_entry_set_max_width_chars(cast(GtkEntry*)this._cPtr, nChars);
  }

  /**
      Sets whether the text is overwritten when typing in the #GtkEntry.
  
      Params:
        overwrite = new value
  */
  void setOverwriteMode(bool overwrite) nothrow
  {
    gtk_entry_set_overwrite_mode(cast(GtkEntry*)this._cPtr, overwrite);
  }

  /**
      Sets text to be displayed in entry when it is empty and unfocused.
      This can be used to give a visual hint of the expected contents of
      the #GtkEntry.
      
      Note that since the placeholder text gets removed when the entry
      received focus, using this feature is a bit problematic if the entry
      is given the initial focus in a window. Sometimes this can be
      worked around by delaying the initial focus setting until the
      first key event arrives.
  
      Params:
        text = a string to be displayed when entry is empty and unfocused, or null
  */
  void setPlaceholderText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_entry_set_placeholder_text(cast(GtkEntry*)this._cPtr, _text);
  }

  /**
      Causes the entry’s progress indicator to “fill in” the given
      fraction of the bar. The fraction should be between 0.0 and 1.0,
      inclusive.
  
      Params:
        fraction = fraction of the task that’s been completed
  */
  void setProgressFraction(double fraction) nothrow
  {
    gtk_entry_set_progress_fraction(cast(GtkEntry*)this._cPtr, fraction);
  }

  /**
      Sets the fraction of total entry width to move the progress
      bouncing block for each call to [gid.gtk4.entry.Entry.progressPulse].
  
      Params:
        fraction = fraction between 0.0 and 1.0
  */
  void setProgressPulseStep(double fraction) nothrow
  {
    gtk_entry_set_progress_pulse_step(cast(GtkEntry*)this._cPtr, fraction);
  }

  /**
      Sets a #PangoTabArray; the tabstops in the array are applied to the entry
      text.
  
      Params:
        tabs = a #PangoTabArray
  */
  void setTabs(gid.pango1.tab_array.TabArray tabs) nothrow
  {
    gtk_entry_set_tabs(cast(GtkEntry*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets the text in the widget to the given
      value, replacing the current contents.
      
      See [gid.gtk4.entry_buffer.EntryBuffer.setText].
  
      Params:
        text = the new text
  */
  void setText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    gtk_entry_set_text(cast(GtkEntry*)this._cPtr, _text);
  }

  /**
      Sets whether the contents of the entry are visible or not.
      When visibility is set to false, characters are displayed
      as the invisible char, and will also appear that way when
      the text in the entry widget is copied elsewhere.
      
      By default, GTK+ picks the best invisible character available
      in the current font, but it can be changed with
      [gid.gtk4.entry.Entry.setInvisibleChar].
      
      Note that you probably want to set #GtkEntry:input-purpose
      to [gid.gtk4.types.InputPurpose.Password] or [gid.gtk4.types.InputPurpose.Pin] to
      inform input methods about the purpose of this entry,
      in addition to setting visibility to false.
  
      Params:
        visible = true if the contents of the entry are displayed
                    as plaintext
  */
  void setVisibility(bool visible) nothrow
  {
    gtk_entry_set_visibility(cast(GtkEntry*)this._cPtr, visible);
  }

  /**
      Changes the size request of the entry to be about the right size
      for n_chars characters. Note that it changes the size
      request, the size can still be affected by
      how you pack the widget into containers. If n_chars is -1, the
      size reverts to the default entry size.
  
      Params:
        nChars = width in chars
  */
  void setWidthChars(int nChars) nothrow
  {
    gtk_entry_set_width_chars(cast(GtkEntry*)this._cPtr, nChars);
  }

  /**
      Converts from a position in the entry contents (returned
      by [gid.gtk3.entry.Entry.getText]) to a position in the
      entry’s #PangoLayout (returned by [gid.gtk3.entry.Entry.getLayout],
      with text retrieved via [gid.pango1.layout.Layout.getText]).
  
      Params:
        textIndex = byte index into the entry contents
      Returns: byte index into the entry layout text
  */
  int textIndexToLayoutIndex(int textIndex) nothrow
  {
    int _retval;
    _retval = gtk_entry_text_index_to_layout_index(cast(GtkEntry*)this._cPtr, textIndex);
    return _retval;
  }

  /**
      Unsets the invisible char previously set with
      [gid.gtk4.entry.Entry.setInvisibleChar]. So that the
      default invisible char is used again.
  */
  void unsetInvisibleChar() nothrow
  {
    gtk_entry_unset_invisible_char(cast(GtkEntry*)this._cPtr);
  }

  /**
      Connect to `Activate` signal.
  
      The ::activate signal is emitted when the user hits
        the Enter key.
        
        While this signal is used as a
        [keybinding signal][GtkBindingSignal],
        it is also commonly used by applications to intercept
        activation of entries.
        
        The default bindings for this signal are all forms of the Enter key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `Backspace` signal.
  
      The ::backspace signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user asks for it.
        
        The default bindings for this signal are
        Backspace and Shift-Backspace.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBackspace(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.backspace");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("backspace", closure, after);
  }

  /**
      Connect to `CopyClipboard` signal.
  
      The ::copy-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to copy the selection to the clipboard.
        
        The default bindings for this signal are
        Ctrl-c and Ctrl-Insert.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.copyClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Connect to `CutClipboard` signal.
  
      The ::cut-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to cut the selection to the clipboard.
        
        The default bindings for this signal are
        Ctrl-x and Shift-Delete.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.cutClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cut-clipboard", closure, after);
  }

  /**
      Connect to `DeleteFromCursor` signal.
  
      The ::delete-from-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a text deletion.
        
        If the type is [gid.gtk4.types.DeleteType.Chars], GTK+ deletes the selection
        if there is one, otherwise it deletes the requested number
        of characters.
        
        The default bindings for this signal are
        Delete for deleting a character and Ctrl-Delete for
        deleting a word.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.DeleteType type, int count, gid.gtk3.entry.Entry entry)`
  
          `type` the granularity of the deletion, as a #GtkDeleteType (optional)
  
          `count` the number of type units to delete (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DeleteType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.deleteFromCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-from-cursor", closure, after);
  }

  /**
      Connect to `IconPress` signal.
  
      The ::icon-press signal is emitted when an activatable icon
        is clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.EntryIconPosition iconPos, gid.gdk3.event.Event event, gid.gtk3.entry.Entry entry)`
  
          `iconPos` The position of the clicked icon (optional)
  
          `event` the button press event (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectIconPress(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.EntryIconPosition)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.iconPress");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("icon-press", closure, after);
  }

  /**
      Connect to `IconRelease` signal.
  
      The ::icon-release signal is emitted on the button release from a
        mouse click over an activatable icon.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.EntryIconPosition iconPos, gid.gdk3.event.Event event, gid.gtk3.entry.Entry entry)`
  
          `iconPos` The position of the clicked icon (optional)
  
          `event` the button release event (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectIconRelease(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.EntryIconPosition)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.iconRelease");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("icon-release", closure, after);
  }

  /**
      Connect to `InsertAtCursor` signal.
  
      The ::insert-at-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates the insertion of a
        fixed string at the cursor.
        
        This signal has no default bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string string_, gid.gtk3.entry.Entry entry)`
  
          `string_` the string to insert (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.insertAtCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-at-cursor", closure, after);
  }

  /**
      Connect to `InsertEmoji` signal.
  
      The ::insert-emoji signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to present the Emoji chooser for the entry.
        
        The default bindings for this signal are Ctrl-. and Ctrl-;
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.insertEmoji");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-emoji", closure, after);
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
  
          `void callback(gid.gtk3.types.MovementStep step, int count, bool extendSelection, gid.gtk3.entry.Entry entry)`
  
          `step` the granularity of the move, as a #GtkMovementStep (optional)
  
          `count` the number of step units to move (optional)
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.moveCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `PasteClipboard` signal.
  
      The ::paste-clipboard signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to paste the contents of the clipboard
        into the text view.
        
        The default bindings for this signal are
        Ctrl-v and Shift-Insert.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.pasteClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
      Connect to `PopulatePopup` signal.
  
      The ::populate-popup signal gets emitted before showing the
        context menu of the entry.
        
        If you need to add items to the context menu, connect
        to this signal and append your items to the widget, which
        will be a #GtkMenu in this case.
        
        If #GtkEntry:populate-all is true, this signal will
        also be emitted to populate touch popups. In this case,
        widget will be a different container, e.g. a #GtkToolbar.
        The signal handler should not make assumptions about the
        type of widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget, gid.gtk3.entry.Entry entry)`
  
          `widget` the container that is being populated (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.populatePopup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      If an input method is used, the typed text will not immediately
        be committed to the buffer. So if you are interested in the text,
        connect to this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string preedit, gid.gtk3.entry.Entry entry)`
  
          `preedit` the current preedit string (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.preeditChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `ToggleDirection` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleDirection(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.toggleDirection");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-direction", closure, after);
  }

  /**
      Connect to `ToggleOverwrite` signal.
  
      The ::toggle-overwrite signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to toggle the overwrite mode of the entry.
        
        The default bindings for this signal is Insert.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.entry.Entry entry)`
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.entry.Entry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.toggleOverwrite");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-overwrite", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Entry
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.entry.Entry), T.stringof ~ " is not derived from gid.gtk3.entry.Entry");

    gid.gtk3.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBackspace", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "backspace");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopyClipboard", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "copy_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCutClipboard", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "cut_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteFromCursor", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "delete_from_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertAtCursor", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "insert_at_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsertEmoji", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "insert_emoji");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCursor", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "move_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPasteClipboard", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "paste_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopulatePopup", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "populate_popup");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleDirection", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "toggle_direction");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleOverwrite", true)[0]) == gid.gtk3.entry.Entry))
      _installVfunc(klass, "toggle_overwrite");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkEntryClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(entry);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "backspace":
      {
        static extern(C) void _vfuncBackspaceTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.backspace)
              return (cast(typeof(&_vfuncBackspaceTramp))_klass.backspace)(entry);
            return;
          }

          try
          {
            _obj.vfuncBackspace();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncBackspace");
          }
        }

        _klass.backspace = cast(typeof(_klass.backspace))&_vfuncBackspaceTramp;
        break;
      }
      case "copy_clipboard":
      {
        static extern(C) void _vfuncCopyClipboardTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.copyClipboard)
              return (cast(typeof(&_vfuncCopyClipboardTramp))_klass.copyClipboard)(entry);
            return;
          }

          try
          {
            _obj.vfuncCopyClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncCopyClipboard");
          }
        }

        _klass.copyClipboard = cast(typeof(_klass.copyClipboard))&_vfuncCopyClipboardTramp;
        break;
      }
      case "cut_clipboard":
      {
        static extern(C) void _vfuncCutClipboardTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.cutClipboard)
              return (cast(typeof(&_vfuncCutClipboardTramp))_klass.cutClipboard)(entry);
            return;
          }

          try
          {
            _obj.vfuncCutClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncCutClipboard");
          }
        }

        _klass.cutClipboard = cast(typeof(_klass.cutClipboard))&_vfuncCutClipboardTramp;
        break;
      }
      case "delete_from_cursor":
      {
        static extern(C) void _vfuncDeleteFromCursorTramp(GtkEntry* entry, GtkDeleteType type, int count) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.deleteFromCursor)
              return (cast(typeof(&_vfuncDeleteFromCursorTramp))_klass.deleteFromCursor)(entry, type, count);
            return;
          }

          try
          {
            _obj.vfuncDeleteFromCursor(type, count);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncDeleteFromCursor");
          }
        }

        _klass.deleteFromCursor = cast(typeof(_klass.deleteFromCursor))&_vfuncDeleteFromCursorTramp;
        break;
      }
      case "insert_at_cursor":
      {
        static extern(C) void _vfuncInsertAtCursorTramp(GtkEntry* entry, const(char)* str) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.insertAtCursor)
              return (cast(typeof(&_vfuncInsertAtCursorTramp))_klass.insertAtCursor)(entry, str);
            return;
          }

          string _str = str.fromCString!(No.Free);

          try
          {
            _obj.vfuncInsertAtCursor(_str);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncInsertAtCursor");
          }
        }

        _klass.insertAtCursor = cast(typeof(_klass.insertAtCursor))&_vfuncInsertAtCursorTramp;
        break;
      }
      case "insert_emoji":
      {
        static extern(C) void _vfuncInsertEmojiTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.insertEmoji)
              return (cast(typeof(&_vfuncInsertEmojiTramp))_klass.insertEmoji)(entry);
            return;
          }

          try
          {
            _obj.vfuncInsertEmoji();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncInsertEmoji");
          }
        }

        _klass.insertEmoji = cast(typeof(_klass.insertEmoji))&_vfuncInsertEmojiTramp;
        break;
      }
      case "move_cursor":
      {
        static extern(C) void _vfuncMoveCursorTramp(GtkEntry* entry, GtkMovementStep step, int count, gboolean extendSelection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.moveCursor)
              return (cast(typeof(&_vfuncMoveCursorTramp))_klass.moveCursor)(entry, step, count, extendSelection);
            return;
          }

          try
          {
            _obj.vfuncMoveCursor(step, count, cast(bool)extendSelection);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncMoveCursor");
          }
        }

        _klass.moveCursor = cast(typeof(_klass.moveCursor))&_vfuncMoveCursorTramp;
        break;
      }
      case "paste_clipboard":
      {
        static extern(C) void _vfuncPasteClipboardTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.pasteClipboard)
              return (cast(typeof(&_vfuncPasteClipboardTramp))_klass.pasteClipboard)(entry);
            return;
          }

          try
          {
            _obj.vfuncPasteClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncPasteClipboard");
          }
        }

        _klass.pasteClipboard = cast(typeof(_klass.pasteClipboard))&_vfuncPasteClipboardTramp;
        break;
      }
      case "populate_popup":
      {
        static extern(C) void _vfuncPopulatePopupTramp(GtkEntry* entry, GtkWidget* popup) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.populatePopup)
              return (cast(typeof(&_vfuncPopulatePopupTramp))_klass.populatePopup)(entry, popup);
            return;
          }

          try
          {
            _obj.vfuncPopulatePopup(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)popup, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncPopulatePopup");
          }
        }

        _klass.populatePopup = cast(typeof(_klass.populatePopup))&_vfuncPopulatePopupTramp;
        break;
      }
      case "toggle_direction":
      {
        static extern(C) void _vfuncToggleDirectionTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.toggleDirection)
              return (cast(typeof(&_vfuncToggleDirectionTramp))_klass.toggleDirection)(entry);
            return;
          }

          try
          {
            _obj.vfuncToggleDirection();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncToggleDirection");
          }
        }

        _klass.toggleDirection = cast(typeof(_klass.toggleDirection))&_vfuncToggleDirectionTramp;
        break;
      }
      case "toggle_overwrite":
      {
        static extern(C) void _vfuncToggleOverwriteTramp(GtkEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.entry.Entry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.toggleOverwrite)
              return (cast(typeof(&_vfuncToggleOverwriteTramp))_klass.toggleOverwrite)(entry);
            return;
          }

          try
          {
            _obj.vfuncToggleOverwrite();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.entry.Entry.vfuncToggleOverwrite");
          }
        }

        _klass.toggleOverwrite = cast(typeof(_klass.toggleOverwrite))&_vfuncToggleOverwriteTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.entry.Entry]
class EntryGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T, gid.gtk3.cell_editable.CellEditableGidBuilderImpl!T, gid.gtk3.editable.EditableGidBuilderImpl!T
{

  mixin CellEditableGidBuilderT!();
  mixin EditableGidBuilderT!();

  /** */
  T activatesDefault(bool propval) nothrow
  {
    return setProperty("activates-default", propval);
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of Pango attributes to apply to the text of the entry.
          
          This is mainly useful to change the size or weight of the text.
          
          The #PangoAttribute's @start_index and @end_index must refer to the
          #GtkEntryBuffer text, i.e. without the preedit string.
      Returns: Builder instance for fluent chaining
  */
  T attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    return setProperty("attributes", propval);
  }

  /** */
  T buffer(gid.gtk3.entry_buffer.EntryBuffer propval) nothrow
  {
    return setProperty("buffer", propval);
  }

  /**
      Set `capsLockWarning` property.
      Params:
        propval = Whether password entries will show a warning when Caps Lock is on.
          
          Note that the warning is shown using a secondary icon, and thus
          does not work if you are using the secondary icon position for some
          other purpose.
      Returns: Builder instance for fluent chaining
  */
  T capsLockWarning(bool propval) nothrow
  {
    return setProperty("caps-lock-warning", propval);
  }

  /**
      Set `completion` property.
      Params:
        propval = The auxiliary completion object to use with the entry.
      Returns: Builder instance for fluent chaining
  */
  T completion(gid.gtk3.entry_completion.EntryCompletion propval) nothrow
  {
    return setProperty("completion", propval);
  }

  /** */
  T editable(bool propval) nothrow
  {
    return setProperty("editable", propval);
  }

  /** */
  T enableEmojiCompletion(bool propval) nothrow
  {
    return setProperty("enable-emoji-completion", propval);
  }

  /** */
  T hasFrame(bool propval) nothrow
  {
    return setProperty("has-frame", propval);
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this entry.
          See #GtkIMContext.
          
          Setting this to a non-null value overrides the
          system-wide IM module setting. See the GtkSettings
          #GtkSettings:gtk-im-module property.
      Returns: Builder instance for fluent chaining
  */
  T imModule(string propval) nothrow
  {
    return setProperty("im-module", propval);
  }

  /**
      Set `innerBorder` property.
      Params:
        propval = Sets the text area's border between the text and the frame.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use the standard border and padding CSS properties
          (through objects like #GtkStyleContext and #GtkCssProvider); the value
          of this style property is ignored.
  */
  T innerBorder(gid.gtk3.border.Border propval) nothrow
  {
    return setProperty("inner-border", propval);
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond #GtkEntry:input-purpose) that
          allow input methods to fine-tune their behaviour.
      Returns: Builder instance for fluent chaining
  */
  T inputHints(gid.gtk3.types.InputHints propval) nothrow
  {
    return setProperty("input-hints", propval);
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of this text field.
          
          This property can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
          
          Note that setting the purpose to [gid.gtk4.types.InputPurpose.Password] or
          [gid.gtk4.types.InputPurpose.Pin] is independent from setting
          #GtkEntry:visibility.
      Returns: Builder instance for fluent chaining
  */
  T inputPurpose(gid.gtk3.types.InputPurpose propval) nothrow
  {
    return setProperty("input-purpose", propval);
  }

  /**
      Set `invisibleChar` property.
      Params:
        propval = The invisible character is used when masking entry contents (in
          \"password mode\")"). When it is not explicitly set with the
          #GtkEntry:invisible-char property, GTK+ determines the character
          to use from a list of possible candidates, depending on availability
          in the current font.
          
          This style property allows the theme to prepend a character
          to the list of candidates.
      Returns: Builder instance for fluent chaining
  */
  T invisibleChar(uint propval) nothrow
  {
    return setProperty("invisible-char", propval);
  }

  /**
      Set `invisibleCharSet` property.
      Params:
        propval = Whether the invisible char has been set for the #GtkEntry.
      Returns: Builder instance for fluent chaining
  */
  T invisibleCharSet(bool propval) nothrow
  {
    return setProperty("invisible-char-set", propval);
  }

  /** */
  T maxLength(int propval) nothrow
  {
    return setProperty("max-length", propval);
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the entry, in characters.
          If this property is set to -1, the width will be calculated
          automatically.
      Returns: Builder instance for fluent chaining
  */
  T maxWidthChars(int propval) nothrow
  {
    return setProperty("max-width-chars", propval);
  }

  /**
      Set `overwriteMode` property.
      Params:
        propval = If text is overwritten when typing in the #GtkEntry.
      Returns: Builder instance for fluent chaining
  */
  T overwriteMode(bool propval) nothrow
  {
    return setProperty("overwrite-mode", propval);
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the #GtkEntry when it is empty
          and unfocused.
      Returns: Builder instance for fluent chaining
  */
  T placeholderText(string propval) nothrow
  {
    return setProperty("placeholder-text", propval);
  }

  /**
      Set `populateAll` property.
      Params:
        propval = If :populate-all is true, the #GtkEntry::populate-popup
          signal is also emitted for touch popups.
      Returns: Builder instance for fluent chaining
  */
  T populateAll(bool propval) nothrow
  {
    return setProperty("populate-all", propval);
  }

  /**
      Set `primaryIconActivatable` property.
      Params:
        propval = Whether the primary icon is activatable.
          
          GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
          signals only on sensitive, activatable icons.
          
          Sensitive, but non-activatable icons can be used for purely
          informational purposes.
      Returns: Builder instance for fluent chaining
  */
  T primaryIconActivatable(bool propval) nothrow
  {
    return setProperty("primary-icon-activatable", propval);
  }

  /**
      Set `primaryIconGicon` property.
      Params:
        propval = The #GIcon to use for the primary icon for the entry.
      Returns: Builder instance for fluent chaining
  */
  T primaryIconGicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("primary-icon-gicon", propval);
  }

  /**
      Set `primaryIconName` property.
      Params:
        propval = The icon name to use for the primary icon for the entry.
      Returns: Builder instance for fluent chaining
  */
  T primaryIconName(string propval) nothrow
  {
    return setProperty("primary-icon-name", propval);
  }

  /**
      Set `primaryIconPixbuf` property.
      Params:
        propval = A pixbuf to use as the primary icon for the entry.
      Returns: Builder instance for fluent chaining
  */
  T primaryIconPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("primary-icon-pixbuf", propval);
  }

  /**
      Set `primaryIconSensitive` property.
      Params:
        propval = Whether the primary icon is sensitive.
          
          An insensitive icon appears grayed out. GTK+ does not emit the
          #GtkEntry::icon-press and #GtkEntry::icon-release signals and
          does not allow DND from insensitive icons.
          
          An icon should be set insensitive if the action that would trigger
          when clicked is currently not available.
      Returns: Builder instance for fluent chaining
  */
  T primaryIconSensitive(bool propval) nothrow
  {
    return setProperty("primary-icon-sensitive", propval);
  }

  /**
      Set `primaryIconStock` property.
      Params:
        propval = The stock id to use for the primary icon for the entry.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkEntry:primary-icon-name instead.
  */
  T primaryIconStock(string propval) nothrow
  {
    return setProperty("primary-icon-stock", propval);
  }

  /**
      Set `primaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the primary icon, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipMarkup].
      Returns: Builder instance for fluent chaining
  */
  T primaryIconTooltipMarkup(string propval) nothrow
  {
    return setProperty("primary-icon-tooltip-markup", propval);
  }

  /**
      Set `primaryIconTooltipText` property.
      Params:
        propval = The contents of the tooltip on the primary icon.
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipText].
      Returns: Builder instance for fluent chaining
  */
  T primaryIconTooltipText(string propval) nothrow
  {
    return setProperty("primary-icon-tooltip-text", propval);
  }

  /**
      Set `progressFraction` property.
      Params:
        propval = The current fraction of the task that's been completed.
      Returns: Builder instance for fluent chaining
  */
  T progressFraction(double propval) nothrow
  {
    return setProperty("progress-fraction", propval);
  }

  /**
      Set `progressPulseStep` property.
      Params:
        propval = The fraction of total entry width to move the progress
          bouncing block for each call to [gid.gtk4.entry.Entry.progressPulse].
      Returns: Builder instance for fluent chaining
  */
  T progressPulseStep(double propval) nothrow
  {
    return setProperty("progress-pulse-step", propval);
  }

  /**
      Set `secondaryIconActivatable` property.
      Params:
        propval = Whether the secondary icon is activatable.
          
          GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
          signals only on sensitive, activatable icons.
          
          Sensitive, but non-activatable icons can be used for purely
          informational purposes.
      Returns: Builder instance for fluent chaining
  */
  T secondaryIconActivatable(bool propval) nothrow
  {
    return setProperty("secondary-icon-activatable", propval);
  }

  /**
      Set `secondaryIconGicon` property.
      Params:
        propval = The #GIcon to use for the secondary icon for the entry.
      Returns: Builder instance for fluent chaining
  */
  T secondaryIconGicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("secondary-icon-gicon", propval);
  }

  /**
      Set `secondaryIconName` property.
      Params:
        propval = The icon name to use for the secondary icon for the entry.
      Returns: Builder instance for fluent chaining
  */
  T secondaryIconName(string propval) nothrow
  {
    return setProperty("secondary-icon-name", propval);
  }

  /**
      Set `secondaryIconPixbuf` property.
      Params:
        propval = An pixbuf to use as the secondary icon for the entry.
      Returns: Builder instance for fluent chaining
  */
  T secondaryIconPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("secondary-icon-pixbuf", propval);
  }

  /**
      Set `secondaryIconSensitive` property.
      Params:
        propval = Whether the secondary icon is sensitive.
          
          An insensitive icon appears grayed out. GTK+ does not emit the
          #GtkEntry::icon-press and #GtkEntry::icon-release signals and
          does not allow DND from insensitive icons.
          
          An icon should be set insensitive if the action that would trigger
          when clicked is currently not available.
      Returns: Builder instance for fluent chaining
  */
  T secondaryIconSensitive(bool propval) nothrow
  {
    return setProperty("secondary-icon-sensitive", propval);
  }

  /**
      Set `secondaryIconStock` property.
      Params:
        propval = The stock id to use for the secondary icon for the entry.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkEntry:secondary-icon-name instead.
  */
  T secondaryIconStock(string propval) nothrow
  {
    return setProperty("secondary-icon-stock", propval);
  }

  /**
      Set `secondaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the secondary icon, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipMarkup].
      Returns: Builder instance for fluent chaining
  */
  T secondaryIconTooltipMarkup(string propval) nothrow
  {
    return setProperty("secondary-icon-tooltip-markup", propval);
  }

  /**
      Set `secondaryIconTooltipText` property.
      Params:
        propval = The contents of the tooltip on the secondary icon.
          
          Also see [gid.gtk4.entry.Entry.setIconTooltipText].
      Returns: Builder instance for fluent chaining
  */
  T secondaryIconTooltipText(string propval) nothrow
  {
    return setProperty("secondary-icon-tooltip-text", propval);
  }

  /**
      Set `shadowType` property.
      Params:
        propval = Which kind of shadow to draw around the entry when
          #GtkEntry:has-frame is set to true.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use CSS to determine the style of the border;
            the value of this style property is ignored.
  */
  T shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    return setProperty("shadow-type", propval);
  }

  /** */
  T showEmojiIcon(bool propval) nothrow
  {
    return setProperty("show-emoji-icon", propval);
  }

  /** */
  T tabs(gid.pango1.tab_array.TabArray propval) nothrow
  {
    return setProperty("tabs", propval);
  }

  /** */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }

  /**
      Set `truncateMultiline` property.
      Params:
        propval = When true, pasted multi-line text is truncated to the first line.
      Returns: Builder instance for fluent chaining
  */
  T truncateMultiline(bool propval) nothrow
  {
    return setProperty("truncate-multiline", propval);
  }

  /** */
  T visibility(bool propval) nothrow
  {
    return setProperty("visibility", propval);
  }

  /** */
  T widthChars(int propval) nothrow
  {
    return setProperty("width-chars", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment, from 0 (left) to 1 (right).
          Reversed for RTL layouts.
      Returns: Builder instance for fluent chaining
  */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }
}

/// Fluent builder for [gid.gtk3.entry.Entry]
final class EntryGidBuilder : EntryGidBuilderImpl!EntryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Entry build() nothrow
  {
    return new Entry(cast(void*)createGObject(Entry._getGType), Yes.Take);
  }
}
