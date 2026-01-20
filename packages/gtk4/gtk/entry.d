/// Module for [Entry] class
module gtk.entry;

import gdk.content_provider;
import gdk.paintable;
import gdk.rectangle;
import gdk.types;
import gid.gid;
import gio.icon;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.entry_buffer;
import gtk.entry_completion;
import gtk.types;
import gtk.widget;
import pango.attr_list;
import pango.tab_array;

/**
    [gtk.entry.Entry] is a single line text entry widget.
    
    ![An example GtkEntry](entry.png)
    
    A fairly large set of key bindings are supported by default. If the
    entered text is longer than the allocation of the widget, the widget
    will scroll so that the cursor position is visible.
    
    When using an entry for passwords and other sensitive information, it
    can be put into “password mode” using [gtk.entry.Entry.setVisibility].
    In this mode, entered text is displayed using a “invisible” character.
    By default, GTK picks the best invisible character that is available
    in the current font, but it can be changed with
    [gtk.entry.Entry.setInvisibleChar].
    
    [gtk.entry.Entry] has the ability to display progress or activity
    information behind the text. To make an entry display such information,
    use [gtk.entry.Entry.setProgressFraction] or
    [gtk.entry.Entry.setProgressPulseStep].
    
    Additionally, [gtk.entry.Entry] can show icons at either side of the entry.
    These icons can be activatable by clicking, can be set up as drag source
    and can have tooltips. To add an icon, use
    [gtk.entry.Entry.setIconFromGicon] or one of the various other functions
    that set an icon from an icon name or a paintable. To trigger an action when
    the user clicks an icon, connect to the `signal@Gtk.Entry::icon-press` signal.
    To allow DND operations from an icon, use
    [gtk.entry.Entry.setIconDragSource]. To set a tooltip on an icon, use
    [gtk.entry.Entry.setIconTooltipText] or the corresponding function
    for markup.
    
    Note that functionality or information that is only available by clicking
    on an icon in an entry may not be accessible at all to users which are not
    able to use a mouse or other pointing device. It is therefore recommended
    that any such functionality should also be available by other means, e.g.
    via the context menu of the entry.
    
    # CSS nodes
    
    ```
    entry[.flat][.warning][.error]
    ├── text[.readonly]
    ├── image.left
    ├── image.right
    ╰── [progress[.pulse]]
    ```
    
    [gtk.entry.Entry] has a main node with the name entry. Depending on the properties
    of the entry, the style classes .read-only and .flat may appear. The style
    classes .warning and .error may also be used with entries.
    
    When the entry shows icons, it adds subnodes with the name image and the
    style class .left or .right, depending on where the icon appears.
    
    When the entry shows progress, it adds a subnode with the name progress.
    The node has the style class .pulse when the shown progress is pulsing.
    
    For all the subnodes added to the text node in various situations,
    see [gtk.text.Text].
    
    # GtkEntry as GtkBuildable
    
    The [gtk.entry.Entry] implementation of the [gtk.buildable.Buildable] interface supports a
    custom `<attributes>` element, which supports any number of `<attribute>`
    elements. The `<attribute>` element has attributes named “name“, “value“,
    “start“ and “end“ and allows you to specify [pango.attribute.Attribute] values for
    this label.
    
    An example of a UI definition fragment specifying Pango attributes:
    ```xml
    <object class="GtkEntry">
      <attributes>
        <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
        <attribute name="background" value="red" start="5" end="10"/>
      </attributes>
    </object>
    ```
    
    The start and end attributes specify the range of characters to which the
    Pango attribute applies. If start and end are not specified, the attribute
    is applied to the whole text. Note that specifying ranges does not make much
    sense with translatable attributes. Use markup embedded in the translatable
    content instead.
    
    # Accessibility
    
    [gtk.entry.Entry] uses the [gtk.types.AccessibleRole.TextBox] role.
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

  /**
      Get `activatesDefault` property.
      Returns: Whether to activate the default widget when Enter is pressed.
  */
  @property bool activatesDefault()
  {
    return getActivatesDefault();
  }

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when Enter is pressed.
  */
  @property void activatesDefault(bool propval)
  {
    return setActivatesDefault(propval);
  }

  /**
      Get `attributes` property.
      Returns: A list of Pango attributes to apply to the text of the entry.
        
        This is mainly useful to change the size or weight of the text.
        
        The [pango.attribute.Attribute]'s @start_index and @end_index must refer to the
        [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
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
          
          The [pango.attribute.Attribute]'s @start_index and @end_index must refer to the
          [gtk.entry_buffer.EntryBuffer] text, i.e. without the preedit string.
  */
  @property void attributes(pango.attr_list.AttrList propval)
  {
    return setAttributes(propval);
  }

  /**
      Get `buffer` property.
      Returns: The buffer object which actually stores the text.
  */
  @property gtk.entry_buffer.EntryBuffer buffer()
  {
    return getBuffer();
  }

  /**
      Set `buffer` property.
      Params:
        propval = The buffer object which actually stores the text.
  */
  @property void buffer(gtk.entry_buffer.EntryBuffer propval)
  {
    return setBuffer(propval);
  }

  /**
      Get `completion` property.
      Returns: The auxiliary completion object to use with the entry.
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  @property gtk.entry_completion.EntryCompletion completion()
  {
    return getCompletion();
  }

  /**
      Set `completion` property.
      Params:
        propval = The auxiliary completion object to use with the entry.
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  @property void completion(gtk.entry_completion.EntryCompletion propval)
  {
    return setCompletion(propval);
  }

  /**
      Get `enableEmojiCompletion` property.
      Returns: Whether to suggest Emoji replacements for :-delimited names
        like `:heart:`.
  */
  @property bool enableEmojiCompletion()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("enable-emoji-completion");
  }

  /**
      Set `enableEmojiCompletion` property.
      Params:
        propval = Whether to suggest Emoji replacements for :-delimited names
          like `:heart:`.
  */
  @property void enableEmojiCompletion(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("enable-emoji-completion", propval);
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
      Get `hasFrame` property.
      Returns: Whether the entry should draw a frame.
  */
  @property bool hasFrame()
  {
    return getHasFrame();
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = Whether the entry should draw a frame.
  */
  @property void hasFrame(bool propval)
  {
    return setHasFrame(propval);
  }

  /**
      Get `imModule` property.
      Returns: Which IM (input method) module should be used for this entry.
        
        See [gtk.imcontext.IMContext].
        
        Setting this to a non-null value overrides the system-wide IM
        module setting. See the GtkSettings `property@Gtk.Settings:gtk-im-module`
        property.
  */
  @property string imModule()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("im-module");
  }

  /**
      Set `imModule` property.
      Params:
        propval = Which IM (input method) module should be used for this entry.
          
          See [gtk.imcontext.IMContext].
          
          Setting this to a non-null value overrides the system-wide IM
          module setting. See the GtkSettings `property@Gtk.Settings:gtk-im-module`
          property.
  */
  @property void imModule(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("im-module", propval);
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints that allow input methods to fine-tune their behavior.
        
        Also see `property@Gtk.Entry:input-purpose`
  */
  @property gtk.types.InputHints inputHints()
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints that allow input methods to fine-tune their behavior.
          
          Also see `property@Gtk.Entry:input-purpose`
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
        [gtk.entry.Entry.visibility].
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
          [gtk.entry.Entry.visibility].
  */
  @property void inputPurpose(gtk.types.InputPurpose propval)
  {
    return setInputPurpose(propval);
  }

  /**
      Get `invisibleChar` property.
      Returns: The character to use when masking entry contents (“password mode”).
  */
  @property uint invisibleChar()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("invisible-char");
  }

  /**
      Set `invisibleChar` property.
      Params:
        propval = The character to use when masking entry contents (“password mode”).
  */
  @property void invisibleChar(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("invisible-char", propval);
  }

  /**
      Get `invisibleCharSet` property.
      Returns: Whether the invisible char has been set for the [gtk.entry.Entry].
  */
  @property bool invisibleCharSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("invisible-char-set");
  }

  /**
      Set `invisibleCharSet` property.
      Params:
        propval = Whether the invisible char has been set for the [gtk.entry.Entry].
  */
  @property void invisibleCharSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible-char-set", propval);
  }

  /**
      Get `maxLength` property.
      Returns: Maximum number of characters for this entry.
  */
  @property int maxLength()
  {
    return getMaxLength();
  }

  /**
      Set `maxLength` property.
      Params:
        propval = Maximum number of characters for this entry.
  */
  @property void maxLength(int propval)
  {
    return setMaxLength(propval);
  }

  /**
      Get `overwriteMode` property.
      Returns: If text is overwritten when typing in the [gtk.entry.Entry].
  */
  @property bool overwriteMode()
  {
    return getOverwriteMode();
  }

  /**
      Set `overwriteMode` property.
      Params:
        propval = If text is overwritten when typing in the [gtk.entry.Entry].
  */
  @property void overwriteMode(bool propval)
  {
    return setOverwriteMode(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gtk.entry.Entry] when it is empty
        and unfocused.
  */
  @property string placeholderText()
  {
    return getPlaceholderText();
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gtk.entry.Entry] when it is empty
          and unfocused.
  */
  @property void placeholderText(string propval)
  {
    return setPlaceholderText(propval);
  }

  /**
      Get `primaryIconActivatable` property.
      Returns: Whether the primary icon is activatable.
        
        GTK emits the `signal@Gtk.Entry::icon-press` and
        `signal@Gtk.Entry::icon-release` signals only on sensitive,
        activatable icons.
        
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
          
          GTK emits the `signal@Gtk.Entry::icon-press` and
          `signal@Gtk.Entry::icon-release` signals only on sensitive,
          activatable icons.
          
          Sensitive, but non-activatable icons can be used for purely
          informational purposes.
  */
  @property void primaryIconActivatable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("primary-icon-activatable", propval);
  }

  /**
      Get `primaryIconGicon` property.
      Returns: The [gio.icon.Icon] to use for the primary icon for the entry.
  */
  @property gio.icon.Icon primaryIconGicon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("primary-icon-gicon");
  }

  /**
      Set `primaryIconGicon` property.
      Params:
        propval = The [gio.icon.Icon] to use for the primary icon for the entry.
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
      Get `primaryIconPaintable` property.
      Returns: A [gdk.paintable.Paintable] to use as the primary icon for the entry.
  */
  @property gdk.paintable.Paintable primaryIconPaintable()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.paintable.Paintable)("primary-icon-paintable");
  }

  /**
      Set `primaryIconPaintable` property.
      Params:
        propval = A [gdk.paintable.Paintable] to use as the primary icon for the entry.
  */
  @property void primaryIconPaintable(gdk.paintable.Paintable propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.paintable.Paintable)("primary-icon-paintable", propval);
  }

  /**
      Get `primaryIconSensitive` property.
      Returns: Whether the primary icon is sensitive.
        
        An insensitive icon appears grayed out. GTK does not emit the
        `signal@Gtk.Entry::icon-press` and `signal@Gtk.Entry::icon-release`
        signals and does not allow DND from insensitive icons.
        
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
          
          An insensitive icon appears grayed out. GTK does not emit the
          `signal@Gtk.Entry::icon-press` and `signal@Gtk.Entry::icon-release`
          signals and does not allow DND from insensitive icons.
          
          An icon should be set insensitive if the action that would trigger
          when clicked is currently not available.
  */
  @property void primaryIconSensitive(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("primary-icon-sensitive", propval);
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
      Returns: The contents of the tooltip on the primary icon, with markup.
        
        Also see [gtk.entry.Entry.setIconTooltipMarkup].
  */
  @property string primaryIconTooltipMarkup()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("primary-icon-tooltip-markup");
  }

  /**
      Set `primaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the primary icon, with markup.
          
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
        bouncing block for each pulse.
        
        See [gtk.entry.Entry.progressPulse].
  */
  @property double progressPulseStep()
  {
    return getProgressPulseStep();
  }

  /**
      Set `progressPulseStep` property.
      Params:
        propval = The fraction of total entry width to move the progress
          bouncing block for each pulse.
          
          See [gtk.entry.Entry.progressPulse].
  */
  @property void progressPulseStep(double propval)
  {
    return setProgressPulseStep(propval);
  }

  /**
      Get `scrollOffset` property.
      Returns: Number of pixels of the entry scrolled off the screen to the left.
  */
  @property int scrollOffset()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("scroll-offset");
  }

  /**
      Get `secondaryIconActivatable` property.
      Returns: Whether the secondary icon is activatable.
        
        GTK emits the `signal@Gtk.Entry::icon-press` and
        `signal@Gtk.Entry::icon-release` signals only on sensitive,
        activatable icons.
        
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
          
          GTK emits the `signal@Gtk.Entry::icon-press` and
          `signal@Gtk.Entry::icon-release` signals only on sensitive,
          activatable icons.
          
          Sensitive, but non-activatable icons can be used for purely
          informational purposes.
  */
  @property void secondaryIconActivatable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("secondary-icon-activatable", propval);
  }

  /**
      Get `secondaryIconGicon` property.
      Returns: The [gio.icon.Icon] to use for the secondary icon for the entry.
  */
  @property gio.icon.Icon secondaryIconGicon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("secondary-icon-gicon");
  }

  /**
      Set `secondaryIconGicon` property.
      Params:
        propval = The [gio.icon.Icon] to use for the secondary icon for the entry.
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
      Get `secondaryIconPaintable` property.
      Returns: A [gdk.paintable.Paintable] to use as the secondary icon for the entry.
  */
  @property gdk.paintable.Paintable secondaryIconPaintable()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.paintable.Paintable)("secondary-icon-paintable");
  }

  /**
      Set `secondaryIconPaintable` property.
      Params:
        propval = A [gdk.paintable.Paintable] to use as the secondary icon for the entry.
  */
  @property void secondaryIconPaintable(gdk.paintable.Paintable propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.paintable.Paintable)("secondary-icon-paintable", propval);
  }

  /**
      Get `secondaryIconSensitive` property.
      Returns: Whether the secondary icon is sensitive.
        
        An insensitive icon appears grayed out. GTK does not emit the
        `signal@Gtk.Entry::icon-press[ and [signal@Gtk.Entry::icon-release`
        signals and does not allow DND from insensitive icons.
        
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
          
          An insensitive icon appears grayed out. GTK does not emit the
          `signal@Gtk.Entry::icon-press[ and [signal@Gtk.Entry::icon-release`
          signals and does not allow DND from insensitive icons.
          
          An icon should be set insensitive if the action that would trigger
          when clicked is currently not available.
  */
  @property void secondaryIconSensitive(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("secondary-icon-sensitive", propval);
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
      Returns: The contents of the tooltip on the secondary icon, with markup.
        
        Also see [gtk.entry.Entry.setIconTooltipMarkup].
  */
  @property string secondaryIconTooltipMarkup()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("secondary-icon-tooltip-markup");
  }

  /**
      Set `secondaryIconTooltipMarkup` property.
      Params:
        propval = The contents of the tooltip on the secondary icon, with markup.
          
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

  /**
      Get `textLength` property.
      Returns: The length of the text in the [gtk.entry.Entry].
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

  /**
      Get `visibility` property.
      Returns: Whether the entry should show the “invisible char” instead of the
        actual text (“password mode”).
  */
  @property bool visibility()
  {
    return getVisibility();
  }

  /**
      Set `visibility` property.
      Params:
        propval = Whether the entry should show the “invisible char” instead of the
          actual text (“password mode”).
  */
  @property void visibility(bool propval)
  {
    return setVisibility(propval);
  }

  mixin CellEditableT!();
  mixin EditableT!();

  /**
      Creates a new entry.
      Returns: a new [gtk.entry.Entry].
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
        buffer = The buffer to use for the new [gtk.entry.Entry].
      Returns: a new [gtk.entry.Entry]
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
      
      See also: [gtk.editable.Editable.xalign]
      Returns: the alignment
  */
  float getAlignment()
  {
    float _retval;
    _retval = gtk_entry_get_alignment(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the attribute list of the [gtk.entry.Entry].
      
      See [gtk.entry.Entry.setAttributes].
      Returns: the attribute list
  */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = gtk_entry_get_attributes(cast(GtkEntry*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the [gtk.entry_buffer.EntryBuffer] object which holds the text for
      this widget.
      Returns: A [gtk.entry_buffer.EntryBuffer] object.
  */
  gtk.entry_buffer.EntryBuffer getBuffer()
  {
    GtkEntryBuffer* _cretval;
    _cretval = gtk_entry_get_buffer(cast(GtkEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry_buffer.EntryBuffer)(cast(GtkEntryBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the auxiliary completion object currently
      in use by entry.
      Returns: The auxiliary
          completion object currently in use by entry
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  gtk.entry_completion.EntryCompletion getCompletion()
  {
    GtkEntryCompletion* _cretval;
    _cretval = gtk_entry_get_completion(cast(GtkEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry_completion.EntryCompletion)(cast(GtkEntryCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the index of the icon which is the source of the
      current  DND operation, or -1.
      Returns: index of the icon which is the source of the
          current DND operation, or -1.
  */
  int getCurrentIconDragSource()
  {
    int _retval;
    _retval = gtk_entry_get_current_icon_drag_source(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the menu model set with [gtk.entry.Entry.setExtraMenu].
      Returns: the menu model
  */
  gio.menu_model.MenuModel getExtraMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_entry_get_extra_menu(cast(GtkEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
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
      
      If the entry is not realized or has no icon at the given
      position, icon_area is filled with zeros. Otherwise,
      icon_area will be filled with the icon's allocation,
      relative to entry's allocation.
  
      Params:
        iconPos = Icon position
        iconArea = Return location for the icon’s area
  */
  void getIconArea(gtk.types.EntryIconPosition iconPos, out gdk.rectangle.Rectangle iconArea)
  {
    gtk_entry_get_icon_area(cast(GtkEntry*)this._cPtr, iconPos, cast(GdkRectangle*)&iconArea);
  }

  /**
      Finds the icon at the given position and return its index.
      
      The position’s coordinates are relative to the entry’s
      top left corner. If `x`, `y` doesn’t lie inside an icon,
      -1 is returned. This function is intended for use in a
       `signalGtk.Widget::query-tooltip` signal handler.
  
      Params:
        x = the x coordinate of the position to find, relative to entry
        y = the y coordinate of the position to find, relative to entry
      Returns: the index of the icon at the given position, or -1
  */
  int getIconAtPos(int x, int y)
  {
    int _retval;
    _retval = gtk_entry_get_icon_at_pos(cast(GtkEntry*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Retrieves the [gio.icon.Icon] used for the icon.
      
      null will be returned if there is no icon or if the icon was
      set by some other method (e.g., by [gdk.paintable.Paintable] or icon name).
  
      Params:
        iconPos = Icon position
      Returns: A [gio.icon.Icon]
  */
  gio.icon.Icon getIconGicon(gtk.types.EntryIconPosition iconPos)
  {
    GIcon* _cretval;
    _cretval = gtk_entry_get_icon_gicon(cast(GtkEntry*)this._cPtr, iconPos);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the icon name used for the icon.
      
      null is returned if there is no icon or if the icon was set
      by some other method (e.g., by [gdk.paintable.Paintable] or gicon).
  
      Params:
        iconPos = Icon position
      Returns: An icon name
  */
  string getIconName(gtk.types.EntryIconPosition iconPos)
  {
    const(char)* _cretval;
    _cretval = gtk_entry_get_icon_name(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the [gdk.paintable.Paintable] used for the icon.
      
      If no [gdk.paintable.Paintable] was used for the icon, null is returned.
  
      Params:
        iconPos = Icon position
      Returns: A [gdk.paintable.Paintable]
          if no icon is set for this position or the icon set is not
          a [gdk.paintable.Paintable].
  */
  gdk.paintable.Paintable getIconPaintable(gtk.types.EntryIconPosition iconPos)
  {
    GdkPaintable* _cretval;
    _cretval = gtk_entry_get_icon_paintable(cast(GtkEntry*)this._cPtr, iconPos);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
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
      Gets the type of representation being used by the icon
      to store image data.
      
      If the icon has no image data, the return value will
      be [gtk.types.ImageType.Empty].
  
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
      Returns: the tooltip text
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
      Returns: the tooltip text
  */
  string getIconTooltipText(gtk.types.EntryIconPosition iconPos)
  {
    char* _cretval;
    _cretval = gtk_entry_get_icon_tooltip_text(cast(GtkEntry*)this._cPtr, iconPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the input hints of this [gtk.entry.Entry].
      Returns: the input hints
  */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_entry_get_input_hints(cast(GtkEntry*)this._cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the input purpose of the [gtk.entry.Entry].
      Returns: the input purpose
  */
  gtk.types.InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_entry_get_input_purpose(cast(GtkEntry*)this._cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Retrieves the character displayed in place of the actual text
      in “password mode”.
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
      Retrieves the maximum allowed length of the text in entry.
      
      See [gtk.entry.Entry.setMaxLength].
      Returns: the maximum allowed number of characters
          in [gtk.entry.Entry], or 0 if there is no maximum.
  */
  int getMaxLength()
  {
    int _retval;
    _retval = gtk_entry_get_max_length(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the [gtk.entry.Entry] is in overwrite mode.
      Returns: whether the text is overwritten when typing.
  */
  bool getOverwriteMode()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_overwrite_mode(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the text that will be displayed when entry
      is empty and unfocused
      Returns: a pointer to the
          placeholder text as a string. This string points to
          internally allocated storage in the widget and must
          not be freed, modified or stored. If no placeholder
          text has been set, null will be returned.
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
      Retrieves the pulse step set with
      [gtk.entry.Entry.setProgressPulseStep].
      Returns: a fraction from 0.0 to 1.0
  */
  double getProgressPulseStep()
  {
    double _retval;
    _retval = gtk_entry_get_progress_pulse_step(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tabstops of the [gtk.entry.Entry].
      
      See [gtk.entry.Entry.setTabs].
      Returns: the tabstops
  */
  pango.tab_array.TabArray getTabs()
  {
    PangoTabArray* _cretval;
    _cretval = gtk_entry_get_tabs(cast(GtkEntry*)this._cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the current length of the text in entry.
      
      This is equivalent to getting entry's [gtk.entry_buffer.EntryBuffer]
      and calling [gtk.entry_buffer.EntryBuffer.getLength] on it.
      Returns: the current number of characters
          in [gtk.entry.Entry], or 0 if there are none.
  */
  ushort getTextLength()
  {
    ushort _retval;
    _retval = gtk_entry_get_text_length(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the text in entry is visible.
      
      See [gtk.entry.Entry.setVisibility].
      Returns: true if the text is currently visible
  */
  bool getVisibility()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_get_visibility(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Causes entry to have keyboard focus.
      
      It behaves like [gtk.widget.Widget.grabFocus], except that it doesn't
      select the contents of the entry. You only want to call this on some
      special entries which the user usually doesn't want to replace all text
      in, such as search-as-you-type entries.
      Returns: true if focus is now inside self
  */
  bool grabFocusWithoutSelecting()
  {
    bool _retval;
    _retval = cast(bool)gtk_entry_grab_focus_without_selecting(cast(GtkEntry*)this._cPtr);
    return _retval;
  }

  /**
      Indicates that some progress is made, but you don’t
      know how much.
      
      Causes the entry’s progress indicator to enter “activity
      mode”, where a block bounces back and forth. Each call to
      [gtk.entry.Entry.progressPulse] causes the block to move by a
      little bit (the amount of movement per pulse is determined
      by [gtk.entry.Entry.setProgressPulseStep]).
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
      Sets whether pressing Enter in the entry will activate the default
      widget for the window containing the entry.
      
      This usually means that the dialog containing the entry will be closed,
      since the default widget is usually one of the dialog buttons.
  
      Params:
        setting = true to activate window’s default widget on Enter keypress
  */
  void setActivatesDefault(bool setting)
  {
    gtk_entry_set_activates_default(cast(GtkEntry*)this._cPtr, setting);
  }

  /**
      Sets the alignment for the contents of the entry.
      
      This controls the horizontal positioning of the contents when
      the displayed text is shorter than the width of the entry.
      
      See also: [gtk.editable.Editable.xalign]
  
      Params:
        xalign = The horizontal alignment, from 0 (left) to 1 (right).
            Reversed for RTL layouts
  */
  void setAlignment(float xalign)
  {
    gtk_entry_set_alignment(cast(GtkEntry*)this._cPtr, xalign);
  }

  /**
      Sets a [pango.attr_list.AttrList].
      
      The attributes in the list are applied to the entry text.
      
      Since the attributes will be applied to text that changes
      as the user types, it makes most sense to use attributes
      with unlimited extent.
  
      Params:
        attrs = a [pango.attr_list.AttrList]
  */
  void setAttributes(pango.attr_list.AttrList attrs)
  {
    gtk_entry_set_attributes(cast(GtkEntry*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Set the [gtk.entry_buffer.EntryBuffer] object which holds the text for
      this widget.
  
      Params:
        buffer = a [gtk.entry_buffer.EntryBuffer]
  */
  void setBuffer(gtk.entry_buffer.EntryBuffer buffer)
  {
    gtk_entry_set_buffer(cast(GtkEntry*)this._cPtr, buffer ? cast(GtkEntryBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Sets completion to be the auxiliary completion object
      to use with entry.
      
      All further configuration of the completion mechanism is
      done on completion using the [gtk.entry_completion.EntryCompletion] API.
      Completion is disabled if completion is set to null.
  
      Params:
        completion = The [gtk.entry_completion.EntryCompletion]
  
      Deprecated: GtkEntryCompletion will be removed in GTK 5.
  */
  void setCompletion(gtk.entry_completion.EntryCompletion completion = null)
  {
    gtk_entry_set_completion(cast(GtkEntry*)this._cPtr, completion ? cast(GtkEntryCompletion*)completion._cPtr(No.Dup) : null);
  }

  /**
      Sets a menu model to add when constructing
      the context menu for entry.
  
      Params:
        model = a [gio.menu_model.MenuModel]
  */
  void setExtraMenu(gio.menu_model.MenuModel model = null)
  {
    gtk_entry_set_extra_menu(cast(GtkEntry*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
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
      Sets up the icon at the given position as drag source.
      
      This makes it so that GTK will start a drag
      operation when the user clicks and drags the icon.
  
      Params:
        iconPos = icon position
        provider = a [gdk.content_provider.ContentProvider]
        actions = a bitmask of the allowed drag actions
  */
  void setIconDragSource(gtk.types.EntryIconPosition iconPos, gdk.content_provider.ContentProvider provider, gdk.types.DragAction actions)
  {
    gtk_entry_set_icon_drag_source(cast(GtkEntry*)this._cPtr, iconPos, provider ? cast(GdkContentProvider*)provider._cPtr(No.Dup) : null, actions);
  }

  /**
      Sets the icon shown in the entry at the specified position
      from the current icon theme.
      
      If the icon isn’t known, a “broken image” icon will be
      displayed instead.
      
      If icon is null, no icon will be shown in the
      specified position.
  
      Params:
        iconPos = The position at which to set the icon
        icon = The icon to set
  */
  void setIconFromGicon(gtk.types.EntryIconPosition iconPos, gio.icon.Icon icon = null)
  {
    gtk_entry_set_icon_from_gicon(cast(GtkEntry*)this._cPtr, iconPos, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon shown in the entry at the specified position
      from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead.
      
      If icon_name is null, no icon will be shown in the
      specified position.
  
      Params:
        iconPos = The position at which to set the icon
        iconName = An icon name
  */
  void setIconFromIconName(gtk.types.EntryIconPosition iconPos, string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_entry_set_icon_from_icon_name(cast(GtkEntry*)this._cPtr, iconPos, _iconName);
  }

  /**
      Sets the icon shown in the specified position using a [gdk.paintable.Paintable].
      
      If paintable is null, no icon will be shown in the specified position.
  
      Params:
        iconPos = Icon position
        paintable = A [gdk.paintable.Paintable]
  */
  void setIconFromPaintable(gtk.types.EntryIconPosition iconPos, gdk.paintable.Paintable paintable = null)
  {
    gtk_entry_set_icon_from_paintable(cast(GtkEntry*)this._cPtr, iconPos, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
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
      the specified position.
      
      tooltip is assumed to be marked up with Pango Markup.
      
      Use null for tooltip to remove an existing tooltip.
      
      See also [gtk.widget.Widget.setTooltipMarkup] and
      [gtk.entry.Entry.setIconTooltipText].
  
      Params:
        iconPos = the icon position
        tooltip = the contents of the tooltip for the icon
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
      
      If you unset the widget tooltip via
      [gtk.widget.Widget.setTooltipText] or
      [gtk.widget.Widget.setTooltipMarkup], this sets
      `propertyGtk.Widget:has-tooltip` to false, which suppresses
      icon tooltips too. You can resolve this by then calling
      [gtk.widget.Widget.setHasTooltip] to set
      `propertyGtk.Widget:has-tooltip` back to true, or
      setting at least one non-empty tooltip on any icon
      achieves the same result.
  
      Params:
        iconPos = the icon position
        tooltip = the contents of the tooltip for the icon
  */
  void setIconTooltipText(gtk.types.EntryIconPosition iconPos, string tooltip = null)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    gtk_entry_set_icon_tooltip_text(cast(GtkEntry*)this._cPtr, iconPos, _tooltip);
  }

  /**
      Set additional hints which allow input methods to
      fine-tune their behavior.
  
      Params:
        hints = the hints
  */
  void setInputHints(gtk.types.InputHints hints)
  {
    gtk_entry_set_input_hints(cast(GtkEntry*)this._cPtr, hints);
  }

  /**
      Sets the input purpose which can be used by input methods
      to adjust their behavior.
  
      Params:
        purpose = the purpose
  */
  void setInputPurpose(gtk.types.InputPurpose purpose)
  {
    gtk_entry_set_input_purpose(cast(GtkEntry*)this._cPtr, purpose);
  }

  /**
      Sets the character to use in place of the actual text
      in “password mode”.
      
      See [gtk.entry.Entry.setVisibility] for how to enable
      “password mode”.
      
      By default, GTK picks the best invisible char available in
      the current font. If you set the invisible char to 0, then
      the user will get no feedback at all; there will be no text
      on the screen as they type.
  
      Params:
        ch = a Unicode character
  */
  void setInvisibleChar(dchar ch)
  {
    gtk_entry_set_invisible_char(cast(GtkEntry*)this._cPtr, ch);
  }

  /**
      Sets the maximum allowed length of the contents of the widget.
      
      If the current contents are longer than the given length, then
      they will be truncated to fit. The length is in characters.
      
      This is equivalent to getting entry's [gtk.entry_buffer.EntryBuffer] and
      calling [gtk.entry_buffer.EntryBuffer.setMaxLength] on it.
  
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
      Sets whether the text is overwritten when typing in the [gtk.entry.Entry].
  
      Params:
        overwrite = new value
  */
  void setOverwriteMode(bool overwrite)
  {
    gtk_entry_set_overwrite_mode(cast(GtkEntry*)this._cPtr, overwrite);
  }

  /**
      Sets text to be displayed in entry when it is empty.
      
      This can be used to give a visual hint of the expected
      contents of the [gtk.entry.Entry].
  
      Params:
        text = a string to be displayed when entry is empty and unfocused
  */
  void setPlaceholderText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_entry_set_placeholder_text(cast(GtkEntry*)this._cPtr, _text);
  }

  /**
      Causes the entry’s progress indicator to “fill in” the given
      fraction of the bar.
      
      The fraction should be between 0.0 and 1.0, inclusive.
  
      Params:
        fraction = fraction of the task that’s been completed
  */
  void setProgressFraction(double fraction)
  {
    gtk_entry_set_progress_fraction(cast(GtkEntry*)this._cPtr, fraction);
  }

  /**
      Sets the fraction of total entry width to move the progress
      bouncing block for each pulse.
      
      Use [gtk.entry.Entry.progressPulse] to pulse
      the progress.
  
      Params:
        fraction = fraction between 0.0 and 1.0
  */
  void setProgressPulseStep(double fraction)
  {
    gtk_entry_set_progress_pulse_step(cast(GtkEntry*)this._cPtr, fraction);
  }

  /**
      Sets a [pango.tab_array.TabArray].
      
      The tabstops in the array are applied to the entry text.
  
      Params:
        tabs = a [pango.tab_array.TabArray]
  */
  void setTabs(pango.tab_array.TabArray tabs = null)
  {
    gtk_entry_set_tabs(cast(GtkEntry*)this._cPtr, tabs ? cast(PangoTabArray*)tabs._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the contents of the entry are visible or not.
      
      When visibility is set to false, characters are displayed
      as the invisible char, and will also appear that way when
      the text in the entry widget is copied elsewhere.
      
      By default, GTK picks the best invisible character available
      in the current font, but it can be changed with
      [gtk.entry.Entry.setInvisibleChar].
      
      Note that you probably want to set `propertyGtk.Entry:input-purpose`
      to [gtk.types.InputPurpose.Password] or [gtk.types.InputPurpose.Pin] to
      inform input methods about the purpose of this entry,
      in addition to setting visibility to false.
  
      Params:
        visible = true if the contents of the entry are displayed as plaintext
  */
  void setVisibility(bool visible)
  {
    gtk_entry_set_visibility(cast(GtkEntry*)this._cPtr, visible);
  }

  /**
      Unsets the invisible char, so that the default invisible char
      is used again. See [gtk.entry.Entry.setInvisibleChar].
  */
  void unsetInvisibleChar()
  {
    gtk_entry_unset_invisible_char(cast(GtkEntry*)this._cPtr);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the entry is activated.
        
        The keybindings for this signal are all forms of the Enter key.
  
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
      Connect to `IconPress` signal.
  
      Emitted when an activatable icon is clicked.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.EntryIconPosition iconPos, gtk.entry.Entry entry))
  
          `iconPos` The position of the clicked icon (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectIconPress(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.EntryIconPosition)))
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
    return connectSignalClosure("icon-press", closure, after);
  }

  /**
      Connect to `IconRelease` signal.
  
      Emitted on the button release from a mouse click
        over an activatable icon.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.EntryIconPosition iconPos, gtk.entry.Entry entry))
  
          `iconPos` The position of the clicked icon (optional)
  
          `entry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectIconRelease(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.EntryIconPosition)))
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
    return connectSignalClosure("icon-release", closure, after);
  }
}
