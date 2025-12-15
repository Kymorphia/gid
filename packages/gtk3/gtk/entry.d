/// Module for [Entry] class
module gtk.entry;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event;
import gdk.event_key;
import gdk.rectangle;
import gdk.types;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.border;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.entry_buffer;
import gtk.entry_completion;
import gtk.target_list;
import gtk.types;
import gtk.widget;
import pango.attr_list;
import pango.layout;
import pango.tab_array;

/**
    The #GtkEntry widget is a single line text entry
    widget. A fairly large set of key bindings are supported
    by default. If the entered text is longer than the allocation
    of the widget, the widget will scroll so that the cursor
    position is visible.
    
    When using an entry for passwords and other sensitive information,
    it can be put into “password mode” using [gtk.entry.Entry.setVisibility].
    In this mode, entered text is displayed using a “invisible” character.
    By default, GTK+ picks the best invisible character that is available
    in the current font, but it can be changed with
    [gtk.entry.Entry.setInvisibleChar]. Since 2.16, GTK+ displays a warning
    when Caps Lock or input methods might interfere with entering text in
    a password entry. The warning can be turned off with the
    #GtkEntry:caps-lock-warning property.
    
    Since 2.16, GtkEntry has the ability to display progress or activity
    information behind the text. To make an entry display such information,
    use [gtk.entry.Entry.setProgressFraction] or [gtk.entry.Entry.setProgressPulseStep].
    
    Additionally, GtkEntry can show icons at either side of the entry. These
    icons can be activatable by clicking, can be set up as drag source and
    can have tooltips. To add an icon, use [gtk.entry.Entry.setIconFromGicon] or
    one of the various other functions that set an icon from a stock id, an
    icon name or a pixbuf. To trigger an action when the user clicks an icon,
    connect to the #GtkEntry::icon-press signal. To allow DND operations
    from an icon, use [gtk.entry.Entry.setIconDragSource]. To set a tooltip on
    an icon, use [gtk.entry.Entry.setIconTooltipText] or the corresponding function
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
class Entry : gtk.widget.Widget, gtk.cell_editable.CellEditable, gtk.editable.Editable
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
    return cast(void function())gtk_entry_get_type != &gidSymbolNotFound ? gtk_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Entry self()
  {
    return this;
  }

  /** */
  @property bool activatesDefault()
  {
    return getActivatesDefault();
  }

  /** */
  @property void activatesDefault(bool propval)
  {
    return setActivatesDefault(propval);
  }

  /**
      Get `attributes` property.
      Returns: A list of Pango attributes to apply to the text of the entry.
      
      This is mainly useful to change the size or weight of the text.
      
      The #PangoAttribute's @start_index and @end_index must refer to the
      #GtkEntryBuffer text, i.e. without the preedit string.
  */
  @property pango.attr_list.AttrList attributes()
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
  @property void attributes(pango.attr_list.AttrList propval)
  {
    return setAttributes(propval);
  }

  /** */
  @property gtk.entry_buffer.EntryBuffer buffer()
  {
    return getBuffer();
  }

  /** */
  @property void buffer(gtk.entry_buffer.EntryBuffer propval)
  {
    return setBuffer(propval);
  }

  /**
      Get `capsLockWarning` property.
      Returns: Whether password entries will show a warning when Caps Lock is on.
      
      Note that the warning is shown using a secondary icon, and thus
      does not work if you are using the secondary icon position for some
      other purpose.
  */
  @property bool capsLockWarning()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("caps-lock-warning");
  }

  /**
      Set `capsLockWarning` property.
      Params:
        propval = Whether password entries will show a warning when Caps Lock is on.
        
        Note that the warning is shown using a secondary icon, and thus
        does not work if you are using the secondary icon position for some
        other purpose.
  */
  @property void capsLockWarning(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("caps-lock-warning", propval);
  }

  /**
      Get `completion` property.
      Returns: The auxiliary completion object to use with the entry.
  */
  @property gtk.entry_completion.EntryCompletion completion()
  {
    return getCompletion();
  }

  /**
      Set `completion` property.
      Params:
        propval = The auxiliary completion object to use with the entry.
  */
  @property void completion(gtk.entry_completion.EntryCompletion propval)
  {
    return setCompletion(propval);
  }

  /** */
  @property int cursorPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("cursor-position");
  }

  /** */
  @property bool editable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /** */
  @property void editable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editable", propval);
  }

  /** */
  @property bool enableEmojiCompletion()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("enable-emoji-completion");
  }

  /** */
  @property void enableEmojiCompletion(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("enable-emoji-completion", propval);
  }

  /** */
  @property bool hasFrame()
  {
    return getHasFrame();
  }

  /** */
  @property void hasFrame(bool propval)
  {
    return setHasFrame(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this entry.
      See #GtkIMContext.
      
      Setting this to a non-null value overrides the
      system-wide IM module setting. See the GtkSettings
      #GtkSettings:gtk-im-module property.
  */
  @property string imModule()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("im-module");
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
  @property void imModule(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /**
      Get `innerBorder` property.
      Returns: Sets the text area's border between the text and the frame.
  
      Deprecated: Use the standard border and padding CSS properties
        (through objects like #GtkStyleContext and #GtkCssProvider); the value
        of this style property is ignored.
  */
  @property gtk.border.Border innerBorder()
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
  @property void innerBorder(gtk.border.Border propval)
  {
    return setInnerBorder(propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints (beyond #GtkEntry:input-purpose) that
      allow input methods to fine-tune their behaviour.
  */
  @property gtk.types.InputHints inputHints()
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints (beyond #GtkEntry:input-purpose) that
        allow input methods to fine-tune their behaviour.
  */
  @property void inputHints(gtk.types.InputHints propval)
  {
    return setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of this text field.
      
      This property can be used by on-screen keyboards and other input
      methods to adjust their behaviour.
      
      Note that setting the purpose to [gtk.types.InputPurpose.Password] or
      [gtk.types.InputPurpose.Pin] is independent from setting
      #GtkEntry:visibility.
  */
  @property gtk.types.InputPurpose inputPurpose()
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of this text field.
        
        This property can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
        
        Note that setting the purpose to [gtk.types.InputPurpose.Password] or
        [gtk.types.InputPurpose.Pin] is independent from setting
        #GtkEntry:visibility.
  */
  @property void inputPurpose(gtk.types.InputPurpose propval)
  {
    return setInputPurpose(propval);
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
  @property uint invisibleChar()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("invisible-char");
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
  @property void invisibleChar(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("invisible-char", propval);
  }

  /**
      Get `invisibleCharSet` property.
      Returns: Whether the invisible char has been set for the #GtkEntry.
  */
  @property bool invisibleCharSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("invisible-char-set");
  }

  /**
      Set `invisibleCharSet` property.
      Params:
        propval = Whether the invisible char has been set for the #GtkEntry.
  */
  @property void invisibleCharSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible-char-set", propval);
  }

  /** */
  @property int maxLength()
  {
    return getMaxLength();
  }

  /** */
  @property void maxLength(int propval)
  {
    return setMaxLength(propval);
  }

  /**
      Get `maxWidthChars` property.
      Returns: The desired maximum width of the entry, in characters.
      If this property is set to -1, the width will be calculated
      automatically.
  */
  @property int maxWidthChars()
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
  @property void maxWidthChars(int propval)
  {
    return setMaxWidthChars(propval);
  }

  /**
      Get `overwriteMode` property.
      Returns: If text is overwritten when typing in the #GtkEntry.
  */
  @property bool overwriteMode()
  {
    return getOverwriteMode();
  }

  /**
      Set `overwriteMode` property.
      Params:
        propval = If text is overwritten when typing in the #GtkEntry.
  */
  @property void overwriteMode(bool propval)
  {
    return setOverwriteMode(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the #GtkEntry when it is empty
      and unfocused.
  */
  @property string placeholderText()
  {
    return getPlaceholderText();
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the #GtkEntry when it is empty
        and unfocused.
  */
  @property void placeholderText(string propval)
  {
    return setPlaceholderText(propval);
  }

  /**
      Get `populateAll` property.
      Returns: If :populate-all is true, the #GtkEntry::populate-popup
      signal is also emitted for touch popups.
  */
  @property bool populateAll()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("populate-all");
  }

  /**
      Set `populateAll` property.
      Params:
        propval = If :populate-all is true, the #GtkEntry::populate-popup
        signal is also emitted for touch popups.
  */
  @property void populateAll(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("populate-all", propval);
  }

  /**
      Get `primaryIconActivatable` property.
      Returns: Whether the primary icon is activatable.
      
      GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
      signals only on sensitive, activatable icons.
      
      Sensitive, but non-activatable icons can be used for purely
      informational purposes.
  */
  @property bool primaryIconActivatable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("primary-icon-activatable");
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
  @property void primaryIconActivatable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("primary-icon-activatable", propval);
  }

  /**
      Get `primaryIconGicon` property.
      Returns: The #GIcon to use for the primary icon for the entry.
  */
  @property gio.icon.Icon primaryIconGicon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("primary-icon-gicon");
  }

  /**
      Set `primaryIconGicon` property.
      Params:
        propval = The #GIcon to use for the primary icon for the entry.
  */
  @property void primaryIconGicon(gio.icon.Icon propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("primary-icon-gicon", propval);
  }

  /**
      Get `primaryIconName` property.
      Returns: The icon name to use for the primary icon for the entry.
  */
  @property string primaryIconName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("primary-icon-name");
  }

  /**
      Set `primaryIconName` property.
      Params:
        propval = The icon name to use for the primary icon for the entry.
  */
  @property void primaryIconName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("primary-icon-name", propval);
  }

  /**
      Get `primaryIconPixbuf` property.
      Returns: A pixbuf to use as the primary icon for the entry.
  */
  @property gdkpixbuf.pixbuf.Pixbuf primaryIconPixbuf()
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("primary-icon-pixbuf");
  }

  /**
      Set `primaryIconPixbuf` property.
      Params:
        propval = A pixbuf to use as the primary icon for the entry.
  */
  @property void primaryIconPixbuf(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("primary-icon-pixbuf", propval);
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
  @property bool primaryIconSensitive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("primary-icon-sensitive");
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
  @property void primaryIconSensitive(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("primary-icon-sensitive", propval);
  }

  /**
      Get `primaryIconStock` property.
      Returns: The stock id to use for the primary icon for the entry.
  
      Deprecated: Use #GtkEntry:primary-icon-name instead.
  */
  @property string primaryIconStock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("primary-icon-stock");
  }

  /**
      Set `primaryIconStock` property.
      Params:
        propval = The stock id to use for the primary icon for the entry.
  
      Deprecated: Use #GtkEntry:primary-icon-name instead.
  */
  @property void primaryIconStock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("primary-icon-stock", propval);
  }

  /**
      Get `primaryIconStorageType` property.
      Returns: The representation which is used for the primary icon of the entry.
  */
  @property gtk.types.ImageType primaryIconStorageType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ImageType)("primary-icon-storage-type");
  }

  /**
      Get `primaryIconTooltipMarkup` property.
      Returns: The contents of the tooltip on the primary icon, which is marked up
      with the [Pango text markup language][PangoMarkupFormat].
      
      Also see [gtk.entry.Entry.setIconTooltipMarkup].
  */
  @property string primaryIconTooltipMarkup()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("primary-icon-tooltip-markup");
  }

  /**
      Set `primaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the primary icon, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        
        Also see [gtk.entry.Entry.setIconTooltipMarkup].
  */
  @property void primaryIconTooltipMarkup(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("primary-icon-tooltip-markup", propval);
  }

  /**
      Get `primaryIconTooltipText` property.
      Returns: The contents of the tooltip on the primary icon.
      
      Also see [gtk.entry.Entry.setIconTooltipText].
  */
  @property string primaryIconTooltipText()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("primary-icon-tooltip-text");
  }

  /**
      Set `primaryIconTooltipText` property.
      Params:
        propval = The contents of the tooltip on the primary icon.
        
        Also see [gtk.entry.Entry.setIconTooltipText].
  */
  @property void primaryIconTooltipText(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("primary-icon-tooltip-text", propval);
  }

  /**
      Get `progressFraction` property.
      Returns: The current fraction of the task that's been completed.
  */
  @property double progressFraction()
  {
    return getProgressFraction();
  }

  /**
      Set `progressFraction` property.
      Params:
        propval = The current fraction of the task that's been completed.
  */
  @property void progressFraction(double propval)
  {
    return setProgressFraction(propval);
  }

  /**
      Get `progressPulseStep` property.
      Returns: The fraction of total entry width to move the progress
      bouncing block for each call to [gtk.entry.Entry.progressPulse].
  */
  @property double progressPulseStep()
  {
    return getProgressPulseStep();
  }

  /**
      Set `progressPulseStep` property.
      Params:
        propval = The fraction of total entry width to move the progress
        bouncing block for each call to [gtk.entry.Entry.progressPulse].
  */
  @property void progressPulseStep(double propval)
  {
    return setProgressPulseStep(propval);
  }

  /** */
  @property int scrollOffset()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("scroll-offset");
  }

  /**
      Get `secondaryIconActivatable` property.
      Returns: Whether the secondary icon is activatable.
      
      GTK+ emits the #GtkEntry::icon-press and #GtkEntry::icon-release
      signals only on sensitive, activatable icons.
      
      Sensitive, but non-activatable icons can be used for purely
      informational purposes.
  */
  @property bool secondaryIconActivatable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("secondary-icon-activatable");
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
  @property void secondaryIconActivatable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("secondary-icon-activatable", propval);
  }

  /**
      Get `secondaryIconGicon` property.
      Returns: The #GIcon to use for the secondary icon for the entry.
  */
  @property gio.icon.Icon secondaryIconGicon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("secondary-icon-gicon");
  }

  /**
      Set `secondaryIconGicon` property.
      Params:
        propval = The #GIcon to use for the secondary icon for the entry.
  */
  @property void secondaryIconGicon(gio.icon.Icon propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("secondary-icon-gicon", propval);
  }

  /**
      Get `secondaryIconName` property.
      Returns: The icon name to use for the secondary icon for the entry.
  */
  @property string secondaryIconName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("secondary-icon-name");
  }

  /**
      Set `secondaryIconName` property.
      Params:
        propval = The icon name to use for the secondary icon for the entry.
  */
  @property void secondaryIconName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("secondary-icon-name", propval);
  }

  /**
      Get `secondaryIconPixbuf` property.
      Returns: An pixbuf to use as the secondary icon for the entry.
  */
  @property gdkpixbuf.pixbuf.Pixbuf secondaryIconPixbuf()
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("secondary-icon-pixbuf");
  }

  /**
      Set `secondaryIconPixbuf` property.
      Params:
        propval = An pixbuf to use as the secondary icon for the entry.
  */
  @property void secondaryIconPixbuf(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("secondary-icon-pixbuf", propval);
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
  @property bool secondaryIconSensitive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("secondary-icon-sensitive");
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
  @property void secondaryIconSensitive(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("secondary-icon-sensitive", propval);
  }

  /**
      Get `secondaryIconStock` property.
      Returns: The stock id to use for the secondary icon for the entry.
  
      Deprecated: Use #GtkEntry:secondary-icon-name instead.
  */
  @property string secondaryIconStock()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("secondary-icon-stock");
  }

  /**
      Set `secondaryIconStock` property.
      Params:
        propval = The stock id to use for the secondary icon for the entry.
  
      Deprecated: Use #GtkEntry:secondary-icon-name instead.
  */
  @property void secondaryIconStock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("secondary-icon-stock", propval);
  }

  /**
      Get `secondaryIconStorageType` property.
      Returns: The representation which is used for the secondary icon of the entry.
  */
  @property gtk.types.ImageType secondaryIconStorageType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ImageType)("secondary-icon-storage-type");
  }

  /**
      Get `secondaryIconTooltipMarkup` property.
      Returns: The contents of the tooltip on the secondary icon, which is marked up
      with the [Pango text markup language][PangoMarkupFormat].
      
      Also see [gtk.entry.Entry.setIconTooltipMarkup].
  */
  @property string secondaryIconTooltipMarkup()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("secondary-icon-tooltip-markup");
  }

  /**
      Set `secondaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the secondary icon, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        
        Also see [gtk.entry.Entry.setIconTooltipMarkup].
  */
  @property void secondaryIconTooltipMarkup(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("secondary-icon-tooltip-markup", propval);
  }

  /**
      Get `secondaryIconTooltipText` property.
      Returns: The contents of the tooltip on the secondary icon.
      
      Also see [gtk.entry.Entry.setIconTooltipText].
  */
  @property string secondaryIconTooltipText()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("secondary-icon-tooltip-text");
  }

  /**
      Set `secondaryIconTooltipText` property.
      Params:
        propval = The contents of the tooltip on the secondary icon.
        
        Also see [gtk.entry.Entry.setIconTooltipText].
  */
  @property void secondaryIconTooltipText(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("secondary-icon-tooltip-text", propval);
  }

  /** */
  @property int selectionBound()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("selection-bound");
  }

  /**
      Get `shadowType` property.
      Returns: Which kind of shadow to draw around the entry when
      #GtkEntry:has-frame is set to true.
  
      Deprecated: Use CSS to determine the style of the border;
          the value of this style property is ignored.
  */
  @property gtk.types.ShadowType shadowType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ShadowType)("shadow-type");
  }

  /**
      Set `shadowType` property.
      Params:
        propval = Which kind of shadow to draw around the entry when
        #GtkEntry:has-frame is set to true.
  
      Deprecated: Use CSS to determine the style of the border;
          the value of this style property is ignored.
  */
  @property void shadowType(gtk.types.ShadowType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ShadowType)("shadow-type", propval);
  }

  /** */
  @property bool showEmojiIcon()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-emoji-icon");
  }

  /** */
  @property void showEmojiIcon(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-emoji-icon", propval);
  }

  /** */
  @property pango.tab_array.TabArray tabs()
  {
    return getTabs();
  }

  /** */
  @property void tabs(pango.tab_array.TabArray propval)
  {
    return setTabs(propval);
  }

  /** */
  @property string text()
  {
    return getText();
  }

  /** */
  @property void text(string propval)
  {
    return setText(propval);
  }

  /**
      Get `textLength` property.
      Returns: The length of the text in the #GtkEntry.
  */
  @property uint textLength()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("text-length");
  }

  /**
      Get `truncateMultiline` property.
      Returns: When true, pasted multi-line text is truncated to the first line.
  */
  @property bool truncateMultiline()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("truncate-multiline");
  }

  /**
      Set `truncateMultiline` property.
      Params:
        propval = When true, pasted multi-line text is truncated to the first line.
  */
  @property void truncateMultiline(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("truncate-multiline", propval);
  }

  /** */
  @property bool visibility()
  {
    return getVisibility();
  }

  /** */
  @property void visibility(bool propval)
  {
    return setVisibility(propval);
  }

  /** */
  @property int widthChars()
  {
    return getWidthChars();
  }

  /** */
  @property void widthChars(int propval)
  {
    return setWidthChars(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment, from 0 (left) to 1 (right).
      Reversed for RTL layouts.
  */
  @property float xalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment, from 0 (left) to 1 (right).
        Reversed for RTL layouts.
  */
  @property void xalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  mixin CellEditableT!();
  mixin EditableT!();

  /**
      Creates a new entry.
      Returns: a new #GtkEntry.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_entry_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new entry with the specified text buffer.
  
      Params:
        buffer = The buffer to use for the new #GtkEntry.
      Returns: a new #GtkEntry
  */
  static gtk.entry.Entry newWithBuffer(gtk.entry_buffer.EntryBuffer buffer)
  {
    GtkWidget* _cretval;
    _cretval = gtk_entry_new_with_buffer(buffer ? cast(GtkEntryBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry.Entry)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the value set by [gtk.entry.Entry.setActivatesDefault].
      Returns: true if the entry will activate the default widget
  */
  bool getActivatesDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_activates_default(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.entry.Entry.setAlignment].
      Returns: the alignment
  */
  float getAlignment()
  {
    float _retval;
    _retval = gtk_entry_get_alignment(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the attribute list that was set on the entry using
      [gtk.entry.Entry.setAttributes], if any.
      Returns: the attribute list, or null
            if none was set.
  */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = gtk_entry_get_attributes(cast(GtkEntry*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the #GtkEntryBuffer object which holds the text for
      this widget.
      Returns: A #GtkEntryBuffer object.
  */
  gtk.entry_buffer.EntryBuffer getBuffer()
  {
    GtkEntryBuffer* _cretval;
    _cretval = gtk_entry_get_buffer(cast(GtkEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry_buffer.EntryBuffer)(cast(GtkEntryBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the auxiliary completion object currently in use by entry.
      Returns: The auxiliary completion object currently
            in use by entry.
  */
  gtk.entry_completion.EntryCompletion getCompletion()
  {
    GtkEntryCompletion* _cretval;
    _cretval = gtk_entry_get_completion(cast(GtkEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry_completion.EntryCompletion)(cast(GtkEntryCompletion*)_cretval, No.Take);
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
  int getCurrentIconDragSource()
  {
    int _retval;
    _retval = gtk_entry_get_current_icon_drag_source(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the horizontal cursor adjustment for the entry.
      See [gtk.entry.Entry.setCursorHadjustment].
      Returns: the horizontal cursor adjustment, or null
          if none has been set.
  */
  gtk.adjustment.Adjustment getCursorHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_entry_get_cursor_hadjustment(cast(GtkEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value set by [gtk.entry.Entry.setHasFrame].
      Returns: whether the entry has a beveled frame
  */
  bool getHasFrame()
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
  bool getIconActivatable(gtk.types.EntryIconPosition iconPos)
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
      
      See also [gtk.entry.Entry.getTextArea]
  
      Params:
        iconPos = Icon position
        iconArea = Return location for the icon’s area
  */
  void getIconArea(gtk.types.EntryIconPosition iconPos, out gdk.rectangle.Rectangle iconArea)
  {
    GdkRectangle _iconArea;
    gtk_entry_get_icon_area(cast(GtkEntry*)this._cPtr, iconPos, &_iconArea);
    iconArea = new gdk.rectangle.Rectangle(cast(void*)&_iconArea, No.Take);
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
  int getIconAtPos(int x, int y)
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
  gio.icon.Icon getIconGicon(gtk.types.EntryIconPosition iconPos)
  {
    GIcon* _cretval;
    _cretval = gtk_entry_get_icon_gicon(cast(GtkEntry*)this._cPtr, iconPos);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
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
  string getIconName(gtk.types.EntryIconPosition iconPos)
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_icon_name(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  gdkpixbuf.pixbuf.Pixbuf getIconPixbuf(gtk.types.EntryIconPosition iconPos)
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_entry_get_icon_pixbuf(cast(GtkEntry*)this._cPtr, iconPos);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the icon appears sensitive or insensitive.
  
      Params:
        iconPos = Icon position
      Returns: true if the icon is sensitive.
  */
  bool getIconSensitive(gtk.types.EntryIconPosition iconPos)
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
  
      Deprecated: Use [gtk.entry.Entry.getIconName] instead.
  */
  string getIconStock(gtk.types.EntryIconPosition iconPos)
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_icon_stock(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the type of representation being used by the icon
      to store image data. If the icon has no image data,
      the return value will be [gtk.types.ImageType.Empty].
  
      Params:
        iconPos = Icon position
      Returns: image representation being used
  */
  gtk.types.ImageType getIconStorageType(gtk.types.EntryIconPosition iconPos)
  {
    GtkImageType _cretval;
    _cretval = gtk_entry_get_icon_storage_type(cast(GtkEntry*)this._cPtr, iconPos);
    gtk.types.ImageType _retval = cast(gtk.types.ImageType)_cretval;
    return _retval;
  }

  /**
      Gets the contents of the tooltip on the icon at the specified
      position in entry.
  
      Params:
        iconPos = the icon position
      Returns: the tooltip text, or null. Free the returned
            string with [glib.global.gfree] when done.
  */
  string getIconTooltipMarkup(gtk.types.EntryIconPosition iconPos)
  {
    char* _cretval;
    _cretval = gtk_entry_get_icon_tooltip_markup(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip on the icon at the specified
      position in entry.
  
      Params:
        iconPos = the icon position
      Returns: the tooltip text, or null. Free the returned
            string with [glib.global.gfree] when done.
  */
  string getIconTooltipText(gtk.types.EntryIconPosition iconPos)
  {
    char* _cretval;
    _cretval = gtk_entry_get_icon_tooltip_text(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      This function returns the entry’s #GtkEntry:inner-border property. See
      [gtk.entry.Entry.setInnerBorder] for more information.
      Returns: the entry’s #GtkBorder, or
          null if none was set.
  
      Deprecated: Use the standard border and padding CSS properties (through
          objects like #GtkStyleContext and #GtkCssProvider); the value returned by
          this function is ignored by #GtkEntry.
  */
  gtk.border.Border getInnerBorder()
  {
    const(GtkBorder)* _cretval;
    _cretval = gtk_entry_get_inner_border(cast(GtkEntry*)this._cPtr);
    auto _retval = _cretval ? new gtk.border.Border(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the value of the #GtkEntry:input-hints property.
      Returns: 
  */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_entry_get_input_hints(cast(GtkEntry*)this._cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the value of the #GtkEntry:input-purpose property.
      Returns: 
  */
  gtk.types.InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_entry_get_input_purpose(cast(GtkEntry*)this._cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Retrieves the character displayed in place of the real characters
      for entries with visibility set to false. See [gtk.entry.Entry.setInvisibleChar].
      Returns: the current invisible char, or 0, if the entry does not
                      show invisible text at all.
  */
  dchar getInvisibleChar()
  {
    dchar _retval;
    _retval = gtk_entry_get_invisible_char(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #PangoLayout used to display the entry.
      The layout is useful to e.g. convert text positions to
      pixel positions, in combination with [gtk.entry.Entry.getLayoutOffsets].
      The returned layout is owned by the entry and must not be
      modified or freed by the caller.
      
      Keep in mind that the layout text may contain a preedit string, so
      [gtk.entry.Entry.layoutIndexToTextIndex] and
      [gtk.entry.Entry.textIndexToLayoutIndex] are needed to convert byte
      indices in the layout to byte indices in the entry contents.
      Returns: the #PangoLayout for this entry
  */
  pango.layout.Layout getLayout()
  {
    PangoLayout* _cretval;
    _cretval = gtk_entry_get_layout(cast(GtkEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
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
      [gtk.entry.Entry.layoutIndexToTextIndex] and
      [gtk.entry.Entry.textIndexToLayoutIndex] are needed to convert byte
      indices in the layout to byte indices in the entry contents.
  
      Params:
        x = location to store X offset of layout, or null
        y = location to store Y offset of layout, or null
  */
  void getLayoutOffsets(out int x, out int y)
  {
    gtk_entry_get_layout_offsets(cast(GtkEntry*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Retrieves the maximum allowed length of the text in
      entry. See [gtk.entry.Entry.setMaxLength].
      
      This is equivalent to getting entry's #GtkEntryBuffer and
      calling [gtk.entry_buffer.EntryBuffer.getMaxLength] on it.
      Returns: the maximum allowed number of characters
                      in #GtkEntry, or 0 if there is no maximum.
  */
  int getMaxLength()
  {
    int _retval;
    _retval = gtk_entry_get_max_length(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the desired maximum width of entry, in characters.
      See [gtk.entry.Entry.setMaxWidthChars].
      Returns: the maximum width of the entry, in characters
  */
  int getMaxWidthChars()
  {
    int _retval;
    _retval = gtk_entry_get_max_width_chars(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.entry.Entry.setOverwriteMode].
      Returns: whether the text is overwritten when typing.
  */
  bool getOverwriteMode()
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
  string getPlaceholderText()
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_placeholder_text(cast(GtkEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the current fraction of the task that’s been completed.
      See [gtk.entry.Entry.setProgressFraction].
      Returns: a fraction from 0.0 to 1.0
  */
  double getProgressFraction()
  {
    double _retval;
    _retval = gtk_entry_get_progress_fraction(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the pulse step set with [gtk.entry.Entry.setProgressPulseStep].
      Returns: a fraction from 0.0 to 1.0
  */
  double getProgressPulseStep()
  {
    double _retval;
    _retval = gtk_entry_get_progress_pulse_step(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tabstops that were set on the entry using [gtk.entry.Entry.setTabs], if
      any.
      Returns: the tabstops, or null if none was set.
  */
  pango.tab_array.TabArray getTabs()
  {
    PangoTabArray* _cretval;
    _cretval = gtk_entry_get_tabs(cast(GtkEntry*)this._cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the contents of the entry widget.
      See also [gtk.editable.Editable.getChars].
      
      This is equivalent to getting entry's #GtkEntryBuffer and calling
      [gtk.entry_buffer.EntryBuffer.getText] on it.
      Returns: a pointer to the contents of the widget as a
             string. This string points to internally allocated
             storage in the widget and must not be freed, modified or
             stored.
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_text(cast(GtkEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the area where the entry’s text is drawn. This function is
      useful when drawing something to the entry in a draw callback.
      
      If the entry is not realized, text_area is filled with zeros.
      
      See also [gtk.entry.Entry.getIconArea].
  
      Params:
        textArea = Return location for the text area.
  */
  void getTextArea(out gdk.rectangle.Rectangle textArea)
  {
    GdkRectangle _textArea;
    gtk_entry_get_text_area(cast(GtkEntry*)this._cPtr, &_textArea);
    textArea = new gdk.rectangle.Rectangle(cast(void*)&_textArea, No.Take);
  }

  /**
      Retrieves the current length of the text in
      entry.
      
      This is equivalent to getting entry's #GtkEntryBuffer and
      calling [gtk.entry_buffer.EntryBuffer.getLength] on it.
      Returns: the current number of characters
                      in #GtkEntry, or 0 if there are none.
  */
  ushort getTextLength()
  {
    ushort _retval;
    _retval = gtk_entry_get_text_length(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the text in entry is visible. See
      [gtk.entry.Entry.setVisibility].
      Returns: true if the text is currently visible
  */
  bool getVisibility()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_visibility(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.entry.Entry.setWidthChars].
      Returns: number of chars to request space for, or negative if unset
  */
  int getWidthChars()
  {
    int _retval;
    _retval = gtk_entry_get_width_chars(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Causes entry to have keyboard focus.
      
      It behaves like [gtk.widget.Widget.grabFocus],
      except that it doesn't select the contents of the entry.
      You only want to call this on some special entries
      which the user usually doesn't want to replace all text in,
      such as search-as-you-type entries.
  */
  void grabFocusWithoutSelecting()
  {
    gtk_entry_grab_focus_without_selecting(cast(GtkEntry*)this._cPtr);
  }

  /**
      Allow the #GtkEntry input method to internally handle key press
      and release events. If this function returns true, then no further
      processing should be done for this key event. See
      [gtk.imcontext.IMContext.filterKeypress].
      
      Note that you are expected to call this function from your handler
      when overriding key event handling. This is needed in the case when
      you need to insert your own key handling between the input method
      and the default key event handling of the #GtkEntry.
      See [gtk.text_view.TextView.resetImContext] for an example of use.
  
      Params:
        event = the key event
      Returns: true if the input method handled the key event.
  */
  bool imContextFilterKeypress(gdk.event_key.EventKey event)
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_im_context_filter_keypress(cast(GtkEntry*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr : null);
    return _retval;
  }

  /**
      Converts from a position in the entry’s #PangoLayout (returned by
      [gtk.entry.Entry.getLayout]) to a position in the entry contents
      (returned by [gtk.entry.Entry.getText]).
  
      Params:
        layoutIndex = byte index into the entry layout text
      Returns: byte index into the entry contents
  */
  int layoutIndexToTextIndex(int layoutIndex)
  {
    int _retval;
    _retval = gtk_entry_layout_index_to_text_index(cast(GtkEntry*)this._cPtr, layoutIndex);
    return _retval;
  }

  /**
      Indicates that some progress is made, but you don’t know how much.
      Causes the entry’s progress indicator to enter “activity mode,”
      where a block bounces back and forth. Each call to
      [gtk.entry.Entry.progressPulse] causes the block to move by a little bit
      (the amount of movement per pulse is determined by
      [gtk.entry.Entry.setProgressPulseStep]).
  */
  void progressPulse()
  {
    gtk_entry_progress_pulse(cast(GtkEntry*)this._cPtr);
  }

  /**
      Reset the input method context of the entry if needed.
      
      This can be necessary in the case where modifying the buffer
      would confuse on-going input method behavior.
  */
  void resetImContext()
  {
    gtk_entry_reset_im_context(cast(GtkEntry*)this._cPtr);
  }

  /**
      If setting is true, pressing Enter in the entry will activate the default
      widget for the window containing the entry. This usually means that
      the dialog box containing the entry will be closed, since the default
      widget is usually one of the dialog buttons.
      
      (For experts: if setting is true, the entry calls
      [gtk.window.Window.activateDefault] on the window containing the entry, in
      the default handler for the #GtkEntry::activate signal.)
  
      Params:
        setting = true to activate window’s default widget on Enter keypress
  */
  void setActivatesDefault(bool setting)
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
  void setAlignment(float xalign)
  {
    gtk_entry_set_alignment(cast(GtkEntry*)this._cPtr, xalign);
  }

  /**
      Sets a #PangoAttrList; the attributes in the list are applied to the
      entry text.
  
      Params:
        attrs = a #PangoAttrList
  */
  void setAttributes(pango.attr_list.AttrList attrs)
  {
    gtk_entry_set_attributes(cast(GtkEntry*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Set the #GtkEntryBuffer object which holds the text for
      this widget.
  
      Params:
        buffer = a #GtkEntryBuffer
  */
  void setBuffer(gtk.entry_buffer.EntryBuffer buffer)
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
  void setCompletion(gtk.entry_completion.EntryCompletion completion = null)
  {
    gtk_entry_set_completion(cast(GtkEntry*)this._cPtr, completion ? cast(GtkEntryCompletion*)completion._cPtr(No.Dup) : null);
  }

  /**
      Hooks up an adjustment to the cursor position in an entry, so that when
      the cursor is moved, the adjustment is scrolled to show that position.
      See [gtk.scrolled_window.ScrolledWindow.getHadjustment] for a typical way of obtaining
      the adjustment.
      
      The adjustment has to be in pixel units and in the same coordinate system
      as the entry.
  
      Params:
        adjustment = an adjustment which should be adjusted when the cursor
                       is moved, or null
  */
  void setCursorHadjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_entry_set_cursor_hadjustment(cast(GtkEntry*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the entry has a beveled frame around it.
  
      Params:
        setting = new value
  */
  void setHasFrame(bool setting)
  {
    gtk_entry_set_has_frame(cast(GtkEntry*)this._cPtr, setting);
  }

  /**
      Sets whether the icon is activatable.
  
      Params:
        iconPos = Icon position
        activatable = true if the icon should be activatable
  */
  void setIconActivatable(gtk.types.EntryIconPosition iconPos, bool activatable)
  {
    gtk_entry_set_icon_activatable(cast(GtkEntry*)this._cPtr, iconPos, activatable);
  }

  /**
      Sets up the icon at the given position so that GTK+ will start a drag
      operation when the user clicks and drags the icon.
      
      To handle the drag operation, you need to connect to the usual
      #GtkWidget::drag-data-get (or possibly #GtkWidget::drag-data-delete)
      signal, and use [gtk.entry.Entry.getCurrentIconDragSource] in
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
  void setIconDragSource(gtk.types.EntryIconPosition iconPos, gtk.target_list.TargetList targetList, gdk.types.DragAction actions)
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
  void setIconFromGicon(gtk.types.EntryIconPosition iconPos, gio.icon.Icon icon = null)
  {
    gtk_entry_set_icon_from_gicon(cast(GtkEntry*)this._cPtr, iconPos, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
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
  void setIconFromIconName(gtk.types.EntryIconPosition iconPos, string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_entry_set_icon_from_icon_name(cast(GtkEntry*)this._cPtr, iconPos, _iconName);
  }

  /**
      Sets the icon shown in the specified position using a pixbuf.
      
      If pixbuf is null, no icon will be shown in the specified position.
  
      Params:
        iconPos = Icon position
        pixbuf = A #GdkPixbuf, or null
  */
  void setIconFromPixbuf(gtk.types.EntryIconPosition iconPos, gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
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
  
      Deprecated: Use [gtk.entry.Entry.setIconFromIconName] instead.
  */
  void setIconFromStock(gtk.types.EntryIconPosition iconPos, string stockId = null)
  {
    const(char)* _stockId = stockId.toCString(No.Alloc);
    gtk_entry_set_icon_from_stock(cast(GtkEntry*)this._cPtr, iconPos, _stockId);
  }

  /**
      Sets the sensitivity for the specified icon.
  
      Params:
        iconPos = Icon position
        sensitive = Specifies whether the icon should appear
                      sensitive or insensitive
  */
  void setIconSensitive(gtk.types.EntryIconPosition iconPos, bool sensitive)
  {
    gtk_entry_set_icon_sensitive(cast(GtkEntry*)this._cPtr, iconPos, sensitive);
  }

  /**
      Sets tooltip as the contents of the tooltip for the icon at
      the specified position. tooltip is assumed to be marked up with
      the [Pango text markup language][PangoMarkupFormat].
      
      Use null for tooltip to remove an existing tooltip.
      
      See also [gtk.widget.Widget.setTooltipMarkup] and
      [gtk.entry.Entry.setIconTooltipText].
  
      Params:
        iconPos = the icon position
        tooltip = the contents of the tooltip for the icon, or null
  */
  void setIconTooltipMarkup(gtk.types.EntryIconPosition iconPos, string tooltip = null)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    gtk_entry_set_icon_tooltip_markup(cast(GtkEntry*)this._cPtr, iconPos, _tooltip);
  }

  /**
      Sets tooltip as the contents of the tooltip for the icon
      at the specified position.
      
      Use null for tooltip to remove an existing tooltip.
      
      See also [gtk.widget.Widget.setTooltipText] and
      [gtk.entry.Entry.setIconTooltipMarkup].
      
      If you unset the widget tooltip via [gtk.widget.Widget.setTooltipText] or
      [gtk.widget.Widget.setTooltipMarkup], this sets GtkWidget:has-tooltip to false,
      which suppresses icon tooltips too. You can resolve this by then calling
      [gtk.widget.Widget.setHasTooltip] to set GtkWidget:has-tooltip back to true, or
      setting at least one non-empty tooltip on any icon achieves the same result.
  
      Params:
        iconPos = the icon position
        tooltip = the contents of the tooltip for the icon, or null
  */
  void setIconTooltipText(gtk.types.EntryIconPosition iconPos, string tooltip = null)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
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
  void setInnerBorder(gtk.border.Border border = null)
  {
    gtk_entry_set_inner_border(cast(GtkEntry*)this._cPtr, border ? cast(const(GtkBorder)*)border._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkEntry:input-hints property, which
      allows input methods to fine-tune their behaviour.
  
      Params:
        hints = the hints
  */
  void setInputHints(gtk.types.InputHints hints)
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
  void setInputPurpose(gtk.types.InputPurpose purpose)
  {
    gtk_entry_set_input_purpose(cast(GtkEntry*)this._cPtr, purpose);
  }

  /**
      Sets the character to use in place of the actual text when
      [gtk.entry.Entry.setVisibility] has been called to set text visibility
      to false. i.e. this is the character used in “password mode” to
      show the user how many characters have been typed. By default, GTK+
      picks the best invisible char available in the current font. If you
      set the invisible char to 0, then the user will get no feedback
      at all; there will be no text on the screen as they type.
  
      Params:
        ch = a Unicode character
  */
  void setInvisibleChar(dchar ch)
  {
    gtk_entry_set_invisible_char(cast(GtkEntry*)this._cPtr, ch);
  }

  /**
      Sets the maximum allowed length of the contents of the widget. If
      the current contents are longer than the given length, then they
      will be truncated to fit.
      
      This is equivalent to getting entry's #GtkEntryBuffer and
      calling [gtk.entry_buffer.EntryBuffer.setMaxLength] on it.
      ]|
  
      Params:
        max = the maximum length of the entry, or 0 for no maximum.
            (other than the maximum length of entries.) The value passed in will
            be clamped to the range 0-65536.
  */
  void setMaxLength(int max)
  {
    gtk_entry_set_max_length(cast(GtkEntry*)this._cPtr, max);
  }

  /**
      Sets the desired maximum width in characters of entry.
  
      Params:
        nChars = the new desired maximum width, in characters
  */
  void setMaxWidthChars(int nChars)
  {
    gtk_entry_set_max_width_chars(cast(GtkEntry*)this._cPtr, nChars);
  }

  /**
      Sets whether the text is overwritten when typing in the #GtkEntry.
  
      Params:
        overwrite = new value
  */
  void setOverwriteMode(bool overwrite)
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
  void setPlaceholderText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_entry_set_placeholder_text(cast(GtkEntry*)this._cPtr, _text);
  }

  /**
      Causes the entry’s progress indicator to “fill in” the given
      fraction of the bar. The fraction should be between 0.0 and 1.0,
      inclusive.
  
      Params:
        fraction = fraction of the task that’s been completed
  */
  void setProgressFraction(double fraction)
  {
    gtk_entry_set_progress_fraction(cast(GtkEntry*)this._cPtr, fraction);
  }

  /**
      Sets the fraction of total entry width to move the progress
      bouncing block for each call to [gtk.entry.Entry.progressPulse].
  
      Params:
        fraction = fraction between 0.0 and 1.0
  */
  void setProgressPulseStep(double fraction)
  {
    gtk_entry_set_progress_pulse_step(cast(GtkEntry*)this._cPtr, fraction);
  }

  /**
      Sets a #PangoTabArray; the tabstops in the array are applied to the entry
      text.
  
      Params:
        tabs = a #PangoTabArray
  */
  void setTabs(pango.tab_array.TabArray tabs)
  {
    gtk_entry_set_tabs(cast(GtkEntry*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets the text in the widget to the given
      value, replacing the current contents.
      
      See [gtk.entry_buffer.EntryBuffer.setText].
  
      Params:
        text = the new text
  */
  void setText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_entry_set_text(cast(GtkEntry*)this._cPtr, _text);
  }

  /**
      Sets whether the contents of the entry are visible or not.
      When visibility is set to false, characters are displayed
      as the invisible char, and will also appear that way when
      the text in the entry widget is copied elsewhere.
      
      By default, GTK+ picks the best invisible character available
      in the current font, but it can be changed with
      [gtk.entry.Entry.setInvisibleChar].
      
      Note that you probably want to set #GtkEntry:input-purpose
      to [gtk.types.InputPurpose.Password] or [gtk.types.InputPurpose.Pin] to
      inform input methods about the purpose of this entry,
      in addition to setting visibility to false.
  
      Params:
        visible = true if the contents of the entry are displayed
                    as plaintext
  */
  void setVisibility(bool visible)
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
  void setWidthChars(int nChars)
  {
    gtk_entry_set_width_chars(cast(GtkEntry*)this._cPtr, nChars);
  }

  /**
      Converts from a position in the entry contents (returned
      by [gtk.entry.Entry.getText]) to a position in the
      entry’s #PangoLayout (returned by [gtk.entry.Entry.getLayout],
      with text retrieved via [pango.layout.Layout.getText]).
  
      Params:
        textIndex = byte index into the entry contents
      Returns: byte index into the entry layout text
  */
  int textIndexToLayoutIndex(int textIndex)
  {
    int _retval;
    _retval = gtk_entry_text_index_to_layout_index(cast(GtkEntry*)this._cPtr, textIndex);
    return _retval;
  }

  /**
      Unsets the invisible char previously set with
      [gtk.entry.Entry.setInvisibleChar]. So that the
      default invisible char is used again.
  */
  void unsetInvisibleChar()
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
  
          $(D void callback(gtk.entry.Entry entry))
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry.Entry)))
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
  
          $(D void callback(gtk.entry.Entry entry))
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBackspace(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry.Entry)))
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
  
          $(D void callback(gtk.entry.Entry entry))
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry.Entry)))
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
      Connect to `CutClipboard` signal.
  
      The ::cut-clipboard signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to cut the selection to the clipboard.
      
      The default bindings for this signal are
      Ctrl-x and Shift-Delete.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.entry.Entry entry))
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry.Entry)))
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
    return connectSignalClosure("cut-clipboard", closure, after);
  }

  /**
      Connect to `DeleteFromCursor` signal.
  
      The ::delete-from-cursor signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted when the user initiates a text deletion.
      
      If the type is [gtk.types.DeleteType.Chars], GTK+ deletes the selection
      if there is one, otherwise it deletes the requested number
      of characters.
      
      The default bindings for this signal are
      Delete for deleting a character and Ctrl-Delete for
      deleting a word.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DeleteType type, int count, gtk.entry.Entry entry))
  
          `type` the granularity of the deletion, as a #GtkDeleteType (optional)
  
          `count` the number of type units to delete (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DeleteType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.entry.Entry)))
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
    return connectSignalClosure("delete-from-cursor", closure, after);
  }

  /**
      Connect to `IconPress` signal.
  
      The ::icon-press signal is emitted when an activatable icon
      is clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.EntryIconPosition iconPos, gdk.event.Event event, gtk.entry.Entry entry))
  
          `iconPos` The position of the clicked icon (optional)
  
          `event` the button press event (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectIconPress(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.EntryIconPosition)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.event.Event)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.entry.Entry)))
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
    return connectSignalClosure("icon-press", closure, after);
  }

  /**
      Connect to `IconRelease` signal.
  
      The ::icon-release signal is emitted on the button release from a
      mouse click over an activatable icon.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.EntryIconPosition iconPos, gdk.event.Event event, gtk.entry.Entry entry))
  
          `iconPos` The position of the clicked icon (optional)
  
          `event` the button release event (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectIconRelease(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.EntryIconPosition)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.event.Event)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.entry.Entry)))
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
  
          $(D void callback(string string_, gtk.entry.Entry entry))
  
          `string_` the string to insert (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.entry.Entry)))
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
  
          $(D void callback(gtk.entry.Entry entry))
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry.Entry)))
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
      [gobject.global.signalEmitByName] if they need to control the cursor
      programmatically.
      
      The default bindings for this signal come in two variants,
      the variant with the Shift modifier extends the selection,
      the variant without the Shift modifer does not.
      There are too many key combinations to list them all here.
      $(LIST
        * Arrow keys move by individual characters/lines
        * Ctrl-arrow key combinations move by words/paragraphs
        * Home/End keys move to the ends of the buffer
      )
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.MovementStep step, int count, bool extendSelection, gtk.entry.Entry entry))
  
          `step` the granularity of the move, as a #GtkMovementStep (optional)
  
          `count` the number of step units to move (optional)
  
          `extendSelection` true if the move should extend the selection (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.entry.Entry)))
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
  
          $(D void callback(gtk.entry.Entry entry))
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry.Entry)))
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
  
          $(D void callback(gtk.widget.Widget widget, gtk.entry.Entry entry))
  
          `widget` the container that is being populated (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.entry.Entry)))
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
    return connectSignalClosure("populate-popup", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      If an input method is used, the typed text will not immediately
      be committed to the buffer. So if you are interested in the text,
      connect to this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string preedit, gtk.entry.Entry entry))
  
          `preedit` the current preedit string (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.entry.Entry)))
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
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `ToggleOverwrite` signal.
  
      The ::toggle-overwrite signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to toggle the overwrite mode of the entry.
      
      The default bindings for this signal is Insert.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.entry.Entry entry))
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.entry.Entry)))
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
    return connectSignalClosure("toggle-overwrite", closure, after);
  }
}
