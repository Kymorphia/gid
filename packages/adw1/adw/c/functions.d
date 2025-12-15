/// C functions for adw1 library
module adw.c.functions;

public import gid.basictypes;
import gid.loader;
import adw.c.types;
public import gio.c.types;
public import gtk.c.types;

version(Windows)
  private immutable LIBS = ["libadwaita-1-0.dll;adwaita-1-0.dll;adwaita-1.dll"];
else version(OSX)
  private immutable LIBS = ["libadwaita-1.0.dylib"];
else
  private immutable LIBS = ["libadwaita-1.so.0"];

__gshared extern(C)
{
  // AboutDialog
  GType function() c_adw_about_dialog_get_type; ///
  AdwDialog* function() c_adw_about_dialog_new; ///
  AdwDialog* function(const(char)* resourcePath, const(char)* releaseNotesVersion) c_adw_about_dialog_new_from_appdata; ///
  void function(AdwAboutDialog* self, const(char)* name, const(char*)* people) c_adw_about_dialog_add_acknowledgement_section; ///
  void function(AdwAboutDialog* self, const(char)* name, const(char*)* people) c_adw_about_dialog_add_credit_section; ///
  void function(AdwAboutDialog* self, const(char)* title, const(char)* copyright, GtkLicense licenseType, const(char)* license) c_adw_about_dialog_add_legal_section; ///
  void function(AdwAboutDialog* self, const(char)* title, const(char)* url) c_adw_about_dialog_add_link; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_application_icon; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_application_name; ///
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_artists; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_comments; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_copyright; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_debug_info; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_debug_info_filename; ///
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_designers; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_developer_name; ///
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_developers; ///
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_documenters; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_issue_url; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_license; ///
  GtkLicense function(AdwAboutDialog* self) c_adw_about_dialog_get_license_type; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_release_notes; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_release_notes_version; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_support_url; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_translator_credits; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_version; ///
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_website; ///
  void function(AdwAboutDialog* self, const(char)* applicationIcon) c_adw_about_dialog_set_application_icon; ///
  void function(AdwAboutDialog* self, const(char)* applicationName) c_adw_about_dialog_set_application_name; ///
  void function(AdwAboutDialog* self, const(char*)* artists) c_adw_about_dialog_set_artists; ///
  void function(AdwAboutDialog* self, const(char)* comments) c_adw_about_dialog_set_comments; ///
  void function(AdwAboutDialog* self, const(char)* copyright) c_adw_about_dialog_set_copyright; ///
  void function(AdwAboutDialog* self, const(char)* debugInfo) c_adw_about_dialog_set_debug_info; ///
  void function(AdwAboutDialog* self, const(char)* filename) c_adw_about_dialog_set_debug_info_filename; ///
  void function(AdwAboutDialog* self, const(char*)* designers) c_adw_about_dialog_set_designers; ///
  void function(AdwAboutDialog* self, const(char)* developerName) c_adw_about_dialog_set_developer_name; ///
  void function(AdwAboutDialog* self, const(char*)* developers) c_adw_about_dialog_set_developers; ///
  void function(AdwAboutDialog* self, const(char*)* documenters) c_adw_about_dialog_set_documenters; ///
  void function(AdwAboutDialog* self, const(char)* issueUrl) c_adw_about_dialog_set_issue_url; ///
  void function(AdwAboutDialog* self, const(char)* license) c_adw_about_dialog_set_license; ///
  void function(AdwAboutDialog* self, GtkLicense licenseType) c_adw_about_dialog_set_license_type; ///
  void function(AdwAboutDialog* self, const(char)* releaseNotes) c_adw_about_dialog_set_release_notes; ///
  void function(AdwAboutDialog* self, const(char)* version_) c_adw_about_dialog_set_release_notes_version; ///
  void function(AdwAboutDialog* self, const(char)* supportUrl) c_adw_about_dialog_set_support_url; ///
  void function(AdwAboutDialog* self, const(char)* translatorCredits) c_adw_about_dialog_set_translator_credits; ///
  void function(AdwAboutDialog* self, const(char)* version_) c_adw_about_dialog_set_version; ///
  void function(AdwAboutDialog* self, const(char)* website) c_adw_about_dialog_set_website; ///

  // AboutWindow
  GType function() c_adw_about_window_get_type; ///
  GtkWidget* function() c_adw_about_window_new; ///
  GtkWidget* function(const(char)* resourcePath, const(char)* releaseNotesVersion) c_adw_about_window_new_from_appdata; ///
  void function(AdwAboutWindow* self, const(char)* name, const(char*)* people) c_adw_about_window_add_acknowledgement_section; ///
  void function(AdwAboutWindow* self, const(char)* name, const(char*)* people) c_adw_about_window_add_credit_section; ///
  void function(AdwAboutWindow* self, const(char)* title, const(char)* copyright, GtkLicense licenseType, const(char)* license) c_adw_about_window_add_legal_section; ///
  void function(AdwAboutWindow* self, const(char)* title, const(char)* url) c_adw_about_window_add_link; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_application_icon; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_application_name; ///
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_artists; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_comments; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_copyright; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_debug_info; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_debug_info_filename; ///
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_designers; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_developer_name; ///
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_developers; ///
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_documenters; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_issue_url; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_license; ///
  GtkLicense function(AdwAboutWindow* self) c_adw_about_window_get_license_type; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_release_notes; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_release_notes_version; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_support_url; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_translator_credits; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_version; ///
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_website; ///
  void function(AdwAboutWindow* self, const(char)* applicationIcon) c_adw_about_window_set_application_icon; ///
  void function(AdwAboutWindow* self, const(char)* applicationName) c_adw_about_window_set_application_name; ///
  void function(AdwAboutWindow* self, const(char*)* artists) c_adw_about_window_set_artists; ///
  void function(AdwAboutWindow* self, const(char)* comments) c_adw_about_window_set_comments; ///
  void function(AdwAboutWindow* self, const(char)* copyright) c_adw_about_window_set_copyright; ///
  void function(AdwAboutWindow* self, const(char)* debugInfo) c_adw_about_window_set_debug_info; ///
  void function(AdwAboutWindow* self, const(char)* filename) c_adw_about_window_set_debug_info_filename; ///
  void function(AdwAboutWindow* self, const(char*)* designers) c_adw_about_window_set_designers; ///
  void function(AdwAboutWindow* self, const(char)* developerName) c_adw_about_window_set_developer_name; ///
  void function(AdwAboutWindow* self, const(char*)* developers) c_adw_about_window_set_developers; ///
  void function(AdwAboutWindow* self, const(char*)* documenters) c_adw_about_window_set_documenters; ///
  void function(AdwAboutWindow* self, const(char)* issueUrl) c_adw_about_window_set_issue_url; ///
  void function(AdwAboutWindow* self, const(char)* license) c_adw_about_window_set_license; ///
  void function(AdwAboutWindow* self, GtkLicense licenseType) c_adw_about_window_set_license_type; ///
  void function(AdwAboutWindow* self, const(char)* releaseNotes) c_adw_about_window_set_release_notes; ///
  void function(AdwAboutWindow* self, const(char)* version_) c_adw_about_window_set_release_notes_version; ///
  void function(AdwAboutWindow* self, const(char)* supportUrl) c_adw_about_window_set_support_url; ///
  void function(AdwAboutWindow* self, const(char)* translatorCredits) c_adw_about_window_set_translator_credits; ///
  void function(AdwAboutWindow* self, const(char)* version_) c_adw_about_window_set_version; ///
  void function(AdwAboutWindow* self, const(char)* website) c_adw_about_window_set_website; ///

  // ActionRow
  GType function() c_adw_action_row_get_type; ///
  GtkWidget* function() c_adw_action_row_new; ///
  void function(AdwActionRow* self) c_adw_action_row_activate; ///
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_add_prefix; ///
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_add_suffix; ///
  GtkWidget* function(AdwActionRow* self) c_adw_action_row_get_activatable_widget; ///
  const(char)* function(AdwActionRow* self) c_adw_action_row_get_icon_name; ///
  const(char)* function(AdwActionRow* self) c_adw_action_row_get_subtitle; ///
  int function(AdwActionRow* self) c_adw_action_row_get_subtitle_lines; ///
  gboolean function(AdwActionRow* self) c_adw_action_row_get_subtitle_selectable; ///
  int function(AdwActionRow* self) c_adw_action_row_get_title_lines; ///
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_remove; ///
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_set_activatable_widget; ///
  void function(AdwActionRow* self, const(char)* iconName) c_adw_action_row_set_icon_name; ///
  void function(AdwActionRow* self, const(char)* subtitle) c_adw_action_row_set_subtitle; ///
  void function(AdwActionRow* self, int subtitleLines) c_adw_action_row_set_subtitle_lines; ///
  void function(AdwActionRow* self, gboolean subtitleSelectable) c_adw_action_row_set_subtitle_selectable; ///
  void function(AdwActionRow* self, int titleLines) c_adw_action_row_set_title_lines; ///

  // AlertDialog
  GType function() c_adw_alert_dialog_get_type; ///
  AdwDialog* function(const(char)* heading, const(char)* body_) c_adw_alert_dialog_new; ///
  void function(AdwAlertDialog* self, const(char)* id, const(char)* label) c_adw_alert_dialog_add_response; ///
  void function(AdwAlertDialog* self, const(char)* firstId,  ...) c_adw_alert_dialog_add_responses; ///
  void function(AdwAlertDialog* self, GtkWidget* parent, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_adw_alert_dialog_choose; ///
  const(char)* function(AdwAlertDialog* self, GAsyncResult* result) c_adw_alert_dialog_choose_finish; ///
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_body; ///
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_body_markup; ///
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_heading; ///
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_heading_markup; ///
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_body; ///
  gboolean function(AdwAlertDialog* self) c_adw_alert_dialog_get_body_use_markup; ///
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_close_response; ///
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_default_response; ///
  GtkWidget* function(AdwAlertDialog* self) c_adw_alert_dialog_get_extra_child; ///
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_heading; ///
  gboolean function(AdwAlertDialog* self) c_adw_alert_dialog_get_heading_use_markup; ///
  AdwResponseAppearance function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_get_response_appearance; ///
  gboolean function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_get_response_enabled; ///
  const(char)* function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_get_response_label; ///
  gboolean function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_has_response; ///
  void function(AdwAlertDialog* self, const(char)* id) c_adw_alert_dialog_remove_response; ///
  void function(AdwAlertDialog* self, const(char)* body_) c_adw_alert_dialog_set_body; ///
  void function(AdwAlertDialog* self, gboolean useMarkup) c_adw_alert_dialog_set_body_use_markup; ///
  void function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_set_close_response; ///
  void function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_set_default_response; ///
  void function(AdwAlertDialog* self, GtkWidget* child) c_adw_alert_dialog_set_extra_child; ///
  void function(AdwAlertDialog* self, const(char)* heading) c_adw_alert_dialog_set_heading; ///
  void function(AdwAlertDialog* self, gboolean useMarkup) c_adw_alert_dialog_set_heading_use_markup; ///
  void function(AdwAlertDialog* self, const(char)* response, AdwResponseAppearance appearance) c_adw_alert_dialog_set_response_appearance; ///
  void function(AdwAlertDialog* self, const(char)* response, gboolean enabled) c_adw_alert_dialog_set_response_enabled; ///
  void function(AdwAlertDialog* self, const(char)* response, const(char)* label) c_adw_alert_dialog_set_response_label; ///

  // Animation
  GType function() c_adw_animation_get_type; ///
  gboolean function(AdwAnimation* self) c_adw_animation_get_follow_enable_animations_setting; ///
  AdwAnimationState function(AdwAnimation* self) c_adw_animation_get_state; ///
  AdwAnimationTarget* function(AdwAnimation* self) c_adw_animation_get_target; ///
  double function(AdwAnimation* self) c_adw_animation_get_value; ///
  GtkWidget* function(AdwAnimation* self) c_adw_animation_get_widget; ///
  void function(AdwAnimation* self) c_adw_animation_pause; ///
  void function(AdwAnimation* self) c_adw_animation_play; ///
  void function(AdwAnimation* self) c_adw_animation_reset; ///
  void function(AdwAnimation* self) c_adw_animation_resume; ///
  void function(AdwAnimation* self, gboolean setting) c_adw_animation_set_follow_enable_animations_setting; ///
  void function(AdwAnimation* self, AdwAnimationTarget* target) c_adw_animation_set_target; ///
  void function(AdwAnimation* self) c_adw_animation_skip; ///

  // AnimationTarget
  GType function() c_adw_animation_target_get_type; ///

  // Application
  GType function() c_adw_application_get_type; ///
  AdwApplication* function(const(char)* applicationId, GApplicationFlags flags) c_adw_application_new; ///
  AdwStyleManager* function(AdwApplication* self) c_adw_application_get_style_manager; ///

  // ApplicationWindow
  GType function() c_adw_application_window_get_type; ///
  GtkWidget* function(GtkApplication* app) c_adw_application_window_new; ///
  void function(AdwApplicationWindow* self, AdwBreakpoint* breakpoint) c_adw_application_window_add_breakpoint; ///
  GtkWidget* function(AdwApplicationWindow* self) c_adw_application_window_get_content; ///
  AdwBreakpoint* function(AdwApplicationWindow* self) c_adw_application_window_get_current_breakpoint; ///
  GListModel* function(AdwApplicationWindow* self) c_adw_application_window_get_dialogs; ///
  AdwDialog* function(AdwApplicationWindow* self) c_adw_application_window_get_visible_dialog; ///
  void function(AdwApplicationWindow* self, GtkWidget* content) c_adw_application_window_set_content; ///

  // Avatar
  GType function() c_adw_avatar_get_type; ///
  GtkWidget* function(int size, const(char)* text, gboolean showInitials) c_adw_avatar_new; ///
  GdkTexture* function(AdwAvatar* self, int scaleFactor) c_adw_avatar_draw_to_texture; ///
  GdkPaintable* function(AdwAvatar* self) c_adw_avatar_get_custom_image; ///
  const(char)* function(AdwAvatar* self) c_adw_avatar_get_icon_name; ///
  gboolean function(AdwAvatar* self) c_adw_avatar_get_show_initials; ///
  int function(AdwAvatar* self) c_adw_avatar_get_size; ///
  const(char)* function(AdwAvatar* self) c_adw_avatar_get_text; ///
  void function(AdwAvatar* self, GdkPaintable* customImage) c_adw_avatar_set_custom_image; ///
  void function(AdwAvatar* self, const(char)* iconName) c_adw_avatar_set_icon_name; ///
  void function(AdwAvatar* self, gboolean showInitials) c_adw_avatar_set_show_initials; ///
  void function(AdwAvatar* self, int size) c_adw_avatar_set_size; ///
  void function(AdwAvatar* self, const(char)* text) c_adw_avatar_set_text; ///

  // Banner
  GType function() c_adw_banner_get_type; ///
  GtkWidget* function(const(char)* title) c_adw_banner_new; ///
  const(char)* function(AdwBanner* self) c_adw_banner_get_button_label; ///
  gboolean function(AdwBanner* self) c_adw_banner_get_revealed; ///
  const(char)* function(AdwBanner* self) c_adw_banner_get_title; ///
  gboolean function(AdwBanner* self) c_adw_banner_get_use_markup; ///
  void function(AdwBanner* self, const(char)* label) c_adw_banner_set_button_label; ///
  void function(AdwBanner* self, gboolean revealed) c_adw_banner_set_revealed; ///
  void function(AdwBanner* self, const(char)* title) c_adw_banner_set_title; ///
  void function(AdwBanner* self, gboolean useMarkup) c_adw_banner_set_use_markup; ///

  // Bin
  GType function() c_adw_bin_get_type; ///
  GtkWidget* function() c_adw_bin_new; ///
  GtkWidget* function(AdwBin* self) c_adw_bin_get_child; ///
  void function(AdwBin* self, GtkWidget* child) c_adw_bin_set_child; ///

  // Breakpoint
  GType function() c_adw_breakpoint_get_type; ///
  AdwBreakpoint* function(AdwBreakpointCondition* condition) c_adw_breakpoint_new; ///
  void function(AdwBreakpoint* self, GObject* object, const(char)* property, const(GValue)* value) c_adw_breakpoint_add_setter; ///
  void function(AdwBreakpoint* self, GObject* firstObject, const(char)* firstProperty,  ...) c_adw_breakpoint_add_setters; ///
  void function(AdwBreakpoint* self, GObject* firstObject, const(char)* firstProperty, void* args) c_adw_breakpoint_add_setters_valist; ///
  void function(AdwBreakpoint* self, int nSetters, GObject** objects, const(char*)* names, const(GValue*)* values) c_adw_breakpoint_add_settersv; ///
  AdwBreakpointCondition* function(AdwBreakpoint* self) c_adw_breakpoint_get_condition; ///
  void function(AdwBreakpoint* self, AdwBreakpointCondition* condition) c_adw_breakpoint_set_condition; ///

  // BreakpointBin
  GType function() c_adw_breakpoint_bin_get_type; ///
  GtkWidget* function() c_adw_breakpoint_bin_new; ///
  void function(AdwBreakpointBin* self, AdwBreakpoint* breakpoint) c_adw_breakpoint_bin_add_breakpoint; ///
  GtkWidget* function(AdwBreakpointBin* self) c_adw_breakpoint_bin_get_child; ///
  AdwBreakpoint* function(AdwBreakpointBin* self) c_adw_breakpoint_bin_get_current_breakpoint; ///
  void function(AdwBreakpointBin* self, AdwBreakpoint* breakpoint) c_adw_breakpoint_bin_remove_breakpoint; ///
  void function(AdwBreakpointBin* self, GtkWidget* child) c_adw_breakpoint_bin_set_child; ///

  // BreakpointCondition
  GType function() c_adw_breakpoint_condition_get_type; ///
  AdwBreakpointCondition* function(AdwBreakpointCondition* condition1, AdwBreakpointCondition* condition2) c_adw_breakpoint_condition_new_and; ///
  AdwBreakpointCondition* function(AdwBreakpointConditionLengthType type, double value, AdwLengthUnit unit) c_adw_breakpoint_condition_new_length; ///
  AdwBreakpointCondition* function(AdwBreakpointCondition* condition1, AdwBreakpointCondition* condition2) c_adw_breakpoint_condition_new_or; ///
  AdwBreakpointCondition* function(AdwBreakpointConditionRatioType type, int width, int height) c_adw_breakpoint_condition_new_ratio; ///
  AdwBreakpointCondition* function(AdwBreakpointCondition* self) c_adw_breakpoint_condition_copy; ///
  void function(AdwBreakpointCondition* self) c_adw_breakpoint_condition_free; ///
  char* function(AdwBreakpointCondition* self) c_adw_breakpoint_condition_to_string; ///
  AdwBreakpointCondition* function(const(char)* str) c_adw_breakpoint_condition_parse; ///

  // ButtonContent
  GType function() c_adw_button_content_get_type; ///
  GtkWidget* function() c_adw_button_content_new; ///
  gboolean function(AdwButtonContent* self) c_adw_button_content_get_can_shrink; ///
  const(char)* function(AdwButtonContent* self) c_adw_button_content_get_icon_name; ///
  const(char)* function(AdwButtonContent* self) c_adw_button_content_get_label; ///
  gboolean function(AdwButtonContent* self) c_adw_button_content_get_use_underline; ///
  void function(AdwButtonContent* self, gboolean canShrink) c_adw_button_content_set_can_shrink; ///
  void function(AdwButtonContent* self, const(char)* iconName) c_adw_button_content_set_icon_name; ///
  void function(AdwButtonContent* self, const(char)* label) c_adw_button_content_set_label; ///
  void function(AdwButtonContent* self, gboolean useUnderline) c_adw_button_content_set_use_underline; ///

  // CallbackAnimationTarget
  GType function() c_adw_callback_animation_target_get_type; ///
  AdwAnimationTarget* function(AdwAnimationTargetFunc callback, void* userData, GDestroyNotify destroy) c_adw_callback_animation_target_new; ///

  // Carousel
  GType function() c_adw_carousel_get_type; ///
  GtkWidget* function() c_adw_carousel_new; ///
  void function(AdwCarousel* self, GtkWidget* child) c_adw_carousel_append; ///
  gboolean function(AdwCarousel* self) c_adw_carousel_get_allow_long_swipes; ///
  gboolean function(AdwCarousel* self) c_adw_carousel_get_allow_mouse_drag; ///
  gboolean function(AdwCarousel* self) c_adw_carousel_get_allow_scroll_wheel; ///
  gboolean function(AdwCarousel* self) c_adw_carousel_get_interactive; ///
  uint function(AdwCarousel* self) c_adw_carousel_get_n_pages; ///
  GtkWidget* function(AdwCarousel* self, uint n) c_adw_carousel_get_nth_page; ///
  double function(AdwCarousel* self) c_adw_carousel_get_position; ///
  uint function(AdwCarousel* self) c_adw_carousel_get_reveal_duration; ///
  AdwSpringParams* function(AdwCarousel* self) c_adw_carousel_get_scroll_params; ///
  uint function(AdwCarousel* self) c_adw_carousel_get_spacing; ///
  void function(AdwCarousel* self, GtkWidget* child, int position) c_adw_carousel_insert; ///
  void function(AdwCarousel* self, GtkWidget* child) c_adw_carousel_prepend; ///
  void function(AdwCarousel* self, GtkWidget* child) c_adw_carousel_remove; ///
  void function(AdwCarousel* self, GtkWidget* child, int position) c_adw_carousel_reorder; ///
  void function(AdwCarousel* self, GtkWidget* widget, gboolean animate) c_adw_carousel_scroll_to; ///
  void function(AdwCarousel* self, gboolean allowLongSwipes) c_adw_carousel_set_allow_long_swipes; ///
  void function(AdwCarousel* self, gboolean allowMouseDrag) c_adw_carousel_set_allow_mouse_drag; ///
  void function(AdwCarousel* self, gboolean allowScrollWheel) c_adw_carousel_set_allow_scroll_wheel; ///
  void function(AdwCarousel* self, gboolean interactive) c_adw_carousel_set_interactive; ///
  void function(AdwCarousel* self, uint revealDuration) c_adw_carousel_set_reveal_duration; ///
  void function(AdwCarousel* self, AdwSpringParams* params) c_adw_carousel_set_scroll_params; ///
  void function(AdwCarousel* self, uint spacing) c_adw_carousel_set_spacing; ///

  // CarouselIndicatorDots
  GType function() c_adw_carousel_indicator_dots_get_type; ///
  GtkWidget* function() c_adw_carousel_indicator_dots_new; ///
  AdwCarousel* function(AdwCarouselIndicatorDots* self) c_adw_carousel_indicator_dots_get_carousel; ///
  void function(AdwCarouselIndicatorDots* self, AdwCarousel* carousel) c_adw_carousel_indicator_dots_set_carousel; ///

  // CarouselIndicatorLines
  GType function() c_adw_carousel_indicator_lines_get_type; ///
  GtkWidget* function() c_adw_carousel_indicator_lines_new; ///
  AdwCarousel* function(AdwCarouselIndicatorLines* self) c_adw_carousel_indicator_lines_get_carousel; ///
  void function(AdwCarouselIndicatorLines* self, AdwCarousel* carousel) c_adw_carousel_indicator_lines_set_carousel; ///

  // Clamp
  GType function() c_adw_clamp_get_type; ///
  GtkWidget* function() c_adw_clamp_new; ///
  GtkWidget* function(AdwClamp* self) c_adw_clamp_get_child; ///
  int function(AdwClamp* self) c_adw_clamp_get_maximum_size; ///
  int function(AdwClamp* self) c_adw_clamp_get_tightening_threshold; ///
  AdwLengthUnit function(AdwClamp* self) c_adw_clamp_get_unit; ///
  void function(AdwClamp* self, GtkWidget* child) c_adw_clamp_set_child; ///
  void function(AdwClamp* self, int maximumSize) c_adw_clamp_set_maximum_size; ///
  void function(AdwClamp* self, int tighteningThreshold) c_adw_clamp_set_tightening_threshold; ///
  void function(AdwClamp* self, AdwLengthUnit unit) c_adw_clamp_set_unit; ///

  // ClampLayout
  GType function() c_adw_clamp_layout_get_type; ///
  GtkLayoutManager* function() c_adw_clamp_layout_new; ///
  int function(AdwClampLayout* self) c_adw_clamp_layout_get_maximum_size; ///
  int function(AdwClampLayout* self) c_adw_clamp_layout_get_tightening_threshold; ///
  AdwLengthUnit function(AdwClampLayout* self) c_adw_clamp_layout_get_unit; ///
  void function(AdwClampLayout* self, int maximumSize) c_adw_clamp_layout_set_maximum_size; ///
  void function(AdwClampLayout* self, int tighteningThreshold) c_adw_clamp_layout_set_tightening_threshold; ///
  void function(AdwClampLayout* self, AdwLengthUnit unit) c_adw_clamp_layout_set_unit; ///

  // ClampScrollable
  GType function() c_adw_clamp_scrollable_get_type; ///
  GtkWidget* function() c_adw_clamp_scrollable_new; ///
  GtkWidget* function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_child; ///
  int function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_maximum_size; ///
  int function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_tightening_threshold; ///
  AdwLengthUnit function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_unit; ///
  void function(AdwClampScrollable* self, GtkWidget* child) c_adw_clamp_scrollable_set_child; ///
  void function(AdwClampScrollable* self, int maximumSize) c_adw_clamp_scrollable_set_maximum_size; ///
  void function(AdwClampScrollable* self, int tighteningThreshold) c_adw_clamp_scrollable_set_tightening_threshold; ///
  void function(AdwClampScrollable* self, AdwLengthUnit unit) c_adw_clamp_scrollable_set_unit; ///

  // ComboRow
  GType function() c_adw_combo_row_get_type; ///
  GtkWidget* function() c_adw_combo_row_new; ///
  gboolean function(AdwComboRow* self) c_adw_combo_row_get_enable_search; ///
  GtkExpression* function(AdwComboRow* self) c_adw_combo_row_get_expression; ///
  GtkListItemFactory* function(AdwComboRow* self) c_adw_combo_row_get_factory; ///
  GtkListItemFactory* function(AdwComboRow* self) c_adw_combo_row_get_list_factory; ///
  GListModel* function(AdwComboRow* self) c_adw_combo_row_get_model; ///
  uint function(AdwComboRow* self) c_adw_combo_row_get_selected; ///
  GObject* function(AdwComboRow* self) c_adw_combo_row_get_selected_item; ///
  gboolean function(AdwComboRow* self) c_adw_combo_row_get_use_subtitle; ///
  void function(AdwComboRow* self, gboolean enableSearch) c_adw_combo_row_set_enable_search; ///
  void function(AdwComboRow* self, GtkExpression* expression) c_adw_combo_row_set_expression; ///
  void function(AdwComboRow* self, GtkListItemFactory* factory) c_adw_combo_row_set_factory; ///
  void function(AdwComboRow* self, GtkListItemFactory* factory) c_adw_combo_row_set_list_factory; ///
  void function(AdwComboRow* self, GListModel* model) c_adw_combo_row_set_model; ///
  void function(AdwComboRow* self, uint position) c_adw_combo_row_set_selected; ///
  void function(AdwComboRow* self, gboolean useSubtitle) c_adw_combo_row_set_use_subtitle; ///

  // Dialog
  GType function() c_adw_dialog_get_type; ///
  AdwDialog* function() c_adw_dialog_new; ///
  void function(AdwDialog* self, AdwBreakpoint* breakpoint) c_adw_dialog_add_breakpoint; ///
  gboolean function(AdwDialog* self) c_adw_dialog_close; ///
  void function(AdwDialog* self) c_adw_dialog_force_close; ///
  gboolean function(AdwDialog* self) c_adw_dialog_get_can_close; ///
  GtkWidget* function(AdwDialog* self) c_adw_dialog_get_child; ///
  int function(AdwDialog* self) c_adw_dialog_get_content_height; ///
  int function(AdwDialog* self) c_adw_dialog_get_content_width; ///
  AdwBreakpoint* function(AdwDialog* self) c_adw_dialog_get_current_breakpoint; ///
  GtkWidget* function(AdwDialog* self) c_adw_dialog_get_default_widget; ///
  GtkWidget* function(AdwDialog* self) c_adw_dialog_get_focus; ///
  gboolean function(AdwDialog* self) c_adw_dialog_get_follows_content_size; ///
  AdwDialogPresentationMode function(AdwDialog* self) c_adw_dialog_get_presentation_mode; ///
  const(char)* function(AdwDialog* self) c_adw_dialog_get_title; ///
  void function(AdwDialog* self, GtkWidget* parent) c_adw_dialog_present; ///
  void function(AdwDialog* self, gboolean canClose) c_adw_dialog_set_can_close; ///
  void function(AdwDialog* self, GtkWidget* child) c_adw_dialog_set_child; ///
  void function(AdwDialog* self, int contentHeight) c_adw_dialog_set_content_height; ///
  void function(AdwDialog* self, int contentWidth) c_adw_dialog_set_content_width; ///
  void function(AdwDialog* self, GtkWidget* defaultWidget) c_adw_dialog_set_default_widget; ///
  void function(AdwDialog* self, GtkWidget* focus) c_adw_dialog_set_focus; ///
  void function(AdwDialog* self, gboolean followsContentSize) c_adw_dialog_set_follows_content_size; ///
  void function(AdwDialog* self, AdwDialogPresentationMode presentationMode) c_adw_dialog_set_presentation_mode; ///
  void function(AdwDialog* self, const(char)* title) c_adw_dialog_set_title; ///

  // EntryRow
  GType function() c_adw_entry_row_get_type; ///
  GtkWidget* function() c_adw_entry_row_new; ///
  void function(AdwEntryRow* self, GtkWidget* widget) c_adw_entry_row_add_prefix; ///
  void function(AdwEntryRow* self, GtkWidget* widget) c_adw_entry_row_add_suffix; ///
  gboolean function(AdwEntryRow* self) c_adw_entry_row_get_activates_default; ///
  PangoAttrList* function(AdwEntryRow* self) c_adw_entry_row_get_attributes; ///
  gboolean function(AdwEntryRow* self) c_adw_entry_row_get_enable_emoji_completion; ///
  GtkInputHints function(AdwEntryRow* self) c_adw_entry_row_get_input_hints; ///
  GtkInputPurpose function(AdwEntryRow* self) c_adw_entry_row_get_input_purpose; ///
  gboolean function(AdwEntryRow* self) c_adw_entry_row_get_show_apply_button; ///
  uint function(AdwEntryRow* self) c_adw_entry_row_get_text_length; ///
  gboolean function(AdwEntryRow* self) c_adw_entry_row_grab_focus_without_selecting; ///
  void function(AdwEntryRow* self, GtkWidget* widget) c_adw_entry_row_remove; ///
  void function(AdwEntryRow* self, gboolean activates) c_adw_entry_row_set_activates_default; ///
  void function(AdwEntryRow* self, PangoAttrList* attributes) c_adw_entry_row_set_attributes; ///
  void function(AdwEntryRow* self, gboolean enableEmojiCompletion) c_adw_entry_row_set_enable_emoji_completion; ///
  void function(AdwEntryRow* self, GtkInputHints hints) c_adw_entry_row_set_input_hints; ///
  void function(AdwEntryRow* self, GtkInputPurpose purpose) c_adw_entry_row_set_input_purpose; ///
  void function(AdwEntryRow* self, gboolean showApplyButton) c_adw_entry_row_set_show_apply_button; ///

  // EnumListItem
  GType function() c_adw_enum_list_item_get_type; ///
  const(char)* function(AdwEnumListItem* self) c_adw_enum_list_item_get_name; ///
  const(char)* function(AdwEnumListItem* self) c_adw_enum_list_item_get_nick; ///
  int function(AdwEnumListItem* self) c_adw_enum_list_item_get_value; ///

  // EnumListModel
  GType function() c_adw_enum_list_model_get_type; ///
  AdwEnumListModel* function(GType enumType) c_adw_enum_list_model_new; ///
  uint function(AdwEnumListModel* self, int value) c_adw_enum_list_model_find_position; ///
  GType function(AdwEnumListModel* self) c_adw_enum_list_model_get_enum_type; ///

  // ExpanderRow
  GType function() c_adw_expander_row_get_type; ///
  GtkWidget* function() c_adw_expander_row_new; ///
  void function(AdwExpanderRow* self, GtkWidget* widget) c_adw_expander_row_add_action; ///
  void function(AdwExpanderRow* self, GtkWidget* widget) c_adw_expander_row_add_prefix; ///
  void function(AdwExpanderRow* self, GtkWidget* child) c_adw_expander_row_add_row; ///
  void function(AdwExpanderRow* self, GtkWidget* widget) c_adw_expander_row_add_suffix; ///
  gboolean function(AdwExpanderRow* self) c_adw_expander_row_get_enable_expansion; ///
  gboolean function(AdwExpanderRow* self) c_adw_expander_row_get_expanded; ///
  const(char)* function(AdwExpanderRow* self) c_adw_expander_row_get_icon_name; ///
  gboolean function(AdwExpanderRow* self) c_adw_expander_row_get_show_enable_switch; ///
  const(char)* function(AdwExpanderRow* self) c_adw_expander_row_get_subtitle; ///
  int function(AdwExpanderRow* self) c_adw_expander_row_get_subtitle_lines; ///
  int function(AdwExpanderRow* self) c_adw_expander_row_get_title_lines; ///
  void function(AdwExpanderRow* self, GtkWidget* child) c_adw_expander_row_remove; ///
  void function(AdwExpanderRow* self, gboolean enableExpansion) c_adw_expander_row_set_enable_expansion; ///
  void function(AdwExpanderRow* self, gboolean expanded) c_adw_expander_row_set_expanded; ///
  void function(AdwExpanderRow* self, const(char)* iconName) c_adw_expander_row_set_icon_name; ///
  void function(AdwExpanderRow* self, gboolean showEnableSwitch) c_adw_expander_row_set_show_enable_switch; ///
  void function(AdwExpanderRow* self, const(char)* subtitle) c_adw_expander_row_set_subtitle; ///
  void function(AdwExpanderRow* self, int subtitleLines) c_adw_expander_row_set_subtitle_lines; ///
  void function(AdwExpanderRow* self, int titleLines) c_adw_expander_row_set_title_lines; ///

  // Flap
  GType function() c_adw_flap_get_type; ///
  GtkWidget* function() c_adw_flap_new; ///
  GtkWidget* function(AdwFlap* self) c_adw_flap_get_content; ///
  GtkWidget* function(AdwFlap* self) c_adw_flap_get_flap; ///
  GtkPackType function(AdwFlap* self) c_adw_flap_get_flap_position; ///
  uint function(AdwFlap* self) c_adw_flap_get_fold_duration; ///
  AdwFlapFoldPolicy function(AdwFlap* self) c_adw_flap_get_fold_policy; ///
  AdwFoldThresholdPolicy function(AdwFlap* self) c_adw_flap_get_fold_threshold_policy; ///
  gboolean function(AdwFlap* self) c_adw_flap_get_folded; ///
  gboolean function(AdwFlap* self) c_adw_flap_get_locked; ///
  gboolean function(AdwFlap* self) c_adw_flap_get_modal; ///
  gboolean function(AdwFlap* self) c_adw_flap_get_reveal_flap; ///
  AdwSpringParams* function(AdwFlap* self) c_adw_flap_get_reveal_params; ///
  double function(AdwFlap* self) c_adw_flap_get_reveal_progress; ///
  GtkWidget* function(AdwFlap* self) c_adw_flap_get_separator; ///
  gboolean function(AdwFlap* self) c_adw_flap_get_swipe_to_close; ///
  gboolean function(AdwFlap* self) c_adw_flap_get_swipe_to_open; ///
  AdwFlapTransitionType function(AdwFlap* self) c_adw_flap_get_transition_type; ///
  void function(AdwFlap* self, GtkWidget* content) c_adw_flap_set_content; ///
  void function(AdwFlap* self, GtkWidget* flap) c_adw_flap_set_flap; ///
  void function(AdwFlap* self, GtkPackType position) c_adw_flap_set_flap_position; ///
  void function(AdwFlap* self, uint duration) c_adw_flap_set_fold_duration; ///
  void function(AdwFlap* self, AdwFlapFoldPolicy policy) c_adw_flap_set_fold_policy; ///
  void function(AdwFlap* self, AdwFoldThresholdPolicy policy) c_adw_flap_set_fold_threshold_policy; ///
  void function(AdwFlap* self, gboolean locked) c_adw_flap_set_locked; ///
  void function(AdwFlap* self, gboolean modal) c_adw_flap_set_modal; ///
  void function(AdwFlap* self, gboolean revealFlap) c_adw_flap_set_reveal_flap; ///
  void function(AdwFlap* self, AdwSpringParams* params) c_adw_flap_set_reveal_params; ///
  void function(AdwFlap* self, GtkWidget* separator) c_adw_flap_set_separator; ///
  void function(AdwFlap* self, gboolean swipeToClose) c_adw_flap_set_swipe_to_close; ///
  void function(AdwFlap* self, gboolean swipeToOpen) c_adw_flap_set_swipe_to_open; ///
  void function(AdwFlap* self, AdwFlapTransitionType transitionType) c_adw_flap_set_transition_type; ///

  // HeaderBar
  GType function() c_adw_header_bar_get_type; ///
  GtkWidget* function() c_adw_header_bar_new; ///
  AdwCenteringPolicy function(AdwHeaderBar* self) c_adw_header_bar_get_centering_policy; ///
  const(char)* function(AdwHeaderBar* self) c_adw_header_bar_get_decoration_layout; ///
  gboolean function(AdwHeaderBar* self) c_adw_header_bar_get_show_back_button; ///
  gboolean function(AdwHeaderBar* self) c_adw_header_bar_get_show_end_title_buttons; ///
  gboolean function(AdwHeaderBar* self) c_adw_header_bar_get_show_start_title_buttons; ///
  gboolean function(AdwHeaderBar* self) c_adw_header_bar_get_show_title; ///
  GtkWidget* function(AdwHeaderBar* self) c_adw_header_bar_get_title_widget; ///
  void function(AdwHeaderBar* self, GtkWidget* child) c_adw_header_bar_pack_end; ///
  void function(AdwHeaderBar* self, GtkWidget* child) c_adw_header_bar_pack_start; ///
  void function(AdwHeaderBar* self, GtkWidget* child) c_adw_header_bar_remove; ///
  void function(AdwHeaderBar* self, AdwCenteringPolicy centeringPolicy) c_adw_header_bar_set_centering_policy; ///
  void function(AdwHeaderBar* self, const(char)* layout) c_adw_header_bar_set_decoration_layout; ///
  void function(AdwHeaderBar* self, gboolean showBackButton) c_adw_header_bar_set_show_back_button; ///
  void function(AdwHeaderBar* self, gboolean setting) c_adw_header_bar_set_show_end_title_buttons; ///
  void function(AdwHeaderBar* self, gboolean setting) c_adw_header_bar_set_show_start_title_buttons; ///
  void function(AdwHeaderBar* self, gboolean showTitle) c_adw_header_bar_set_show_title; ///
  void function(AdwHeaderBar* self, GtkWidget* titleWidget) c_adw_header_bar_set_title_widget; ///

  // Leaflet
  GType function() c_adw_leaflet_get_type; ///
  GtkWidget* function() c_adw_leaflet_new; ///
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_append; ///
  GtkWidget* function(AdwLeaflet* self, AdwNavigationDirection direction) c_adw_leaflet_get_adjacent_child; ///
  gboolean function(AdwLeaflet* self) c_adw_leaflet_get_can_navigate_back; ///
  gboolean function(AdwLeaflet* self) c_adw_leaflet_get_can_navigate_forward; ///
  gboolean function(AdwLeaflet* self) c_adw_leaflet_get_can_unfold; ///
  GtkWidget* function(AdwLeaflet* self, const(char)* name) c_adw_leaflet_get_child_by_name; ///
  AdwSpringParams* function(AdwLeaflet* self) c_adw_leaflet_get_child_transition_params; ///
  gboolean function(AdwLeaflet* self) c_adw_leaflet_get_child_transition_running; ///
  AdwFoldThresholdPolicy function(AdwLeaflet* self) c_adw_leaflet_get_fold_threshold_policy; ///
  gboolean function(AdwLeaflet* self) c_adw_leaflet_get_folded; ///
  gboolean function(AdwLeaflet* self) c_adw_leaflet_get_homogeneous; ///
  uint function(AdwLeaflet* self) c_adw_leaflet_get_mode_transition_duration; ///
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_get_page; ///
  GtkSelectionModel* function(AdwLeaflet* self) c_adw_leaflet_get_pages; ///
  AdwLeafletTransitionType function(AdwLeaflet* self) c_adw_leaflet_get_transition_type; ///
  GtkWidget* function(AdwLeaflet* self) c_adw_leaflet_get_visible_child; ///
  const(char)* function(AdwLeaflet* self) c_adw_leaflet_get_visible_child_name; ///
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child, GtkWidget* sibling) c_adw_leaflet_insert_child_after; ///
  gboolean function(AdwLeaflet* self, AdwNavigationDirection direction) c_adw_leaflet_navigate; ///
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_prepend; ///
  void function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_remove; ///
  void function(AdwLeaflet* self, GtkWidget* child, GtkWidget* sibling) c_adw_leaflet_reorder_child_after; ///
  void function(AdwLeaflet* self, gboolean canNavigateBack) c_adw_leaflet_set_can_navigate_back; ///
  void function(AdwLeaflet* self, gboolean canNavigateForward) c_adw_leaflet_set_can_navigate_forward; ///
  void function(AdwLeaflet* self, gboolean canUnfold) c_adw_leaflet_set_can_unfold; ///
  void function(AdwLeaflet* self, AdwSpringParams* params) c_adw_leaflet_set_child_transition_params; ///
  void function(AdwLeaflet* self, AdwFoldThresholdPolicy policy) c_adw_leaflet_set_fold_threshold_policy; ///
  void function(AdwLeaflet* self, gboolean homogeneous) c_adw_leaflet_set_homogeneous; ///
  void function(AdwLeaflet* self, uint duration) c_adw_leaflet_set_mode_transition_duration; ///
  void function(AdwLeaflet* self, AdwLeafletTransitionType transition) c_adw_leaflet_set_transition_type; ///
  void function(AdwLeaflet* self, GtkWidget* visibleChild) c_adw_leaflet_set_visible_child; ///
  void function(AdwLeaflet* self, const(char)* name) c_adw_leaflet_set_visible_child_name; ///

  // LeafletPage
  GType function() c_adw_leaflet_page_get_type; ///
  GtkWidget* function(AdwLeafletPage* self) c_adw_leaflet_page_get_child; ///
  const(char)* function(AdwLeafletPage* self) c_adw_leaflet_page_get_name; ///
  gboolean function(AdwLeafletPage* self) c_adw_leaflet_page_get_navigatable; ///
  void function(AdwLeafletPage* self, const(char)* name) c_adw_leaflet_page_set_name; ///
  void function(AdwLeafletPage* self, gboolean navigatable) c_adw_leaflet_page_set_navigatable; ///

  // MessageDialog
  GType function() c_adw_message_dialog_get_type; ///
  GtkWidget* function(GtkWindow* parent, const(char)* heading, const(char)* body_) c_adw_message_dialog_new; ///
  void function(AdwMessageDialog* self, const(char)* id, const(char)* label) c_adw_message_dialog_add_response; ///
  void function(AdwMessageDialog* self, const(char)* firstId,  ...) c_adw_message_dialog_add_responses; ///
  void function(AdwMessageDialog* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_adw_message_dialog_choose; ///
  const(char)* function(AdwMessageDialog* self, GAsyncResult* result) c_adw_message_dialog_choose_finish; ///
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_body; ///
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_body_markup; ///
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_heading; ///
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_heading_markup; ///
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_body; ///
  gboolean function(AdwMessageDialog* self) c_adw_message_dialog_get_body_use_markup; ///
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_close_response; ///
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_default_response; ///
  GtkWidget* function(AdwMessageDialog* self) c_adw_message_dialog_get_extra_child; ///
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_heading; ///
  gboolean function(AdwMessageDialog* self) c_adw_message_dialog_get_heading_use_markup; ///
  AdwResponseAppearance function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_get_response_appearance; ///
  gboolean function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_get_response_enabled; ///
  const(char)* function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_get_response_label; ///
  gboolean function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_has_response; ///
  void function(AdwMessageDialog* self, const(char)* id) c_adw_message_dialog_remove_response; ///
  void function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_response; ///
  void function(AdwMessageDialog* self, const(char)* body_) c_adw_message_dialog_set_body; ///
  void function(AdwMessageDialog* self, gboolean useMarkup) c_adw_message_dialog_set_body_use_markup; ///
  void function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_set_close_response; ///
  void function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_set_default_response; ///
  void function(AdwMessageDialog* self, GtkWidget* child) c_adw_message_dialog_set_extra_child; ///
  void function(AdwMessageDialog* self, const(char)* heading) c_adw_message_dialog_set_heading; ///
  void function(AdwMessageDialog* self, gboolean useMarkup) c_adw_message_dialog_set_heading_use_markup; ///
  void function(AdwMessageDialog* self, const(char)* response, AdwResponseAppearance appearance) c_adw_message_dialog_set_response_appearance; ///
  void function(AdwMessageDialog* self, const(char)* response, gboolean enabled) c_adw_message_dialog_set_response_enabled; ///
  void function(AdwMessageDialog* self, const(char)* response, const(char)* label) c_adw_message_dialog_set_response_label; ///

  // NavigationPage
  GType function() c_adw_navigation_page_get_type; ///
  AdwNavigationPage* function(GtkWidget* child, const(char)* title) c_adw_navigation_page_new; ///
  AdwNavigationPage* function(GtkWidget* child, const(char)* title, const(char)* tag) c_adw_navigation_page_new_with_tag; ///
  gboolean function(AdwNavigationPage* self) c_adw_navigation_page_get_can_pop; ///
  GtkWidget* function(AdwNavigationPage* self) c_adw_navigation_page_get_child; ///
  const(char)* function(AdwNavigationPage* self) c_adw_navigation_page_get_tag; ///
  const(char)* function(AdwNavigationPage* self) c_adw_navigation_page_get_title; ///
  void function(AdwNavigationPage* self, gboolean canPop) c_adw_navigation_page_set_can_pop; ///
  void function(AdwNavigationPage* self, GtkWidget* child) c_adw_navigation_page_set_child; ///
  void function(AdwNavigationPage* self, const(char)* tag) c_adw_navigation_page_set_tag; ///
  void function(AdwNavigationPage* self, const(char)* title) c_adw_navigation_page_set_title; ///

  // NavigationSplitView
  GType function() c_adw_navigation_split_view_get_type; ///
  GtkWidget* function() c_adw_navigation_split_view_new; ///
  gboolean function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_collapsed; ///
  AdwNavigationPage* function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_content; ///
  double function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_max_sidebar_width; ///
  double function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_min_sidebar_width; ///
  gboolean function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_show_content; ///
  AdwNavigationPage* function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_sidebar; ///
  double function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_sidebar_width_fraction; ///
  AdwLengthUnit function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_sidebar_width_unit; ///
  void function(AdwNavigationSplitView* self, gboolean collapsed) c_adw_navigation_split_view_set_collapsed; ///
  void function(AdwNavigationSplitView* self, AdwNavigationPage* content) c_adw_navigation_split_view_set_content; ///
  void function(AdwNavigationSplitView* self, double width) c_adw_navigation_split_view_set_max_sidebar_width; ///
  void function(AdwNavigationSplitView* self, double width) c_adw_navigation_split_view_set_min_sidebar_width; ///
  void function(AdwNavigationSplitView* self, gboolean showContent) c_adw_navigation_split_view_set_show_content; ///
  void function(AdwNavigationSplitView* self, AdwNavigationPage* sidebar) c_adw_navigation_split_view_set_sidebar; ///
  void function(AdwNavigationSplitView* self, double fraction) c_adw_navigation_split_view_set_sidebar_width_fraction; ///
  void function(AdwNavigationSplitView* self, AdwLengthUnit unit) c_adw_navigation_split_view_set_sidebar_width_unit; ///

  // NavigationView
  GType function() c_adw_navigation_view_get_type; ///
  GtkWidget* function() c_adw_navigation_view_new; ///
  void function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_add; ///
  AdwNavigationPage* function(AdwNavigationView* self, const(char)* tag) c_adw_navigation_view_find_page; ///
  gboolean function(AdwNavigationView* self) c_adw_navigation_view_get_animate_transitions; ///
  GListModel* function(AdwNavigationView* self) c_adw_navigation_view_get_navigation_stack; ///
  gboolean function(AdwNavigationView* self) c_adw_navigation_view_get_pop_on_escape; ///
  AdwNavigationPage* function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_get_previous_page; ///
  AdwNavigationPage* function(AdwNavigationView* self) c_adw_navigation_view_get_visible_page; ///
  gboolean function(AdwNavigationView* self) c_adw_navigation_view_pop; ///
  gboolean function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_pop_to_page; ///
  gboolean function(AdwNavigationView* self, const(char)* tag) c_adw_navigation_view_pop_to_tag; ///
  void function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_push; ///
  void function(AdwNavigationView* self, const(char)* tag) c_adw_navigation_view_push_by_tag; ///
  void function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_remove; ///
  void function(AdwNavigationView* self, AdwNavigationPage** pages, int nPages) c_adw_navigation_view_replace; ///
  void function(AdwNavigationView* self, const(char*)* tags, int nTags) c_adw_navigation_view_replace_with_tags; ///
  void function(AdwNavigationView* self, gboolean animateTransitions) c_adw_navigation_view_set_animate_transitions; ///
  void function(AdwNavigationView* self, gboolean popOnEscape) c_adw_navigation_view_set_pop_on_escape; ///

  // OverlaySplitView
  GType function() c_adw_overlay_split_view_get_type; ///
  GtkWidget* function() c_adw_overlay_split_view_new; ///
  gboolean function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_collapsed; ///
  GtkWidget* function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_content; ///
  gboolean function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_enable_hide_gesture; ///
  gboolean function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_enable_show_gesture; ///
  double function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_max_sidebar_width; ///
  double function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_min_sidebar_width; ///
  gboolean function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_pin_sidebar; ///
  gboolean function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_show_sidebar; ///
  GtkWidget* function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar; ///
  GtkPackType function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar_position; ///
  double function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar_width_fraction; ///
  AdwLengthUnit function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar_width_unit; ///
  void function(AdwOverlaySplitView* self, gboolean collapsed) c_adw_overlay_split_view_set_collapsed; ///
  void function(AdwOverlaySplitView* self, GtkWidget* content) c_adw_overlay_split_view_set_content; ///
  void function(AdwOverlaySplitView* self, gboolean enableHideGesture) c_adw_overlay_split_view_set_enable_hide_gesture; ///
  void function(AdwOverlaySplitView* self, gboolean enableShowGesture) c_adw_overlay_split_view_set_enable_show_gesture; ///
  void function(AdwOverlaySplitView* self, double width) c_adw_overlay_split_view_set_max_sidebar_width; ///
  void function(AdwOverlaySplitView* self, double width) c_adw_overlay_split_view_set_min_sidebar_width; ///
  void function(AdwOverlaySplitView* self, gboolean pinSidebar) c_adw_overlay_split_view_set_pin_sidebar; ///
  void function(AdwOverlaySplitView* self, gboolean showSidebar) c_adw_overlay_split_view_set_show_sidebar; ///
  void function(AdwOverlaySplitView* self, GtkWidget* sidebar) c_adw_overlay_split_view_set_sidebar; ///
  void function(AdwOverlaySplitView* self, GtkPackType position) c_adw_overlay_split_view_set_sidebar_position; ///
  void function(AdwOverlaySplitView* self, double fraction) c_adw_overlay_split_view_set_sidebar_width_fraction; ///
  void function(AdwOverlaySplitView* self, AdwLengthUnit unit) c_adw_overlay_split_view_set_sidebar_width_unit; ///

  // PasswordEntryRow
  GType function() c_adw_password_entry_row_get_type; ///
  GtkWidget* function() c_adw_password_entry_row_new; ///

  // PreferencesDialog
  GType function() c_adw_preferences_dialog_get_type; ///
  AdwDialog* function() c_adw_preferences_dialog_new; ///
  void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) c_adw_preferences_dialog_add; ///
  void function(AdwPreferencesDialog* self, AdwToast* toast) c_adw_preferences_dialog_add_toast; ///
  gboolean function(AdwPreferencesDialog* self) c_adw_preferences_dialog_get_search_enabled; ///
  AdwPreferencesPage* function(AdwPreferencesDialog* self) c_adw_preferences_dialog_get_visible_page; ///
  const(char)* function(AdwPreferencesDialog* self) c_adw_preferences_dialog_get_visible_page_name; ///
  gboolean function(AdwPreferencesDialog* self) c_adw_preferences_dialog_pop_subpage; ///
  void function(AdwPreferencesDialog* self, AdwNavigationPage* page) c_adw_preferences_dialog_push_subpage; ///
  void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) c_adw_preferences_dialog_remove; ///
  void function(AdwPreferencesDialog* self, gboolean searchEnabled) c_adw_preferences_dialog_set_search_enabled; ///
  void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) c_adw_preferences_dialog_set_visible_page; ///
  void function(AdwPreferencesDialog* self, const(char)* name) c_adw_preferences_dialog_set_visible_page_name; ///

  // PreferencesGroup
  GType function() c_adw_preferences_group_get_type; ///
  GtkWidget* function() c_adw_preferences_group_new; ///
  void function(AdwPreferencesGroup* self, GtkWidget* child) c_adw_preferences_group_add; ///
  const(char)* function(AdwPreferencesGroup* self) c_adw_preferences_group_get_description; ///
  GtkWidget* function(AdwPreferencesGroup* self) c_adw_preferences_group_get_header_suffix; ///
  const(char)* function(AdwPreferencesGroup* self) c_adw_preferences_group_get_title; ///
  void function(AdwPreferencesGroup* self, GtkWidget* child) c_adw_preferences_group_remove; ///
  void function(AdwPreferencesGroup* self, const(char)* description) c_adw_preferences_group_set_description; ///
  void function(AdwPreferencesGroup* self, GtkWidget* suffix) c_adw_preferences_group_set_header_suffix; ///
  void function(AdwPreferencesGroup* self, const(char)* title) c_adw_preferences_group_set_title; ///

  // PreferencesPage
  GType function() c_adw_preferences_page_get_type; ///
  GtkWidget* function() c_adw_preferences_page_new; ///
  void function(AdwPreferencesPage* self, AdwPreferencesGroup* group) c_adw_preferences_page_add; ///
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_description; ///
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_icon_name; ///
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_name; ///
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_title; ///
  gboolean function(AdwPreferencesPage* self) c_adw_preferences_page_get_use_underline; ///
  void function(AdwPreferencesPage* self, AdwPreferencesGroup* group) c_adw_preferences_page_remove; ///
  void function(AdwPreferencesPage* self) c_adw_preferences_page_scroll_to_top; ///
  void function(AdwPreferencesPage* self, const(char)* description) c_adw_preferences_page_set_description; ///
  void function(AdwPreferencesPage* self, const(char)* iconName) c_adw_preferences_page_set_icon_name; ///
  void function(AdwPreferencesPage* self, const(char)* name) c_adw_preferences_page_set_name; ///
  void function(AdwPreferencesPage* self, const(char)* title) c_adw_preferences_page_set_title; ///
  void function(AdwPreferencesPage* self, gboolean useUnderline) c_adw_preferences_page_set_use_underline; ///

  // PreferencesRow
  GType function() c_adw_preferences_row_get_type; ///
  GtkWidget* function() c_adw_preferences_row_new; ///
  const(char)* function(AdwPreferencesRow* self) c_adw_preferences_row_get_title; ///
  gboolean function(AdwPreferencesRow* self) c_adw_preferences_row_get_title_selectable; ///
  gboolean function(AdwPreferencesRow* self) c_adw_preferences_row_get_use_markup; ///
  gboolean function(AdwPreferencesRow* self) c_adw_preferences_row_get_use_underline; ///
  void function(AdwPreferencesRow* self, const(char)* title) c_adw_preferences_row_set_title; ///
  void function(AdwPreferencesRow* self, gboolean titleSelectable) c_adw_preferences_row_set_title_selectable; ///
  void function(AdwPreferencesRow* self, gboolean useMarkup) c_adw_preferences_row_set_use_markup; ///
  void function(AdwPreferencesRow* self, gboolean useUnderline) c_adw_preferences_row_set_use_underline; ///

  // PreferencesWindow
  GType function() c_adw_preferences_window_get_type; ///
  GtkWidget* function() c_adw_preferences_window_new; ///
  void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) c_adw_preferences_window_add; ///
  void function(AdwPreferencesWindow* self, AdwToast* toast) c_adw_preferences_window_add_toast; ///
  void function(AdwPreferencesWindow* self) c_adw_preferences_window_close_subpage; ///
  gboolean function(AdwPreferencesWindow* self) c_adw_preferences_window_get_can_navigate_back; ///
  gboolean function(AdwPreferencesWindow* self) c_adw_preferences_window_get_search_enabled; ///
  AdwPreferencesPage* function(AdwPreferencesWindow* self) c_adw_preferences_window_get_visible_page; ///
  const(char)* function(AdwPreferencesWindow* self) c_adw_preferences_window_get_visible_page_name; ///
  gboolean function(AdwPreferencesWindow* self) c_adw_preferences_window_pop_subpage; ///
  void function(AdwPreferencesWindow* self, GtkWidget* subpage) c_adw_preferences_window_present_subpage; ///
  void function(AdwPreferencesWindow* self, AdwNavigationPage* page) c_adw_preferences_window_push_subpage; ///
  void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) c_adw_preferences_window_remove; ///
  void function(AdwPreferencesWindow* self, gboolean canNavigateBack) c_adw_preferences_window_set_can_navigate_back; ///
  void function(AdwPreferencesWindow* self, gboolean searchEnabled) c_adw_preferences_window_set_search_enabled; ///
  void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) c_adw_preferences_window_set_visible_page; ///
  void function(AdwPreferencesWindow* self, const(char)* name) c_adw_preferences_window_set_visible_page_name; ///

  // PropertyAnimationTarget
  GType function() c_adw_property_animation_target_get_type; ///
  AdwAnimationTarget* function(GObject* object, const(char)* propertyName) c_adw_property_animation_target_new; ///
  AdwAnimationTarget* function(GObject* object, GParamSpec* pspec) c_adw_property_animation_target_new_for_pspec; ///
  GObject* function(AdwPropertyAnimationTarget* self) c_adw_property_animation_target_get_object; ///
  GParamSpec* function(AdwPropertyAnimationTarget* self) c_adw_property_animation_target_get_pspec; ///

  // SpinRow
  GType function() c_adw_spin_row_get_type; ///
  GtkWidget* function(GtkAdjustment* adjustment, double climbRate, uint digits) c_adw_spin_row_new; ///
  GtkWidget* function(double min, double max, double step) c_adw_spin_row_new_with_range; ///
  void function(AdwSpinRow* self, GtkAdjustment* adjustment, double climbRate, uint digits) c_adw_spin_row_configure; ///
  GtkAdjustment* function(AdwSpinRow* self) c_adw_spin_row_get_adjustment; ///
  double function(AdwSpinRow* self) c_adw_spin_row_get_climb_rate; ///
  uint function(AdwSpinRow* self) c_adw_spin_row_get_digits; ///
  gboolean function(AdwSpinRow* self) c_adw_spin_row_get_numeric; ///
  gboolean function(AdwSpinRow* self) c_adw_spin_row_get_snap_to_ticks; ///
  GtkSpinButtonUpdatePolicy function(AdwSpinRow* self) c_adw_spin_row_get_update_policy; ///
  double function(AdwSpinRow* self) c_adw_spin_row_get_value; ///
  gboolean function(AdwSpinRow* self) c_adw_spin_row_get_wrap; ///
  void function(AdwSpinRow* self, GtkAdjustment* adjustment) c_adw_spin_row_set_adjustment; ///
  void function(AdwSpinRow* self, double climbRate) c_adw_spin_row_set_climb_rate; ///
  void function(AdwSpinRow* self, uint digits) c_adw_spin_row_set_digits; ///
  void function(AdwSpinRow* self, gboolean numeric) c_adw_spin_row_set_numeric; ///
  void function(AdwSpinRow* self, double min, double max) c_adw_spin_row_set_range; ///
  void function(AdwSpinRow* self, gboolean snapToTicks) c_adw_spin_row_set_snap_to_ticks; ///
  void function(AdwSpinRow* self, GtkSpinButtonUpdatePolicy policy) c_adw_spin_row_set_update_policy; ///
  void function(AdwSpinRow* self, double value) c_adw_spin_row_set_value; ///
  void function(AdwSpinRow* self, gboolean wrap) c_adw_spin_row_set_wrap; ///
  void function(AdwSpinRow* self) c_adw_spin_row_update; ///

  // SplitButton
  GType function() c_adw_split_button_get_type; ///
  GtkWidget* function() c_adw_split_button_new; ///
  gboolean function(AdwSplitButton* self) c_adw_split_button_get_can_shrink; ///
  GtkWidget* function(AdwSplitButton* self) c_adw_split_button_get_child; ///
  GtkArrowType function(AdwSplitButton* self) c_adw_split_button_get_direction; ///
  const(char)* function(AdwSplitButton* self) c_adw_split_button_get_dropdown_tooltip; ///
  const(char)* function(AdwSplitButton* self) c_adw_split_button_get_icon_name; ///
  const(char)* function(AdwSplitButton* self) c_adw_split_button_get_label; ///
  GMenuModel* function(AdwSplitButton* self) c_adw_split_button_get_menu_model; ///
  GtkPopover* function(AdwSplitButton* self) c_adw_split_button_get_popover; ///
  gboolean function(AdwSplitButton* self) c_adw_split_button_get_use_underline; ///
  void function(AdwSplitButton* self) c_adw_split_button_popdown; ///
  void function(AdwSplitButton* self) c_adw_split_button_popup; ///
  void function(AdwSplitButton* self, gboolean canShrink) c_adw_split_button_set_can_shrink; ///
  void function(AdwSplitButton* self, GtkWidget* child) c_adw_split_button_set_child; ///
  void function(AdwSplitButton* self, GtkArrowType direction) c_adw_split_button_set_direction; ///
  void function(AdwSplitButton* self, const(char)* tooltip) c_adw_split_button_set_dropdown_tooltip; ///
  void function(AdwSplitButton* self, const(char)* iconName) c_adw_split_button_set_icon_name; ///
  void function(AdwSplitButton* self, const(char)* label) c_adw_split_button_set_label; ///
  void function(AdwSplitButton* self, GMenuModel* menuModel) c_adw_split_button_set_menu_model; ///
  void function(AdwSplitButton* self, GtkPopover* popover) c_adw_split_button_set_popover; ///
  void function(AdwSplitButton* self, gboolean useUnderline) c_adw_split_button_set_use_underline; ///

  // SpringAnimation
  GType function() c_adw_spring_animation_get_type; ///
  AdwAnimation* function(GtkWidget* widget, double from, double to, AdwSpringParams* springParams, AdwAnimationTarget* target) c_adw_spring_animation_new; ///
  double function(AdwSpringAnimation* self, uint time) c_adw_spring_animation_calculate_value; ///
  double function(AdwSpringAnimation* self, uint time) c_adw_spring_animation_calculate_velocity; ///
  gboolean function(AdwSpringAnimation* self) c_adw_spring_animation_get_clamp; ///
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_epsilon; ///
  uint function(AdwSpringAnimation* self) c_adw_spring_animation_get_estimated_duration; ///
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_initial_velocity; ///
  AdwSpringParams* function(AdwSpringAnimation* self) c_adw_spring_animation_get_spring_params; ///
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_value_from; ///
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_value_to; ///
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_velocity; ///
  void function(AdwSpringAnimation* self, gboolean clamp) c_adw_spring_animation_set_clamp; ///
  void function(AdwSpringAnimation* self, double epsilon) c_adw_spring_animation_set_epsilon; ///
  void function(AdwSpringAnimation* self, double velocity) c_adw_spring_animation_set_initial_velocity; ///
  void function(AdwSpringAnimation* self, AdwSpringParams* springParams) c_adw_spring_animation_set_spring_params; ///
  void function(AdwSpringAnimation* self, double value) c_adw_spring_animation_set_value_from; ///
  void function(AdwSpringAnimation* self, double value) c_adw_spring_animation_set_value_to; ///

  // SpringParams
  GType function() c_adw_spring_params_get_type; ///
  AdwSpringParams* function(double dampingRatio, double mass, double stiffness) c_adw_spring_params_new; ///
  AdwSpringParams* function(double damping, double mass, double stiffness) c_adw_spring_params_new_full; ///
  double function(AdwSpringParams* self) c_adw_spring_params_get_damping; ///
  double function(AdwSpringParams* self) c_adw_spring_params_get_damping_ratio; ///
  double function(AdwSpringParams* self) c_adw_spring_params_get_mass; ///
  double function(AdwSpringParams* self) c_adw_spring_params_get_stiffness; ///
  AdwSpringParams* function(AdwSpringParams* self) c_adw_spring_params_ref; ///
  void function(AdwSpringParams* self) c_adw_spring_params_unref; ///

  // Squeezer
  GType function() c_adw_squeezer_get_type; ///
  GtkWidget* function() c_adw_squeezer_new; ///
  AdwSqueezerPage* function(AdwSqueezer* self, GtkWidget* child) c_adw_squeezer_add; ///
  gboolean function(AdwSqueezer* self) c_adw_squeezer_get_allow_none; ///
  gboolean function(AdwSqueezer* self) c_adw_squeezer_get_homogeneous; ///
  gboolean function(AdwSqueezer* self) c_adw_squeezer_get_interpolate_size; ///
  AdwSqueezerPage* function(AdwSqueezer* self, GtkWidget* child) c_adw_squeezer_get_page; ///
  GtkSelectionModel* function(AdwSqueezer* self) c_adw_squeezer_get_pages; ///
  AdwFoldThresholdPolicy function(AdwSqueezer* self) c_adw_squeezer_get_switch_threshold_policy; ///
  uint function(AdwSqueezer* self) c_adw_squeezer_get_transition_duration; ///
  gboolean function(AdwSqueezer* self) c_adw_squeezer_get_transition_running; ///
  AdwSqueezerTransitionType function(AdwSqueezer* self) c_adw_squeezer_get_transition_type; ///
  GtkWidget* function(AdwSqueezer* self) c_adw_squeezer_get_visible_child; ///
  float function(AdwSqueezer* self) c_adw_squeezer_get_xalign; ///
  float function(AdwSqueezer* self) c_adw_squeezer_get_yalign; ///
  void function(AdwSqueezer* self, GtkWidget* child) c_adw_squeezer_remove; ///
  void function(AdwSqueezer* self, gboolean allowNone) c_adw_squeezer_set_allow_none; ///
  void function(AdwSqueezer* self, gboolean homogeneous) c_adw_squeezer_set_homogeneous; ///
  void function(AdwSqueezer* self, gboolean interpolateSize) c_adw_squeezer_set_interpolate_size; ///
  void function(AdwSqueezer* self, AdwFoldThresholdPolicy policy) c_adw_squeezer_set_switch_threshold_policy; ///
  void function(AdwSqueezer* self, uint duration) c_adw_squeezer_set_transition_duration; ///
  void function(AdwSqueezer* self, AdwSqueezerTransitionType transition) c_adw_squeezer_set_transition_type; ///
  void function(AdwSqueezer* self, float xalign) c_adw_squeezer_set_xalign; ///
  void function(AdwSqueezer* self, float yalign) c_adw_squeezer_set_yalign; ///

  // SqueezerPage
  GType function() c_adw_squeezer_page_get_type; ///
  GtkWidget* function(AdwSqueezerPage* self) c_adw_squeezer_page_get_child; ///
  gboolean function(AdwSqueezerPage* self) c_adw_squeezer_page_get_enabled; ///
  void function(AdwSqueezerPage* self, gboolean enabled) c_adw_squeezer_page_set_enabled; ///

  // StatusPage
  GType function() c_adw_status_page_get_type; ///
  GtkWidget* function() c_adw_status_page_new; ///
  GtkWidget* function(AdwStatusPage* self) c_adw_status_page_get_child; ///
  const(char)* function(AdwStatusPage* self) c_adw_status_page_get_description; ///
  const(char)* function(AdwStatusPage* self) c_adw_status_page_get_icon_name; ///
  GdkPaintable* function(AdwStatusPage* self) c_adw_status_page_get_paintable; ///
  const(char)* function(AdwStatusPage* self) c_adw_status_page_get_title; ///
  void function(AdwStatusPage* self, GtkWidget* child) c_adw_status_page_set_child; ///
  void function(AdwStatusPage* self, const(char)* description) c_adw_status_page_set_description; ///
  void function(AdwStatusPage* self, const(char)* iconName) c_adw_status_page_set_icon_name; ///
  void function(AdwStatusPage* self, GdkPaintable* paintable) c_adw_status_page_set_paintable; ///
  void function(AdwStatusPage* self, const(char)* title) c_adw_status_page_set_title; ///

  // StyleManager
  GType function() c_adw_style_manager_get_type; ///
  AdwStyleManager* function() c_adw_style_manager_get_default; ///
  AdwStyleManager* function(GdkDisplay* display) c_adw_style_manager_get_for_display; ///
  AdwColorScheme function(AdwStyleManager* self) c_adw_style_manager_get_color_scheme; ///
  gboolean function(AdwStyleManager* self) c_adw_style_manager_get_dark; ///
  GdkDisplay* function(AdwStyleManager* self) c_adw_style_manager_get_display; ///
  gboolean function(AdwStyleManager* self) c_adw_style_manager_get_high_contrast; ///
  gboolean function(AdwStyleManager* self) c_adw_style_manager_get_system_supports_color_schemes; ///
  void function(AdwStyleManager* self, AdwColorScheme colorScheme) c_adw_style_manager_set_color_scheme; ///

  // SwipeTracker
  GType function() c_adw_swipe_tracker_get_type; ///
  AdwSwipeTracker* function(AdwSwipeable* swipeable) c_adw_swipe_tracker_new; ///
  gboolean function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_allow_long_swipes; ///
  gboolean function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_allow_mouse_drag; ///
  gboolean function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_allow_window_handle; ///
  gboolean function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_enabled; ///
  gboolean function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_lower_overshoot; ///
  gboolean function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_reversed; ///
  AdwSwipeable* function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_swipeable; ///
  gboolean function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_upper_overshoot; ///
  void function(AdwSwipeTracker* self, gboolean allowLongSwipes) c_adw_swipe_tracker_set_allow_long_swipes; ///
  void function(AdwSwipeTracker* self, gboolean allowMouseDrag) c_adw_swipe_tracker_set_allow_mouse_drag; ///
  void function(AdwSwipeTracker* self, gboolean allowWindowHandle) c_adw_swipe_tracker_set_allow_window_handle; ///
  void function(AdwSwipeTracker* self, gboolean enabled) c_adw_swipe_tracker_set_enabled; ///
  void function(AdwSwipeTracker* self, gboolean overshoot) c_adw_swipe_tracker_set_lower_overshoot; ///
  void function(AdwSwipeTracker* self, gboolean reversed) c_adw_swipe_tracker_set_reversed; ///
  void function(AdwSwipeTracker* self, gboolean overshoot) c_adw_swipe_tracker_set_upper_overshoot; ///
  void function(AdwSwipeTracker* self, double delta) c_adw_swipe_tracker_shift_position; ///

  // Swipeable
  GType function() c_adw_swipeable_get_type; ///
  double function(AdwSwipeable* self) c_adw_swipeable_get_cancel_progress; ///
  double function(AdwSwipeable* self) c_adw_swipeable_get_distance; ///
  double function(AdwSwipeable* self) c_adw_swipeable_get_progress; ///
  double* function(AdwSwipeable* self, int* nSnapPoints) c_adw_swipeable_get_snap_points; ///
  void function(AdwSwipeable* self, AdwNavigationDirection navigationDirection, gboolean isDrag, GdkRectangle* rect) c_adw_swipeable_get_swipe_area; ///

  // SwitchRow
  GType function() c_adw_switch_row_get_type; ///
  GtkWidget* function() c_adw_switch_row_new; ///
  gboolean function(AdwSwitchRow* self) c_adw_switch_row_get_active; ///
  void function(AdwSwitchRow* self, gboolean isActive) c_adw_switch_row_set_active; ///

  // TabBar
  GType function() c_adw_tab_bar_get_type; ///
  AdwTabBar* function() c_adw_tab_bar_new; ///
  gboolean function(AdwTabBar* self) c_adw_tab_bar_get_autohide; ///
  GtkWidget* function(AdwTabBar* self) c_adw_tab_bar_get_end_action_widget; ///
  gboolean function(AdwTabBar* self) c_adw_tab_bar_get_expand_tabs; ///
  GdkDragAction function(AdwTabBar* self) c_adw_tab_bar_get_extra_drag_preferred_action; ///
  gboolean function(AdwTabBar* self) c_adw_tab_bar_get_extra_drag_preload; ///
  gboolean function(AdwTabBar* self) c_adw_tab_bar_get_inverted; ///
  gboolean function(AdwTabBar* self) c_adw_tab_bar_get_is_overflowing; ///
  GtkWidget* function(AdwTabBar* self) c_adw_tab_bar_get_start_action_widget; ///
  gboolean function(AdwTabBar* self) c_adw_tab_bar_get_tabs_revealed; ///
  AdwTabView* function(AdwTabBar* self) c_adw_tab_bar_get_view; ///
  void function(AdwTabBar* self, gboolean autohide) c_adw_tab_bar_set_autohide; ///
  void function(AdwTabBar* self, GtkWidget* widget) c_adw_tab_bar_set_end_action_widget; ///
  void function(AdwTabBar* self, gboolean expandTabs) c_adw_tab_bar_set_expand_tabs; ///
  void function(AdwTabBar* self, gboolean preload) c_adw_tab_bar_set_extra_drag_preload; ///
  void function(AdwTabBar* self, gboolean inverted) c_adw_tab_bar_set_inverted; ///
  void function(AdwTabBar* self, GtkWidget* widget) c_adw_tab_bar_set_start_action_widget; ///
  void function(AdwTabBar* self, AdwTabView* view) c_adw_tab_bar_set_view; ///
  void function(AdwTabBar* self, GdkDragAction actions, GType* types, size_t nTypes) c_adw_tab_bar_setup_extra_drop_target; ///

  // TabButton
  GType function() c_adw_tab_button_get_type; ///
  GtkWidget* function() c_adw_tab_button_new; ///
  AdwTabView* function(AdwTabButton* self) c_adw_tab_button_get_view; ///
  void function(AdwTabButton* self, AdwTabView* view) c_adw_tab_button_set_view; ///

  // TabOverview
  GType function() c_adw_tab_overview_get_type; ///
  GtkWidget* function() c_adw_tab_overview_new; ///
  GtkWidget* function(AdwTabOverview* self) c_adw_tab_overview_get_child; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_enable_new_tab; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_enable_search; ///
  GdkDragAction function(AdwTabOverview* self) c_adw_tab_overview_get_extra_drag_preferred_action; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_extra_drag_preload; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_inverted; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_open; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_search_active; ///
  GMenuModel* function(AdwTabOverview* self) c_adw_tab_overview_get_secondary_menu; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_show_end_title_buttons; ///
  gboolean function(AdwTabOverview* self) c_adw_tab_overview_get_show_start_title_buttons; ///
  AdwTabView* function(AdwTabOverview* self) c_adw_tab_overview_get_view; ///
  void function(AdwTabOverview* self, GtkWidget* child) c_adw_tab_overview_set_child; ///
  void function(AdwTabOverview* self, gboolean enableNewTab) c_adw_tab_overview_set_enable_new_tab; ///
  void function(AdwTabOverview* self, gboolean enableSearch) c_adw_tab_overview_set_enable_search; ///
  void function(AdwTabOverview* self, gboolean preload) c_adw_tab_overview_set_extra_drag_preload; ///
  void function(AdwTabOverview* self, gboolean inverted) c_adw_tab_overview_set_inverted; ///
  void function(AdwTabOverview* self, gboolean open) c_adw_tab_overview_set_open; ///
  void function(AdwTabOverview* self, GMenuModel* secondaryMenu) c_adw_tab_overview_set_secondary_menu; ///
  void function(AdwTabOverview* self, gboolean showEndTitleButtons) c_adw_tab_overview_set_show_end_title_buttons; ///
  void function(AdwTabOverview* self, gboolean showStartTitleButtons) c_adw_tab_overview_set_show_start_title_buttons; ///
  void function(AdwTabOverview* self, AdwTabView* view) c_adw_tab_overview_set_view; ///
  void function(AdwTabOverview* self, GdkDragAction actions, GType* types, size_t nTypes) c_adw_tab_overview_setup_extra_drop_target; ///

  // TabPage
  GType function() c_adw_tab_page_get_type; ///
  GtkWidget* function(AdwTabPage* self) c_adw_tab_page_get_child; ///
  GIcon* function(AdwTabPage* self) c_adw_tab_page_get_icon; ///
  gboolean function(AdwTabPage* self) c_adw_tab_page_get_indicator_activatable; ///
  GIcon* function(AdwTabPage* self) c_adw_tab_page_get_indicator_icon; ///
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_indicator_tooltip; ///
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_keyword; ///
  gboolean function(AdwTabPage* self) c_adw_tab_page_get_live_thumbnail; ///
  gboolean function(AdwTabPage* self) c_adw_tab_page_get_loading; ///
  gboolean function(AdwTabPage* self) c_adw_tab_page_get_needs_attention; ///
  AdwTabPage* function(AdwTabPage* self) c_adw_tab_page_get_parent; ///
  gboolean function(AdwTabPage* self) c_adw_tab_page_get_pinned; ///
  gboolean function(AdwTabPage* self) c_adw_tab_page_get_selected; ///
  float function(AdwTabPage* self) c_adw_tab_page_get_thumbnail_xalign; ///
  float function(AdwTabPage* self) c_adw_tab_page_get_thumbnail_yalign; ///
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_title; ///
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_tooltip; ///
  void function(AdwTabPage* self) c_adw_tab_page_invalidate_thumbnail; ///
  void function(AdwTabPage* self, GIcon* icon) c_adw_tab_page_set_icon; ///
  void function(AdwTabPage* self, gboolean activatable) c_adw_tab_page_set_indicator_activatable; ///
  void function(AdwTabPage* self, GIcon* indicatorIcon) c_adw_tab_page_set_indicator_icon; ///
  void function(AdwTabPage* self, const(char)* tooltip) c_adw_tab_page_set_indicator_tooltip; ///
  void function(AdwTabPage* self, const(char)* keyword) c_adw_tab_page_set_keyword; ///
  void function(AdwTabPage* self, gboolean liveThumbnail) c_adw_tab_page_set_live_thumbnail; ///
  void function(AdwTabPage* self, gboolean loading) c_adw_tab_page_set_loading; ///
  void function(AdwTabPage* self, gboolean needsAttention) c_adw_tab_page_set_needs_attention; ///
  void function(AdwTabPage* self, float xalign) c_adw_tab_page_set_thumbnail_xalign; ///
  void function(AdwTabPage* self, float yalign) c_adw_tab_page_set_thumbnail_yalign; ///
  void function(AdwTabPage* self, const(char)* title) c_adw_tab_page_set_title; ///
  void function(AdwTabPage* self, const(char)* tooltip) c_adw_tab_page_set_tooltip; ///

  // TabView
  GType function() c_adw_tab_view_get_type; ///
  AdwTabView* function() c_adw_tab_view_new; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child, AdwTabPage* parent) c_adw_tab_view_add_page; ///
  void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) c_adw_tab_view_add_shortcuts; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_append; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_append_pinned; ///
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_other_pages; ///
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_page; ///
  void function(AdwTabView* self, AdwTabPage* page, gboolean confirm) c_adw_tab_view_close_page_finish; ///
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_pages_after; ///
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_pages_before; ///
  GIcon* function(AdwTabView* self) c_adw_tab_view_get_default_icon; ///
  gboolean function(AdwTabView* self) c_adw_tab_view_get_is_transferring_page; ///
  GMenuModel* function(AdwTabView* self) c_adw_tab_view_get_menu_model; ///
  int function(AdwTabView* self) c_adw_tab_view_get_n_pages; ///
  int function(AdwTabView* self) c_adw_tab_view_get_n_pinned_pages; ///
  AdwTabPage* function(AdwTabView* self, int position) c_adw_tab_view_get_nth_page; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_get_page; ///
  int function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_get_page_position; ///
  GtkSelectionModel* function(AdwTabView* self) c_adw_tab_view_get_pages; ///
  AdwTabPage* function(AdwTabView* self) c_adw_tab_view_get_selected_page; ///
  AdwTabViewShortcuts function(AdwTabView* self) c_adw_tab_view_get_shortcuts; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child, int position) c_adw_tab_view_insert; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child, int position) c_adw_tab_view_insert_pinned; ///
  void function(AdwTabView* self) c_adw_tab_view_invalidate_thumbnails; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_prepend; ///
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_prepend_pinned; ///
  void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) c_adw_tab_view_remove_shortcuts; ///
  gboolean function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_backward; ///
  gboolean function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_first; ///
  gboolean function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_forward; ///
  gboolean function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_last; ///
  gboolean function(AdwTabView* self, AdwTabPage* page, int position) c_adw_tab_view_reorder_page; ///
  gboolean function(AdwTabView* self) c_adw_tab_view_select_next_page; ///
  gboolean function(AdwTabView* self) c_adw_tab_view_select_previous_page; ///
  void function(AdwTabView* self, GIcon* defaultIcon) c_adw_tab_view_set_default_icon; ///
  void function(AdwTabView* self, GMenuModel* menuModel) c_adw_tab_view_set_menu_model; ///
  void function(AdwTabView* self, AdwTabPage* page, gboolean pinned) c_adw_tab_view_set_page_pinned; ///
  void function(AdwTabView* self, AdwTabPage* selectedPage) c_adw_tab_view_set_selected_page; ///
  void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) c_adw_tab_view_set_shortcuts; ///
  void function(AdwTabView* self, AdwTabPage* page, AdwTabView* otherView, int position) c_adw_tab_view_transfer_page; ///

  // TimedAnimation
  GType function() c_adw_timed_animation_get_type; ///
  AdwAnimation* function(GtkWidget* widget, double from, double to, uint duration, AdwAnimationTarget* target) c_adw_timed_animation_new; ///
  gboolean function(AdwTimedAnimation* self) c_adw_timed_animation_get_alternate; ///
  uint function(AdwTimedAnimation* self) c_adw_timed_animation_get_duration; ///
  AdwEasing function(AdwTimedAnimation* self) c_adw_timed_animation_get_easing; ///
  uint function(AdwTimedAnimation* self) c_adw_timed_animation_get_repeat_count; ///
  gboolean function(AdwTimedAnimation* self) c_adw_timed_animation_get_reverse; ///
  double function(AdwTimedAnimation* self) c_adw_timed_animation_get_value_from; ///
  double function(AdwTimedAnimation* self) c_adw_timed_animation_get_value_to; ///
  void function(AdwTimedAnimation* self, gboolean alternate) c_adw_timed_animation_set_alternate; ///
  void function(AdwTimedAnimation* self, uint duration) c_adw_timed_animation_set_duration; ///
  void function(AdwTimedAnimation* self, AdwEasing easing) c_adw_timed_animation_set_easing; ///
  void function(AdwTimedAnimation* self, uint repeatCount) c_adw_timed_animation_set_repeat_count; ///
  void function(AdwTimedAnimation* self, gboolean reverse) c_adw_timed_animation_set_reverse; ///
  void function(AdwTimedAnimation* self, double value) c_adw_timed_animation_set_value_from; ///
  void function(AdwTimedAnimation* self, double value) c_adw_timed_animation_set_value_to; ///

  // Toast
  GType function() c_adw_toast_get_type; ///
  AdwToast* function(const(char)* title) c_adw_toast_new; ///
  AdwToast* function(const(char)* format,  ...) c_adw_toast_new_format; ///
  void function(AdwToast* self) c_adw_toast_dismiss; ///
  const(char)* function(AdwToast* self) c_adw_toast_get_action_name; ///
  GVariant* function(AdwToast* self) c_adw_toast_get_action_target_value; ///
  const(char)* function(AdwToast* self) c_adw_toast_get_button_label; ///
  GtkWidget* function(AdwToast* self) c_adw_toast_get_custom_title; ///
  AdwToastPriority function(AdwToast* self) c_adw_toast_get_priority; ///
  uint function(AdwToast* self) c_adw_toast_get_timeout; ///
  const(char)* function(AdwToast* self) c_adw_toast_get_title; ///
  gboolean function(AdwToast* self) c_adw_toast_get_use_markup; ///
  void function(AdwToast* self, const(char)* actionName) c_adw_toast_set_action_name; ///
  void function(AdwToast* self, const(char)* formatString,  ...) c_adw_toast_set_action_target; ///
  void function(AdwToast* self, GVariant* actionTarget) c_adw_toast_set_action_target_value; ///
  void function(AdwToast* self, const(char)* buttonLabel) c_adw_toast_set_button_label; ///
  void function(AdwToast* self, GtkWidget* widget) c_adw_toast_set_custom_title; ///
  void function(AdwToast* self, const(char)* detailedActionName) c_adw_toast_set_detailed_action_name; ///
  void function(AdwToast* self, AdwToastPriority priority) c_adw_toast_set_priority; ///
  void function(AdwToast* self, uint timeout) c_adw_toast_set_timeout; ///
  void function(AdwToast* self, const(char)* title) c_adw_toast_set_title; ///
  void function(AdwToast* self, gboolean useMarkup) c_adw_toast_set_use_markup; ///

  // ToastOverlay
  GType function() c_adw_toast_overlay_get_type; ///
  GtkWidget* function() c_adw_toast_overlay_new; ///
  void function(AdwToastOverlay* self, AdwToast* toast) c_adw_toast_overlay_add_toast; ///
  GtkWidget* function(AdwToastOverlay* self) c_adw_toast_overlay_get_child; ///
  void function(AdwToastOverlay* self, GtkWidget* child) c_adw_toast_overlay_set_child; ///

  // ToolbarView
  GType function() c_adw_toolbar_view_get_type; ///
  GtkWidget* function() c_adw_toolbar_view_new; ///
  void function(AdwToolbarView* self, GtkWidget* widget) c_adw_toolbar_view_add_bottom_bar; ///
  void function(AdwToolbarView* self, GtkWidget* widget) c_adw_toolbar_view_add_top_bar; ///
  int function(AdwToolbarView* self) c_adw_toolbar_view_get_bottom_bar_height; ///
  AdwToolbarStyle function(AdwToolbarView* self) c_adw_toolbar_view_get_bottom_bar_style; ///
  GtkWidget* function(AdwToolbarView* self) c_adw_toolbar_view_get_content; ///
  gboolean function(AdwToolbarView* self) c_adw_toolbar_view_get_extend_content_to_bottom_edge; ///
  gboolean function(AdwToolbarView* self) c_adw_toolbar_view_get_extend_content_to_top_edge; ///
  gboolean function(AdwToolbarView* self) c_adw_toolbar_view_get_reveal_bottom_bars; ///
  gboolean function(AdwToolbarView* self) c_adw_toolbar_view_get_reveal_top_bars; ///
  int function(AdwToolbarView* self) c_adw_toolbar_view_get_top_bar_height; ///
  AdwToolbarStyle function(AdwToolbarView* self) c_adw_toolbar_view_get_top_bar_style; ///
  void function(AdwToolbarView* self, GtkWidget* widget) c_adw_toolbar_view_remove; ///
  void function(AdwToolbarView* self, AdwToolbarStyle style) c_adw_toolbar_view_set_bottom_bar_style; ///
  void function(AdwToolbarView* self, GtkWidget* content) c_adw_toolbar_view_set_content; ///
  void function(AdwToolbarView* self, gboolean extend) c_adw_toolbar_view_set_extend_content_to_bottom_edge; ///
  void function(AdwToolbarView* self, gboolean extend) c_adw_toolbar_view_set_extend_content_to_top_edge; ///
  void function(AdwToolbarView* self, gboolean reveal) c_adw_toolbar_view_set_reveal_bottom_bars; ///
  void function(AdwToolbarView* self, gboolean reveal) c_adw_toolbar_view_set_reveal_top_bars; ///
  void function(AdwToolbarView* self, AdwToolbarStyle style) c_adw_toolbar_view_set_top_bar_style; ///

  // ViewStack
  GType function() c_adw_view_stack_get_type; ///
  GtkWidget* function() c_adw_view_stack_new; ///
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_add; ///
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name) c_adw_view_stack_add_named; ///
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name, const(char)* title) c_adw_view_stack_add_titled; ///
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name, const(char)* title, const(char)* iconName) c_adw_view_stack_add_titled_with_icon; ///
  GtkWidget* function(AdwViewStack* self, const(char)* name) c_adw_view_stack_get_child_by_name; ///
  gboolean function(AdwViewStack* self) c_adw_view_stack_get_hhomogeneous; ///
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_get_page; ///
  GtkSelectionModel* function(AdwViewStack* self) c_adw_view_stack_get_pages; ///
  gboolean function(AdwViewStack* self) c_adw_view_stack_get_vhomogeneous; ///
  GtkWidget* function(AdwViewStack* self) c_adw_view_stack_get_visible_child; ///
  const(char)* function(AdwViewStack* self) c_adw_view_stack_get_visible_child_name; ///
  void function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_remove; ///
  void function(AdwViewStack* self, gboolean hhomogeneous) c_adw_view_stack_set_hhomogeneous; ///
  void function(AdwViewStack* self, gboolean vhomogeneous) c_adw_view_stack_set_vhomogeneous; ///
  void function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_set_visible_child; ///
  void function(AdwViewStack* self, const(char)* name) c_adw_view_stack_set_visible_child_name; ///

  // ViewStackPage
  GType function() c_adw_view_stack_page_get_type; ///
  uint function(AdwViewStackPage* self) c_adw_view_stack_page_get_badge_number; ///
  GtkWidget* function(AdwViewStackPage* self) c_adw_view_stack_page_get_child; ///
  const(char)* function(AdwViewStackPage* self) c_adw_view_stack_page_get_icon_name; ///
  const(char)* function(AdwViewStackPage* self) c_adw_view_stack_page_get_name; ///
  gboolean function(AdwViewStackPage* self) c_adw_view_stack_page_get_needs_attention; ///
  const(char)* function(AdwViewStackPage* self) c_adw_view_stack_page_get_title; ///
  gboolean function(AdwViewStackPage* self) c_adw_view_stack_page_get_use_underline; ///
  gboolean function(AdwViewStackPage* self) c_adw_view_stack_page_get_visible; ///
  void function(AdwViewStackPage* self, uint badgeNumber) c_adw_view_stack_page_set_badge_number; ///
  void function(AdwViewStackPage* self, const(char)* iconName) c_adw_view_stack_page_set_icon_name; ///
  void function(AdwViewStackPage* self, const(char)* name) c_adw_view_stack_page_set_name; ///
  void function(AdwViewStackPage* self, gboolean needsAttention) c_adw_view_stack_page_set_needs_attention; ///
  void function(AdwViewStackPage* self, const(char)* title) c_adw_view_stack_page_set_title; ///
  void function(AdwViewStackPage* self, gboolean useUnderline) c_adw_view_stack_page_set_use_underline; ///
  void function(AdwViewStackPage* self, gboolean visible) c_adw_view_stack_page_set_visible; ///

  // ViewStackPages
  GType function() c_adw_view_stack_pages_get_type; ///
  AdwViewStackPage* function(AdwViewStackPages* self) c_adw_view_stack_pages_get_selected_page; ///
  void function(AdwViewStackPages* self, AdwViewStackPage* page) c_adw_view_stack_pages_set_selected_page; ///

  // ViewSwitcher
  GType function() c_adw_view_switcher_get_type; ///
  GtkWidget* function() c_adw_view_switcher_new; ///
  AdwViewSwitcherPolicy function(AdwViewSwitcher* self) c_adw_view_switcher_get_policy; ///
  AdwViewStack* function(AdwViewSwitcher* self) c_adw_view_switcher_get_stack; ///
  void function(AdwViewSwitcher* self, AdwViewSwitcherPolicy policy) c_adw_view_switcher_set_policy; ///
  void function(AdwViewSwitcher* self, AdwViewStack* stack) c_adw_view_switcher_set_stack; ///

  // ViewSwitcherBar
  GType function() c_adw_view_switcher_bar_get_type; ///
  GtkWidget* function() c_adw_view_switcher_bar_new; ///
  gboolean function(AdwViewSwitcherBar* self) c_adw_view_switcher_bar_get_reveal; ///
  AdwViewStack* function(AdwViewSwitcherBar* self) c_adw_view_switcher_bar_get_stack; ///
  void function(AdwViewSwitcherBar* self, gboolean reveal) c_adw_view_switcher_bar_set_reveal; ///
  void function(AdwViewSwitcherBar* self, AdwViewStack* stack) c_adw_view_switcher_bar_set_stack; ///

  // ViewSwitcherTitle
  GType function() c_adw_view_switcher_title_get_type; ///
  GtkWidget* function() c_adw_view_switcher_title_new; ///
  AdwViewStack* function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_stack; ///
  const(char)* function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_subtitle; ///
  const(char)* function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_title; ///
  gboolean function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_title_visible; ///
  gboolean function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_view_switcher_enabled; ///
  void function(AdwViewSwitcherTitle* self, AdwViewStack* stack) c_adw_view_switcher_title_set_stack; ///
  void function(AdwViewSwitcherTitle* self, const(char)* subtitle) c_adw_view_switcher_title_set_subtitle; ///
  void function(AdwViewSwitcherTitle* self, const(char)* title) c_adw_view_switcher_title_set_title; ///
  void function(AdwViewSwitcherTitle* self, gboolean enabled) c_adw_view_switcher_title_set_view_switcher_enabled; ///

  // Window
  GType function() c_adw_window_get_type; ///
  GtkWidget* function() c_adw_window_new; ///
  void function(AdwWindow* self, AdwBreakpoint* breakpoint) c_adw_window_add_breakpoint; ///
  GtkWidget* function(AdwWindow* self) c_adw_window_get_content; ///
  AdwBreakpoint* function(AdwWindow* self) c_adw_window_get_current_breakpoint; ///
  GListModel* function(AdwWindow* self) c_adw_window_get_dialogs; ///
  AdwDialog* function(AdwWindow* self) c_adw_window_get_visible_dialog; ///
  void function(AdwWindow* self, GtkWidget* content) c_adw_window_set_content; ///

  // WindowTitle
  GType function() c_adw_window_title_get_type; ///
  GtkWidget* function(const(char)* title, const(char)* subtitle) c_adw_window_title_new; ///
  const(char)* function(AdwWindowTitle* self) c_adw_window_title_get_subtitle; ///
  const(char)* function(AdwWindowTitle* self) c_adw_window_title_get_title; ///
  void function(AdwWindowTitle* self, const(char)* subtitle) c_adw_window_title_set_subtitle; ///
  void function(AdwWindowTitle* self, const(char)* title) c_adw_window_title_set_title; ///

  // global
  gboolean function(GtkWidget* widget) c_adw_get_enable_animations; ///
  uint function() c_adw_get_major_version; ///
  uint function() c_adw_get_micro_version; ///
  uint function() c_adw_get_minor_version; ///
  void function() c_adw_init; ///
  gboolean function() c_adw_is_initialized; ///
  double function(double a, double b, double t) c_adw_lerp; ///
  void function(GtkWidget* parent, const(char)* firstPropertyName,  ...) c_adw_show_about_dialog; ///
  void function(GtkWidget* parent, const(char)* resourcePath, const(char)* releaseNotesVersion, const(char)* firstPropertyName,  ...) c_adw_show_about_dialog_from_appdata; ///
  void function(GtkWindow* parent, const(char)* firstPropertyName,  ...) c_adw_show_about_window; ///
  void function(GtkWindow* parent, const(char)* resourcePath, const(char)* releaseNotesVersion, const(char)* firstPropertyName,  ...) c_adw_show_about_window_from_appdata; ///

  // Easing
  double function(AdwEasing self, double value) c_adw_easing_ease; ///

  // LengthUnit
  double function(AdwLengthUnit unit, double value, GtkSettings* settings) c_adw_length_unit_from_px; ///
  double function(AdwLengthUnit unit, double value, GtkSettings* settings) c_adw_length_unit_to_px; ///
}

// AboutDialog

/** */
alias adw_about_dialog_get_type = c_adw_about_dialog_get_type;

/** */
alias adw_about_dialog_new = c_adw_about_dialog_new;

/** */
alias adw_about_dialog_new_from_appdata = c_adw_about_dialog_new_from_appdata;

/** */
alias adw_about_dialog_add_acknowledgement_section = c_adw_about_dialog_add_acknowledgement_section;

/** */
alias adw_about_dialog_add_credit_section = c_adw_about_dialog_add_credit_section;

/** */
alias adw_about_dialog_add_legal_section = c_adw_about_dialog_add_legal_section;

/** */
alias adw_about_dialog_add_link = c_adw_about_dialog_add_link;

/** */
alias adw_about_dialog_get_application_icon = c_adw_about_dialog_get_application_icon;

/** */
alias adw_about_dialog_get_application_name = c_adw_about_dialog_get_application_name;

/** */
alias adw_about_dialog_get_artists = c_adw_about_dialog_get_artists;

/** */
alias adw_about_dialog_get_comments = c_adw_about_dialog_get_comments;

/** */
alias adw_about_dialog_get_copyright = c_adw_about_dialog_get_copyright;

/** */
alias adw_about_dialog_get_debug_info = c_adw_about_dialog_get_debug_info;

/** */
alias adw_about_dialog_get_debug_info_filename = c_adw_about_dialog_get_debug_info_filename;

/** */
alias adw_about_dialog_get_designers = c_adw_about_dialog_get_designers;

/** */
alias adw_about_dialog_get_developer_name = c_adw_about_dialog_get_developer_name;

/** */
alias adw_about_dialog_get_developers = c_adw_about_dialog_get_developers;

/** */
alias adw_about_dialog_get_documenters = c_adw_about_dialog_get_documenters;

/** */
alias adw_about_dialog_get_issue_url = c_adw_about_dialog_get_issue_url;

/** */
alias adw_about_dialog_get_license = c_adw_about_dialog_get_license;

/** */
alias adw_about_dialog_get_license_type = c_adw_about_dialog_get_license_type;

/** */
alias adw_about_dialog_get_release_notes = c_adw_about_dialog_get_release_notes;

/** */
alias adw_about_dialog_get_release_notes_version = c_adw_about_dialog_get_release_notes_version;

/** */
alias adw_about_dialog_get_support_url = c_adw_about_dialog_get_support_url;

/** */
alias adw_about_dialog_get_translator_credits = c_adw_about_dialog_get_translator_credits;

/** */
alias adw_about_dialog_get_version = c_adw_about_dialog_get_version;

/** */
alias adw_about_dialog_get_website = c_adw_about_dialog_get_website;

/** */
alias adw_about_dialog_set_application_icon = c_adw_about_dialog_set_application_icon;

/** */
alias adw_about_dialog_set_application_name = c_adw_about_dialog_set_application_name;

/** */
alias adw_about_dialog_set_artists = c_adw_about_dialog_set_artists;

/** */
alias adw_about_dialog_set_comments = c_adw_about_dialog_set_comments;

/** */
alias adw_about_dialog_set_copyright = c_adw_about_dialog_set_copyright;

/** */
alias adw_about_dialog_set_debug_info = c_adw_about_dialog_set_debug_info;

/** */
alias adw_about_dialog_set_debug_info_filename = c_adw_about_dialog_set_debug_info_filename;

/** */
alias adw_about_dialog_set_designers = c_adw_about_dialog_set_designers;

/** */
alias adw_about_dialog_set_developer_name = c_adw_about_dialog_set_developer_name;

/** */
alias adw_about_dialog_set_developers = c_adw_about_dialog_set_developers;

/** */
alias adw_about_dialog_set_documenters = c_adw_about_dialog_set_documenters;

/** */
alias adw_about_dialog_set_issue_url = c_adw_about_dialog_set_issue_url;

/** */
alias adw_about_dialog_set_license = c_adw_about_dialog_set_license;

/** */
alias adw_about_dialog_set_license_type = c_adw_about_dialog_set_license_type;

/** */
alias adw_about_dialog_set_release_notes = c_adw_about_dialog_set_release_notes;

/** */
alias adw_about_dialog_set_release_notes_version = c_adw_about_dialog_set_release_notes_version;

/** */
alias adw_about_dialog_set_support_url = c_adw_about_dialog_set_support_url;

/** */
alias adw_about_dialog_set_translator_credits = c_adw_about_dialog_set_translator_credits;

/** */
alias adw_about_dialog_set_version = c_adw_about_dialog_set_version;

/** */
alias adw_about_dialog_set_website = c_adw_about_dialog_set_website;

// AboutWindow

/** */
alias adw_about_window_get_type = c_adw_about_window_get_type;

/** */
alias adw_about_window_new = c_adw_about_window_new;

/** */
alias adw_about_window_new_from_appdata = c_adw_about_window_new_from_appdata;

/** */
alias adw_about_window_add_acknowledgement_section = c_adw_about_window_add_acknowledgement_section;

/** */
alias adw_about_window_add_credit_section = c_adw_about_window_add_credit_section;

/** */
alias adw_about_window_add_legal_section = c_adw_about_window_add_legal_section;

/** */
alias adw_about_window_add_link = c_adw_about_window_add_link;

/** */
alias adw_about_window_get_application_icon = c_adw_about_window_get_application_icon;

/** */
alias adw_about_window_get_application_name = c_adw_about_window_get_application_name;

/** */
alias adw_about_window_get_artists = c_adw_about_window_get_artists;

/** */
alias adw_about_window_get_comments = c_adw_about_window_get_comments;

/** */
alias adw_about_window_get_copyright = c_adw_about_window_get_copyright;

/** */
alias adw_about_window_get_debug_info = c_adw_about_window_get_debug_info;

/** */
alias adw_about_window_get_debug_info_filename = c_adw_about_window_get_debug_info_filename;

/** */
alias adw_about_window_get_designers = c_adw_about_window_get_designers;

/** */
alias adw_about_window_get_developer_name = c_adw_about_window_get_developer_name;

/** */
alias adw_about_window_get_developers = c_adw_about_window_get_developers;

/** */
alias adw_about_window_get_documenters = c_adw_about_window_get_documenters;

/** */
alias adw_about_window_get_issue_url = c_adw_about_window_get_issue_url;

/** */
alias adw_about_window_get_license = c_adw_about_window_get_license;

/** */
alias adw_about_window_get_license_type = c_adw_about_window_get_license_type;

/** */
alias adw_about_window_get_release_notes = c_adw_about_window_get_release_notes;

/** */
alias adw_about_window_get_release_notes_version = c_adw_about_window_get_release_notes_version;

/** */
alias adw_about_window_get_support_url = c_adw_about_window_get_support_url;

/** */
alias adw_about_window_get_translator_credits = c_adw_about_window_get_translator_credits;

/** */
alias adw_about_window_get_version = c_adw_about_window_get_version;

/** */
alias adw_about_window_get_website = c_adw_about_window_get_website;

/** */
alias adw_about_window_set_application_icon = c_adw_about_window_set_application_icon;

/** */
alias adw_about_window_set_application_name = c_adw_about_window_set_application_name;

/** */
alias adw_about_window_set_artists = c_adw_about_window_set_artists;

/** */
alias adw_about_window_set_comments = c_adw_about_window_set_comments;

/** */
alias adw_about_window_set_copyright = c_adw_about_window_set_copyright;

/** */
alias adw_about_window_set_debug_info = c_adw_about_window_set_debug_info;

/** */
alias adw_about_window_set_debug_info_filename = c_adw_about_window_set_debug_info_filename;

/** */
alias adw_about_window_set_designers = c_adw_about_window_set_designers;

/** */
alias adw_about_window_set_developer_name = c_adw_about_window_set_developer_name;

/** */
alias adw_about_window_set_developers = c_adw_about_window_set_developers;

/** */
alias adw_about_window_set_documenters = c_adw_about_window_set_documenters;

/** */
alias adw_about_window_set_issue_url = c_adw_about_window_set_issue_url;

/** */
alias adw_about_window_set_license = c_adw_about_window_set_license;

/** */
alias adw_about_window_set_license_type = c_adw_about_window_set_license_type;

/** */
alias adw_about_window_set_release_notes = c_adw_about_window_set_release_notes;

/** */
alias adw_about_window_set_release_notes_version = c_adw_about_window_set_release_notes_version;

/** */
alias adw_about_window_set_support_url = c_adw_about_window_set_support_url;

/** */
alias adw_about_window_set_translator_credits = c_adw_about_window_set_translator_credits;

/** */
alias adw_about_window_set_version = c_adw_about_window_set_version;

/** */
alias adw_about_window_set_website = c_adw_about_window_set_website;

// ActionRow

/** */
alias adw_action_row_get_type = c_adw_action_row_get_type;

/** */
alias adw_action_row_new = c_adw_action_row_new;

/** */
alias adw_action_row_activate = c_adw_action_row_activate;

/** */
alias adw_action_row_add_prefix = c_adw_action_row_add_prefix;

/** */
alias adw_action_row_add_suffix = c_adw_action_row_add_suffix;

/** */
alias adw_action_row_get_activatable_widget = c_adw_action_row_get_activatable_widget;

/** */
alias adw_action_row_get_icon_name = c_adw_action_row_get_icon_name;

/** */
alias adw_action_row_get_subtitle = c_adw_action_row_get_subtitle;

/** */
alias adw_action_row_get_subtitle_lines = c_adw_action_row_get_subtitle_lines;

/** */
alias adw_action_row_get_subtitle_selectable = c_adw_action_row_get_subtitle_selectable;

/** */
alias adw_action_row_get_title_lines = c_adw_action_row_get_title_lines;

/** */
alias adw_action_row_remove = c_adw_action_row_remove;

/** */
alias adw_action_row_set_activatable_widget = c_adw_action_row_set_activatable_widget;

/** */
alias adw_action_row_set_icon_name = c_adw_action_row_set_icon_name;

/** */
alias adw_action_row_set_subtitle = c_adw_action_row_set_subtitle;

/** */
alias adw_action_row_set_subtitle_lines = c_adw_action_row_set_subtitle_lines;

/** */
alias adw_action_row_set_subtitle_selectable = c_adw_action_row_set_subtitle_selectable;

/** */
alias adw_action_row_set_title_lines = c_adw_action_row_set_title_lines;

// AlertDialog

/** */
alias adw_alert_dialog_get_type = c_adw_alert_dialog_get_type;

/** */
alias adw_alert_dialog_new = c_adw_alert_dialog_new;

/** */
alias adw_alert_dialog_add_response = c_adw_alert_dialog_add_response;

/** */
alias adw_alert_dialog_add_responses = c_adw_alert_dialog_add_responses;

/** */
alias adw_alert_dialog_choose = c_adw_alert_dialog_choose;

/** */
alias adw_alert_dialog_choose_finish = c_adw_alert_dialog_choose_finish;

/** */
alias adw_alert_dialog_format_body = c_adw_alert_dialog_format_body;

/** */
alias adw_alert_dialog_format_body_markup = c_adw_alert_dialog_format_body_markup;

/** */
alias adw_alert_dialog_format_heading = c_adw_alert_dialog_format_heading;

/** */
alias adw_alert_dialog_format_heading_markup = c_adw_alert_dialog_format_heading_markup;

/** */
alias adw_alert_dialog_get_body = c_adw_alert_dialog_get_body;

/** */
alias adw_alert_dialog_get_body_use_markup = c_adw_alert_dialog_get_body_use_markup;

/** */
alias adw_alert_dialog_get_close_response = c_adw_alert_dialog_get_close_response;

/** */
alias adw_alert_dialog_get_default_response = c_adw_alert_dialog_get_default_response;

/** */
alias adw_alert_dialog_get_extra_child = c_adw_alert_dialog_get_extra_child;

/** */
alias adw_alert_dialog_get_heading = c_adw_alert_dialog_get_heading;

/** */
alias adw_alert_dialog_get_heading_use_markup = c_adw_alert_dialog_get_heading_use_markup;

/** */
alias adw_alert_dialog_get_response_appearance = c_adw_alert_dialog_get_response_appearance;

/** */
alias adw_alert_dialog_get_response_enabled = c_adw_alert_dialog_get_response_enabled;

/** */
alias adw_alert_dialog_get_response_label = c_adw_alert_dialog_get_response_label;

/** */
alias adw_alert_dialog_has_response = c_adw_alert_dialog_has_response;

/** */
alias adw_alert_dialog_remove_response = c_adw_alert_dialog_remove_response;

/** */
alias adw_alert_dialog_set_body = c_adw_alert_dialog_set_body;

/** */
alias adw_alert_dialog_set_body_use_markup = c_adw_alert_dialog_set_body_use_markup;

/** */
alias adw_alert_dialog_set_close_response = c_adw_alert_dialog_set_close_response;

/** */
alias adw_alert_dialog_set_default_response = c_adw_alert_dialog_set_default_response;

/** */
alias adw_alert_dialog_set_extra_child = c_adw_alert_dialog_set_extra_child;

/** */
alias adw_alert_dialog_set_heading = c_adw_alert_dialog_set_heading;

/** */
alias adw_alert_dialog_set_heading_use_markup = c_adw_alert_dialog_set_heading_use_markup;

/** */
alias adw_alert_dialog_set_response_appearance = c_adw_alert_dialog_set_response_appearance;

/** */
alias adw_alert_dialog_set_response_enabled = c_adw_alert_dialog_set_response_enabled;

/** */
alias adw_alert_dialog_set_response_label = c_adw_alert_dialog_set_response_label;

// Animation

/** */
alias adw_animation_get_type = c_adw_animation_get_type;

/** */
alias adw_animation_get_follow_enable_animations_setting = c_adw_animation_get_follow_enable_animations_setting;

/** */
alias adw_animation_get_state = c_adw_animation_get_state;

/** */
alias adw_animation_get_target = c_adw_animation_get_target;

/** */
alias adw_animation_get_value = c_adw_animation_get_value;

/** */
alias adw_animation_get_widget = c_adw_animation_get_widget;

/** */
alias adw_animation_pause = c_adw_animation_pause;

/** */
alias adw_animation_play = c_adw_animation_play;

/** */
alias adw_animation_reset = c_adw_animation_reset;

/** */
alias adw_animation_resume = c_adw_animation_resume;

/** */
alias adw_animation_set_follow_enable_animations_setting = c_adw_animation_set_follow_enable_animations_setting;

/** */
alias adw_animation_set_target = c_adw_animation_set_target;

/** */
alias adw_animation_skip = c_adw_animation_skip;

// AnimationTarget

/** */
alias adw_animation_target_get_type = c_adw_animation_target_get_type;

// Application

/** */
alias adw_application_get_type = c_adw_application_get_type;

/** */
alias adw_application_new = c_adw_application_new;

/** */
alias adw_application_get_style_manager = c_adw_application_get_style_manager;

// ApplicationWindow

/** */
alias adw_application_window_get_type = c_adw_application_window_get_type;

/** */
alias adw_application_window_new = c_adw_application_window_new;

/** */
alias adw_application_window_add_breakpoint = c_adw_application_window_add_breakpoint;

/** */
alias adw_application_window_get_content = c_adw_application_window_get_content;

/** */
alias adw_application_window_get_current_breakpoint = c_adw_application_window_get_current_breakpoint;

/** */
alias adw_application_window_get_dialogs = c_adw_application_window_get_dialogs;

/** */
alias adw_application_window_get_visible_dialog = c_adw_application_window_get_visible_dialog;

/** */
alias adw_application_window_set_content = c_adw_application_window_set_content;

// Avatar

/** */
alias adw_avatar_get_type = c_adw_avatar_get_type;

/** */
alias adw_avatar_new = c_adw_avatar_new;

/** */
alias adw_avatar_draw_to_texture = c_adw_avatar_draw_to_texture;

/** */
alias adw_avatar_get_custom_image = c_adw_avatar_get_custom_image;

/** */
alias adw_avatar_get_icon_name = c_adw_avatar_get_icon_name;

/** */
alias adw_avatar_get_show_initials = c_adw_avatar_get_show_initials;

/** */
alias adw_avatar_get_size = c_adw_avatar_get_size;

/** */
alias adw_avatar_get_text = c_adw_avatar_get_text;

/** */
alias adw_avatar_set_custom_image = c_adw_avatar_set_custom_image;

/** */
alias adw_avatar_set_icon_name = c_adw_avatar_set_icon_name;

/** */
alias adw_avatar_set_show_initials = c_adw_avatar_set_show_initials;

/** */
alias adw_avatar_set_size = c_adw_avatar_set_size;

/** */
alias adw_avatar_set_text = c_adw_avatar_set_text;

// Banner

/** */
alias adw_banner_get_type = c_adw_banner_get_type;

/** */
alias adw_banner_new = c_adw_banner_new;

/** */
alias adw_banner_get_button_label = c_adw_banner_get_button_label;

/** */
alias adw_banner_get_revealed = c_adw_banner_get_revealed;

/** */
alias adw_banner_get_title = c_adw_banner_get_title;

/** */
alias adw_banner_get_use_markup = c_adw_banner_get_use_markup;

/** */
alias adw_banner_set_button_label = c_adw_banner_set_button_label;

/** */
alias adw_banner_set_revealed = c_adw_banner_set_revealed;

/** */
alias adw_banner_set_title = c_adw_banner_set_title;

/** */
alias adw_banner_set_use_markup = c_adw_banner_set_use_markup;

// Bin

/** */
alias adw_bin_get_type = c_adw_bin_get_type;

/** */
alias adw_bin_new = c_adw_bin_new;

/** */
alias adw_bin_get_child = c_adw_bin_get_child;

/** */
alias adw_bin_set_child = c_adw_bin_set_child;

// Breakpoint

/** */
alias adw_breakpoint_get_type = c_adw_breakpoint_get_type;

/** */
alias adw_breakpoint_new = c_adw_breakpoint_new;

/** */
alias adw_breakpoint_add_setter = c_adw_breakpoint_add_setter;

/** */
alias adw_breakpoint_add_setters = c_adw_breakpoint_add_setters;

/** */
alias adw_breakpoint_add_setters_valist = c_adw_breakpoint_add_setters_valist;

/** */
alias adw_breakpoint_add_settersv = c_adw_breakpoint_add_settersv;

/** */
alias adw_breakpoint_get_condition = c_adw_breakpoint_get_condition;

/** */
alias adw_breakpoint_set_condition = c_adw_breakpoint_set_condition;

// BreakpointBin

/** */
alias adw_breakpoint_bin_get_type = c_adw_breakpoint_bin_get_type;

/** */
alias adw_breakpoint_bin_new = c_adw_breakpoint_bin_new;

/** */
alias adw_breakpoint_bin_add_breakpoint = c_adw_breakpoint_bin_add_breakpoint;

/** */
alias adw_breakpoint_bin_get_child = c_adw_breakpoint_bin_get_child;

/** */
alias adw_breakpoint_bin_get_current_breakpoint = c_adw_breakpoint_bin_get_current_breakpoint;

/** */
alias adw_breakpoint_bin_remove_breakpoint = c_adw_breakpoint_bin_remove_breakpoint;

/** */
alias adw_breakpoint_bin_set_child = c_adw_breakpoint_bin_set_child;

// BreakpointCondition

/** */
alias adw_breakpoint_condition_get_type = c_adw_breakpoint_condition_get_type;

/** */
alias adw_breakpoint_condition_new_and = c_adw_breakpoint_condition_new_and;

/** */
alias adw_breakpoint_condition_new_length = c_adw_breakpoint_condition_new_length;

/** */
alias adw_breakpoint_condition_new_or = c_adw_breakpoint_condition_new_or;

/** */
alias adw_breakpoint_condition_new_ratio = c_adw_breakpoint_condition_new_ratio;

/** */
alias adw_breakpoint_condition_copy = c_adw_breakpoint_condition_copy;

/** */
alias adw_breakpoint_condition_free = c_adw_breakpoint_condition_free;

/** */
alias adw_breakpoint_condition_to_string = c_adw_breakpoint_condition_to_string;

/** */
alias adw_breakpoint_condition_parse = c_adw_breakpoint_condition_parse;

// ButtonContent

/** */
alias adw_button_content_get_type = c_adw_button_content_get_type;

/** */
alias adw_button_content_new = c_adw_button_content_new;

/** */
alias adw_button_content_get_can_shrink = c_adw_button_content_get_can_shrink;

/** */
alias adw_button_content_get_icon_name = c_adw_button_content_get_icon_name;

/** */
alias adw_button_content_get_label = c_adw_button_content_get_label;

/** */
alias adw_button_content_get_use_underline = c_adw_button_content_get_use_underline;

/** */
alias adw_button_content_set_can_shrink = c_adw_button_content_set_can_shrink;

/** */
alias adw_button_content_set_icon_name = c_adw_button_content_set_icon_name;

/** */
alias adw_button_content_set_label = c_adw_button_content_set_label;

/** */
alias adw_button_content_set_use_underline = c_adw_button_content_set_use_underline;

// CallbackAnimationTarget

/** */
alias adw_callback_animation_target_get_type = c_adw_callback_animation_target_get_type;

/** */
alias adw_callback_animation_target_new = c_adw_callback_animation_target_new;

// Carousel

/** */
alias adw_carousel_get_type = c_adw_carousel_get_type;

/** */
alias adw_carousel_new = c_adw_carousel_new;

/** */
alias adw_carousel_append = c_adw_carousel_append;

/** */
alias adw_carousel_get_allow_long_swipes = c_adw_carousel_get_allow_long_swipes;

/** */
alias adw_carousel_get_allow_mouse_drag = c_adw_carousel_get_allow_mouse_drag;

/** */
alias adw_carousel_get_allow_scroll_wheel = c_adw_carousel_get_allow_scroll_wheel;

/** */
alias adw_carousel_get_interactive = c_adw_carousel_get_interactive;

/** */
alias adw_carousel_get_n_pages = c_adw_carousel_get_n_pages;

/** */
alias adw_carousel_get_nth_page = c_adw_carousel_get_nth_page;

/** */
alias adw_carousel_get_position = c_adw_carousel_get_position;

/** */
alias adw_carousel_get_reveal_duration = c_adw_carousel_get_reveal_duration;

/** */
alias adw_carousel_get_scroll_params = c_adw_carousel_get_scroll_params;

/** */
alias adw_carousel_get_spacing = c_adw_carousel_get_spacing;

/** */
alias adw_carousel_insert = c_adw_carousel_insert;

/** */
alias adw_carousel_prepend = c_adw_carousel_prepend;

/** */
alias adw_carousel_remove = c_adw_carousel_remove;

/** */
alias adw_carousel_reorder = c_adw_carousel_reorder;

/** */
alias adw_carousel_scroll_to = c_adw_carousel_scroll_to;

/** */
alias adw_carousel_set_allow_long_swipes = c_adw_carousel_set_allow_long_swipes;

/** */
alias adw_carousel_set_allow_mouse_drag = c_adw_carousel_set_allow_mouse_drag;

/** */
alias adw_carousel_set_allow_scroll_wheel = c_adw_carousel_set_allow_scroll_wheel;

/** */
alias adw_carousel_set_interactive = c_adw_carousel_set_interactive;

/** */
alias adw_carousel_set_reveal_duration = c_adw_carousel_set_reveal_duration;

/** */
alias adw_carousel_set_scroll_params = c_adw_carousel_set_scroll_params;

/** */
alias adw_carousel_set_spacing = c_adw_carousel_set_spacing;

// CarouselIndicatorDots

/** */
alias adw_carousel_indicator_dots_get_type = c_adw_carousel_indicator_dots_get_type;

/** */
alias adw_carousel_indicator_dots_new = c_adw_carousel_indicator_dots_new;

/** */
alias adw_carousel_indicator_dots_get_carousel = c_adw_carousel_indicator_dots_get_carousel;

/** */
alias adw_carousel_indicator_dots_set_carousel = c_adw_carousel_indicator_dots_set_carousel;

// CarouselIndicatorLines

/** */
alias adw_carousel_indicator_lines_get_type = c_adw_carousel_indicator_lines_get_type;

/** */
alias adw_carousel_indicator_lines_new = c_adw_carousel_indicator_lines_new;

/** */
alias adw_carousel_indicator_lines_get_carousel = c_adw_carousel_indicator_lines_get_carousel;

/** */
alias adw_carousel_indicator_lines_set_carousel = c_adw_carousel_indicator_lines_set_carousel;

// Clamp

/** */
alias adw_clamp_get_type = c_adw_clamp_get_type;

/** */
alias adw_clamp_new = c_adw_clamp_new;

/** */
alias adw_clamp_get_child = c_adw_clamp_get_child;

/** */
alias adw_clamp_get_maximum_size = c_adw_clamp_get_maximum_size;

/** */
alias adw_clamp_get_tightening_threshold = c_adw_clamp_get_tightening_threshold;

/** */
alias adw_clamp_get_unit = c_adw_clamp_get_unit;

/** */
alias adw_clamp_set_child = c_adw_clamp_set_child;

/** */
alias adw_clamp_set_maximum_size = c_adw_clamp_set_maximum_size;

/** */
alias adw_clamp_set_tightening_threshold = c_adw_clamp_set_tightening_threshold;

/** */
alias adw_clamp_set_unit = c_adw_clamp_set_unit;

// ClampLayout

/** */
alias adw_clamp_layout_get_type = c_adw_clamp_layout_get_type;

/** */
alias adw_clamp_layout_new = c_adw_clamp_layout_new;

/** */
alias adw_clamp_layout_get_maximum_size = c_adw_clamp_layout_get_maximum_size;

/** */
alias adw_clamp_layout_get_tightening_threshold = c_adw_clamp_layout_get_tightening_threshold;

/** */
alias adw_clamp_layout_get_unit = c_adw_clamp_layout_get_unit;

/** */
alias adw_clamp_layout_set_maximum_size = c_adw_clamp_layout_set_maximum_size;

/** */
alias adw_clamp_layout_set_tightening_threshold = c_adw_clamp_layout_set_tightening_threshold;

/** */
alias adw_clamp_layout_set_unit = c_adw_clamp_layout_set_unit;

// ClampScrollable

/** */
alias adw_clamp_scrollable_get_type = c_adw_clamp_scrollable_get_type;

/** */
alias adw_clamp_scrollable_new = c_adw_clamp_scrollable_new;

/** */
alias adw_clamp_scrollable_get_child = c_adw_clamp_scrollable_get_child;

/** */
alias adw_clamp_scrollable_get_maximum_size = c_adw_clamp_scrollable_get_maximum_size;

/** */
alias adw_clamp_scrollable_get_tightening_threshold = c_adw_clamp_scrollable_get_tightening_threshold;

/** */
alias adw_clamp_scrollable_get_unit = c_adw_clamp_scrollable_get_unit;

/** */
alias adw_clamp_scrollable_set_child = c_adw_clamp_scrollable_set_child;

/** */
alias adw_clamp_scrollable_set_maximum_size = c_adw_clamp_scrollable_set_maximum_size;

/** */
alias adw_clamp_scrollable_set_tightening_threshold = c_adw_clamp_scrollable_set_tightening_threshold;

/** */
alias adw_clamp_scrollable_set_unit = c_adw_clamp_scrollable_set_unit;

// ComboRow

/** */
alias adw_combo_row_get_type = c_adw_combo_row_get_type;

/** */
alias adw_combo_row_new = c_adw_combo_row_new;

/** */
alias adw_combo_row_get_enable_search = c_adw_combo_row_get_enable_search;

/** */
alias adw_combo_row_get_expression = c_adw_combo_row_get_expression;

/** */
alias adw_combo_row_get_factory = c_adw_combo_row_get_factory;

/** */
alias adw_combo_row_get_list_factory = c_adw_combo_row_get_list_factory;

/** */
alias adw_combo_row_get_model = c_adw_combo_row_get_model;

/** */
alias adw_combo_row_get_selected = c_adw_combo_row_get_selected;

/** */
alias adw_combo_row_get_selected_item = c_adw_combo_row_get_selected_item;

/** */
alias adw_combo_row_get_use_subtitle = c_adw_combo_row_get_use_subtitle;

/** */
alias adw_combo_row_set_enable_search = c_adw_combo_row_set_enable_search;

/** */
alias adw_combo_row_set_expression = c_adw_combo_row_set_expression;

/** */
alias adw_combo_row_set_factory = c_adw_combo_row_set_factory;

/** */
alias adw_combo_row_set_list_factory = c_adw_combo_row_set_list_factory;

/** */
alias adw_combo_row_set_model = c_adw_combo_row_set_model;

/** */
alias adw_combo_row_set_selected = c_adw_combo_row_set_selected;

/** */
alias adw_combo_row_set_use_subtitle = c_adw_combo_row_set_use_subtitle;

// Dialog

/** */
alias adw_dialog_get_type = c_adw_dialog_get_type;

/** */
alias adw_dialog_new = c_adw_dialog_new;

/** */
alias adw_dialog_add_breakpoint = c_adw_dialog_add_breakpoint;

/** */
alias adw_dialog_close = c_adw_dialog_close;

/** */
alias adw_dialog_force_close = c_adw_dialog_force_close;

/** */
alias adw_dialog_get_can_close = c_adw_dialog_get_can_close;

/** */
alias adw_dialog_get_child = c_adw_dialog_get_child;

/** */
alias adw_dialog_get_content_height = c_adw_dialog_get_content_height;

/** */
alias adw_dialog_get_content_width = c_adw_dialog_get_content_width;

/** */
alias adw_dialog_get_current_breakpoint = c_adw_dialog_get_current_breakpoint;

/** */
alias adw_dialog_get_default_widget = c_adw_dialog_get_default_widget;

/** */
alias adw_dialog_get_focus = c_adw_dialog_get_focus;

/** */
alias adw_dialog_get_follows_content_size = c_adw_dialog_get_follows_content_size;

/** */
alias adw_dialog_get_presentation_mode = c_adw_dialog_get_presentation_mode;

/** */
alias adw_dialog_get_title = c_adw_dialog_get_title;

/** */
alias adw_dialog_present = c_adw_dialog_present;

/** */
alias adw_dialog_set_can_close = c_adw_dialog_set_can_close;

/** */
alias adw_dialog_set_child = c_adw_dialog_set_child;

/** */
alias adw_dialog_set_content_height = c_adw_dialog_set_content_height;

/** */
alias adw_dialog_set_content_width = c_adw_dialog_set_content_width;

/** */
alias adw_dialog_set_default_widget = c_adw_dialog_set_default_widget;

/** */
alias adw_dialog_set_focus = c_adw_dialog_set_focus;

/** */
alias adw_dialog_set_follows_content_size = c_adw_dialog_set_follows_content_size;

/** */
alias adw_dialog_set_presentation_mode = c_adw_dialog_set_presentation_mode;

/** */
alias adw_dialog_set_title = c_adw_dialog_set_title;

// EntryRow

/** */
alias adw_entry_row_get_type = c_adw_entry_row_get_type;

/** */
alias adw_entry_row_new = c_adw_entry_row_new;

/** */
alias adw_entry_row_add_prefix = c_adw_entry_row_add_prefix;

/** */
alias adw_entry_row_add_suffix = c_adw_entry_row_add_suffix;

/** */
alias adw_entry_row_get_activates_default = c_adw_entry_row_get_activates_default;

/** */
alias adw_entry_row_get_attributes = c_adw_entry_row_get_attributes;

/** */
alias adw_entry_row_get_enable_emoji_completion = c_adw_entry_row_get_enable_emoji_completion;

/** */
alias adw_entry_row_get_input_hints = c_adw_entry_row_get_input_hints;

/** */
alias adw_entry_row_get_input_purpose = c_adw_entry_row_get_input_purpose;

/** */
alias adw_entry_row_get_show_apply_button = c_adw_entry_row_get_show_apply_button;

/** */
alias adw_entry_row_get_text_length = c_adw_entry_row_get_text_length;

/** */
alias adw_entry_row_grab_focus_without_selecting = c_adw_entry_row_grab_focus_without_selecting;

/** */
alias adw_entry_row_remove = c_adw_entry_row_remove;

/** */
alias adw_entry_row_set_activates_default = c_adw_entry_row_set_activates_default;

/** */
alias adw_entry_row_set_attributes = c_adw_entry_row_set_attributes;

/** */
alias adw_entry_row_set_enable_emoji_completion = c_adw_entry_row_set_enable_emoji_completion;

/** */
alias adw_entry_row_set_input_hints = c_adw_entry_row_set_input_hints;

/** */
alias adw_entry_row_set_input_purpose = c_adw_entry_row_set_input_purpose;

/** */
alias adw_entry_row_set_show_apply_button = c_adw_entry_row_set_show_apply_button;

// EnumListItem

/** */
alias adw_enum_list_item_get_type = c_adw_enum_list_item_get_type;

/** */
alias adw_enum_list_item_get_name = c_adw_enum_list_item_get_name;

/** */
alias adw_enum_list_item_get_nick = c_adw_enum_list_item_get_nick;

/** */
alias adw_enum_list_item_get_value = c_adw_enum_list_item_get_value;

// EnumListModel

/** */
alias adw_enum_list_model_get_type = c_adw_enum_list_model_get_type;

/** */
alias adw_enum_list_model_new = c_adw_enum_list_model_new;

/** */
alias adw_enum_list_model_find_position = c_adw_enum_list_model_find_position;

/** */
alias adw_enum_list_model_get_enum_type = c_adw_enum_list_model_get_enum_type;

// ExpanderRow

/** */
alias adw_expander_row_get_type = c_adw_expander_row_get_type;

/** */
alias adw_expander_row_new = c_adw_expander_row_new;

/** */
alias adw_expander_row_add_action = c_adw_expander_row_add_action;

/** */
alias adw_expander_row_add_prefix = c_adw_expander_row_add_prefix;

/** */
alias adw_expander_row_add_row = c_adw_expander_row_add_row;

/** */
alias adw_expander_row_add_suffix = c_adw_expander_row_add_suffix;

/** */
alias adw_expander_row_get_enable_expansion = c_adw_expander_row_get_enable_expansion;

/** */
alias adw_expander_row_get_expanded = c_adw_expander_row_get_expanded;

/** */
alias adw_expander_row_get_icon_name = c_adw_expander_row_get_icon_name;

/** */
alias adw_expander_row_get_show_enable_switch = c_adw_expander_row_get_show_enable_switch;

/** */
alias adw_expander_row_get_subtitle = c_adw_expander_row_get_subtitle;

/** */
alias adw_expander_row_get_subtitle_lines = c_adw_expander_row_get_subtitle_lines;

/** */
alias adw_expander_row_get_title_lines = c_adw_expander_row_get_title_lines;

/** */
alias adw_expander_row_remove = c_adw_expander_row_remove;

/** */
alias adw_expander_row_set_enable_expansion = c_adw_expander_row_set_enable_expansion;

/** */
alias adw_expander_row_set_expanded = c_adw_expander_row_set_expanded;

/** */
alias adw_expander_row_set_icon_name = c_adw_expander_row_set_icon_name;

/** */
alias adw_expander_row_set_show_enable_switch = c_adw_expander_row_set_show_enable_switch;

/** */
alias adw_expander_row_set_subtitle = c_adw_expander_row_set_subtitle;

/** */
alias adw_expander_row_set_subtitle_lines = c_adw_expander_row_set_subtitle_lines;

/** */
alias adw_expander_row_set_title_lines = c_adw_expander_row_set_title_lines;

// Flap

/** */
alias adw_flap_get_type = c_adw_flap_get_type;

/** */
alias adw_flap_new = c_adw_flap_new;

/** */
alias adw_flap_get_content = c_adw_flap_get_content;

/** */
alias adw_flap_get_flap = c_adw_flap_get_flap;

/** */
alias adw_flap_get_flap_position = c_adw_flap_get_flap_position;

/** */
alias adw_flap_get_fold_duration = c_adw_flap_get_fold_duration;

/** */
alias adw_flap_get_fold_policy = c_adw_flap_get_fold_policy;

/** */
alias adw_flap_get_fold_threshold_policy = c_adw_flap_get_fold_threshold_policy;

/** */
alias adw_flap_get_folded = c_adw_flap_get_folded;

/** */
alias adw_flap_get_locked = c_adw_flap_get_locked;

/** */
alias adw_flap_get_modal = c_adw_flap_get_modal;

/** */
alias adw_flap_get_reveal_flap = c_adw_flap_get_reveal_flap;

/** */
alias adw_flap_get_reveal_params = c_adw_flap_get_reveal_params;

/** */
alias adw_flap_get_reveal_progress = c_adw_flap_get_reveal_progress;

/** */
alias adw_flap_get_separator = c_adw_flap_get_separator;

/** */
alias adw_flap_get_swipe_to_close = c_adw_flap_get_swipe_to_close;

/** */
alias adw_flap_get_swipe_to_open = c_adw_flap_get_swipe_to_open;

/** */
alias adw_flap_get_transition_type = c_adw_flap_get_transition_type;

/** */
alias adw_flap_set_content = c_adw_flap_set_content;

/** */
alias adw_flap_set_flap = c_adw_flap_set_flap;

/** */
alias adw_flap_set_flap_position = c_adw_flap_set_flap_position;

/** */
alias adw_flap_set_fold_duration = c_adw_flap_set_fold_duration;

/** */
alias adw_flap_set_fold_policy = c_adw_flap_set_fold_policy;

/** */
alias adw_flap_set_fold_threshold_policy = c_adw_flap_set_fold_threshold_policy;

/** */
alias adw_flap_set_locked = c_adw_flap_set_locked;

/** */
alias adw_flap_set_modal = c_adw_flap_set_modal;

/** */
alias adw_flap_set_reveal_flap = c_adw_flap_set_reveal_flap;

/** */
alias adw_flap_set_reveal_params = c_adw_flap_set_reveal_params;

/** */
alias adw_flap_set_separator = c_adw_flap_set_separator;

/** */
alias adw_flap_set_swipe_to_close = c_adw_flap_set_swipe_to_close;

/** */
alias adw_flap_set_swipe_to_open = c_adw_flap_set_swipe_to_open;

/** */
alias adw_flap_set_transition_type = c_adw_flap_set_transition_type;

// HeaderBar

/** */
alias adw_header_bar_get_type = c_adw_header_bar_get_type;

/** */
alias adw_header_bar_new = c_adw_header_bar_new;

/** */
alias adw_header_bar_get_centering_policy = c_adw_header_bar_get_centering_policy;

/** */
alias adw_header_bar_get_decoration_layout = c_adw_header_bar_get_decoration_layout;

/** */
alias adw_header_bar_get_show_back_button = c_adw_header_bar_get_show_back_button;

/** */
alias adw_header_bar_get_show_end_title_buttons = c_adw_header_bar_get_show_end_title_buttons;

/** */
alias adw_header_bar_get_show_start_title_buttons = c_adw_header_bar_get_show_start_title_buttons;

/** */
alias adw_header_bar_get_show_title = c_adw_header_bar_get_show_title;

/** */
alias adw_header_bar_get_title_widget = c_adw_header_bar_get_title_widget;

/** */
alias adw_header_bar_pack_end = c_adw_header_bar_pack_end;

/** */
alias adw_header_bar_pack_start = c_adw_header_bar_pack_start;

/** */
alias adw_header_bar_remove = c_adw_header_bar_remove;

/** */
alias adw_header_bar_set_centering_policy = c_adw_header_bar_set_centering_policy;

/** */
alias adw_header_bar_set_decoration_layout = c_adw_header_bar_set_decoration_layout;

/** */
alias adw_header_bar_set_show_back_button = c_adw_header_bar_set_show_back_button;

/** */
alias adw_header_bar_set_show_end_title_buttons = c_adw_header_bar_set_show_end_title_buttons;

/** */
alias adw_header_bar_set_show_start_title_buttons = c_adw_header_bar_set_show_start_title_buttons;

/** */
alias adw_header_bar_set_show_title = c_adw_header_bar_set_show_title;

/** */
alias adw_header_bar_set_title_widget = c_adw_header_bar_set_title_widget;

// Leaflet

/** */
alias adw_leaflet_get_type = c_adw_leaflet_get_type;

/** */
alias adw_leaflet_new = c_adw_leaflet_new;

/** */
alias adw_leaflet_append = c_adw_leaflet_append;

/** */
alias adw_leaflet_get_adjacent_child = c_adw_leaflet_get_adjacent_child;

/** */
alias adw_leaflet_get_can_navigate_back = c_adw_leaflet_get_can_navigate_back;

/** */
alias adw_leaflet_get_can_navigate_forward = c_adw_leaflet_get_can_navigate_forward;

/** */
alias adw_leaflet_get_can_unfold = c_adw_leaflet_get_can_unfold;

/** */
alias adw_leaflet_get_child_by_name = c_adw_leaflet_get_child_by_name;

/** */
alias adw_leaflet_get_child_transition_params = c_adw_leaflet_get_child_transition_params;

/** */
alias adw_leaflet_get_child_transition_running = c_adw_leaflet_get_child_transition_running;

/** */
alias adw_leaflet_get_fold_threshold_policy = c_adw_leaflet_get_fold_threshold_policy;

/** */
alias adw_leaflet_get_folded = c_adw_leaflet_get_folded;

/** */
alias adw_leaflet_get_homogeneous = c_adw_leaflet_get_homogeneous;

/** */
alias adw_leaflet_get_mode_transition_duration = c_adw_leaflet_get_mode_transition_duration;

/** */
alias adw_leaflet_get_page = c_adw_leaflet_get_page;

/** */
alias adw_leaflet_get_pages = c_adw_leaflet_get_pages;

/** */
alias adw_leaflet_get_transition_type = c_adw_leaflet_get_transition_type;

/** */
alias adw_leaflet_get_visible_child = c_adw_leaflet_get_visible_child;

/** */
alias adw_leaflet_get_visible_child_name = c_adw_leaflet_get_visible_child_name;

/** */
alias adw_leaflet_insert_child_after = c_adw_leaflet_insert_child_after;

/** */
alias adw_leaflet_navigate = c_adw_leaflet_navigate;

/** */
alias adw_leaflet_prepend = c_adw_leaflet_prepend;

/** */
alias adw_leaflet_remove = c_adw_leaflet_remove;

/** */
alias adw_leaflet_reorder_child_after = c_adw_leaflet_reorder_child_after;

/** */
alias adw_leaflet_set_can_navigate_back = c_adw_leaflet_set_can_navigate_back;

/** */
alias adw_leaflet_set_can_navigate_forward = c_adw_leaflet_set_can_navigate_forward;

/** */
alias adw_leaflet_set_can_unfold = c_adw_leaflet_set_can_unfold;

/** */
alias adw_leaflet_set_child_transition_params = c_adw_leaflet_set_child_transition_params;

/** */
alias adw_leaflet_set_fold_threshold_policy = c_adw_leaflet_set_fold_threshold_policy;

/** */
alias adw_leaflet_set_homogeneous = c_adw_leaflet_set_homogeneous;

/** */
alias adw_leaflet_set_mode_transition_duration = c_adw_leaflet_set_mode_transition_duration;

/** */
alias adw_leaflet_set_transition_type = c_adw_leaflet_set_transition_type;

/** */
alias adw_leaflet_set_visible_child = c_adw_leaflet_set_visible_child;

/** */
alias adw_leaflet_set_visible_child_name = c_adw_leaflet_set_visible_child_name;

// LeafletPage

/** */
alias adw_leaflet_page_get_type = c_adw_leaflet_page_get_type;

/** */
alias adw_leaflet_page_get_child = c_adw_leaflet_page_get_child;

/** */
alias adw_leaflet_page_get_name = c_adw_leaflet_page_get_name;

/** */
alias adw_leaflet_page_get_navigatable = c_adw_leaflet_page_get_navigatable;

/** */
alias adw_leaflet_page_set_name = c_adw_leaflet_page_set_name;

/** */
alias adw_leaflet_page_set_navigatable = c_adw_leaflet_page_set_navigatable;

// MessageDialog

/** */
alias adw_message_dialog_get_type = c_adw_message_dialog_get_type;

/** */
alias adw_message_dialog_new = c_adw_message_dialog_new;

/** */
alias adw_message_dialog_add_response = c_adw_message_dialog_add_response;

/** */
alias adw_message_dialog_add_responses = c_adw_message_dialog_add_responses;

/** */
alias adw_message_dialog_choose = c_adw_message_dialog_choose;

/** */
alias adw_message_dialog_choose_finish = c_adw_message_dialog_choose_finish;

/** */
alias adw_message_dialog_format_body = c_adw_message_dialog_format_body;

/** */
alias adw_message_dialog_format_body_markup = c_adw_message_dialog_format_body_markup;

/** */
alias adw_message_dialog_format_heading = c_adw_message_dialog_format_heading;

/** */
alias adw_message_dialog_format_heading_markup = c_adw_message_dialog_format_heading_markup;

/** */
alias adw_message_dialog_get_body = c_adw_message_dialog_get_body;

/** */
alias adw_message_dialog_get_body_use_markup = c_adw_message_dialog_get_body_use_markup;

/** */
alias adw_message_dialog_get_close_response = c_adw_message_dialog_get_close_response;

/** */
alias adw_message_dialog_get_default_response = c_adw_message_dialog_get_default_response;

/** */
alias adw_message_dialog_get_extra_child = c_adw_message_dialog_get_extra_child;

/** */
alias adw_message_dialog_get_heading = c_adw_message_dialog_get_heading;

/** */
alias adw_message_dialog_get_heading_use_markup = c_adw_message_dialog_get_heading_use_markup;

/** */
alias adw_message_dialog_get_response_appearance = c_adw_message_dialog_get_response_appearance;

/** */
alias adw_message_dialog_get_response_enabled = c_adw_message_dialog_get_response_enabled;

/** */
alias adw_message_dialog_get_response_label = c_adw_message_dialog_get_response_label;

/** */
alias adw_message_dialog_has_response = c_adw_message_dialog_has_response;

/** */
alias adw_message_dialog_remove_response = c_adw_message_dialog_remove_response;

/** */
alias adw_message_dialog_response = c_adw_message_dialog_response;

/** */
alias adw_message_dialog_set_body = c_adw_message_dialog_set_body;

/** */
alias adw_message_dialog_set_body_use_markup = c_adw_message_dialog_set_body_use_markup;

/** */
alias adw_message_dialog_set_close_response = c_adw_message_dialog_set_close_response;

/** */
alias adw_message_dialog_set_default_response = c_adw_message_dialog_set_default_response;

/** */
alias adw_message_dialog_set_extra_child = c_adw_message_dialog_set_extra_child;

/** */
alias adw_message_dialog_set_heading = c_adw_message_dialog_set_heading;

/** */
alias adw_message_dialog_set_heading_use_markup = c_adw_message_dialog_set_heading_use_markup;

/** */
alias adw_message_dialog_set_response_appearance = c_adw_message_dialog_set_response_appearance;

/** */
alias adw_message_dialog_set_response_enabled = c_adw_message_dialog_set_response_enabled;

/** */
alias adw_message_dialog_set_response_label = c_adw_message_dialog_set_response_label;

// NavigationPage

/** */
alias adw_navigation_page_get_type = c_adw_navigation_page_get_type;

/** */
alias adw_navigation_page_new = c_adw_navigation_page_new;

/** */
alias adw_navigation_page_new_with_tag = c_adw_navigation_page_new_with_tag;

/** */
alias adw_navigation_page_get_can_pop = c_adw_navigation_page_get_can_pop;

/** */
alias adw_navigation_page_get_child = c_adw_navigation_page_get_child;

/** */
alias adw_navigation_page_get_tag = c_adw_navigation_page_get_tag;

/** */
alias adw_navigation_page_get_title = c_adw_navigation_page_get_title;

/** */
alias adw_navigation_page_set_can_pop = c_adw_navigation_page_set_can_pop;

/** */
alias adw_navigation_page_set_child = c_adw_navigation_page_set_child;

/** */
alias adw_navigation_page_set_tag = c_adw_navigation_page_set_tag;

/** */
alias adw_navigation_page_set_title = c_adw_navigation_page_set_title;

// NavigationSplitView

/** */
alias adw_navigation_split_view_get_type = c_adw_navigation_split_view_get_type;

/** */
alias adw_navigation_split_view_new = c_adw_navigation_split_view_new;

/** */
alias adw_navigation_split_view_get_collapsed = c_adw_navigation_split_view_get_collapsed;

/** */
alias adw_navigation_split_view_get_content = c_adw_navigation_split_view_get_content;

/** */
alias adw_navigation_split_view_get_max_sidebar_width = c_adw_navigation_split_view_get_max_sidebar_width;

/** */
alias adw_navigation_split_view_get_min_sidebar_width = c_adw_navigation_split_view_get_min_sidebar_width;

/** */
alias adw_navigation_split_view_get_show_content = c_adw_navigation_split_view_get_show_content;

/** */
alias adw_navigation_split_view_get_sidebar = c_adw_navigation_split_view_get_sidebar;

/** */
alias adw_navigation_split_view_get_sidebar_width_fraction = c_adw_navigation_split_view_get_sidebar_width_fraction;

/** */
alias adw_navigation_split_view_get_sidebar_width_unit = c_adw_navigation_split_view_get_sidebar_width_unit;

/** */
alias adw_navigation_split_view_set_collapsed = c_adw_navigation_split_view_set_collapsed;

/** */
alias adw_navigation_split_view_set_content = c_adw_navigation_split_view_set_content;

/** */
alias adw_navigation_split_view_set_max_sidebar_width = c_adw_navigation_split_view_set_max_sidebar_width;

/** */
alias adw_navigation_split_view_set_min_sidebar_width = c_adw_navigation_split_view_set_min_sidebar_width;

/** */
alias adw_navigation_split_view_set_show_content = c_adw_navigation_split_view_set_show_content;

/** */
alias adw_navigation_split_view_set_sidebar = c_adw_navigation_split_view_set_sidebar;

/** */
alias adw_navigation_split_view_set_sidebar_width_fraction = c_adw_navigation_split_view_set_sidebar_width_fraction;

/** */
alias adw_navigation_split_view_set_sidebar_width_unit = c_adw_navigation_split_view_set_sidebar_width_unit;

// NavigationView

/** */
alias adw_navigation_view_get_type = c_adw_navigation_view_get_type;

/** */
alias adw_navigation_view_new = c_adw_navigation_view_new;

/** */
alias adw_navigation_view_add = c_adw_navigation_view_add;

/** */
alias adw_navigation_view_find_page = c_adw_navigation_view_find_page;

/** */
alias adw_navigation_view_get_animate_transitions = c_adw_navigation_view_get_animate_transitions;

/** */
alias adw_navigation_view_get_navigation_stack = c_adw_navigation_view_get_navigation_stack;

/** */
alias adw_navigation_view_get_pop_on_escape = c_adw_navigation_view_get_pop_on_escape;

/** */
alias adw_navigation_view_get_previous_page = c_adw_navigation_view_get_previous_page;

/** */
alias adw_navigation_view_get_visible_page = c_adw_navigation_view_get_visible_page;

/** */
alias adw_navigation_view_pop = c_adw_navigation_view_pop;

/** */
alias adw_navigation_view_pop_to_page = c_adw_navigation_view_pop_to_page;

/** */
alias adw_navigation_view_pop_to_tag = c_adw_navigation_view_pop_to_tag;

/** */
alias adw_navigation_view_push = c_adw_navigation_view_push;

/** */
alias adw_navigation_view_push_by_tag = c_adw_navigation_view_push_by_tag;

/** */
alias adw_navigation_view_remove = c_adw_navigation_view_remove;

/** */
alias adw_navigation_view_replace = c_adw_navigation_view_replace;

/** */
alias adw_navigation_view_replace_with_tags = c_adw_navigation_view_replace_with_tags;

/** */
alias adw_navigation_view_set_animate_transitions = c_adw_navigation_view_set_animate_transitions;

/** */
alias adw_navigation_view_set_pop_on_escape = c_adw_navigation_view_set_pop_on_escape;

// OverlaySplitView

/** */
alias adw_overlay_split_view_get_type = c_adw_overlay_split_view_get_type;

/** */
alias adw_overlay_split_view_new = c_adw_overlay_split_view_new;

/** */
alias adw_overlay_split_view_get_collapsed = c_adw_overlay_split_view_get_collapsed;

/** */
alias adw_overlay_split_view_get_content = c_adw_overlay_split_view_get_content;

/** */
alias adw_overlay_split_view_get_enable_hide_gesture = c_adw_overlay_split_view_get_enable_hide_gesture;

/** */
alias adw_overlay_split_view_get_enable_show_gesture = c_adw_overlay_split_view_get_enable_show_gesture;

/** */
alias adw_overlay_split_view_get_max_sidebar_width = c_adw_overlay_split_view_get_max_sidebar_width;

/** */
alias adw_overlay_split_view_get_min_sidebar_width = c_adw_overlay_split_view_get_min_sidebar_width;

/** */
alias adw_overlay_split_view_get_pin_sidebar = c_adw_overlay_split_view_get_pin_sidebar;

/** */
alias adw_overlay_split_view_get_show_sidebar = c_adw_overlay_split_view_get_show_sidebar;

/** */
alias adw_overlay_split_view_get_sidebar = c_adw_overlay_split_view_get_sidebar;

/** */
alias adw_overlay_split_view_get_sidebar_position = c_adw_overlay_split_view_get_sidebar_position;

/** */
alias adw_overlay_split_view_get_sidebar_width_fraction = c_adw_overlay_split_view_get_sidebar_width_fraction;

/** */
alias adw_overlay_split_view_get_sidebar_width_unit = c_adw_overlay_split_view_get_sidebar_width_unit;

/** */
alias adw_overlay_split_view_set_collapsed = c_adw_overlay_split_view_set_collapsed;

/** */
alias adw_overlay_split_view_set_content = c_adw_overlay_split_view_set_content;

/** */
alias adw_overlay_split_view_set_enable_hide_gesture = c_adw_overlay_split_view_set_enable_hide_gesture;

/** */
alias adw_overlay_split_view_set_enable_show_gesture = c_adw_overlay_split_view_set_enable_show_gesture;

/** */
alias adw_overlay_split_view_set_max_sidebar_width = c_adw_overlay_split_view_set_max_sidebar_width;

/** */
alias adw_overlay_split_view_set_min_sidebar_width = c_adw_overlay_split_view_set_min_sidebar_width;

/** */
alias adw_overlay_split_view_set_pin_sidebar = c_adw_overlay_split_view_set_pin_sidebar;

/** */
alias adw_overlay_split_view_set_show_sidebar = c_adw_overlay_split_view_set_show_sidebar;

/** */
alias adw_overlay_split_view_set_sidebar = c_adw_overlay_split_view_set_sidebar;

/** */
alias adw_overlay_split_view_set_sidebar_position = c_adw_overlay_split_view_set_sidebar_position;

/** */
alias adw_overlay_split_view_set_sidebar_width_fraction = c_adw_overlay_split_view_set_sidebar_width_fraction;

/** */
alias adw_overlay_split_view_set_sidebar_width_unit = c_adw_overlay_split_view_set_sidebar_width_unit;

// PasswordEntryRow

/** */
alias adw_password_entry_row_get_type = c_adw_password_entry_row_get_type;

/** */
alias adw_password_entry_row_new = c_adw_password_entry_row_new;

// PreferencesDialog

/** */
alias adw_preferences_dialog_get_type = c_adw_preferences_dialog_get_type;

/** */
alias adw_preferences_dialog_new = c_adw_preferences_dialog_new;

/** */
alias adw_preferences_dialog_add = c_adw_preferences_dialog_add;

/** */
alias adw_preferences_dialog_add_toast = c_adw_preferences_dialog_add_toast;

/** */
alias adw_preferences_dialog_get_search_enabled = c_adw_preferences_dialog_get_search_enabled;

/** */
alias adw_preferences_dialog_get_visible_page = c_adw_preferences_dialog_get_visible_page;

/** */
alias adw_preferences_dialog_get_visible_page_name = c_adw_preferences_dialog_get_visible_page_name;

/** */
alias adw_preferences_dialog_pop_subpage = c_adw_preferences_dialog_pop_subpage;

/** */
alias adw_preferences_dialog_push_subpage = c_adw_preferences_dialog_push_subpage;

/** */
alias adw_preferences_dialog_remove = c_adw_preferences_dialog_remove;

/** */
alias adw_preferences_dialog_set_search_enabled = c_adw_preferences_dialog_set_search_enabled;

/** */
alias adw_preferences_dialog_set_visible_page = c_adw_preferences_dialog_set_visible_page;

/** */
alias adw_preferences_dialog_set_visible_page_name = c_adw_preferences_dialog_set_visible_page_name;

// PreferencesGroup

/** */
alias adw_preferences_group_get_type = c_adw_preferences_group_get_type;

/** */
alias adw_preferences_group_new = c_adw_preferences_group_new;

/** */
alias adw_preferences_group_add = c_adw_preferences_group_add;

/** */
alias adw_preferences_group_get_description = c_adw_preferences_group_get_description;

/** */
alias adw_preferences_group_get_header_suffix = c_adw_preferences_group_get_header_suffix;

/** */
alias adw_preferences_group_get_title = c_adw_preferences_group_get_title;

/** */
alias adw_preferences_group_remove = c_adw_preferences_group_remove;

/** */
alias adw_preferences_group_set_description = c_adw_preferences_group_set_description;

/** */
alias adw_preferences_group_set_header_suffix = c_adw_preferences_group_set_header_suffix;

/** */
alias adw_preferences_group_set_title = c_adw_preferences_group_set_title;

// PreferencesPage

/** */
alias adw_preferences_page_get_type = c_adw_preferences_page_get_type;

/** */
alias adw_preferences_page_new = c_adw_preferences_page_new;

/** */
alias adw_preferences_page_add = c_adw_preferences_page_add;

/** */
alias adw_preferences_page_get_description = c_adw_preferences_page_get_description;

/** */
alias adw_preferences_page_get_icon_name = c_adw_preferences_page_get_icon_name;

/** */
alias adw_preferences_page_get_name = c_adw_preferences_page_get_name;

/** */
alias adw_preferences_page_get_title = c_adw_preferences_page_get_title;

/** */
alias adw_preferences_page_get_use_underline = c_adw_preferences_page_get_use_underline;

/** */
alias adw_preferences_page_remove = c_adw_preferences_page_remove;

/** */
alias adw_preferences_page_scroll_to_top = c_adw_preferences_page_scroll_to_top;

/** */
alias adw_preferences_page_set_description = c_adw_preferences_page_set_description;

/** */
alias adw_preferences_page_set_icon_name = c_adw_preferences_page_set_icon_name;

/** */
alias adw_preferences_page_set_name = c_adw_preferences_page_set_name;

/** */
alias adw_preferences_page_set_title = c_adw_preferences_page_set_title;

/** */
alias adw_preferences_page_set_use_underline = c_adw_preferences_page_set_use_underline;

// PreferencesRow

/** */
alias adw_preferences_row_get_type = c_adw_preferences_row_get_type;

/** */
alias adw_preferences_row_new = c_adw_preferences_row_new;

/** */
alias adw_preferences_row_get_title = c_adw_preferences_row_get_title;

/** */
alias adw_preferences_row_get_title_selectable = c_adw_preferences_row_get_title_selectable;

/** */
alias adw_preferences_row_get_use_markup = c_adw_preferences_row_get_use_markup;

/** */
alias adw_preferences_row_get_use_underline = c_adw_preferences_row_get_use_underline;

/** */
alias adw_preferences_row_set_title = c_adw_preferences_row_set_title;

/** */
alias adw_preferences_row_set_title_selectable = c_adw_preferences_row_set_title_selectable;

/** */
alias adw_preferences_row_set_use_markup = c_adw_preferences_row_set_use_markup;

/** */
alias adw_preferences_row_set_use_underline = c_adw_preferences_row_set_use_underline;

// PreferencesWindow

/** */
alias adw_preferences_window_get_type = c_adw_preferences_window_get_type;

/** */
alias adw_preferences_window_new = c_adw_preferences_window_new;

/** */
alias adw_preferences_window_add = c_adw_preferences_window_add;

/** */
alias adw_preferences_window_add_toast = c_adw_preferences_window_add_toast;

/** */
alias adw_preferences_window_close_subpage = c_adw_preferences_window_close_subpage;

/** */
alias adw_preferences_window_get_can_navigate_back = c_adw_preferences_window_get_can_navigate_back;

/** */
alias adw_preferences_window_get_search_enabled = c_adw_preferences_window_get_search_enabled;

/** */
alias adw_preferences_window_get_visible_page = c_adw_preferences_window_get_visible_page;

/** */
alias adw_preferences_window_get_visible_page_name = c_adw_preferences_window_get_visible_page_name;

/** */
alias adw_preferences_window_pop_subpage = c_adw_preferences_window_pop_subpage;

/** */
alias adw_preferences_window_present_subpage = c_adw_preferences_window_present_subpage;

/** */
alias adw_preferences_window_push_subpage = c_adw_preferences_window_push_subpage;

/** */
alias adw_preferences_window_remove = c_adw_preferences_window_remove;

/** */
alias adw_preferences_window_set_can_navigate_back = c_adw_preferences_window_set_can_navigate_back;

/** */
alias adw_preferences_window_set_search_enabled = c_adw_preferences_window_set_search_enabled;

/** */
alias adw_preferences_window_set_visible_page = c_adw_preferences_window_set_visible_page;

/** */
alias adw_preferences_window_set_visible_page_name = c_adw_preferences_window_set_visible_page_name;

// PropertyAnimationTarget

/** */
alias adw_property_animation_target_get_type = c_adw_property_animation_target_get_type;

/** */
alias adw_property_animation_target_new = c_adw_property_animation_target_new;

/** */
alias adw_property_animation_target_new_for_pspec = c_adw_property_animation_target_new_for_pspec;

/** */
alias adw_property_animation_target_get_object = c_adw_property_animation_target_get_object;

/** */
alias adw_property_animation_target_get_pspec = c_adw_property_animation_target_get_pspec;

// SpinRow

/** */
alias adw_spin_row_get_type = c_adw_spin_row_get_type;

/** */
alias adw_spin_row_new = c_adw_spin_row_new;

/** */
alias adw_spin_row_new_with_range = c_adw_spin_row_new_with_range;

/** */
alias adw_spin_row_configure = c_adw_spin_row_configure;

/** */
alias adw_spin_row_get_adjustment = c_adw_spin_row_get_adjustment;

/** */
alias adw_spin_row_get_climb_rate = c_adw_spin_row_get_climb_rate;

/** */
alias adw_spin_row_get_digits = c_adw_spin_row_get_digits;

/** */
alias adw_spin_row_get_numeric = c_adw_spin_row_get_numeric;

/** */
alias adw_spin_row_get_snap_to_ticks = c_adw_spin_row_get_snap_to_ticks;

/** */
alias adw_spin_row_get_update_policy = c_adw_spin_row_get_update_policy;

/** */
alias adw_spin_row_get_value = c_adw_spin_row_get_value;

/** */
alias adw_spin_row_get_wrap = c_adw_spin_row_get_wrap;

/** */
alias adw_spin_row_set_adjustment = c_adw_spin_row_set_adjustment;

/** */
alias adw_spin_row_set_climb_rate = c_adw_spin_row_set_climb_rate;

/** */
alias adw_spin_row_set_digits = c_adw_spin_row_set_digits;

/** */
alias adw_spin_row_set_numeric = c_adw_spin_row_set_numeric;

/** */
alias adw_spin_row_set_range = c_adw_spin_row_set_range;

/** */
alias adw_spin_row_set_snap_to_ticks = c_adw_spin_row_set_snap_to_ticks;

/** */
alias adw_spin_row_set_update_policy = c_adw_spin_row_set_update_policy;

/** */
alias adw_spin_row_set_value = c_adw_spin_row_set_value;

/** */
alias adw_spin_row_set_wrap = c_adw_spin_row_set_wrap;

/** */
alias adw_spin_row_update = c_adw_spin_row_update;

// SplitButton

/** */
alias adw_split_button_get_type = c_adw_split_button_get_type;

/** */
alias adw_split_button_new = c_adw_split_button_new;

/** */
alias adw_split_button_get_can_shrink = c_adw_split_button_get_can_shrink;

/** */
alias adw_split_button_get_child = c_adw_split_button_get_child;

/** */
alias adw_split_button_get_direction = c_adw_split_button_get_direction;

/** */
alias adw_split_button_get_dropdown_tooltip = c_adw_split_button_get_dropdown_tooltip;

/** */
alias adw_split_button_get_icon_name = c_adw_split_button_get_icon_name;

/** */
alias adw_split_button_get_label = c_adw_split_button_get_label;

/** */
alias adw_split_button_get_menu_model = c_adw_split_button_get_menu_model;

/** */
alias adw_split_button_get_popover = c_adw_split_button_get_popover;

/** */
alias adw_split_button_get_use_underline = c_adw_split_button_get_use_underline;

/** */
alias adw_split_button_popdown = c_adw_split_button_popdown;

/** */
alias adw_split_button_popup = c_adw_split_button_popup;

/** */
alias adw_split_button_set_can_shrink = c_adw_split_button_set_can_shrink;

/** */
alias adw_split_button_set_child = c_adw_split_button_set_child;

/** */
alias adw_split_button_set_direction = c_adw_split_button_set_direction;

/** */
alias adw_split_button_set_dropdown_tooltip = c_adw_split_button_set_dropdown_tooltip;

/** */
alias adw_split_button_set_icon_name = c_adw_split_button_set_icon_name;

/** */
alias adw_split_button_set_label = c_adw_split_button_set_label;

/** */
alias adw_split_button_set_menu_model = c_adw_split_button_set_menu_model;

/** */
alias adw_split_button_set_popover = c_adw_split_button_set_popover;

/** */
alias adw_split_button_set_use_underline = c_adw_split_button_set_use_underline;

// SpringAnimation

/** */
alias adw_spring_animation_get_type = c_adw_spring_animation_get_type;

/** */
alias adw_spring_animation_new = c_adw_spring_animation_new;

/** */
alias adw_spring_animation_calculate_value = c_adw_spring_animation_calculate_value;

/** */
alias adw_spring_animation_calculate_velocity = c_adw_spring_animation_calculate_velocity;

/** */
alias adw_spring_animation_get_clamp = c_adw_spring_animation_get_clamp;

/** */
alias adw_spring_animation_get_epsilon = c_adw_spring_animation_get_epsilon;

/** */
alias adw_spring_animation_get_estimated_duration = c_adw_spring_animation_get_estimated_duration;

/** */
alias adw_spring_animation_get_initial_velocity = c_adw_spring_animation_get_initial_velocity;

/** */
alias adw_spring_animation_get_spring_params = c_adw_spring_animation_get_spring_params;

/** */
alias adw_spring_animation_get_value_from = c_adw_spring_animation_get_value_from;

/** */
alias adw_spring_animation_get_value_to = c_adw_spring_animation_get_value_to;

/** */
alias adw_spring_animation_get_velocity = c_adw_spring_animation_get_velocity;

/** */
alias adw_spring_animation_set_clamp = c_adw_spring_animation_set_clamp;

/** */
alias adw_spring_animation_set_epsilon = c_adw_spring_animation_set_epsilon;

/** */
alias adw_spring_animation_set_initial_velocity = c_adw_spring_animation_set_initial_velocity;

/** */
alias adw_spring_animation_set_spring_params = c_adw_spring_animation_set_spring_params;

/** */
alias adw_spring_animation_set_value_from = c_adw_spring_animation_set_value_from;

/** */
alias adw_spring_animation_set_value_to = c_adw_spring_animation_set_value_to;

// SpringParams

/** */
alias adw_spring_params_get_type = c_adw_spring_params_get_type;

/** */
alias adw_spring_params_new = c_adw_spring_params_new;

/** */
alias adw_spring_params_new_full = c_adw_spring_params_new_full;

/** */
alias adw_spring_params_get_damping = c_adw_spring_params_get_damping;

/** */
alias adw_spring_params_get_damping_ratio = c_adw_spring_params_get_damping_ratio;

/** */
alias adw_spring_params_get_mass = c_adw_spring_params_get_mass;

/** */
alias adw_spring_params_get_stiffness = c_adw_spring_params_get_stiffness;

/** */
alias adw_spring_params_ref = c_adw_spring_params_ref;

/** */
alias adw_spring_params_unref = c_adw_spring_params_unref;

// Squeezer

/** */
alias adw_squeezer_get_type = c_adw_squeezer_get_type;

/** */
alias adw_squeezer_new = c_adw_squeezer_new;

/** */
alias adw_squeezer_add = c_adw_squeezer_add;

/** */
alias adw_squeezer_get_allow_none = c_adw_squeezer_get_allow_none;

/** */
alias adw_squeezer_get_homogeneous = c_adw_squeezer_get_homogeneous;

/** */
alias adw_squeezer_get_interpolate_size = c_adw_squeezer_get_interpolate_size;

/** */
alias adw_squeezer_get_page = c_adw_squeezer_get_page;

/** */
alias adw_squeezer_get_pages = c_adw_squeezer_get_pages;

/** */
alias adw_squeezer_get_switch_threshold_policy = c_adw_squeezer_get_switch_threshold_policy;

/** */
alias adw_squeezer_get_transition_duration = c_adw_squeezer_get_transition_duration;

/** */
alias adw_squeezer_get_transition_running = c_adw_squeezer_get_transition_running;

/** */
alias adw_squeezer_get_transition_type = c_adw_squeezer_get_transition_type;

/** */
alias adw_squeezer_get_visible_child = c_adw_squeezer_get_visible_child;

/** */
alias adw_squeezer_get_xalign = c_adw_squeezer_get_xalign;

/** */
alias adw_squeezer_get_yalign = c_adw_squeezer_get_yalign;

/** */
alias adw_squeezer_remove = c_adw_squeezer_remove;

/** */
alias adw_squeezer_set_allow_none = c_adw_squeezer_set_allow_none;

/** */
alias adw_squeezer_set_homogeneous = c_adw_squeezer_set_homogeneous;

/** */
alias adw_squeezer_set_interpolate_size = c_adw_squeezer_set_interpolate_size;

/** */
alias adw_squeezer_set_switch_threshold_policy = c_adw_squeezer_set_switch_threshold_policy;

/** */
alias adw_squeezer_set_transition_duration = c_adw_squeezer_set_transition_duration;

/** */
alias adw_squeezer_set_transition_type = c_adw_squeezer_set_transition_type;

/** */
alias adw_squeezer_set_xalign = c_adw_squeezer_set_xalign;

/** */
alias adw_squeezer_set_yalign = c_adw_squeezer_set_yalign;

// SqueezerPage

/** */
alias adw_squeezer_page_get_type = c_adw_squeezer_page_get_type;

/** */
alias adw_squeezer_page_get_child = c_adw_squeezer_page_get_child;

/** */
alias adw_squeezer_page_get_enabled = c_adw_squeezer_page_get_enabled;

/** */
alias adw_squeezer_page_set_enabled = c_adw_squeezer_page_set_enabled;

// StatusPage

/** */
alias adw_status_page_get_type = c_adw_status_page_get_type;

/** */
alias adw_status_page_new = c_adw_status_page_new;

/** */
alias adw_status_page_get_child = c_adw_status_page_get_child;

/** */
alias adw_status_page_get_description = c_adw_status_page_get_description;

/** */
alias adw_status_page_get_icon_name = c_adw_status_page_get_icon_name;

/** */
alias adw_status_page_get_paintable = c_adw_status_page_get_paintable;

/** */
alias adw_status_page_get_title = c_adw_status_page_get_title;

/** */
alias adw_status_page_set_child = c_adw_status_page_set_child;

/** */
alias adw_status_page_set_description = c_adw_status_page_set_description;

/** */
alias adw_status_page_set_icon_name = c_adw_status_page_set_icon_name;

/** */
alias adw_status_page_set_paintable = c_adw_status_page_set_paintable;

/** */
alias adw_status_page_set_title = c_adw_status_page_set_title;

// StyleManager

/** */
alias adw_style_manager_get_type = c_adw_style_manager_get_type;

/** */
alias adw_style_manager_get_default = c_adw_style_manager_get_default;

/** */
alias adw_style_manager_get_for_display = c_adw_style_manager_get_for_display;

/** */
alias adw_style_manager_get_color_scheme = c_adw_style_manager_get_color_scheme;

/** */
alias adw_style_manager_get_dark = c_adw_style_manager_get_dark;

/** */
alias adw_style_manager_get_display = c_adw_style_manager_get_display;

/** */
alias adw_style_manager_get_high_contrast = c_adw_style_manager_get_high_contrast;

/** */
alias adw_style_manager_get_system_supports_color_schemes = c_adw_style_manager_get_system_supports_color_schemes;

/** */
alias adw_style_manager_set_color_scheme = c_adw_style_manager_set_color_scheme;

// SwipeTracker

/** */
alias adw_swipe_tracker_get_type = c_adw_swipe_tracker_get_type;

/** */
alias adw_swipe_tracker_new = c_adw_swipe_tracker_new;

/** */
alias adw_swipe_tracker_get_allow_long_swipes = c_adw_swipe_tracker_get_allow_long_swipes;

/** */
alias adw_swipe_tracker_get_allow_mouse_drag = c_adw_swipe_tracker_get_allow_mouse_drag;

/** */
alias adw_swipe_tracker_get_allow_window_handle = c_adw_swipe_tracker_get_allow_window_handle;

/** */
alias adw_swipe_tracker_get_enabled = c_adw_swipe_tracker_get_enabled;

/** */
alias adw_swipe_tracker_get_lower_overshoot = c_adw_swipe_tracker_get_lower_overshoot;

/** */
alias adw_swipe_tracker_get_reversed = c_adw_swipe_tracker_get_reversed;

/** */
alias adw_swipe_tracker_get_swipeable = c_adw_swipe_tracker_get_swipeable;

/** */
alias adw_swipe_tracker_get_upper_overshoot = c_adw_swipe_tracker_get_upper_overshoot;

/** */
alias adw_swipe_tracker_set_allow_long_swipes = c_adw_swipe_tracker_set_allow_long_swipes;

/** */
alias adw_swipe_tracker_set_allow_mouse_drag = c_adw_swipe_tracker_set_allow_mouse_drag;

/** */
alias adw_swipe_tracker_set_allow_window_handle = c_adw_swipe_tracker_set_allow_window_handle;

/** */
alias adw_swipe_tracker_set_enabled = c_adw_swipe_tracker_set_enabled;

/** */
alias adw_swipe_tracker_set_lower_overshoot = c_adw_swipe_tracker_set_lower_overshoot;

/** */
alias adw_swipe_tracker_set_reversed = c_adw_swipe_tracker_set_reversed;

/** */
alias adw_swipe_tracker_set_upper_overshoot = c_adw_swipe_tracker_set_upper_overshoot;

/** */
alias adw_swipe_tracker_shift_position = c_adw_swipe_tracker_shift_position;

// Swipeable

/** */
alias adw_swipeable_get_type = c_adw_swipeable_get_type;

/** */
alias adw_swipeable_get_cancel_progress = c_adw_swipeable_get_cancel_progress;

/** */
alias adw_swipeable_get_distance = c_adw_swipeable_get_distance;

/** */
alias adw_swipeable_get_progress = c_adw_swipeable_get_progress;

/** */
alias adw_swipeable_get_snap_points = c_adw_swipeable_get_snap_points;

/** */
alias adw_swipeable_get_swipe_area = c_adw_swipeable_get_swipe_area;

// SwitchRow

/** */
alias adw_switch_row_get_type = c_adw_switch_row_get_type;

/** */
alias adw_switch_row_new = c_adw_switch_row_new;

/** */
alias adw_switch_row_get_active = c_adw_switch_row_get_active;

/** */
alias adw_switch_row_set_active = c_adw_switch_row_set_active;

// TabBar

/** */
alias adw_tab_bar_get_type = c_adw_tab_bar_get_type;

/** */
alias adw_tab_bar_new = c_adw_tab_bar_new;

/** */
alias adw_tab_bar_get_autohide = c_adw_tab_bar_get_autohide;

/** */
alias adw_tab_bar_get_end_action_widget = c_adw_tab_bar_get_end_action_widget;

/** */
alias adw_tab_bar_get_expand_tabs = c_adw_tab_bar_get_expand_tabs;

/** */
alias adw_tab_bar_get_extra_drag_preferred_action = c_adw_tab_bar_get_extra_drag_preferred_action;

/** */
alias adw_tab_bar_get_extra_drag_preload = c_adw_tab_bar_get_extra_drag_preload;

/** */
alias adw_tab_bar_get_inverted = c_adw_tab_bar_get_inverted;

/** */
alias adw_tab_bar_get_is_overflowing = c_adw_tab_bar_get_is_overflowing;

/** */
alias adw_tab_bar_get_start_action_widget = c_adw_tab_bar_get_start_action_widget;

/** */
alias adw_tab_bar_get_tabs_revealed = c_adw_tab_bar_get_tabs_revealed;

/** */
alias adw_tab_bar_get_view = c_adw_tab_bar_get_view;

/** */
alias adw_tab_bar_set_autohide = c_adw_tab_bar_set_autohide;

/** */
alias adw_tab_bar_set_end_action_widget = c_adw_tab_bar_set_end_action_widget;

/** */
alias adw_tab_bar_set_expand_tabs = c_adw_tab_bar_set_expand_tabs;

/** */
alias adw_tab_bar_set_extra_drag_preload = c_adw_tab_bar_set_extra_drag_preload;

/** */
alias adw_tab_bar_set_inverted = c_adw_tab_bar_set_inverted;

/** */
alias adw_tab_bar_set_start_action_widget = c_adw_tab_bar_set_start_action_widget;

/** */
alias adw_tab_bar_set_view = c_adw_tab_bar_set_view;

/** */
alias adw_tab_bar_setup_extra_drop_target = c_adw_tab_bar_setup_extra_drop_target;

// TabButton

/** */
alias adw_tab_button_get_type = c_adw_tab_button_get_type;

/** */
alias adw_tab_button_new = c_adw_tab_button_new;

/** */
alias adw_tab_button_get_view = c_adw_tab_button_get_view;

/** */
alias adw_tab_button_set_view = c_adw_tab_button_set_view;

// TabOverview

/** */
alias adw_tab_overview_get_type = c_adw_tab_overview_get_type;

/** */
alias adw_tab_overview_new = c_adw_tab_overview_new;

/** */
alias adw_tab_overview_get_child = c_adw_tab_overview_get_child;

/** */
alias adw_tab_overview_get_enable_new_tab = c_adw_tab_overview_get_enable_new_tab;

/** */
alias adw_tab_overview_get_enable_search = c_adw_tab_overview_get_enable_search;

/** */
alias adw_tab_overview_get_extra_drag_preferred_action = c_adw_tab_overview_get_extra_drag_preferred_action;

/** */
alias adw_tab_overview_get_extra_drag_preload = c_adw_tab_overview_get_extra_drag_preload;

/** */
alias adw_tab_overview_get_inverted = c_adw_tab_overview_get_inverted;

/** */
alias adw_tab_overview_get_open = c_adw_tab_overview_get_open;

/** */
alias adw_tab_overview_get_search_active = c_adw_tab_overview_get_search_active;

/** */
alias adw_tab_overview_get_secondary_menu = c_adw_tab_overview_get_secondary_menu;

/** */
alias adw_tab_overview_get_show_end_title_buttons = c_adw_tab_overview_get_show_end_title_buttons;

/** */
alias adw_tab_overview_get_show_start_title_buttons = c_adw_tab_overview_get_show_start_title_buttons;

/** */
alias adw_tab_overview_get_view = c_adw_tab_overview_get_view;

/** */
alias adw_tab_overview_set_child = c_adw_tab_overview_set_child;

/** */
alias adw_tab_overview_set_enable_new_tab = c_adw_tab_overview_set_enable_new_tab;

/** */
alias adw_tab_overview_set_enable_search = c_adw_tab_overview_set_enable_search;

/** */
alias adw_tab_overview_set_extra_drag_preload = c_adw_tab_overview_set_extra_drag_preload;

/** */
alias adw_tab_overview_set_inverted = c_adw_tab_overview_set_inverted;

/** */
alias adw_tab_overview_set_open = c_adw_tab_overview_set_open;

/** */
alias adw_tab_overview_set_secondary_menu = c_adw_tab_overview_set_secondary_menu;

/** */
alias adw_tab_overview_set_show_end_title_buttons = c_adw_tab_overview_set_show_end_title_buttons;

/** */
alias adw_tab_overview_set_show_start_title_buttons = c_adw_tab_overview_set_show_start_title_buttons;

/** */
alias adw_tab_overview_set_view = c_adw_tab_overview_set_view;

/** */
alias adw_tab_overview_setup_extra_drop_target = c_adw_tab_overview_setup_extra_drop_target;

// TabPage

/** */
alias adw_tab_page_get_type = c_adw_tab_page_get_type;

/** */
alias adw_tab_page_get_child = c_adw_tab_page_get_child;

/** */
alias adw_tab_page_get_icon = c_adw_tab_page_get_icon;

/** */
alias adw_tab_page_get_indicator_activatable = c_adw_tab_page_get_indicator_activatable;

/** */
alias adw_tab_page_get_indicator_icon = c_adw_tab_page_get_indicator_icon;

/** */
alias adw_tab_page_get_indicator_tooltip = c_adw_tab_page_get_indicator_tooltip;

/** */
alias adw_tab_page_get_keyword = c_adw_tab_page_get_keyword;

/** */
alias adw_tab_page_get_live_thumbnail = c_adw_tab_page_get_live_thumbnail;

/** */
alias adw_tab_page_get_loading = c_adw_tab_page_get_loading;

/** */
alias adw_tab_page_get_needs_attention = c_adw_tab_page_get_needs_attention;

/** */
alias adw_tab_page_get_parent = c_adw_tab_page_get_parent;

/** */
alias adw_tab_page_get_pinned = c_adw_tab_page_get_pinned;

/** */
alias adw_tab_page_get_selected = c_adw_tab_page_get_selected;

/** */
alias adw_tab_page_get_thumbnail_xalign = c_adw_tab_page_get_thumbnail_xalign;

/** */
alias adw_tab_page_get_thumbnail_yalign = c_adw_tab_page_get_thumbnail_yalign;

/** */
alias adw_tab_page_get_title = c_adw_tab_page_get_title;

/** */
alias adw_tab_page_get_tooltip = c_adw_tab_page_get_tooltip;

/** */
alias adw_tab_page_invalidate_thumbnail = c_adw_tab_page_invalidate_thumbnail;

/** */
alias adw_tab_page_set_icon = c_adw_tab_page_set_icon;

/** */
alias adw_tab_page_set_indicator_activatable = c_adw_tab_page_set_indicator_activatable;

/** */
alias adw_tab_page_set_indicator_icon = c_adw_tab_page_set_indicator_icon;

/** */
alias adw_tab_page_set_indicator_tooltip = c_adw_tab_page_set_indicator_tooltip;

/** */
alias adw_tab_page_set_keyword = c_adw_tab_page_set_keyword;

/** */
alias adw_tab_page_set_live_thumbnail = c_adw_tab_page_set_live_thumbnail;

/** */
alias adw_tab_page_set_loading = c_adw_tab_page_set_loading;

/** */
alias adw_tab_page_set_needs_attention = c_adw_tab_page_set_needs_attention;

/** */
alias adw_tab_page_set_thumbnail_xalign = c_adw_tab_page_set_thumbnail_xalign;

/** */
alias adw_tab_page_set_thumbnail_yalign = c_adw_tab_page_set_thumbnail_yalign;

/** */
alias adw_tab_page_set_title = c_adw_tab_page_set_title;

/** */
alias adw_tab_page_set_tooltip = c_adw_tab_page_set_tooltip;

// TabView

/** */
alias adw_tab_view_get_type = c_adw_tab_view_get_type;

/** */
alias adw_tab_view_new = c_adw_tab_view_new;

/** */
alias adw_tab_view_add_page = c_adw_tab_view_add_page;

/** */
alias adw_tab_view_add_shortcuts = c_adw_tab_view_add_shortcuts;

/** */
alias adw_tab_view_append = c_adw_tab_view_append;

/** */
alias adw_tab_view_append_pinned = c_adw_tab_view_append_pinned;

/** */
alias adw_tab_view_close_other_pages = c_adw_tab_view_close_other_pages;

/** */
alias adw_tab_view_close_page = c_adw_tab_view_close_page;

/** */
alias adw_tab_view_close_page_finish = c_adw_tab_view_close_page_finish;

/** */
alias adw_tab_view_close_pages_after = c_adw_tab_view_close_pages_after;

/** */
alias adw_tab_view_close_pages_before = c_adw_tab_view_close_pages_before;

/** */
alias adw_tab_view_get_default_icon = c_adw_tab_view_get_default_icon;

/** */
alias adw_tab_view_get_is_transferring_page = c_adw_tab_view_get_is_transferring_page;

/** */
alias adw_tab_view_get_menu_model = c_adw_tab_view_get_menu_model;

/** */
alias adw_tab_view_get_n_pages = c_adw_tab_view_get_n_pages;

/** */
alias adw_tab_view_get_n_pinned_pages = c_adw_tab_view_get_n_pinned_pages;

/** */
alias adw_tab_view_get_nth_page = c_adw_tab_view_get_nth_page;

/** */
alias adw_tab_view_get_page = c_adw_tab_view_get_page;

/** */
alias adw_tab_view_get_page_position = c_adw_tab_view_get_page_position;

/** */
alias adw_tab_view_get_pages = c_adw_tab_view_get_pages;

/** */
alias adw_tab_view_get_selected_page = c_adw_tab_view_get_selected_page;

/** */
alias adw_tab_view_get_shortcuts = c_adw_tab_view_get_shortcuts;

/** */
alias adw_tab_view_insert = c_adw_tab_view_insert;

/** */
alias adw_tab_view_insert_pinned = c_adw_tab_view_insert_pinned;

/** */
alias adw_tab_view_invalidate_thumbnails = c_adw_tab_view_invalidate_thumbnails;

/** */
alias adw_tab_view_prepend = c_adw_tab_view_prepend;

/** */
alias adw_tab_view_prepend_pinned = c_adw_tab_view_prepend_pinned;

/** */
alias adw_tab_view_remove_shortcuts = c_adw_tab_view_remove_shortcuts;

/** */
alias adw_tab_view_reorder_backward = c_adw_tab_view_reorder_backward;

/** */
alias adw_tab_view_reorder_first = c_adw_tab_view_reorder_first;

/** */
alias adw_tab_view_reorder_forward = c_adw_tab_view_reorder_forward;

/** */
alias adw_tab_view_reorder_last = c_adw_tab_view_reorder_last;

/** */
alias adw_tab_view_reorder_page = c_adw_tab_view_reorder_page;

/** */
alias adw_tab_view_select_next_page = c_adw_tab_view_select_next_page;

/** */
alias adw_tab_view_select_previous_page = c_adw_tab_view_select_previous_page;

/** */
alias adw_tab_view_set_default_icon = c_adw_tab_view_set_default_icon;

/** */
alias adw_tab_view_set_menu_model = c_adw_tab_view_set_menu_model;

/** */
alias adw_tab_view_set_page_pinned = c_adw_tab_view_set_page_pinned;

/** */
alias adw_tab_view_set_selected_page = c_adw_tab_view_set_selected_page;

/** */
alias adw_tab_view_set_shortcuts = c_adw_tab_view_set_shortcuts;

/** */
alias adw_tab_view_transfer_page = c_adw_tab_view_transfer_page;

// TimedAnimation

/** */
alias adw_timed_animation_get_type = c_adw_timed_animation_get_type;

/** */
alias adw_timed_animation_new = c_adw_timed_animation_new;

/** */
alias adw_timed_animation_get_alternate = c_adw_timed_animation_get_alternate;

/** */
alias adw_timed_animation_get_duration = c_adw_timed_animation_get_duration;

/** */
alias adw_timed_animation_get_easing = c_adw_timed_animation_get_easing;

/** */
alias adw_timed_animation_get_repeat_count = c_adw_timed_animation_get_repeat_count;

/** */
alias adw_timed_animation_get_reverse = c_adw_timed_animation_get_reverse;

/** */
alias adw_timed_animation_get_value_from = c_adw_timed_animation_get_value_from;

/** */
alias adw_timed_animation_get_value_to = c_adw_timed_animation_get_value_to;

/** */
alias adw_timed_animation_set_alternate = c_adw_timed_animation_set_alternate;

/** */
alias adw_timed_animation_set_duration = c_adw_timed_animation_set_duration;

/** */
alias adw_timed_animation_set_easing = c_adw_timed_animation_set_easing;

/** */
alias adw_timed_animation_set_repeat_count = c_adw_timed_animation_set_repeat_count;

/** */
alias adw_timed_animation_set_reverse = c_adw_timed_animation_set_reverse;

/** */
alias adw_timed_animation_set_value_from = c_adw_timed_animation_set_value_from;

/** */
alias adw_timed_animation_set_value_to = c_adw_timed_animation_set_value_to;

// Toast

/** */
alias adw_toast_get_type = c_adw_toast_get_type;

/** */
alias adw_toast_new = c_adw_toast_new;

/** */
alias adw_toast_new_format = c_adw_toast_new_format;

/** */
alias adw_toast_dismiss = c_adw_toast_dismiss;

/** */
alias adw_toast_get_action_name = c_adw_toast_get_action_name;

/** */
alias adw_toast_get_action_target_value = c_adw_toast_get_action_target_value;

/** */
alias adw_toast_get_button_label = c_adw_toast_get_button_label;

/** */
alias adw_toast_get_custom_title = c_adw_toast_get_custom_title;

/** */
alias adw_toast_get_priority = c_adw_toast_get_priority;

/** */
alias adw_toast_get_timeout = c_adw_toast_get_timeout;

/** */
alias adw_toast_get_title = c_adw_toast_get_title;

/** */
alias adw_toast_get_use_markup = c_adw_toast_get_use_markup;

/** */
alias adw_toast_set_action_name = c_adw_toast_set_action_name;

/** */
alias adw_toast_set_action_target = c_adw_toast_set_action_target;

/** */
alias adw_toast_set_action_target_value = c_adw_toast_set_action_target_value;

/** */
alias adw_toast_set_button_label = c_adw_toast_set_button_label;

/** */
alias adw_toast_set_custom_title = c_adw_toast_set_custom_title;

/** */
alias adw_toast_set_detailed_action_name = c_adw_toast_set_detailed_action_name;

/** */
alias adw_toast_set_priority = c_adw_toast_set_priority;

/** */
alias adw_toast_set_timeout = c_adw_toast_set_timeout;

/** */
alias adw_toast_set_title = c_adw_toast_set_title;

/** */
alias adw_toast_set_use_markup = c_adw_toast_set_use_markup;

// ToastOverlay

/** */
alias adw_toast_overlay_get_type = c_adw_toast_overlay_get_type;

/** */
alias adw_toast_overlay_new = c_adw_toast_overlay_new;

/** */
alias adw_toast_overlay_add_toast = c_adw_toast_overlay_add_toast;

/** */
alias adw_toast_overlay_get_child = c_adw_toast_overlay_get_child;

/** */
alias adw_toast_overlay_set_child = c_adw_toast_overlay_set_child;

// ToolbarView

/** */
alias adw_toolbar_view_get_type = c_adw_toolbar_view_get_type;

/** */
alias adw_toolbar_view_new = c_adw_toolbar_view_new;

/** */
alias adw_toolbar_view_add_bottom_bar = c_adw_toolbar_view_add_bottom_bar;

/** */
alias adw_toolbar_view_add_top_bar = c_adw_toolbar_view_add_top_bar;

/** */
alias adw_toolbar_view_get_bottom_bar_height = c_adw_toolbar_view_get_bottom_bar_height;

/** */
alias adw_toolbar_view_get_bottom_bar_style = c_adw_toolbar_view_get_bottom_bar_style;

/** */
alias adw_toolbar_view_get_content = c_adw_toolbar_view_get_content;

/** */
alias adw_toolbar_view_get_extend_content_to_bottom_edge = c_adw_toolbar_view_get_extend_content_to_bottom_edge;

/** */
alias adw_toolbar_view_get_extend_content_to_top_edge = c_adw_toolbar_view_get_extend_content_to_top_edge;

/** */
alias adw_toolbar_view_get_reveal_bottom_bars = c_adw_toolbar_view_get_reveal_bottom_bars;

/** */
alias adw_toolbar_view_get_reveal_top_bars = c_adw_toolbar_view_get_reveal_top_bars;

/** */
alias adw_toolbar_view_get_top_bar_height = c_adw_toolbar_view_get_top_bar_height;

/** */
alias adw_toolbar_view_get_top_bar_style = c_adw_toolbar_view_get_top_bar_style;

/** */
alias adw_toolbar_view_remove = c_adw_toolbar_view_remove;

/** */
alias adw_toolbar_view_set_bottom_bar_style = c_adw_toolbar_view_set_bottom_bar_style;

/** */
alias adw_toolbar_view_set_content = c_adw_toolbar_view_set_content;

/** */
alias adw_toolbar_view_set_extend_content_to_bottom_edge = c_adw_toolbar_view_set_extend_content_to_bottom_edge;

/** */
alias adw_toolbar_view_set_extend_content_to_top_edge = c_adw_toolbar_view_set_extend_content_to_top_edge;

/** */
alias adw_toolbar_view_set_reveal_bottom_bars = c_adw_toolbar_view_set_reveal_bottom_bars;

/** */
alias adw_toolbar_view_set_reveal_top_bars = c_adw_toolbar_view_set_reveal_top_bars;

/** */
alias adw_toolbar_view_set_top_bar_style = c_adw_toolbar_view_set_top_bar_style;

// ViewStack

/** */
alias adw_view_stack_get_type = c_adw_view_stack_get_type;

/** */
alias adw_view_stack_new = c_adw_view_stack_new;

/** */
alias adw_view_stack_add = c_adw_view_stack_add;

/** */
alias adw_view_stack_add_named = c_adw_view_stack_add_named;

/** */
alias adw_view_stack_add_titled = c_adw_view_stack_add_titled;

/** */
alias adw_view_stack_add_titled_with_icon = c_adw_view_stack_add_titled_with_icon;

/** */
alias adw_view_stack_get_child_by_name = c_adw_view_stack_get_child_by_name;

/** */
alias adw_view_stack_get_hhomogeneous = c_adw_view_stack_get_hhomogeneous;

/** */
alias adw_view_stack_get_page = c_adw_view_stack_get_page;

/** */
alias adw_view_stack_get_pages = c_adw_view_stack_get_pages;

/** */
alias adw_view_stack_get_vhomogeneous = c_adw_view_stack_get_vhomogeneous;

/** */
alias adw_view_stack_get_visible_child = c_adw_view_stack_get_visible_child;

/** */
alias adw_view_stack_get_visible_child_name = c_adw_view_stack_get_visible_child_name;

/** */
alias adw_view_stack_remove = c_adw_view_stack_remove;

/** */
alias adw_view_stack_set_hhomogeneous = c_adw_view_stack_set_hhomogeneous;

/** */
alias adw_view_stack_set_vhomogeneous = c_adw_view_stack_set_vhomogeneous;

/** */
alias adw_view_stack_set_visible_child = c_adw_view_stack_set_visible_child;

/** */
alias adw_view_stack_set_visible_child_name = c_adw_view_stack_set_visible_child_name;

// ViewStackPage

/** */
alias adw_view_stack_page_get_type = c_adw_view_stack_page_get_type;

/** */
alias adw_view_stack_page_get_badge_number = c_adw_view_stack_page_get_badge_number;

/** */
alias adw_view_stack_page_get_child = c_adw_view_stack_page_get_child;

/** */
alias adw_view_stack_page_get_icon_name = c_adw_view_stack_page_get_icon_name;

/** */
alias adw_view_stack_page_get_name = c_adw_view_stack_page_get_name;

/** */
alias adw_view_stack_page_get_needs_attention = c_adw_view_stack_page_get_needs_attention;

/** */
alias adw_view_stack_page_get_title = c_adw_view_stack_page_get_title;

/** */
alias adw_view_stack_page_get_use_underline = c_adw_view_stack_page_get_use_underline;

/** */
alias adw_view_stack_page_get_visible = c_adw_view_stack_page_get_visible;

/** */
alias adw_view_stack_page_set_badge_number = c_adw_view_stack_page_set_badge_number;

/** */
alias adw_view_stack_page_set_icon_name = c_adw_view_stack_page_set_icon_name;

/** */
alias adw_view_stack_page_set_name = c_adw_view_stack_page_set_name;

/** */
alias adw_view_stack_page_set_needs_attention = c_adw_view_stack_page_set_needs_attention;

/** */
alias adw_view_stack_page_set_title = c_adw_view_stack_page_set_title;

/** */
alias adw_view_stack_page_set_use_underline = c_adw_view_stack_page_set_use_underline;

/** */
alias adw_view_stack_page_set_visible = c_adw_view_stack_page_set_visible;

// ViewStackPages

/** */
alias adw_view_stack_pages_get_type = c_adw_view_stack_pages_get_type;

/** */
alias adw_view_stack_pages_get_selected_page = c_adw_view_stack_pages_get_selected_page;

/** */
alias adw_view_stack_pages_set_selected_page = c_adw_view_stack_pages_set_selected_page;

// ViewSwitcher

/** */
alias adw_view_switcher_get_type = c_adw_view_switcher_get_type;

/** */
alias adw_view_switcher_new = c_adw_view_switcher_new;

/** */
alias adw_view_switcher_get_policy = c_adw_view_switcher_get_policy;

/** */
alias adw_view_switcher_get_stack = c_adw_view_switcher_get_stack;

/** */
alias adw_view_switcher_set_policy = c_adw_view_switcher_set_policy;

/** */
alias adw_view_switcher_set_stack = c_adw_view_switcher_set_stack;

// ViewSwitcherBar

/** */
alias adw_view_switcher_bar_get_type = c_adw_view_switcher_bar_get_type;

/** */
alias adw_view_switcher_bar_new = c_adw_view_switcher_bar_new;

/** */
alias adw_view_switcher_bar_get_reveal = c_adw_view_switcher_bar_get_reveal;

/** */
alias adw_view_switcher_bar_get_stack = c_adw_view_switcher_bar_get_stack;

/** */
alias adw_view_switcher_bar_set_reveal = c_adw_view_switcher_bar_set_reveal;

/** */
alias adw_view_switcher_bar_set_stack = c_adw_view_switcher_bar_set_stack;

// ViewSwitcherTitle

/** */
alias adw_view_switcher_title_get_type = c_adw_view_switcher_title_get_type;

/** */
alias adw_view_switcher_title_new = c_adw_view_switcher_title_new;

/** */
alias adw_view_switcher_title_get_stack = c_adw_view_switcher_title_get_stack;

/** */
alias adw_view_switcher_title_get_subtitle = c_adw_view_switcher_title_get_subtitle;

/** */
alias adw_view_switcher_title_get_title = c_adw_view_switcher_title_get_title;

/** */
alias adw_view_switcher_title_get_title_visible = c_adw_view_switcher_title_get_title_visible;

/** */
alias adw_view_switcher_title_get_view_switcher_enabled = c_adw_view_switcher_title_get_view_switcher_enabled;

/** */
alias adw_view_switcher_title_set_stack = c_adw_view_switcher_title_set_stack;

/** */
alias adw_view_switcher_title_set_subtitle = c_adw_view_switcher_title_set_subtitle;

/** */
alias adw_view_switcher_title_set_title = c_adw_view_switcher_title_set_title;

/** */
alias adw_view_switcher_title_set_view_switcher_enabled = c_adw_view_switcher_title_set_view_switcher_enabled;

// Window

/** */
alias adw_window_get_type = c_adw_window_get_type;

/** */
alias adw_window_new = c_adw_window_new;

/** */
alias adw_window_add_breakpoint = c_adw_window_add_breakpoint;

/** */
alias adw_window_get_content = c_adw_window_get_content;

/** */
alias adw_window_get_current_breakpoint = c_adw_window_get_current_breakpoint;

/** */
alias adw_window_get_dialogs = c_adw_window_get_dialogs;

/** */
alias adw_window_get_visible_dialog = c_adw_window_get_visible_dialog;

/** */
alias adw_window_set_content = c_adw_window_set_content;

// WindowTitle

/** */
alias adw_window_title_get_type = c_adw_window_title_get_type;

/** */
alias adw_window_title_new = c_adw_window_title_new;

/** */
alias adw_window_title_get_subtitle = c_adw_window_title_get_subtitle;

/** */
alias adw_window_title_get_title = c_adw_window_title_get_title;

/** */
alias adw_window_title_set_subtitle = c_adw_window_title_set_subtitle;

/** */
alias adw_window_title_set_title = c_adw_window_title_set_title;

// global

/** */
alias adw_get_enable_animations = c_adw_get_enable_animations;

/** */
alias adw_get_major_version = c_adw_get_major_version;

/** */
alias adw_get_micro_version = c_adw_get_micro_version;

/** */
alias adw_get_minor_version = c_adw_get_minor_version;

/** */
alias adw_init = c_adw_init;

/** */
alias adw_is_initialized = c_adw_is_initialized;

/** */
alias adw_lerp = c_adw_lerp;

/** */
alias adw_show_about_dialog = c_adw_show_about_dialog;

/** */
alias adw_show_about_dialog_from_appdata = c_adw_show_about_dialog_from_appdata;

/** */
alias adw_show_about_window = c_adw_show_about_window;

/** */
alias adw_show_about_window_from_appdata = c_adw_show_about_window_from_appdata;

// Easing

/** */
alias adw_easing_ease = c_adw_easing_ease;

// LengthUnit

/** */
alias adw_length_unit_from_px = c_adw_length_unit_from_px;

/** */
alias adw_length_unit_to_px = c_adw_length_unit_to_px;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // AboutDialog
  gidLink(cast(void**)&adw_about_dialog_get_type, "adw_about_dialog_get_type", libs);
  gidLink(cast(void**)&adw_about_dialog_new, "adw_about_dialog_new", libs);
  gidLink(cast(void**)&adw_about_dialog_new_from_appdata, "adw_about_dialog_new_from_appdata", libs);
  gidLink(cast(void**)&adw_about_dialog_add_acknowledgement_section, "adw_about_dialog_add_acknowledgement_section", libs);
  gidLink(cast(void**)&adw_about_dialog_add_credit_section, "adw_about_dialog_add_credit_section", libs);
  gidLink(cast(void**)&adw_about_dialog_add_legal_section, "adw_about_dialog_add_legal_section", libs);
  gidLink(cast(void**)&adw_about_dialog_add_link, "adw_about_dialog_add_link", libs);
  gidLink(cast(void**)&adw_about_dialog_get_application_icon, "adw_about_dialog_get_application_icon", libs);
  gidLink(cast(void**)&adw_about_dialog_get_application_name, "adw_about_dialog_get_application_name", libs);
  gidLink(cast(void**)&adw_about_dialog_get_artists, "adw_about_dialog_get_artists", libs);
  gidLink(cast(void**)&adw_about_dialog_get_comments, "adw_about_dialog_get_comments", libs);
  gidLink(cast(void**)&adw_about_dialog_get_copyright, "adw_about_dialog_get_copyright", libs);
  gidLink(cast(void**)&adw_about_dialog_get_debug_info, "adw_about_dialog_get_debug_info", libs);
  gidLink(cast(void**)&adw_about_dialog_get_debug_info_filename, "adw_about_dialog_get_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_dialog_get_designers, "adw_about_dialog_get_designers", libs);
  gidLink(cast(void**)&adw_about_dialog_get_developer_name, "adw_about_dialog_get_developer_name", libs);
  gidLink(cast(void**)&adw_about_dialog_get_developers, "adw_about_dialog_get_developers", libs);
  gidLink(cast(void**)&adw_about_dialog_get_documenters, "adw_about_dialog_get_documenters", libs);
  gidLink(cast(void**)&adw_about_dialog_get_issue_url, "adw_about_dialog_get_issue_url", libs);
  gidLink(cast(void**)&adw_about_dialog_get_license, "adw_about_dialog_get_license", libs);
  gidLink(cast(void**)&adw_about_dialog_get_license_type, "adw_about_dialog_get_license_type", libs);
  gidLink(cast(void**)&adw_about_dialog_get_release_notes, "adw_about_dialog_get_release_notes", libs);
  gidLink(cast(void**)&adw_about_dialog_get_release_notes_version, "adw_about_dialog_get_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_dialog_get_support_url, "adw_about_dialog_get_support_url", libs);
  gidLink(cast(void**)&adw_about_dialog_get_translator_credits, "adw_about_dialog_get_translator_credits", libs);
  gidLink(cast(void**)&adw_about_dialog_get_version, "adw_about_dialog_get_version", libs);
  gidLink(cast(void**)&adw_about_dialog_get_website, "adw_about_dialog_get_website", libs);
  gidLink(cast(void**)&adw_about_dialog_set_application_icon, "adw_about_dialog_set_application_icon", libs);
  gidLink(cast(void**)&adw_about_dialog_set_application_name, "adw_about_dialog_set_application_name", libs);
  gidLink(cast(void**)&adw_about_dialog_set_artists, "adw_about_dialog_set_artists", libs);
  gidLink(cast(void**)&adw_about_dialog_set_comments, "adw_about_dialog_set_comments", libs);
  gidLink(cast(void**)&adw_about_dialog_set_copyright, "adw_about_dialog_set_copyright", libs);
  gidLink(cast(void**)&adw_about_dialog_set_debug_info, "adw_about_dialog_set_debug_info", libs);
  gidLink(cast(void**)&adw_about_dialog_set_debug_info_filename, "adw_about_dialog_set_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_dialog_set_designers, "adw_about_dialog_set_designers", libs);
  gidLink(cast(void**)&adw_about_dialog_set_developer_name, "adw_about_dialog_set_developer_name", libs);
  gidLink(cast(void**)&adw_about_dialog_set_developers, "adw_about_dialog_set_developers", libs);
  gidLink(cast(void**)&adw_about_dialog_set_documenters, "adw_about_dialog_set_documenters", libs);
  gidLink(cast(void**)&adw_about_dialog_set_issue_url, "adw_about_dialog_set_issue_url", libs);
  gidLink(cast(void**)&adw_about_dialog_set_license, "adw_about_dialog_set_license", libs);
  gidLink(cast(void**)&adw_about_dialog_set_license_type, "adw_about_dialog_set_license_type", libs);
  gidLink(cast(void**)&adw_about_dialog_set_release_notes, "adw_about_dialog_set_release_notes", libs);
  gidLink(cast(void**)&adw_about_dialog_set_release_notes_version, "adw_about_dialog_set_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_dialog_set_support_url, "adw_about_dialog_set_support_url", libs);
  gidLink(cast(void**)&adw_about_dialog_set_translator_credits, "adw_about_dialog_set_translator_credits", libs);
  gidLink(cast(void**)&adw_about_dialog_set_version, "adw_about_dialog_set_version", libs);
  gidLink(cast(void**)&adw_about_dialog_set_website, "adw_about_dialog_set_website", libs);

  // AboutWindow
  gidLink(cast(void**)&adw_about_window_get_type, "adw_about_window_get_type", libs);
  gidLink(cast(void**)&adw_about_window_new, "adw_about_window_new", libs);
  gidLink(cast(void**)&adw_about_window_new_from_appdata, "adw_about_window_new_from_appdata", libs);
  gidLink(cast(void**)&adw_about_window_add_acknowledgement_section, "adw_about_window_add_acknowledgement_section", libs);
  gidLink(cast(void**)&adw_about_window_add_credit_section, "adw_about_window_add_credit_section", libs);
  gidLink(cast(void**)&adw_about_window_add_legal_section, "adw_about_window_add_legal_section", libs);
  gidLink(cast(void**)&adw_about_window_add_link, "adw_about_window_add_link", libs);
  gidLink(cast(void**)&adw_about_window_get_application_icon, "adw_about_window_get_application_icon", libs);
  gidLink(cast(void**)&adw_about_window_get_application_name, "adw_about_window_get_application_name", libs);
  gidLink(cast(void**)&adw_about_window_get_artists, "adw_about_window_get_artists", libs);
  gidLink(cast(void**)&adw_about_window_get_comments, "adw_about_window_get_comments", libs);
  gidLink(cast(void**)&adw_about_window_get_copyright, "adw_about_window_get_copyright", libs);
  gidLink(cast(void**)&adw_about_window_get_debug_info, "adw_about_window_get_debug_info", libs);
  gidLink(cast(void**)&adw_about_window_get_debug_info_filename, "adw_about_window_get_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_window_get_designers, "adw_about_window_get_designers", libs);
  gidLink(cast(void**)&adw_about_window_get_developer_name, "adw_about_window_get_developer_name", libs);
  gidLink(cast(void**)&adw_about_window_get_developers, "adw_about_window_get_developers", libs);
  gidLink(cast(void**)&adw_about_window_get_documenters, "adw_about_window_get_documenters", libs);
  gidLink(cast(void**)&adw_about_window_get_issue_url, "adw_about_window_get_issue_url", libs);
  gidLink(cast(void**)&adw_about_window_get_license, "adw_about_window_get_license", libs);
  gidLink(cast(void**)&adw_about_window_get_license_type, "adw_about_window_get_license_type", libs);
  gidLink(cast(void**)&adw_about_window_get_release_notes, "adw_about_window_get_release_notes", libs);
  gidLink(cast(void**)&adw_about_window_get_release_notes_version, "adw_about_window_get_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_window_get_support_url, "adw_about_window_get_support_url", libs);
  gidLink(cast(void**)&adw_about_window_get_translator_credits, "adw_about_window_get_translator_credits", libs);
  gidLink(cast(void**)&adw_about_window_get_version, "adw_about_window_get_version", libs);
  gidLink(cast(void**)&adw_about_window_get_website, "adw_about_window_get_website", libs);
  gidLink(cast(void**)&adw_about_window_set_application_icon, "adw_about_window_set_application_icon", libs);
  gidLink(cast(void**)&adw_about_window_set_application_name, "adw_about_window_set_application_name", libs);
  gidLink(cast(void**)&adw_about_window_set_artists, "adw_about_window_set_artists", libs);
  gidLink(cast(void**)&adw_about_window_set_comments, "adw_about_window_set_comments", libs);
  gidLink(cast(void**)&adw_about_window_set_copyright, "adw_about_window_set_copyright", libs);
  gidLink(cast(void**)&adw_about_window_set_debug_info, "adw_about_window_set_debug_info", libs);
  gidLink(cast(void**)&adw_about_window_set_debug_info_filename, "adw_about_window_set_debug_info_filename", libs);
  gidLink(cast(void**)&adw_about_window_set_designers, "adw_about_window_set_designers", libs);
  gidLink(cast(void**)&adw_about_window_set_developer_name, "adw_about_window_set_developer_name", libs);
  gidLink(cast(void**)&adw_about_window_set_developers, "adw_about_window_set_developers", libs);
  gidLink(cast(void**)&adw_about_window_set_documenters, "adw_about_window_set_documenters", libs);
  gidLink(cast(void**)&adw_about_window_set_issue_url, "adw_about_window_set_issue_url", libs);
  gidLink(cast(void**)&adw_about_window_set_license, "adw_about_window_set_license", libs);
  gidLink(cast(void**)&adw_about_window_set_license_type, "adw_about_window_set_license_type", libs);
  gidLink(cast(void**)&adw_about_window_set_release_notes, "adw_about_window_set_release_notes", libs);
  gidLink(cast(void**)&adw_about_window_set_release_notes_version, "adw_about_window_set_release_notes_version", libs);
  gidLink(cast(void**)&adw_about_window_set_support_url, "adw_about_window_set_support_url", libs);
  gidLink(cast(void**)&adw_about_window_set_translator_credits, "adw_about_window_set_translator_credits", libs);
  gidLink(cast(void**)&adw_about_window_set_version, "adw_about_window_set_version", libs);
  gidLink(cast(void**)&adw_about_window_set_website, "adw_about_window_set_website", libs);

  // ActionRow
  gidLink(cast(void**)&adw_action_row_get_type, "adw_action_row_get_type", libs);
  gidLink(cast(void**)&adw_action_row_new, "adw_action_row_new", libs);
  gidLink(cast(void**)&adw_action_row_activate, "adw_action_row_activate", libs);
  gidLink(cast(void**)&adw_action_row_add_prefix, "adw_action_row_add_prefix", libs);
  gidLink(cast(void**)&adw_action_row_add_suffix, "adw_action_row_add_suffix", libs);
  gidLink(cast(void**)&adw_action_row_get_activatable_widget, "adw_action_row_get_activatable_widget", libs);
  gidLink(cast(void**)&adw_action_row_get_icon_name, "adw_action_row_get_icon_name", libs);
  gidLink(cast(void**)&adw_action_row_get_subtitle, "adw_action_row_get_subtitle", libs);
  gidLink(cast(void**)&adw_action_row_get_subtitle_lines, "adw_action_row_get_subtitle_lines", libs);
  gidLink(cast(void**)&adw_action_row_get_subtitle_selectable, "adw_action_row_get_subtitle_selectable", libs);
  gidLink(cast(void**)&adw_action_row_get_title_lines, "adw_action_row_get_title_lines", libs);
  gidLink(cast(void**)&adw_action_row_remove, "adw_action_row_remove", libs);
  gidLink(cast(void**)&adw_action_row_set_activatable_widget, "adw_action_row_set_activatable_widget", libs);
  gidLink(cast(void**)&adw_action_row_set_icon_name, "adw_action_row_set_icon_name", libs);
  gidLink(cast(void**)&adw_action_row_set_subtitle, "adw_action_row_set_subtitle", libs);
  gidLink(cast(void**)&adw_action_row_set_subtitle_lines, "adw_action_row_set_subtitle_lines", libs);
  gidLink(cast(void**)&adw_action_row_set_subtitle_selectable, "adw_action_row_set_subtitle_selectable", libs);
  gidLink(cast(void**)&adw_action_row_set_title_lines, "adw_action_row_set_title_lines", libs);

  // AlertDialog
  gidLink(cast(void**)&adw_alert_dialog_get_type, "adw_alert_dialog_get_type", libs);
  gidLink(cast(void**)&adw_alert_dialog_new, "adw_alert_dialog_new", libs);
  gidLink(cast(void**)&adw_alert_dialog_add_response, "adw_alert_dialog_add_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_add_responses, "adw_alert_dialog_add_responses", libs);
  gidLink(cast(void**)&adw_alert_dialog_choose, "adw_alert_dialog_choose", libs);
  gidLink(cast(void**)&adw_alert_dialog_choose_finish, "adw_alert_dialog_choose_finish", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_body, "adw_alert_dialog_format_body", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_body_markup, "adw_alert_dialog_format_body_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_heading, "adw_alert_dialog_format_heading", libs);
  gidLink(cast(void**)&adw_alert_dialog_format_heading_markup, "adw_alert_dialog_format_heading_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_body, "adw_alert_dialog_get_body", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_body_use_markup, "adw_alert_dialog_get_body_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_close_response, "adw_alert_dialog_get_close_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_default_response, "adw_alert_dialog_get_default_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_extra_child, "adw_alert_dialog_get_extra_child", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_heading, "adw_alert_dialog_get_heading", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_heading_use_markup, "adw_alert_dialog_get_heading_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_response_appearance, "adw_alert_dialog_get_response_appearance", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_response_enabled, "adw_alert_dialog_get_response_enabled", libs);
  gidLink(cast(void**)&adw_alert_dialog_get_response_label, "adw_alert_dialog_get_response_label", libs);
  gidLink(cast(void**)&adw_alert_dialog_has_response, "adw_alert_dialog_has_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_remove_response, "adw_alert_dialog_remove_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_body, "adw_alert_dialog_set_body", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_body_use_markup, "adw_alert_dialog_set_body_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_close_response, "adw_alert_dialog_set_close_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_default_response, "adw_alert_dialog_set_default_response", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_extra_child, "adw_alert_dialog_set_extra_child", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_heading, "adw_alert_dialog_set_heading", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_heading_use_markup, "adw_alert_dialog_set_heading_use_markup", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_response_appearance, "adw_alert_dialog_set_response_appearance", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_response_enabled, "adw_alert_dialog_set_response_enabled", libs);
  gidLink(cast(void**)&adw_alert_dialog_set_response_label, "adw_alert_dialog_set_response_label", libs);

  // Animation
  gidLink(cast(void**)&adw_animation_get_type, "adw_animation_get_type", libs);
  gidLink(cast(void**)&adw_animation_get_follow_enable_animations_setting, "adw_animation_get_follow_enable_animations_setting", libs);
  gidLink(cast(void**)&adw_animation_get_state, "adw_animation_get_state", libs);
  gidLink(cast(void**)&adw_animation_get_target, "adw_animation_get_target", libs);
  gidLink(cast(void**)&adw_animation_get_value, "adw_animation_get_value", libs);
  gidLink(cast(void**)&adw_animation_get_widget, "adw_animation_get_widget", libs);
  gidLink(cast(void**)&adw_animation_pause, "adw_animation_pause", libs);
  gidLink(cast(void**)&adw_animation_play, "adw_animation_play", libs);
  gidLink(cast(void**)&adw_animation_reset, "adw_animation_reset", libs);
  gidLink(cast(void**)&adw_animation_resume, "adw_animation_resume", libs);
  gidLink(cast(void**)&adw_animation_set_follow_enable_animations_setting, "adw_animation_set_follow_enable_animations_setting", libs);
  gidLink(cast(void**)&adw_animation_set_target, "adw_animation_set_target", libs);
  gidLink(cast(void**)&adw_animation_skip, "adw_animation_skip", libs);

  // AnimationTarget
  gidLink(cast(void**)&adw_animation_target_get_type, "adw_animation_target_get_type", libs);

  // Application
  gidLink(cast(void**)&adw_application_get_type, "adw_application_get_type", libs);
  gidLink(cast(void**)&adw_application_new, "adw_application_new", libs);
  gidLink(cast(void**)&adw_application_get_style_manager, "adw_application_get_style_manager", libs);

  // ApplicationWindow
  gidLink(cast(void**)&adw_application_window_get_type, "adw_application_window_get_type", libs);
  gidLink(cast(void**)&adw_application_window_new, "adw_application_window_new", libs);
  gidLink(cast(void**)&adw_application_window_add_breakpoint, "adw_application_window_add_breakpoint", libs);
  gidLink(cast(void**)&adw_application_window_get_content, "adw_application_window_get_content", libs);
  gidLink(cast(void**)&adw_application_window_get_current_breakpoint, "adw_application_window_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_application_window_get_dialogs, "adw_application_window_get_dialogs", libs);
  gidLink(cast(void**)&adw_application_window_get_visible_dialog, "adw_application_window_get_visible_dialog", libs);
  gidLink(cast(void**)&adw_application_window_set_content, "adw_application_window_set_content", libs);

  // Avatar
  gidLink(cast(void**)&adw_avatar_get_type, "adw_avatar_get_type", libs);
  gidLink(cast(void**)&adw_avatar_new, "adw_avatar_new", libs);
  gidLink(cast(void**)&adw_avatar_draw_to_texture, "adw_avatar_draw_to_texture", libs);
  gidLink(cast(void**)&adw_avatar_get_custom_image, "adw_avatar_get_custom_image", libs);
  gidLink(cast(void**)&adw_avatar_get_icon_name, "adw_avatar_get_icon_name", libs);
  gidLink(cast(void**)&adw_avatar_get_show_initials, "adw_avatar_get_show_initials", libs);
  gidLink(cast(void**)&adw_avatar_get_size, "adw_avatar_get_size", libs);
  gidLink(cast(void**)&adw_avatar_get_text, "adw_avatar_get_text", libs);
  gidLink(cast(void**)&adw_avatar_set_custom_image, "adw_avatar_set_custom_image", libs);
  gidLink(cast(void**)&adw_avatar_set_icon_name, "adw_avatar_set_icon_name", libs);
  gidLink(cast(void**)&adw_avatar_set_show_initials, "adw_avatar_set_show_initials", libs);
  gidLink(cast(void**)&adw_avatar_set_size, "adw_avatar_set_size", libs);
  gidLink(cast(void**)&adw_avatar_set_text, "adw_avatar_set_text", libs);

  // Banner
  gidLink(cast(void**)&adw_banner_get_type, "adw_banner_get_type", libs);
  gidLink(cast(void**)&adw_banner_new, "adw_banner_new", libs);
  gidLink(cast(void**)&adw_banner_get_button_label, "adw_banner_get_button_label", libs);
  gidLink(cast(void**)&adw_banner_get_revealed, "adw_banner_get_revealed", libs);
  gidLink(cast(void**)&adw_banner_get_title, "adw_banner_get_title", libs);
  gidLink(cast(void**)&adw_banner_get_use_markup, "adw_banner_get_use_markup", libs);
  gidLink(cast(void**)&adw_banner_set_button_label, "adw_banner_set_button_label", libs);
  gidLink(cast(void**)&adw_banner_set_revealed, "adw_banner_set_revealed", libs);
  gidLink(cast(void**)&adw_banner_set_title, "adw_banner_set_title", libs);
  gidLink(cast(void**)&adw_banner_set_use_markup, "adw_banner_set_use_markup", libs);

  // Bin
  gidLink(cast(void**)&adw_bin_get_type, "adw_bin_get_type", libs);
  gidLink(cast(void**)&adw_bin_new, "adw_bin_new", libs);
  gidLink(cast(void**)&adw_bin_get_child, "adw_bin_get_child", libs);
  gidLink(cast(void**)&adw_bin_set_child, "adw_bin_set_child", libs);

  // Breakpoint
  gidLink(cast(void**)&adw_breakpoint_get_type, "adw_breakpoint_get_type", libs);
  gidLink(cast(void**)&adw_breakpoint_new, "adw_breakpoint_new", libs);
  gidLink(cast(void**)&adw_breakpoint_add_setter, "adw_breakpoint_add_setter", libs);
  gidLink(cast(void**)&adw_breakpoint_add_setters, "adw_breakpoint_add_setters", libs);
  gidLink(cast(void**)&adw_breakpoint_add_setters_valist, "adw_breakpoint_add_setters_valist", libs);
  gidLink(cast(void**)&adw_breakpoint_add_settersv, "adw_breakpoint_add_settersv", libs);
  gidLink(cast(void**)&adw_breakpoint_get_condition, "adw_breakpoint_get_condition", libs);
  gidLink(cast(void**)&adw_breakpoint_set_condition, "adw_breakpoint_set_condition", libs);

  // BreakpointBin
  gidLink(cast(void**)&adw_breakpoint_bin_get_type, "adw_breakpoint_bin_get_type", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_new, "adw_breakpoint_bin_new", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_add_breakpoint, "adw_breakpoint_bin_add_breakpoint", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_get_child, "adw_breakpoint_bin_get_child", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_get_current_breakpoint, "adw_breakpoint_bin_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_remove_breakpoint, "adw_breakpoint_bin_remove_breakpoint", libs);
  gidLink(cast(void**)&adw_breakpoint_bin_set_child, "adw_breakpoint_bin_set_child", libs);

  // BreakpointCondition
  gidLink(cast(void**)&adw_breakpoint_condition_get_type, "adw_breakpoint_condition_get_type", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_and, "adw_breakpoint_condition_new_and", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_length, "adw_breakpoint_condition_new_length", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_or, "adw_breakpoint_condition_new_or", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_new_ratio, "adw_breakpoint_condition_new_ratio", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_copy, "adw_breakpoint_condition_copy", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_free, "adw_breakpoint_condition_free", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_to_string, "adw_breakpoint_condition_to_string", libs);
  gidLink(cast(void**)&adw_breakpoint_condition_parse, "adw_breakpoint_condition_parse", libs);

  // ButtonContent
  gidLink(cast(void**)&adw_button_content_get_type, "adw_button_content_get_type", libs);
  gidLink(cast(void**)&adw_button_content_new, "adw_button_content_new", libs);
  gidLink(cast(void**)&adw_button_content_get_can_shrink, "adw_button_content_get_can_shrink", libs);
  gidLink(cast(void**)&adw_button_content_get_icon_name, "adw_button_content_get_icon_name", libs);
  gidLink(cast(void**)&adw_button_content_get_label, "adw_button_content_get_label", libs);
  gidLink(cast(void**)&adw_button_content_get_use_underline, "adw_button_content_get_use_underline", libs);
  gidLink(cast(void**)&adw_button_content_set_can_shrink, "adw_button_content_set_can_shrink", libs);
  gidLink(cast(void**)&adw_button_content_set_icon_name, "adw_button_content_set_icon_name", libs);
  gidLink(cast(void**)&adw_button_content_set_label, "adw_button_content_set_label", libs);
  gidLink(cast(void**)&adw_button_content_set_use_underline, "adw_button_content_set_use_underline", libs);

  // CallbackAnimationTarget
  gidLink(cast(void**)&adw_callback_animation_target_get_type, "adw_callback_animation_target_get_type", libs);
  gidLink(cast(void**)&adw_callback_animation_target_new, "adw_callback_animation_target_new", libs);

  // Carousel
  gidLink(cast(void**)&adw_carousel_get_type, "adw_carousel_get_type", libs);
  gidLink(cast(void**)&adw_carousel_new, "adw_carousel_new", libs);
  gidLink(cast(void**)&adw_carousel_append, "adw_carousel_append", libs);
  gidLink(cast(void**)&adw_carousel_get_allow_long_swipes, "adw_carousel_get_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_carousel_get_allow_mouse_drag, "adw_carousel_get_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_carousel_get_allow_scroll_wheel, "adw_carousel_get_allow_scroll_wheel", libs);
  gidLink(cast(void**)&adw_carousel_get_interactive, "adw_carousel_get_interactive", libs);
  gidLink(cast(void**)&adw_carousel_get_n_pages, "adw_carousel_get_n_pages", libs);
  gidLink(cast(void**)&adw_carousel_get_nth_page, "adw_carousel_get_nth_page", libs);
  gidLink(cast(void**)&adw_carousel_get_position, "adw_carousel_get_position", libs);
  gidLink(cast(void**)&adw_carousel_get_reveal_duration, "adw_carousel_get_reveal_duration", libs);
  gidLink(cast(void**)&adw_carousel_get_scroll_params, "adw_carousel_get_scroll_params", libs);
  gidLink(cast(void**)&adw_carousel_get_spacing, "adw_carousel_get_spacing", libs);
  gidLink(cast(void**)&adw_carousel_insert, "adw_carousel_insert", libs);
  gidLink(cast(void**)&adw_carousel_prepend, "adw_carousel_prepend", libs);
  gidLink(cast(void**)&adw_carousel_remove, "adw_carousel_remove", libs);
  gidLink(cast(void**)&adw_carousel_reorder, "adw_carousel_reorder", libs);
  gidLink(cast(void**)&adw_carousel_scroll_to, "adw_carousel_scroll_to", libs);
  gidLink(cast(void**)&adw_carousel_set_allow_long_swipes, "adw_carousel_set_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_carousel_set_allow_mouse_drag, "adw_carousel_set_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_carousel_set_allow_scroll_wheel, "adw_carousel_set_allow_scroll_wheel", libs);
  gidLink(cast(void**)&adw_carousel_set_interactive, "adw_carousel_set_interactive", libs);
  gidLink(cast(void**)&adw_carousel_set_reveal_duration, "adw_carousel_set_reveal_duration", libs);
  gidLink(cast(void**)&adw_carousel_set_scroll_params, "adw_carousel_set_scroll_params", libs);
  gidLink(cast(void**)&adw_carousel_set_spacing, "adw_carousel_set_spacing", libs);

  // CarouselIndicatorDots
  gidLink(cast(void**)&adw_carousel_indicator_dots_get_type, "adw_carousel_indicator_dots_get_type", libs);
  gidLink(cast(void**)&adw_carousel_indicator_dots_new, "adw_carousel_indicator_dots_new", libs);
  gidLink(cast(void**)&adw_carousel_indicator_dots_get_carousel, "adw_carousel_indicator_dots_get_carousel", libs);
  gidLink(cast(void**)&adw_carousel_indicator_dots_set_carousel, "adw_carousel_indicator_dots_set_carousel", libs);

  // CarouselIndicatorLines
  gidLink(cast(void**)&adw_carousel_indicator_lines_get_type, "adw_carousel_indicator_lines_get_type", libs);
  gidLink(cast(void**)&adw_carousel_indicator_lines_new, "adw_carousel_indicator_lines_new", libs);
  gidLink(cast(void**)&adw_carousel_indicator_lines_get_carousel, "adw_carousel_indicator_lines_get_carousel", libs);
  gidLink(cast(void**)&adw_carousel_indicator_lines_set_carousel, "adw_carousel_indicator_lines_set_carousel", libs);

  // Clamp
  gidLink(cast(void**)&adw_clamp_get_type, "adw_clamp_get_type", libs);
  gidLink(cast(void**)&adw_clamp_new, "adw_clamp_new", libs);
  gidLink(cast(void**)&adw_clamp_get_child, "adw_clamp_get_child", libs);
  gidLink(cast(void**)&adw_clamp_get_maximum_size, "adw_clamp_get_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_get_tightening_threshold, "adw_clamp_get_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_get_unit, "adw_clamp_get_unit", libs);
  gidLink(cast(void**)&adw_clamp_set_child, "adw_clamp_set_child", libs);
  gidLink(cast(void**)&adw_clamp_set_maximum_size, "adw_clamp_set_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_set_tightening_threshold, "adw_clamp_set_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_set_unit, "adw_clamp_set_unit", libs);

  // ClampLayout
  gidLink(cast(void**)&adw_clamp_layout_get_type, "adw_clamp_layout_get_type", libs);
  gidLink(cast(void**)&adw_clamp_layout_new, "adw_clamp_layout_new", libs);
  gidLink(cast(void**)&adw_clamp_layout_get_maximum_size, "adw_clamp_layout_get_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_layout_get_tightening_threshold, "adw_clamp_layout_get_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_layout_get_unit, "adw_clamp_layout_get_unit", libs);
  gidLink(cast(void**)&adw_clamp_layout_set_maximum_size, "adw_clamp_layout_set_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_layout_set_tightening_threshold, "adw_clamp_layout_set_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_layout_set_unit, "adw_clamp_layout_set_unit", libs);

  // ClampScrollable
  gidLink(cast(void**)&adw_clamp_scrollable_get_type, "adw_clamp_scrollable_get_type", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_new, "adw_clamp_scrollable_new", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_child, "adw_clamp_scrollable_get_child", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_maximum_size, "adw_clamp_scrollable_get_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_tightening_threshold, "adw_clamp_scrollable_get_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_get_unit, "adw_clamp_scrollable_get_unit", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_child, "adw_clamp_scrollable_set_child", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_maximum_size, "adw_clamp_scrollable_set_maximum_size", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_tightening_threshold, "adw_clamp_scrollable_set_tightening_threshold", libs);
  gidLink(cast(void**)&adw_clamp_scrollable_set_unit, "adw_clamp_scrollable_set_unit", libs);

  // ComboRow
  gidLink(cast(void**)&adw_combo_row_get_type, "adw_combo_row_get_type", libs);
  gidLink(cast(void**)&adw_combo_row_new, "adw_combo_row_new", libs);
  gidLink(cast(void**)&adw_combo_row_get_enable_search, "adw_combo_row_get_enable_search", libs);
  gidLink(cast(void**)&adw_combo_row_get_expression, "adw_combo_row_get_expression", libs);
  gidLink(cast(void**)&adw_combo_row_get_factory, "adw_combo_row_get_factory", libs);
  gidLink(cast(void**)&adw_combo_row_get_list_factory, "adw_combo_row_get_list_factory", libs);
  gidLink(cast(void**)&adw_combo_row_get_model, "adw_combo_row_get_model", libs);
  gidLink(cast(void**)&adw_combo_row_get_selected, "adw_combo_row_get_selected", libs);
  gidLink(cast(void**)&adw_combo_row_get_selected_item, "adw_combo_row_get_selected_item", libs);
  gidLink(cast(void**)&adw_combo_row_get_use_subtitle, "adw_combo_row_get_use_subtitle", libs);
  gidLink(cast(void**)&adw_combo_row_set_enable_search, "adw_combo_row_set_enable_search", libs);
  gidLink(cast(void**)&adw_combo_row_set_expression, "adw_combo_row_set_expression", libs);
  gidLink(cast(void**)&adw_combo_row_set_factory, "adw_combo_row_set_factory", libs);
  gidLink(cast(void**)&adw_combo_row_set_list_factory, "adw_combo_row_set_list_factory", libs);
  gidLink(cast(void**)&adw_combo_row_set_model, "adw_combo_row_set_model", libs);
  gidLink(cast(void**)&adw_combo_row_set_selected, "adw_combo_row_set_selected", libs);
  gidLink(cast(void**)&adw_combo_row_set_use_subtitle, "adw_combo_row_set_use_subtitle", libs);

  // Dialog
  gidLink(cast(void**)&adw_dialog_get_type, "adw_dialog_get_type", libs);
  gidLink(cast(void**)&adw_dialog_new, "adw_dialog_new", libs);
  gidLink(cast(void**)&adw_dialog_add_breakpoint, "adw_dialog_add_breakpoint", libs);
  gidLink(cast(void**)&adw_dialog_close, "adw_dialog_close", libs);
  gidLink(cast(void**)&adw_dialog_force_close, "adw_dialog_force_close", libs);
  gidLink(cast(void**)&adw_dialog_get_can_close, "adw_dialog_get_can_close", libs);
  gidLink(cast(void**)&adw_dialog_get_child, "adw_dialog_get_child", libs);
  gidLink(cast(void**)&adw_dialog_get_content_height, "adw_dialog_get_content_height", libs);
  gidLink(cast(void**)&adw_dialog_get_content_width, "adw_dialog_get_content_width", libs);
  gidLink(cast(void**)&adw_dialog_get_current_breakpoint, "adw_dialog_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_dialog_get_default_widget, "adw_dialog_get_default_widget", libs);
  gidLink(cast(void**)&adw_dialog_get_focus, "adw_dialog_get_focus", libs);
  gidLink(cast(void**)&adw_dialog_get_follows_content_size, "adw_dialog_get_follows_content_size", libs);
  gidLink(cast(void**)&adw_dialog_get_presentation_mode, "adw_dialog_get_presentation_mode", libs);
  gidLink(cast(void**)&adw_dialog_get_title, "adw_dialog_get_title", libs);
  gidLink(cast(void**)&adw_dialog_present, "adw_dialog_present", libs);
  gidLink(cast(void**)&adw_dialog_set_can_close, "adw_dialog_set_can_close", libs);
  gidLink(cast(void**)&adw_dialog_set_child, "adw_dialog_set_child", libs);
  gidLink(cast(void**)&adw_dialog_set_content_height, "adw_dialog_set_content_height", libs);
  gidLink(cast(void**)&adw_dialog_set_content_width, "adw_dialog_set_content_width", libs);
  gidLink(cast(void**)&adw_dialog_set_default_widget, "adw_dialog_set_default_widget", libs);
  gidLink(cast(void**)&adw_dialog_set_focus, "adw_dialog_set_focus", libs);
  gidLink(cast(void**)&adw_dialog_set_follows_content_size, "adw_dialog_set_follows_content_size", libs);
  gidLink(cast(void**)&adw_dialog_set_presentation_mode, "adw_dialog_set_presentation_mode", libs);
  gidLink(cast(void**)&adw_dialog_set_title, "adw_dialog_set_title", libs);

  // EntryRow
  gidLink(cast(void**)&adw_entry_row_get_type, "adw_entry_row_get_type", libs);
  gidLink(cast(void**)&adw_entry_row_new, "adw_entry_row_new", libs);
  gidLink(cast(void**)&adw_entry_row_add_prefix, "adw_entry_row_add_prefix", libs);
  gidLink(cast(void**)&adw_entry_row_add_suffix, "adw_entry_row_add_suffix", libs);
  gidLink(cast(void**)&adw_entry_row_get_activates_default, "adw_entry_row_get_activates_default", libs);
  gidLink(cast(void**)&adw_entry_row_get_attributes, "adw_entry_row_get_attributes", libs);
  gidLink(cast(void**)&adw_entry_row_get_enable_emoji_completion, "adw_entry_row_get_enable_emoji_completion", libs);
  gidLink(cast(void**)&adw_entry_row_get_input_hints, "adw_entry_row_get_input_hints", libs);
  gidLink(cast(void**)&adw_entry_row_get_input_purpose, "adw_entry_row_get_input_purpose", libs);
  gidLink(cast(void**)&adw_entry_row_get_show_apply_button, "adw_entry_row_get_show_apply_button", libs);
  gidLink(cast(void**)&adw_entry_row_get_text_length, "adw_entry_row_get_text_length", libs);
  gidLink(cast(void**)&adw_entry_row_grab_focus_without_selecting, "adw_entry_row_grab_focus_without_selecting", libs);
  gidLink(cast(void**)&adw_entry_row_remove, "adw_entry_row_remove", libs);
  gidLink(cast(void**)&adw_entry_row_set_activates_default, "adw_entry_row_set_activates_default", libs);
  gidLink(cast(void**)&adw_entry_row_set_attributes, "adw_entry_row_set_attributes", libs);
  gidLink(cast(void**)&adw_entry_row_set_enable_emoji_completion, "adw_entry_row_set_enable_emoji_completion", libs);
  gidLink(cast(void**)&adw_entry_row_set_input_hints, "adw_entry_row_set_input_hints", libs);
  gidLink(cast(void**)&adw_entry_row_set_input_purpose, "adw_entry_row_set_input_purpose", libs);
  gidLink(cast(void**)&adw_entry_row_set_show_apply_button, "adw_entry_row_set_show_apply_button", libs);

  // EnumListItem
  gidLink(cast(void**)&adw_enum_list_item_get_type, "adw_enum_list_item_get_type", libs);
  gidLink(cast(void**)&adw_enum_list_item_get_name, "adw_enum_list_item_get_name", libs);
  gidLink(cast(void**)&adw_enum_list_item_get_nick, "adw_enum_list_item_get_nick", libs);
  gidLink(cast(void**)&adw_enum_list_item_get_value, "adw_enum_list_item_get_value", libs);

  // EnumListModel
  gidLink(cast(void**)&adw_enum_list_model_get_type, "adw_enum_list_model_get_type", libs);
  gidLink(cast(void**)&adw_enum_list_model_new, "adw_enum_list_model_new", libs);
  gidLink(cast(void**)&adw_enum_list_model_find_position, "adw_enum_list_model_find_position", libs);
  gidLink(cast(void**)&adw_enum_list_model_get_enum_type, "adw_enum_list_model_get_enum_type", libs);

  // ExpanderRow
  gidLink(cast(void**)&adw_expander_row_get_type, "adw_expander_row_get_type", libs);
  gidLink(cast(void**)&adw_expander_row_new, "adw_expander_row_new", libs);
  gidLink(cast(void**)&adw_expander_row_add_action, "adw_expander_row_add_action", libs);
  gidLink(cast(void**)&adw_expander_row_add_prefix, "adw_expander_row_add_prefix", libs);
  gidLink(cast(void**)&adw_expander_row_add_row, "adw_expander_row_add_row", libs);
  gidLink(cast(void**)&adw_expander_row_add_suffix, "adw_expander_row_add_suffix", libs);
  gidLink(cast(void**)&adw_expander_row_get_enable_expansion, "adw_expander_row_get_enable_expansion", libs);
  gidLink(cast(void**)&adw_expander_row_get_expanded, "adw_expander_row_get_expanded", libs);
  gidLink(cast(void**)&adw_expander_row_get_icon_name, "adw_expander_row_get_icon_name", libs);
  gidLink(cast(void**)&adw_expander_row_get_show_enable_switch, "adw_expander_row_get_show_enable_switch", libs);
  gidLink(cast(void**)&adw_expander_row_get_subtitle, "adw_expander_row_get_subtitle", libs);
  gidLink(cast(void**)&adw_expander_row_get_subtitle_lines, "adw_expander_row_get_subtitle_lines", libs);
  gidLink(cast(void**)&adw_expander_row_get_title_lines, "adw_expander_row_get_title_lines", libs);
  gidLink(cast(void**)&adw_expander_row_remove, "adw_expander_row_remove", libs);
  gidLink(cast(void**)&adw_expander_row_set_enable_expansion, "adw_expander_row_set_enable_expansion", libs);
  gidLink(cast(void**)&adw_expander_row_set_expanded, "adw_expander_row_set_expanded", libs);
  gidLink(cast(void**)&adw_expander_row_set_icon_name, "adw_expander_row_set_icon_name", libs);
  gidLink(cast(void**)&adw_expander_row_set_show_enable_switch, "adw_expander_row_set_show_enable_switch", libs);
  gidLink(cast(void**)&adw_expander_row_set_subtitle, "adw_expander_row_set_subtitle", libs);
  gidLink(cast(void**)&adw_expander_row_set_subtitle_lines, "adw_expander_row_set_subtitle_lines", libs);
  gidLink(cast(void**)&adw_expander_row_set_title_lines, "adw_expander_row_set_title_lines", libs);

  // Flap
  gidLink(cast(void**)&adw_flap_get_type, "adw_flap_get_type", libs);
  gidLink(cast(void**)&adw_flap_new, "adw_flap_new", libs);
  gidLink(cast(void**)&adw_flap_get_content, "adw_flap_get_content", libs);
  gidLink(cast(void**)&adw_flap_get_flap, "adw_flap_get_flap", libs);
  gidLink(cast(void**)&adw_flap_get_flap_position, "adw_flap_get_flap_position", libs);
  gidLink(cast(void**)&adw_flap_get_fold_duration, "adw_flap_get_fold_duration", libs);
  gidLink(cast(void**)&adw_flap_get_fold_policy, "adw_flap_get_fold_policy", libs);
  gidLink(cast(void**)&adw_flap_get_fold_threshold_policy, "adw_flap_get_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_flap_get_folded, "adw_flap_get_folded", libs);
  gidLink(cast(void**)&adw_flap_get_locked, "adw_flap_get_locked", libs);
  gidLink(cast(void**)&adw_flap_get_modal, "adw_flap_get_modal", libs);
  gidLink(cast(void**)&adw_flap_get_reveal_flap, "adw_flap_get_reveal_flap", libs);
  gidLink(cast(void**)&adw_flap_get_reveal_params, "adw_flap_get_reveal_params", libs);
  gidLink(cast(void**)&adw_flap_get_reveal_progress, "adw_flap_get_reveal_progress", libs);
  gidLink(cast(void**)&adw_flap_get_separator, "adw_flap_get_separator", libs);
  gidLink(cast(void**)&adw_flap_get_swipe_to_close, "adw_flap_get_swipe_to_close", libs);
  gidLink(cast(void**)&adw_flap_get_swipe_to_open, "adw_flap_get_swipe_to_open", libs);
  gidLink(cast(void**)&adw_flap_get_transition_type, "adw_flap_get_transition_type", libs);
  gidLink(cast(void**)&adw_flap_set_content, "adw_flap_set_content", libs);
  gidLink(cast(void**)&adw_flap_set_flap, "adw_flap_set_flap", libs);
  gidLink(cast(void**)&adw_flap_set_flap_position, "adw_flap_set_flap_position", libs);
  gidLink(cast(void**)&adw_flap_set_fold_duration, "adw_flap_set_fold_duration", libs);
  gidLink(cast(void**)&adw_flap_set_fold_policy, "adw_flap_set_fold_policy", libs);
  gidLink(cast(void**)&adw_flap_set_fold_threshold_policy, "adw_flap_set_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_flap_set_locked, "adw_flap_set_locked", libs);
  gidLink(cast(void**)&adw_flap_set_modal, "adw_flap_set_modal", libs);
  gidLink(cast(void**)&adw_flap_set_reveal_flap, "adw_flap_set_reveal_flap", libs);
  gidLink(cast(void**)&adw_flap_set_reveal_params, "adw_flap_set_reveal_params", libs);
  gidLink(cast(void**)&adw_flap_set_separator, "adw_flap_set_separator", libs);
  gidLink(cast(void**)&adw_flap_set_swipe_to_close, "adw_flap_set_swipe_to_close", libs);
  gidLink(cast(void**)&adw_flap_set_swipe_to_open, "adw_flap_set_swipe_to_open", libs);
  gidLink(cast(void**)&adw_flap_set_transition_type, "adw_flap_set_transition_type", libs);

  // HeaderBar
  gidLink(cast(void**)&adw_header_bar_get_type, "adw_header_bar_get_type", libs);
  gidLink(cast(void**)&adw_header_bar_new, "adw_header_bar_new", libs);
  gidLink(cast(void**)&adw_header_bar_get_centering_policy, "adw_header_bar_get_centering_policy", libs);
  gidLink(cast(void**)&adw_header_bar_get_decoration_layout, "adw_header_bar_get_decoration_layout", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_back_button, "adw_header_bar_get_show_back_button", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_end_title_buttons, "adw_header_bar_get_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_start_title_buttons, "adw_header_bar_get_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_get_show_title, "adw_header_bar_get_show_title", libs);
  gidLink(cast(void**)&adw_header_bar_get_title_widget, "adw_header_bar_get_title_widget", libs);
  gidLink(cast(void**)&adw_header_bar_pack_end, "adw_header_bar_pack_end", libs);
  gidLink(cast(void**)&adw_header_bar_pack_start, "adw_header_bar_pack_start", libs);
  gidLink(cast(void**)&adw_header_bar_remove, "adw_header_bar_remove", libs);
  gidLink(cast(void**)&adw_header_bar_set_centering_policy, "adw_header_bar_set_centering_policy", libs);
  gidLink(cast(void**)&adw_header_bar_set_decoration_layout, "adw_header_bar_set_decoration_layout", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_back_button, "adw_header_bar_set_show_back_button", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_end_title_buttons, "adw_header_bar_set_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_start_title_buttons, "adw_header_bar_set_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_header_bar_set_show_title, "adw_header_bar_set_show_title", libs);
  gidLink(cast(void**)&adw_header_bar_set_title_widget, "adw_header_bar_set_title_widget", libs);

  // Leaflet
  gidLink(cast(void**)&adw_leaflet_get_type, "adw_leaflet_get_type", libs);
  gidLink(cast(void**)&adw_leaflet_new, "adw_leaflet_new", libs);
  gidLink(cast(void**)&adw_leaflet_append, "adw_leaflet_append", libs);
  gidLink(cast(void**)&adw_leaflet_get_adjacent_child, "adw_leaflet_get_adjacent_child", libs);
  gidLink(cast(void**)&adw_leaflet_get_can_navigate_back, "adw_leaflet_get_can_navigate_back", libs);
  gidLink(cast(void**)&adw_leaflet_get_can_navigate_forward, "adw_leaflet_get_can_navigate_forward", libs);
  gidLink(cast(void**)&adw_leaflet_get_can_unfold, "adw_leaflet_get_can_unfold", libs);
  gidLink(cast(void**)&adw_leaflet_get_child_by_name, "adw_leaflet_get_child_by_name", libs);
  gidLink(cast(void**)&adw_leaflet_get_child_transition_params, "adw_leaflet_get_child_transition_params", libs);
  gidLink(cast(void**)&adw_leaflet_get_child_transition_running, "adw_leaflet_get_child_transition_running", libs);
  gidLink(cast(void**)&adw_leaflet_get_fold_threshold_policy, "adw_leaflet_get_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_leaflet_get_folded, "adw_leaflet_get_folded", libs);
  gidLink(cast(void**)&adw_leaflet_get_homogeneous, "adw_leaflet_get_homogeneous", libs);
  gidLink(cast(void**)&adw_leaflet_get_mode_transition_duration, "adw_leaflet_get_mode_transition_duration", libs);
  gidLink(cast(void**)&adw_leaflet_get_page, "adw_leaflet_get_page", libs);
  gidLink(cast(void**)&adw_leaflet_get_pages, "adw_leaflet_get_pages", libs);
  gidLink(cast(void**)&adw_leaflet_get_transition_type, "adw_leaflet_get_transition_type", libs);
  gidLink(cast(void**)&adw_leaflet_get_visible_child, "adw_leaflet_get_visible_child", libs);
  gidLink(cast(void**)&adw_leaflet_get_visible_child_name, "adw_leaflet_get_visible_child_name", libs);
  gidLink(cast(void**)&adw_leaflet_insert_child_after, "adw_leaflet_insert_child_after", libs);
  gidLink(cast(void**)&adw_leaflet_navigate, "adw_leaflet_navigate", libs);
  gidLink(cast(void**)&adw_leaflet_prepend, "adw_leaflet_prepend", libs);
  gidLink(cast(void**)&adw_leaflet_remove, "adw_leaflet_remove", libs);
  gidLink(cast(void**)&adw_leaflet_reorder_child_after, "adw_leaflet_reorder_child_after", libs);
  gidLink(cast(void**)&adw_leaflet_set_can_navigate_back, "adw_leaflet_set_can_navigate_back", libs);
  gidLink(cast(void**)&adw_leaflet_set_can_navigate_forward, "adw_leaflet_set_can_navigate_forward", libs);
  gidLink(cast(void**)&adw_leaflet_set_can_unfold, "adw_leaflet_set_can_unfold", libs);
  gidLink(cast(void**)&adw_leaflet_set_child_transition_params, "adw_leaflet_set_child_transition_params", libs);
  gidLink(cast(void**)&adw_leaflet_set_fold_threshold_policy, "adw_leaflet_set_fold_threshold_policy", libs);
  gidLink(cast(void**)&adw_leaflet_set_homogeneous, "adw_leaflet_set_homogeneous", libs);
  gidLink(cast(void**)&adw_leaflet_set_mode_transition_duration, "adw_leaflet_set_mode_transition_duration", libs);
  gidLink(cast(void**)&adw_leaflet_set_transition_type, "adw_leaflet_set_transition_type", libs);
  gidLink(cast(void**)&adw_leaflet_set_visible_child, "adw_leaflet_set_visible_child", libs);
  gidLink(cast(void**)&adw_leaflet_set_visible_child_name, "adw_leaflet_set_visible_child_name", libs);

  // LeafletPage
  gidLink(cast(void**)&adw_leaflet_page_get_type, "adw_leaflet_page_get_type", libs);
  gidLink(cast(void**)&adw_leaflet_page_get_child, "adw_leaflet_page_get_child", libs);
  gidLink(cast(void**)&adw_leaflet_page_get_name, "adw_leaflet_page_get_name", libs);
  gidLink(cast(void**)&adw_leaflet_page_get_navigatable, "adw_leaflet_page_get_navigatable", libs);
  gidLink(cast(void**)&adw_leaflet_page_set_name, "adw_leaflet_page_set_name", libs);
  gidLink(cast(void**)&adw_leaflet_page_set_navigatable, "adw_leaflet_page_set_navigatable", libs);

  // MessageDialog
  gidLink(cast(void**)&adw_message_dialog_get_type, "adw_message_dialog_get_type", libs);
  gidLink(cast(void**)&adw_message_dialog_new, "adw_message_dialog_new", libs);
  gidLink(cast(void**)&adw_message_dialog_add_response, "adw_message_dialog_add_response", libs);
  gidLink(cast(void**)&adw_message_dialog_add_responses, "adw_message_dialog_add_responses", libs);
  gidLink(cast(void**)&adw_message_dialog_choose, "adw_message_dialog_choose", libs);
  gidLink(cast(void**)&adw_message_dialog_choose_finish, "adw_message_dialog_choose_finish", libs);
  gidLink(cast(void**)&adw_message_dialog_format_body, "adw_message_dialog_format_body", libs);
  gidLink(cast(void**)&adw_message_dialog_format_body_markup, "adw_message_dialog_format_body_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_format_heading, "adw_message_dialog_format_heading", libs);
  gidLink(cast(void**)&adw_message_dialog_format_heading_markup, "adw_message_dialog_format_heading_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_get_body, "adw_message_dialog_get_body", libs);
  gidLink(cast(void**)&adw_message_dialog_get_body_use_markup, "adw_message_dialog_get_body_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_get_close_response, "adw_message_dialog_get_close_response", libs);
  gidLink(cast(void**)&adw_message_dialog_get_default_response, "adw_message_dialog_get_default_response", libs);
  gidLink(cast(void**)&adw_message_dialog_get_extra_child, "adw_message_dialog_get_extra_child", libs);
  gidLink(cast(void**)&adw_message_dialog_get_heading, "adw_message_dialog_get_heading", libs);
  gidLink(cast(void**)&adw_message_dialog_get_heading_use_markup, "adw_message_dialog_get_heading_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_get_response_appearance, "adw_message_dialog_get_response_appearance", libs);
  gidLink(cast(void**)&adw_message_dialog_get_response_enabled, "adw_message_dialog_get_response_enabled", libs);
  gidLink(cast(void**)&adw_message_dialog_get_response_label, "adw_message_dialog_get_response_label", libs);
  gidLink(cast(void**)&adw_message_dialog_has_response, "adw_message_dialog_has_response", libs);
  gidLink(cast(void**)&adw_message_dialog_remove_response, "adw_message_dialog_remove_response", libs);
  gidLink(cast(void**)&adw_message_dialog_response, "adw_message_dialog_response", libs);
  gidLink(cast(void**)&adw_message_dialog_set_body, "adw_message_dialog_set_body", libs);
  gidLink(cast(void**)&adw_message_dialog_set_body_use_markup, "adw_message_dialog_set_body_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_set_close_response, "adw_message_dialog_set_close_response", libs);
  gidLink(cast(void**)&adw_message_dialog_set_default_response, "adw_message_dialog_set_default_response", libs);
  gidLink(cast(void**)&adw_message_dialog_set_extra_child, "adw_message_dialog_set_extra_child", libs);
  gidLink(cast(void**)&adw_message_dialog_set_heading, "adw_message_dialog_set_heading", libs);
  gidLink(cast(void**)&adw_message_dialog_set_heading_use_markup, "adw_message_dialog_set_heading_use_markup", libs);
  gidLink(cast(void**)&adw_message_dialog_set_response_appearance, "adw_message_dialog_set_response_appearance", libs);
  gidLink(cast(void**)&adw_message_dialog_set_response_enabled, "adw_message_dialog_set_response_enabled", libs);
  gidLink(cast(void**)&adw_message_dialog_set_response_label, "adw_message_dialog_set_response_label", libs);

  // NavigationPage
  gidLink(cast(void**)&adw_navigation_page_get_type, "adw_navigation_page_get_type", libs);
  gidLink(cast(void**)&adw_navigation_page_new, "adw_navigation_page_new", libs);
  gidLink(cast(void**)&adw_navigation_page_new_with_tag, "adw_navigation_page_new_with_tag", libs);
  gidLink(cast(void**)&adw_navigation_page_get_can_pop, "adw_navigation_page_get_can_pop", libs);
  gidLink(cast(void**)&adw_navigation_page_get_child, "adw_navigation_page_get_child", libs);
  gidLink(cast(void**)&adw_navigation_page_get_tag, "adw_navigation_page_get_tag", libs);
  gidLink(cast(void**)&adw_navigation_page_get_title, "adw_navigation_page_get_title", libs);
  gidLink(cast(void**)&adw_navigation_page_set_can_pop, "adw_navigation_page_set_can_pop", libs);
  gidLink(cast(void**)&adw_navigation_page_set_child, "adw_navigation_page_set_child", libs);
  gidLink(cast(void**)&adw_navigation_page_set_tag, "adw_navigation_page_set_tag", libs);
  gidLink(cast(void**)&adw_navigation_page_set_title, "adw_navigation_page_set_title", libs);

  // NavigationSplitView
  gidLink(cast(void**)&adw_navigation_split_view_get_type, "adw_navigation_split_view_get_type", libs);
  gidLink(cast(void**)&adw_navigation_split_view_new, "adw_navigation_split_view_new", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_collapsed, "adw_navigation_split_view_get_collapsed", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_content, "adw_navigation_split_view_get_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_max_sidebar_width, "adw_navigation_split_view_get_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_min_sidebar_width, "adw_navigation_split_view_get_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_show_content, "adw_navigation_split_view_get_show_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar, "adw_navigation_split_view_get_sidebar", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar_width_fraction, "adw_navigation_split_view_get_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar_width_unit, "adw_navigation_split_view_get_sidebar_width_unit", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_collapsed, "adw_navigation_split_view_set_collapsed", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_content, "adw_navigation_split_view_set_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_max_sidebar_width, "adw_navigation_split_view_set_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_min_sidebar_width, "adw_navigation_split_view_set_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_show_content, "adw_navigation_split_view_set_show_content", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar, "adw_navigation_split_view_set_sidebar", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar_width_fraction, "adw_navigation_split_view_set_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar_width_unit, "adw_navigation_split_view_set_sidebar_width_unit", libs);

  // NavigationView
  gidLink(cast(void**)&adw_navigation_view_get_type, "adw_navigation_view_get_type", libs);
  gidLink(cast(void**)&adw_navigation_view_new, "adw_navigation_view_new", libs);
  gidLink(cast(void**)&adw_navigation_view_add, "adw_navigation_view_add", libs);
  gidLink(cast(void**)&adw_navigation_view_find_page, "adw_navigation_view_find_page", libs);
  gidLink(cast(void**)&adw_navigation_view_get_animate_transitions, "adw_navigation_view_get_animate_transitions", libs);
  gidLink(cast(void**)&adw_navigation_view_get_navigation_stack, "adw_navigation_view_get_navigation_stack", libs);
  gidLink(cast(void**)&adw_navigation_view_get_pop_on_escape, "adw_navigation_view_get_pop_on_escape", libs);
  gidLink(cast(void**)&adw_navigation_view_get_previous_page, "adw_navigation_view_get_previous_page", libs);
  gidLink(cast(void**)&adw_navigation_view_get_visible_page, "adw_navigation_view_get_visible_page", libs);
  gidLink(cast(void**)&adw_navigation_view_pop, "adw_navigation_view_pop", libs);
  gidLink(cast(void**)&adw_navigation_view_pop_to_page, "adw_navigation_view_pop_to_page", libs);
  gidLink(cast(void**)&adw_navigation_view_pop_to_tag, "adw_navigation_view_pop_to_tag", libs);
  gidLink(cast(void**)&adw_navigation_view_push, "adw_navigation_view_push", libs);
  gidLink(cast(void**)&adw_navigation_view_push_by_tag, "adw_navigation_view_push_by_tag", libs);
  gidLink(cast(void**)&adw_navigation_view_remove, "adw_navigation_view_remove", libs);
  gidLink(cast(void**)&adw_navigation_view_replace, "adw_navigation_view_replace", libs);
  gidLink(cast(void**)&adw_navigation_view_replace_with_tags, "adw_navigation_view_replace_with_tags", libs);
  gidLink(cast(void**)&adw_navigation_view_set_animate_transitions, "adw_navigation_view_set_animate_transitions", libs);
  gidLink(cast(void**)&adw_navigation_view_set_pop_on_escape, "adw_navigation_view_set_pop_on_escape", libs);

  // OverlaySplitView
  gidLink(cast(void**)&adw_overlay_split_view_get_type, "adw_overlay_split_view_get_type", libs);
  gidLink(cast(void**)&adw_overlay_split_view_new, "adw_overlay_split_view_new", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_collapsed, "adw_overlay_split_view_get_collapsed", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_content, "adw_overlay_split_view_get_content", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_enable_hide_gesture, "adw_overlay_split_view_get_enable_hide_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_enable_show_gesture, "adw_overlay_split_view_get_enable_show_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_max_sidebar_width, "adw_overlay_split_view_get_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_min_sidebar_width, "adw_overlay_split_view_get_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_pin_sidebar, "adw_overlay_split_view_get_pin_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_show_sidebar, "adw_overlay_split_view_get_show_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar, "adw_overlay_split_view_get_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_position, "adw_overlay_split_view_get_sidebar_position", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_width_fraction, "adw_overlay_split_view_get_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_width_unit, "adw_overlay_split_view_get_sidebar_width_unit", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_collapsed, "adw_overlay_split_view_set_collapsed", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_content, "adw_overlay_split_view_set_content", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_enable_hide_gesture, "adw_overlay_split_view_set_enable_hide_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_enable_show_gesture, "adw_overlay_split_view_set_enable_show_gesture", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_max_sidebar_width, "adw_overlay_split_view_set_max_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_min_sidebar_width, "adw_overlay_split_view_set_min_sidebar_width", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_pin_sidebar, "adw_overlay_split_view_set_pin_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_show_sidebar, "adw_overlay_split_view_set_show_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar, "adw_overlay_split_view_set_sidebar", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_position, "adw_overlay_split_view_set_sidebar_position", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_width_fraction, "adw_overlay_split_view_set_sidebar_width_fraction", libs);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_width_unit, "adw_overlay_split_view_set_sidebar_width_unit", libs);

  // PasswordEntryRow
  gidLink(cast(void**)&adw_password_entry_row_get_type, "adw_password_entry_row_get_type", libs);
  gidLink(cast(void**)&adw_password_entry_row_new, "adw_password_entry_row_new", libs);

  // PreferencesDialog
  gidLink(cast(void**)&adw_preferences_dialog_get_type, "adw_preferences_dialog_get_type", libs);
  gidLink(cast(void**)&adw_preferences_dialog_new, "adw_preferences_dialog_new", libs);
  gidLink(cast(void**)&adw_preferences_dialog_add, "adw_preferences_dialog_add", libs);
  gidLink(cast(void**)&adw_preferences_dialog_add_toast, "adw_preferences_dialog_add_toast", libs);
  gidLink(cast(void**)&adw_preferences_dialog_get_search_enabled, "adw_preferences_dialog_get_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_dialog_get_visible_page, "adw_preferences_dialog_get_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_dialog_get_visible_page_name, "adw_preferences_dialog_get_visible_page_name", libs);
  gidLink(cast(void**)&adw_preferences_dialog_pop_subpage, "adw_preferences_dialog_pop_subpage", libs);
  gidLink(cast(void**)&adw_preferences_dialog_push_subpage, "adw_preferences_dialog_push_subpage", libs);
  gidLink(cast(void**)&adw_preferences_dialog_remove, "adw_preferences_dialog_remove", libs);
  gidLink(cast(void**)&adw_preferences_dialog_set_search_enabled, "adw_preferences_dialog_set_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_dialog_set_visible_page, "adw_preferences_dialog_set_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_dialog_set_visible_page_name, "adw_preferences_dialog_set_visible_page_name", libs);

  // PreferencesGroup
  gidLink(cast(void**)&adw_preferences_group_get_type, "adw_preferences_group_get_type", libs);
  gidLink(cast(void**)&adw_preferences_group_new, "adw_preferences_group_new", libs);
  gidLink(cast(void**)&adw_preferences_group_add, "adw_preferences_group_add", libs);
  gidLink(cast(void**)&adw_preferences_group_get_description, "adw_preferences_group_get_description", libs);
  gidLink(cast(void**)&adw_preferences_group_get_header_suffix, "adw_preferences_group_get_header_suffix", libs);
  gidLink(cast(void**)&adw_preferences_group_get_title, "adw_preferences_group_get_title", libs);
  gidLink(cast(void**)&adw_preferences_group_remove, "adw_preferences_group_remove", libs);
  gidLink(cast(void**)&adw_preferences_group_set_description, "adw_preferences_group_set_description", libs);
  gidLink(cast(void**)&adw_preferences_group_set_header_suffix, "adw_preferences_group_set_header_suffix", libs);
  gidLink(cast(void**)&adw_preferences_group_set_title, "adw_preferences_group_set_title", libs);

  // PreferencesPage
  gidLink(cast(void**)&adw_preferences_page_get_type, "adw_preferences_page_get_type", libs);
  gidLink(cast(void**)&adw_preferences_page_new, "adw_preferences_page_new", libs);
  gidLink(cast(void**)&adw_preferences_page_add, "adw_preferences_page_add", libs);
  gidLink(cast(void**)&adw_preferences_page_get_description, "adw_preferences_page_get_description", libs);
  gidLink(cast(void**)&adw_preferences_page_get_icon_name, "adw_preferences_page_get_icon_name", libs);
  gidLink(cast(void**)&adw_preferences_page_get_name, "adw_preferences_page_get_name", libs);
  gidLink(cast(void**)&adw_preferences_page_get_title, "adw_preferences_page_get_title", libs);
  gidLink(cast(void**)&adw_preferences_page_get_use_underline, "adw_preferences_page_get_use_underline", libs);
  gidLink(cast(void**)&adw_preferences_page_remove, "adw_preferences_page_remove", libs);
  gidLink(cast(void**)&adw_preferences_page_scroll_to_top, "adw_preferences_page_scroll_to_top", libs);
  gidLink(cast(void**)&adw_preferences_page_set_description, "adw_preferences_page_set_description", libs);
  gidLink(cast(void**)&adw_preferences_page_set_icon_name, "adw_preferences_page_set_icon_name", libs);
  gidLink(cast(void**)&adw_preferences_page_set_name, "adw_preferences_page_set_name", libs);
  gidLink(cast(void**)&adw_preferences_page_set_title, "adw_preferences_page_set_title", libs);
  gidLink(cast(void**)&adw_preferences_page_set_use_underline, "adw_preferences_page_set_use_underline", libs);

  // PreferencesRow
  gidLink(cast(void**)&adw_preferences_row_get_type, "adw_preferences_row_get_type", libs);
  gidLink(cast(void**)&adw_preferences_row_new, "adw_preferences_row_new", libs);
  gidLink(cast(void**)&adw_preferences_row_get_title, "adw_preferences_row_get_title", libs);
  gidLink(cast(void**)&adw_preferences_row_get_title_selectable, "adw_preferences_row_get_title_selectable", libs);
  gidLink(cast(void**)&adw_preferences_row_get_use_markup, "adw_preferences_row_get_use_markup", libs);
  gidLink(cast(void**)&adw_preferences_row_get_use_underline, "adw_preferences_row_get_use_underline", libs);
  gidLink(cast(void**)&adw_preferences_row_set_title, "adw_preferences_row_set_title", libs);
  gidLink(cast(void**)&adw_preferences_row_set_title_selectable, "adw_preferences_row_set_title_selectable", libs);
  gidLink(cast(void**)&adw_preferences_row_set_use_markup, "adw_preferences_row_set_use_markup", libs);
  gidLink(cast(void**)&adw_preferences_row_set_use_underline, "adw_preferences_row_set_use_underline", libs);

  // PreferencesWindow
  gidLink(cast(void**)&adw_preferences_window_get_type, "adw_preferences_window_get_type", libs);
  gidLink(cast(void**)&adw_preferences_window_new, "adw_preferences_window_new", libs);
  gidLink(cast(void**)&adw_preferences_window_add, "adw_preferences_window_add", libs);
  gidLink(cast(void**)&adw_preferences_window_add_toast, "adw_preferences_window_add_toast", libs);
  gidLink(cast(void**)&adw_preferences_window_close_subpage, "adw_preferences_window_close_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_get_can_navigate_back, "adw_preferences_window_get_can_navigate_back", libs);
  gidLink(cast(void**)&adw_preferences_window_get_search_enabled, "adw_preferences_window_get_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_window_get_visible_page, "adw_preferences_window_get_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_window_get_visible_page_name, "adw_preferences_window_get_visible_page_name", libs);
  gidLink(cast(void**)&adw_preferences_window_pop_subpage, "adw_preferences_window_pop_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_present_subpage, "adw_preferences_window_present_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_push_subpage, "adw_preferences_window_push_subpage", libs);
  gidLink(cast(void**)&adw_preferences_window_remove, "adw_preferences_window_remove", libs);
  gidLink(cast(void**)&adw_preferences_window_set_can_navigate_back, "adw_preferences_window_set_can_navigate_back", libs);
  gidLink(cast(void**)&adw_preferences_window_set_search_enabled, "adw_preferences_window_set_search_enabled", libs);
  gidLink(cast(void**)&adw_preferences_window_set_visible_page, "adw_preferences_window_set_visible_page", libs);
  gidLink(cast(void**)&adw_preferences_window_set_visible_page_name, "adw_preferences_window_set_visible_page_name", libs);

  // PropertyAnimationTarget
  gidLink(cast(void**)&adw_property_animation_target_get_type, "adw_property_animation_target_get_type", libs);
  gidLink(cast(void**)&adw_property_animation_target_new, "adw_property_animation_target_new", libs);
  gidLink(cast(void**)&adw_property_animation_target_new_for_pspec, "adw_property_animation_target_new_for_pspec", libs);
  gidLink(cast(void**)&adw_property_animation_target_get_object, "adw_property_animation_target_get_object", libs);
  gidLink(cast(void**)&adw_property_animation_target_get_pspec, "adw_property_animation_target_get_pspec", libs);

  // SpinRow
  gidLink(cast(void**)&adw_spin_row_get_type, "adw_spin_row_get_type", libs);
  gidLink(cast(void**)&adw_spin_row_new, "adw_spin_row_new", libs);
  gidLink(cast(void**)&adw_spin_row_new_with_range, "adw_spin_row_new_with_range", libs);
  gidLink(cast(void**)&adw_spin_row_configure, "adw_spin_row_configure", libs);
  gidLink(cast(void**)&adw_spin_row_get_adjustment, "adw_spin_row_get_adjustment", libs);
  gidLink(cast(void**)&adw_spin_row_get_climb_rate, "adw_spin_row_get_climb_rate", libs);
  gidLink(cast(void**)&adw_spin_row_get_digits, "adw_spin_row_get_digits", libs);
  gidLink(cast(void**)&adw_spin_row_get_numeric, "adw_spin_row_get_numeric", libs);
  gidLink(cast(void**)&adw_spin_row_get_snap_to_ticks, "adw_spin_row_get_snap_to_ticks", libs);
  gidLink(cast(void**)&adw_spin_row_get_update_policy, "adw_spin_row_get_update_policy", libs);
  gidLink(cast(void**)&adw_spin_row_get_value, "adw_spin_row_get_value", libs);
  gidLink(cast(void**)&adw_spin_row_get_wrap, "adw_spin_row_get_wrap", libs);
  gidLink(cast(void**)&adw_spin_row_set_adjustment, "adw_spin_row_set_adjustment", libs);
  gidLink(cast(void**)&adw_spin_row_set_climb_rate, "adw_spin_row_set_climb_rate", libs);
  gidLink(cast(void**)&adw_spin_row_set_digits, "adw_spin_row_set_digits", libs);
  gidLink(cast(void**)&adw_spin_row_set_numeric, "adw_spin_row_set_numeric", libs);
  gidLink(cast(void**)&adw_spin_row_set_range, "adw_spin_row_set_range", libs);
  gidLink(cast(void**)&adw_spin_row_set_snap_to_ticks, "adw_spin_row_set_snap_to_ticks", libs);
  gidLink(cast(void**)&adw_spin_row_set_update_policy, "adw_spin_row_set_update_policy", libs);
  gidLink(cast(void**)&adw_spin_row_set_value, "adw_spin_row_set_value", libs);
  gidLink(cast(void**)&adw_spin_row_set_wrap, "adw_spin_row_set_wrap", libs);
  gidLink(cast(void**)&adw_spin_row_update, "adw_spin_row_update", libs);

  // SplitButton
  gidLink(cast(void**)&adw_split_button_get_type, "adw_split_button_get_type", libs);
  gidLink(cast(void**)&adw_split_button_new, "adw_split_button_new", libs);
  gidLink(cast(void**)&adw_split_button_get_can_shrink, "adw_split_button_get_can_shrink", libs);
  gidLink(cast(void**)&adw_split_button_get_child, "adw_split_button_get_child", libs);
  gidLink(cast(void**)&adw_split_button_get_direction, "adw_split_button_get_direction", libs);
  gidLink(cast(void**)&adw_split_button_get_dropdown_tooltip, "adw_split_button_get_dropdown_tooltip", libs);
  gidLink(cast(void**)&adw_split_button_get_icon_name, "adw_split_button_get_icon_name", libs);
  gidLink(cast(void**)&adw_split_button_get_label, "adw_split_button_get_label", libs);
  gidLink(cast(void**)&adw_split_button_get_menu_model, "adw_split_button_get_menu_model", libs);
  gidLink(cast(void**)&adw_split_button_get_popover, "adw_split_button_get_popover", libs);
  gidLink(cast(void**)&adw_split_button_get_use_underline, "adw_split_button_get_use_underline", libs);
  gidLink(cast(void**)&adw_split_button_popdown, "adw_split_button_popdown", libs);
  gidLink(cast(void**)&adw_split_button_popup, "adw_split_button_popup", libs);
  gidLink(cast(void**)&adw_split_button_set_can_shrink, "adw_split_button_set_can_shrink", libs);
  gidLink(cast(void**)&adw_split_button_set_child, "adw_split_button_set_child", libs);
  gidLink(cast(void**)&adw_split_button_set_direction, "adw_split_button_set_direction", libs);
  gidLink(cast(void**)&adw_split_button_set_dropdown_tooltip, "adw_split_button_set_dropdown_tooltip", libs);
  gidLink(cast(void**)&adw_split_button_set_icon_name, "adw_split_button_set_icon_name", libs);
  gidLink(cast(void**)&adw_split_button_set_label, "adw_split_button_set_label", libs);
  gidLink(cast(void**)&adw_split_button_set_menu_model, "adw_split_button_set_menu_model", libs);
  gidLink(cast(void**)&adw_split_button_set_popover, "adw_split_button_set_popover", libs);
  gidLink(cast(void**)&adw_split_button_set_use_underline, "adw_split_button_set_use_underline", libs);

  // SpringAnimation
  gidLink(cast(void**)&adw_spring_animation_get_type, "adw_spring_animation_get_type", libs);
  gidLink(cast(void**)&adw_spring_animation_new, "adw_spring_animation_new", libs);
  gidLink(cast(void**)&adw_spring_animation_calculate_value, "adw_spring_animation_calculate_value", libs);
  gidLink(cast(void**)&adw_spring_animation_calculate_velocity, "adw_spring_animation_calculate_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_get_clamp, "adw_spring_animation_get_clamp", libs);
  gidLink(cast(void**)&adw_spring_animation_get_epsilon, "adw_spring_animation_get_epsilon", libs);
  gidLink(cast(void**)&adw_spring_animation_get_estimated_duration, "adw_spring_animation_get_estimated_duration", libs);
  gidLink(cast(void**)&adw_spring_animation_get_initial_velocity, "adw_spring_animation_get_initial_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_get_spring_params, "adw_spring_animation_get_spring_params", libs);
  gidLink(cast(void**)&adw_spring_animation_get_value_from, "adw_spring_animation_get_value_from", libs);
  gidLink(cast(void**)&adw_spring_animation_get_value_to, "adw_spring_animation_get_value_to", libs);
  gidLink(cast(void**)&adw_spring_animation_get_velocity, "adw_spring_animation_get_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_set_clamp, "adw_spring_animation_set_clamp", libs);
  gidLink(cast(void**)&adw_spring_animation_set_epsilon, "adw_spring_animation_set_epsilon", libs);
  gidLink(cast(void**)&adw_spring_animation_set_initial_velocity, "adw_spring_animation_set_initial_velocity", libs);
  gidLink(cast(void**)&adw_spring_animation_set_spring_params, "adw_spring_animation_set_spring_params", libs);
  gidLink(cast(void**)&adw_spring_animation_set_value_from, "adw_spring_animation_set_value_from", libs);
  gidLink(cast(void**)&adw_spring_animation_set_value_to, "adw_spring_animation_set_value_to", libs);

  // SpringParams
  gidLink(cast(void**)&adw_spring_params_get_type, "adw_spring_params_get_type", libs);
  gidLink(cast(void**)&adw_spring_params_new, "adw_spring_params_new", libs);
  gidLink(cast(void**)&adw_spring_params_new_full, "adw_spring_params_new_full", libs);
  gidLink(cast(void**)&adw_spring_params_get_damping, "adw_spring_params_get_damping", libs);
  gidLink(cast(void**)&adw_spring_params_get_damping_ratio, "adw_spring_params_get_damping_ratio", libs);
  gidLink(cast(void**)&adw_spring_params_get_mass, "adw_spring_params_get_mass", libs);
  gidLink(cast(void**)&adw_spring_params_get_stiffness, "adw_spring_params_get_stiffness", libs);
  gidLink(cast(void**)&adw_spring_params_ref, "adw_spring_params_ref", libs);
  gidLink(cast(void**)&adw_spring_params_unref, "adw_spring_params_unref", libs);

  // Squeezer
  gidLink(cast(void**)&adw_squeezer_get_type, "adw_squeezer_get_type", libs);
  gidLink(cast(void**)&adw_squeezer_new, "adw_squeezer_new", libs);
  gidLink(cast(void**)&adw_squeezer_add, "adw_squeezer_add", libs);
  gidLink(cast(void**)&adw_squeezer_get_allow_none, "adw_squeezer_get_allow_none", libs);
  gidLink(cast(void**)&adw_squeezer_get_homogeneous, "adw_squeezer_get_homogeneous", libs);
  gidLink(cast(void**)&adw_squeezer_get_interpolate_size, "adw_squeezer_get_interpolate_size", libs);
  gidLink(cast(void**)&adw_squeezer_get_page, "adw_squeezer_get_page", libs);
  gidLink(cast(void**)&adw_squeezer_get_pages, "adw_squeezer_get_pages", libs);
  gidLink(cast(void**)&adw_squeezer_get_switch_threshold_policy, "adw_squeezer_get_switch_threshold_policy", libs);
  gidLink(cast(void**)&adw_squeezer_get_transition_duration, "adw_squeezer_get_transition_duration", libs);
  gidLink(cast(void**)&adw_squeezer_get_transition_running, "adw_squeezer_get_transition_running", libs);
  gidLink(cast(void**)&adw_squeezer_get_transition_type, "adw_squeezer_get_transition_type", libs);
  gidLink(cast(void**)&adw_squeezer_get_visible_child, "adw_squeezer_get_visible_child", libs);
  gidLink(cast(void**)&adw_squeezer_get_xalign, "adw_squeezer_get_xalign", libs);
  gidLink(cast(void**)&adw_squeezer_get_yalign, "adw_squeezer_get_yalign", libs);
  gidLink(cast(void**)&adw_squeezer_remove, "adw_squeezer_remove", libs);
  gidLink(cast(void**)&adw_squeezer_set_allow_none, "adw_squeezer_set_allow_none", libs);
  gidLink(cast(void**)&adw_squeezer_set_homogeneous, "adw_squeezer_set_homogeneous", libs);
  gidLink(cast(void**)&adw_squeezer_set_interpolate_size, "adw_squeezer_set_interpolate_size", libs);
  gidLink(cast(void**)&adw_squeezer_set_switch_threshold_policy, "adw_squeezer_set_switch_threshold_policy", libs);
  gidLink(cast(void**)&adw_squeezer_set_transition_duration, "adw_squeezer_set_transition_duration", libs);
  gidLink(cast(void**)&adw_squeezer_set_transition_type, "adw_squeezer_set_transition_type", libs);
  gidLink(cast(void**)&adw_squeezer_set_xalign, "adw_squeezer_set_xalign", libs);
  gidLink(cast(void**)&adw_squeezer_set_yalign, "adw_squeezer_set_yalign", libs);

  // SqueezerPage
  gidLink(cast(void**)&adw_squeezer_page_get_type, "adw_squeezer_page_get_type", libs);
  gidLink(cast(void**)&adw_squeezer_page_get_child, "adw_squeezer_page_get_child", libs);
  gidLink(cast(void**)&adw_squeezer_page_get_enabled, "adw_squeezer_page_get_enabled", libs);
  gidLink(cast(void**)&adw_squeezer_page_set_enabled, "adw_squeezer_page_set_enabled", libs);

  // StatusPage
  gidLink(cast(void**)&adw_status_page_get_type, "adw_status_page_get_type", libs);
  gidLink(cast(void**)&adw_status_page_new, "adw_status_page_new", libs);
  gidLink(cast(void**)&adw_status_page_get_child, "adw_status_page_get_child", libs);
  gidLink(cast(void**)&adw_status_page_get_description, "adw_status_page_get_description", libs);
  gidLink(cast(void**)&adw_status_page_get_icon_name, "adw_status_page_get_icon_name", libs);
  gidLink(cast(void**)&adw_status_page_get_paintable, "adw_status_page_get_paintable", libs);
  gidLink(cast(void**)&adw_status_page_get_title, "adw_status_page_get_title", libs);
  gidLink(cast(void**)&adw_status_page_set_child, "adw_status_page_set_child", libs);
  gidLink(cast(void**)&adw_status_page_set_description, "adw_status_page_set_description", libs);
  gidLink(cast(void**)&adw_status_page_set_icon_name, "adw_status_page_set_icon_name", libs);
  gidLink(cast(void**)&adw_status_page_set_paintable, "adw_status_page_set_paintable", libs);
  gidLink(cast(void**)&adw_status_page_set_title, "adw_status_page_set_title", libs);

  // StyleManager
  gidLink(cast(void**)&adw_style_manager_get_type, "adw_style_manager_get_type", libs);
  gidLink(cast(void**)&adw_style_manager_get_default, "adw_style_manager_get_default", libs);
  gidLink(cast(void**)&adw_style_manager_get_for_display, "adw_style_manager_get_for_display", libs);
  gidLink(cast(void**)&adw_style_manager_get_color_scheme, "adw_style_manager_get_color_scheme", libs);
  gidLink(cast(void**)&adw_style_manager_get_dark, "adw_style_manager_get_dark", libs);
  gidLink(cast(void**)&adw_style_manager_get_display, "adw_style_manager_get_display", libs);
  gidLink(cast(void**)&adw_style_manager_get_high_contrast, "adw_style_manager_get_high_contrast", libs);
  gidLink(cast(void**)&adw_style_manager_get_system_supports_color_schemes, "adw_style_manager_get_system_supports_color_schemes", libs);
  gidLink(cast(void**)&adw_style_manager_set_color_scheme, "adw_style_manager_set_color_scheme", libs);

  // SwipeTracker
  gidLink(cast(void**)&adw_swipe_tracker_get_type, "adw_swipe_tracker_get_type", libs);
  gidLink(cast(void**)&adw_swipe_tracker_new, "adw_swipe_tracker_new", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_long_swipes, "adw_swipe_tracker_get_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_mouse_drag, "adw_swipe_tracker_get_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_window_handle, "adw_swipe_tracker_get_allow_window_handle", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_enabled, "adw_swipe_tracker_get_enabled", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_lower_overshoot, "adw_swipe_tracker_get_lower_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_reversed, "adw_swipe_tracker_get_reversed", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_swipeable, "adw_swipe_tracker_get_swipeable", libs);
  gidLink(cast(void**)&adw_swipe_tracker_get_upper_overshoot, "adw_swipe_tracker_get_upper_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_long_swipes, "adw_swipe_tracker_set_allow_long_swipes", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_mouse_drag, "adw_swipe_tracker_set_allow_mouse_drag", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_window_handle, "adw_swipe_tracker_set_allow_window_handle", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_enabled, "adw_swipe_tracker_set_enabled", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_lower_overshoot, "adw_swipe_tracker_set_lower_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_reversed, "adw_swipe_tracker_set_reversed", libs);
  gidLink(cast(void**)&adw_swipe_tracker_set_upper_overshoot, "adw_swipe_tracker_set_upper_overshoot", libs);
  gidLink(cast(void**)&adw_swipe_tracker_shift_position, "adw_swipe_tracker_shift_position", libs);

  // Swipeable
  gidLink(cast(void**)&adw_swipeable_get_type, "adw_swipeable_get_type", libs);
  gidLink(cast(void**)&adw_swipeable_get_cancel_progress, "adw_swipeable_get_cancel_progress", libs);
  gidLink(cast(void**)&adw_swipeable_get_distance, "adw_swipeable_get_distance", libs);
  gidLink(cast(void**)&adw_swipeable_get_progress, "adw_swipeable_get_progress", libs);
  gidLink(cast(void**)&adw_swipeable_get_snap_points, "adw_swipeable_get_snap_points", libs);
  gidLink(cast(void**)&adw_swipeable_get_swipe_area, "adw_swipeable_get_swipe_area", libs);

  // SwitchRow
  gidLink(cast(void**)&adw_switch_row_get_type, "adw_switch_row_get_type", libs);
  gidLink(cast(void**)&adw_switch_row_new, "adw_switch_row_new", libs);
  gidLink(cast(void**)&adw_switch_row_get_active, "adw_switch_row_get_active", libs);
  gidLink(cast(void**)&adw_switch_row_set_active, "adw_switch_row_set_active", libs);

  // TabBar
  gidLink(cast(void**)&adw_tab_bar_get_type, "adw_tab_bar_get_type", libs);
  gidLink(cast(void**)&adw_tab_bar_new, "adw_tab_bar_new", libs);
  gidLink(cast(void**)&adw_tab_bar_get_autohide, "adw_tab_bar_get_autohide", libs);
  gidLink(cast(void**)&adw_tab_bar_get_end_action_widget, "adw_tab_bar_get_end_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_get_expand_tabs, "adw_tab_bar_get_expand_tabs", libs);
  gidLink(cast(void**)&adw_tab_bar_get_extra_drag_preferred_action, "adw_tab_bar_get_extra_drag_preferred_action", libs);
  gidLink(cast(void**)&adw_tab_bar_get_extra_drag_preload, "adw_tab_bar_get_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_bar_get_inverted, "adw_tab_bar_get_inverted", libs);
  gidLink(cast(void**)&adw_tab_bar_get_is_overflowing, "adw_tab_bar_get_is_overflowing", libs);
  gidLink(cast(void**)&adw_tab_bar_get_start_action_widget, "adw_tab_bar_get_start_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_get_tabs_revealed, "adw_tab_bar_get_tabs_revealed", libs);
  gidLink(cast(void**)&adw_tab_bar_get_view, "adw_tab_bar_get_view", libs);
  gidLink(cast(void**)&adw_tab_bar_set_autohide, "adw_tab_bar_set_autohide", libs);
  gidLink(cast(void**)&adw_tab_bar_set_end_action_widget, "adw_tab_bar_set_end_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_set_expand_tabs, "adw_tab_bar_set_expand_tabs", libs);
  gidLink(cast(void**)&adw_tab_bar_set_extra_drag_preload, "adw_tab_bar_set_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_bar_set_inverted, "adw_tab_bar_set_inverted", libs);
  gidLink(cast(void**)&adw_tab_bar_set_start_action_widget, "adw_tab_bar_set_start_action_widget", libs);
  gidLink(cast(void**)&adw_tab_bar_set_view, "adw_tab_bar_set_view", libs);
  gidLink(cast(void**)&adw_tab_bar_setup_extra_drop_target, "adw_tab_bar_setup_extra_drop_target", libs);

  // TabButton
  gidLink(cast(void**)&adw_tab_button_get_type, "adw_tab_button_get_type", libs);
  gidLink(cast(void**)&adw_tab_button_new, "adw_tab_button_new", libs);
  gidLink(cast(void**)&adw_tab_button_get_view, "adw_tab_button_get_view", libs);
  gidLink(cast(void**)&adw_tab_button_set_view, "adw_tab_button_set_view", libs);

  // TabOverview
  gidLink(cast(void**)&adw_tab_overview_get_type, "adw_tab_overview_get_type", libs);
  gidLink(cast(void**)&adw_tab_overview_new, "adw_tab_overview_new", libs);
  gidLink(cast(void**)&adw_tab_overview_get_child, "adw_tab_overview_get_child", libs);
  gidLink(cast(void**)&adw_tab_overview_get_enable_new_tab, "adw_tab_overview_get_enable_new_tab", libs);
  gidLink(cast(void**)&adw_tab_overview_get_enable_search, "adw_tab_overview_get_enable_search", libs);
  gidLink(cast(void**)&adw_tab_overview_get_extra_drag_preferred_action, "adw_tab_overview_get_extra_drag_preferred_action", libs);
  gidLink(cast(void**)&adw_tab_overview_get_extra_drag_preload, "adw_tab_overview_get_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_overview_get_inverted, "adw_tab_overview_get_inverted", libs);
  gidLink(cast(void**)&adw_tab_overview_get_open, "adw_tab_overview_get_open", libs);
  gidLink(cast(void**)&adw_tab_overview_get_search_active, "adw_tab_overview_get_search_active", libs);
  gidLink(cast(void**)&adw_tab_overview_get_secondary_menu, "adw_tab_overview_get_secondary_menu", libs);
  gidLink(cast(void**)&adw_tab_overview_get_show_end_title_buttons, "adw_tab_overview_get_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_get_show_start_title_buttons, "adw_tab_overview_get_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_get_view, "adw_tab_overview_get_view", libs);
  gidLink(cast(void**)&adw_tab_overview_set_child, "adw_tab_overview_set_child", libs);
  gidLink(cast(void**)&adw_tab_overview_set_enable_new_tab, "adw_tab_overview_set_enable_new_tab", libs);
  gidLink(cast(void**)&adw_tab_overview_set_enable_search, "adw_tab_overview_set_enable_search", libs);
  gidLink(cast(void**)&adw_tab_overview_set_extra_drag_preload, "adw_tab_overview_set_extra_drag_preload", libs);
  gidLink(cast(void**)&adw_tab_overview_set_inverted, "adw_tab_overview_set_inverted", libs);
  gidLink(cast(void**)&adw_tab_overview_set_open, "adw_tab_overview_set_open", libs);
  gidLink(cast(void**)&adw_tab_overview_set_secondary_menu, "adw_tab_overview_set_secondary_menu", libs);
  gidLink(cast(void**)&adw_tab_overview_set_show_end_title_buttons, "adw_tab_overview_set_show_end_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_set_show_start_title_buttons, "adw_tab_overview_set_show_start_title_buttons", libs);
  gidLink(cast(void**)&adw_tab_overview_set_view, "adw_tab_overview_set_view", libs);
  gidLink(cast(void**)&adw_tab_overview_setup_extra_drop_target, "adw_tab_overview_setup_extra_drop_target", libs);

  // TabPage
  gidLink(cast(void**)&adw_tab_page_get_type, "adw_tab_page_get_type", libs);
  gidLink(cast(void**)&adw_tab_page_get_child, "adw_tab_page_get_child", libs);
  gidLink(cast(void**)&adw_tab_page_get_icon, "adw_tab_page_get_icon", libs);
  gidLink(cast(void**)&adw_tab_page_get_indicator_activatable, "adw_tab_page_get_indicator_activatable", libs);
  gidLink(cast(void**)&adw_tab_page_get_indicator_icon, "adw_tab_page_get_indicator_icon", libs);
  gidLink(cast(void**)&adw_tab_page_get_indicator_tooltip, "adw_tab_page_get_indicator_tooltip", libs);
  gidLink(cast(void**)&adw_tab_page_get_keyword, "adw_tab_page_get_keyword", libs);
  gidLink(cast(void**)&adw_tab_page_get_live_thumbnail, "adw_tab_page_get_live_thumbnail", libs);
  gidLink(cast(void**)&adw_tab_page_get_loading, "adw_tab_page_get_loading", libs);
  gidLink(cast(void**)&adw_tab_page_get_needs_attention, "adw_tab_page_get_needs_attention", libs);
  gidLink(cast(void**)&adw_tab_page_get_parent, "adw_tab_page_get_parent", libs);
  gidLink(cast(void**)&adw_tab_page_get_pinned, "adw_tab_page_get_pinned", libs);
  gidLink(cast(void**)&adw_tab_page_get_selected, "adw_tab_page_get_selected", libs);
  gidLink(cast(void**)&adw_tab_page_get_thumbnail_xalign, "adw_tab_page_get_thumbnail_xalign", libs);
  gidLink(cast(void**)&adw_tab_page_get_thumbnail_yalign, "adw_tab_page_get_thumbnail_yalign", libs);
  gidLink(cast(void**)&adw_tab_page_get_title, "adw_tab_page_get_title", libs);
  gidLink(cast(void**)&adw_tab_page_get_tooltip, "adw_tab_page_get_tooltip", libs);
  gidLink(cast(void**)&adw_tab_page_invalidate_thumbnail, "adw_tab_page_invalidate_thumbnail", libs);
  gidLink(cast(void**)&adw_tab_page_set_icon, "adw_tab_page_set_icon", libs);
  gidLink(cast(void**)&adw_tab_page_set_indicator_activatable, "adw_tab_page_set_indicator_activatable", libs);
  gidLink(cast(void**)&adw_tab_page_set_indicator_icon, "adw_tab_page_set_indicator_icon", libs);
  gidLink(cast(void**)&adw_tab_page_set_indicator_tooltip, "adw_tab_page_set_indicator_tooltip", libs);
  gidLink(cast(void**)&adw_tab_page_set_keyword, "adw_tab_page_set_keyword", libs);
  gidLink(cast(void**)&adw_tab_page_set_live_thumbnail, "adw_tab_page_set_live_thumbnail", libs);
  gidLink(cast(void**)&adw_tab_page_set_loading, "adw_tab_page_set_loading", libs);
  gidLink(cast(void**)&adw_tab_page_set_needs_attention, "adw_tab_page_set_needs_attention", libs);
  gidLink(cast(void**)&adw_tab_page_set_thumbnail_xalign, "adw_tab_page_set_thumbnail_xalign", libs);
  gidLink(cast(void**)&adw_tab_page_set_thumbnail_yalign, "adw_tab_page_set_thumbnail_yalign", libs);
  gidLink(cast(void**)&adw_tab_page_set_title, "adw_tab_page_set_title", libs);
  gidLink(cast(void**)&adw_tab_page_set_tooltip, "adw_tab_page_set_tooltip", libs);

  // TabView
  gidLink(cast(void**)&adw_tab_view_get_type, "adw_tab_view_get_type", libs);
  gidLink(cast(void**)&adw_tab_view_new, "adw_tab_view_new", libs);
  gidLink(cast(void**)&adw_tab_view_add_page, "adw_tab_view_add_page", libs);
  gidLink(cast(void**)&adw_tab_view_add_shortcuts, "adw_tab_view_add_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_append, "adw_tab_view_append", libs);
  gidLink(cast(void**)&adw_tab_view_append_pinned, "adw_tab_view_append_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_close_other_pages, "adw_tab_view_close_other_pages", libs);
  gidLink(cast(void**)&adw_tab_view_close_page, "adw_tab_view_close_page", libs);
  gidLink(cast(void**)&adw_tab_view_close_page_finish, "adw_tab_view_close_page_finish", libs);
  gidLink(cast(void**)&adw_tab_view_close_pages_after, "adw_tab_view_close_pages_after", libs);
  gidLink(cast(void**)&adw_tab_view_close_pages_before, "adw_tab_view_close_pages_before", libs);
  gidLink(cast(void**)&adw_tab_view_get_default_icon, "adw_tab_view_get_default_icon", libs);
  gidLink(cast(void**)&adw_tab_view_get_is_transferring_page, "adw_tab_view_get_is_transferring_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_menu_model, "adw_tab_view_get_menu_model", libs);
  gidLink(cast(void**)&adw_tab_view_get_n_pages, "adw_tab_view_get_n_pages", libs);
  gidLink(cast(void**)&adw_tab_view_get_n_pinned_pages, "adw_tab_view_get_n_pinned_pages", libs);
  gidLink(cast(void**)&adw_tab_view_get_nth_page, "adw_tab_view_get_nth_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_page, "adw_tab_view_get_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_page_position, "adw_tab_view_get_page_position", libs);
  gidLink(cast(void**)&adw_tab_view_get_pages, "adw_tab_view_get_pages", libs);
  gidLink(cast(void**)&adw_tab_view_get_selected_page, "adw_tab_view_get_selected_page", libs);
  gidLink(cast(void**)&adw_tab_view_get_shortcuts, "adw_tab_view_get_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_insert, "adw_tab_view_insert", libs);
  gidLink(cast(void**)&adw_tab_view_insert_pinned, "adw_tab_view_insert_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_invalidate_thumbnails, "adw_tab_view_invalidate_thumbnails", libs);
  gidLink(cast(void**)&adw_tab_view_prepend, "adw_tab_view_prepend", libs);
  gidLink(cast(void**)&adw_tab_view_prepend_pinned, "adw_tab_view_prepend_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_remove_shortcuts, "adw_tab_view_remove_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_backward, "adw_tab_view_reorder_backward", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_first, "adw_tab_view_reorder_first", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_forward, "adw_tab_view_reorder_forward", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_last, "adw_tab_view_reorder_last", libs);
  gidLink(cast(void**)&adw_tab_view_reorder_page, "adw_tab_view_reorder_page", libs);
  gidLink(cast(void**)&adw_tab_view_select_next_page, "adw_tab_view_select_next_page", libs);
  gidLink(cast(void**)&adw_tab_view_select_previous_page, "adw_tab_view_select_previous_page", libs);
  gidLink(cast(void**)&adw_tab_view_set_default_icon, "adw_tab_view_set_default_icon", libs);
  gidLink(cast(void**)&adw_tab_view_set_menu_model, "adw_tab_view_set_menu_model", libs);
  gidLink(cast(void**)&adw_tab_view_set_page_pinned, "adw_tab_view_set_page_pinned", libs);
  gidLink(cast(void**)&adw_tab_view_set_selected_page, "adw_tab_view_set_selected_page", libs);
  gidLink(cast(void**)&adw_tab_view_set_shortcuts, "adw_tab_view_set_shortcuts", libs);
  gidLink(cast(void**)&adw_tab_view_transfer_page, "adw_tab_view_transfer_page", libs);

  // TimedAnimation
  gidLink(cast(void**)&adw_timed_animation_get_type, "adw_timed_animation_get_type", libs);
  gidLink(cast(void**)&adw_timed_animation_new, "adw_timed_animation_new", libs);
  gidLink(cast(void**)&adw_timed_animation_get_alternate, "adw_timed_animation_get_alternate", libs);
  gidLink(cast(void**)&adw_timed_animation_get_duration, "adw_timed_animation_get_duration", libs);
  gidLink(cast(void**)&adw_timed_animation_get_easing, "adw_timed_animation_get_easing", libs);
  gidLink(cast(void**)&adw_timed_animation_get_repeat_count, "adw_timed_animation_get_repeat_count", libs);
  gidLink(cast(void**)&adw_timed_animation_get_reverse, "adw_timed_animation_get_reverse", libs);
  gidLink(cast(void**)&adw_timed_animation_get_value_from, "adw_timed_animation_get_value_from", libs);
  gidLink(cast(void**)&adw_timed_animation_get_value_to, "adw_timed_animation_get_value_to", libs);
  gidLink(cast(void**)&adw_timed_animation_set_alternate, "adw_timed_animation_set_alternate", libs);
  gidLink(cast(void**)&adw_timed_animation_set_duration, "adw_timed_animation_set_duration", libs);
  gidLink(cast(void**)&adw_timed_animation_set_easing, "adw_timed_animation_set_easing", libs);
  gidLink(cast(void**)&adw_timed_animation_set_repeat_count, "adw_timed_animation_set_repeat_count", libs);
  gidLink(cast(void**)&adw_timed_animation_set_reverse, "adw_timed_animation_set_reverse", libs);
  gidLink(cast(void**)&adw_timed_animation_set_value_from, "adw_timed_animation_set_value_from", libs);
  gidLink(cast(void**)&adw_timed_animation_set_value_to, "adw_timed_animation_set_value_to", libs);

  // Toast
  gidLink(cast(void**)&adw_toast_get_type, "adw_toast_get_type", libs);
  gidLink(cast(void**)&adw_toast_new, "adw_toast_new", libs);
  gidLink(cast(void**)&adw_toast_new_format, "adw_toast_new_format", libs);
  gidLink(cast(void**)&adw_toast_dismiss, "adw_toast_dismiss", libs);
  gidLink(cast(void**)&adw_toast_get_action_name, "adw_toast_get_action_name", libs);
  gidLink(cast(void**)&adw_toast_get_action_target_value, "adw_toast_get_action_target_value", libs);
  gidLink(cast(void**)&adw_toast_get_button_label, "adw_toast_get_button_label", libs);
  gidLink(cast(void**)&adw_toast_get_custom_title, "adw_toast_get_custom_title", libs);
  gidLink(cast(void**)&adw_toast_get_priority, "adw_toast_get_priority", libs);
  gidLink(cast(void**)&adw_toast_get_timeout, "adw_toast_get_timeout", libs);
  gidLink(cast(void**)&adw_toast_get_title, "adw_toast_get_title", libs);
  gidLink(cast(void**)&adw_toast_get_use_markup, "adw_toast_get_use_markup", libs);
  gidLink(cast(void**)&adw_toast_set_action_name, "adw_toast_set_action_name", libs);
  gidLink(cast(void**)&adw_toast_set_action_target, "adw_toast_set_action_target", libs);
  gidLink(cast(void**)&adw_toast_set_action_target_value, "adw_toast_set_action_target_value", libs);
  gidLink(cast(void**)&adw_toast_set_button_label, "adw_toast_set_button_label", libs);
  gidLink(cast(void**)&adw_toast_set_custom_title, "adw_toast_set_custom_title", libs);
  gidLink(cast(void**)&adw_toast_set_detailed_action_name, "adw_toast_set_detailed_action_name", libs);
  gidLink(cast(void**)&adw_toast_set_priority, "adw_toast_set_priority", libs);
  gidLink(cast(void**)&adw_toast_set_timeout, "adw_toast_set_timeout", libs);
  gidLink(cast(void**)&adw_toast_set_title, "adw_toast_set_title", libs);
  gidLink(cast(void**)&adw_toast_set_use_markup, "adw_toast_set_use_markup", libs);

  // ToastOverlay
  gidLink(cast(void**)&adw_toast_overlay_get_type, "adw_toast_overlay_get_type", libs);
  gidLink(cast(void**)&adw_toast_overlay_new, "adw_toast_overlay_new", libs);
  gidLink(cast(void**)&adw_toast_overlay_add_toast, "adw_toast_overlay_add_toast", libs);
  gidLink(cast(void**)&adw_toast_overlay_get_child, "adw_toast_overlay_get_child", libs);
  gidLink(cast(void**)&adw_toast_overlay_set_child, "adw_toast_overlay_set_child", libs);

  // ToolbarView
  gidLink(cast(void**)&adw_toolbar_view_get_type, "adw_toolbar_view_get_type", libs);
  gidLink(cast(void**)&adw_toolbar_view_new, "adw_toolbar_view_new", libs);
  gidLink(cast(void**)&adw_toolbar_view_add_bottom_bar, "adw_toolbar_view_add_bottom_bar", libs);
  gidLink(cast(void**)&adw_toolbar_view_add_top_bar, "adw_toolbar_view_add_top_bar", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_bottom_bar_height, "adw_toolbar_view_get_bottom_bar_height", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_bottom_bar_style, "adw_toolbar_view_get_bottom_bar_style", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_content, "adw_toolbar_view_get_content", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_extend_content_to_bottom_edge, "adw_toolbar_view_get_extend_content_to_bottom_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_extend_content_to_top_edge, "adw_toolbar_view_get_extend_content_to_top_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_reveal_bottom_bars, "adw_toolbar_view_get_reveal_bottom_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_reveal_top_bars, "adw_toolbar_view_get_reveal_top_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_top_bar_height, "adw_toolbar_view_get_top_bar_height", libs);
  gidLink(cast(void**)&adw_toolbar_view_get_top_bar_style, "adw_toolbar_view_get_top_bar_style", libs);
  gidLink(cast(void**)&adw_toolbar_view_remove, "adw_toolbar_view_remove", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_bottom_bar_style, "adw_toolbar_view_set_bottom_bar_style", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_content, "adw_toolbar_view_set_content", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_extend_content_to_bottom_edge, "adw_toolbar_view_set_extend_content_to_bottom_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_extend_content_to_top_edge, "adw_toolbar_view_set_extend_content_to_top_edge", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_reveal_bottom_bars, "adw_toolbar_view_set_reveal_bottom_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_reveal_top_bars, "adw_toolbar_view_set_reveal_top_bars", libs);
  gidLink(cast(void**)&adw_toolbar_view_set_top_bar_style, "adw_toolbar_view_set_top_bar_style", libs);

  // ViewStack
  gidLink(cast(void**)&adw_view_stack_get_type, "adw_view_stack_get_type", libs);
  gidLink(cast(void**)&adw_view_stack_new, "adw_view_stack_new", libs);
  gidLink(cast(void**)&adw_view_stack_add, "adw_view_stack_add", libs);
  gidLink(cast(void**)&adw_view_stack_add_named, "adw_view_stack_add_named", libs);
  gidLink(cast(void**)&adw_view_stack_add_titled, "adw_view_stack_add_titled", libs);
  gidLink(cast(void**)&adw_view_stack_add_titled_with_icon, "adw_view_stack_add_titled_with_icon", libs);
  gidLink(cast(void**)&adw_view_stack_get_child_by_name, "adw_view_stack_get_child_by_name", libs);
  gidLink(cast(void**)&adw_view_stack_get_hhomogeneous, "adw_view_stack_get_hhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_get_page, "adw_view_stack_get_page", libs);
  gidLink(cast(void**)&adw_view_stack_get_pages, "adw_view_stack_get_pages", libs);
  gidLink(cast(void**)&adw_view_stack_get_vhomogeneous, "adw_view_stack_get_vhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_get_visible_child, "adw_view_stack_get_visible_child", libs);
  gidLink(cast(void**)&adw_view_stack_get_visible_child_name, "adw_view_stack_get_visible_child_name", libs);
  gidLink(cast(void**)&adw_view_stack_remove, "adw_view_stack_remove", libs);
  gidLink(cast(void**)&adw_view_stack_set_hhomogeneous, "adw_view_stack_set_hhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_set_vhomogeneous, "adw_view_stack_set_vhomogeneous", libs);
  gidLink(cast(void**)&adw_view_stack_set_visible_child, "adw_view_stack_set_visible_child", libs);
  gidLink(cast(void**)&adw_view_stack_set_visible_child_name, "adw_view_stack_set_visible_child_name", libs);

  // ViewStackPage
  gidLink(cast(void**)&adw_view_stack_page_get_type, "adw_view_stack_page_get_type", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_badge_number, "adw_view_stack_page_get_badge_number", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_child, "adw_view_stack_page_get_child", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_icon_name, "adw_view_stack_page_get_icon_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_name, "adw_view_stack_page_get_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_needs_attention, "adw_view_stack_page_get_needs_attention", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_title, "adw_view_stack_page_get_title", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_use_underline, "adw_view_stack_page_get_use_underline", libs);
  gidLink(cast(void**)&adw_view_stack_page_get_visible, "adw_view_stack_page_get_visible", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_badge_number, "adw_view_stack_page_set_badge_number", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_icon_name, "adw_view_stack_page_set_icon_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_name, "adw_view_stack_page_set_name", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_needs_attention, "adw_view_stack_page_set_needs_attention", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_title, "adw_view_stack_page_set_title", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_use_underline, "adw_view_stack_page_set_use_underline", libs);
  gidLink(cast(void**)&adw_view_stack_page_set_visible, "adw_view_stack_page_set_visible", libs);

  // ViewStackPages
  gidLink(cast(void**)&adw_view_stack_pages_get_type, "adw_view_stack_pages_get_type", libs);
  gidLink(cast(void**)&adw_view_stack_pages_get_selected_page, "adw_view_stack_pages_get_selected_page", libs);
  gidLink(cast(void**)&adw_view_stack_pages_set_selected_page, "adw_view_stack_pages_set_selected_page", libs);

  // ViewSwitcher
  gidLink(cast(void**)&adw_view_switcher_get_type, "adw_view_switcher_get_type", libs);
  gidLink(cast(void**)&adw_view_switcher_new, "adw_view_switcher_new", libs);
  gidLink(cast(void**)&adw_view_switcher_get_policy, "adw_view_switcher_get_policy", libs);
  gidLink(cast(void**)&adw_view_switcher_get_stack, "adw_view_switcher_get_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_set_policy, "adw_view_switcher_set_policy", libs);
  gidLink(cast(void**)&adw_view_switcher_set_stack, "adw_view_switcher_set_stack", libs);

  // ViewSwitcherBar
  gidLink(cast(void**)&adw_view_switcher_bar_get_type, "adw_view_switcher_bar_get_type", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_new, "adw_view_switcher_bar_new", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_get_reveal, "adw_view_switcher_bar_get_reveal", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_get_stack, "adw_view_switcher_bar_get_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_set_reveal, "adw_view_switcher_bar_set_reveal", libs);
  gidLink(cast(void**)&adw_view_switcher_bar_set_stack, "adw_view_switcher_bar_set_stack", libs);

  // ViewSwitcherTitle
  gidLink(cast(void**)&adw_view_switcher_title_get_type, "adw_view_switcher_title_get_type", libs);
  gidLink(cast(void**)&adw_view_switcher_title_new, "adw_view_switcher_title_new", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_stack, "adw_view_switcher_title_get_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_subtitle, "adw_view_switcher_title_get_subtitle", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_title, "adw_view_switcher_title_get_title", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_title_visible, "adw_view_switcher_title_get_title_visible", libs);
  gidLink(cast(void**)&adw_view_switcher_title_get_view_switcher_enabled, "adw_view_switcher_title_get_view_switcher_enabled", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_stack, "adw_view_switcher_title_set_stack", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_subtitle, "adw_view_switcher_title_set_subtitle", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_title, "adw_view_switcher_title_set_title", libs);
  gidLink(cast(void**)&adw_view_switcher_title_set_view_switcher_enabled, "adw_view_switcher_title_set_view_switcher_enabled", libs);

  // Window
  gidLink(cast(void**)&adw_window_get_type, "adw_window_get_type", libs);
  gidLink(cast(void**)&adw_window_new, "adw_window_new", libs);
  gidLink(cast(void**)&adw_window_add_breakpoint, "adw_window_add_breakpoint", libs);
  gidLink(cast(void**)&adw_window_get_content, "adw_window_get_content", libs);
  gidLink(cast(void**)&adw_window_get_current_breakpoint, "adw_window_get_current_breakpoint", libs);
  gidLink(cast(void**)&adw_window_get_dialogs, "adw_window_get_dialogs", libs);
  gidLink(cast(void**)&adw_window_get_visible_dialog, "adw_window_get_visible_dialog", libs);
  gidLink(cast(void**)&adw_window_set_content, "adw_window_set_content", libs);

  // WindowTitle
  gidLink(cast(void**)&adw_window_title_get_type, "adw_window_title_get_type", libs);
  gidLink(cast(void**)&adw_window_title_new, "adw_window_title_new", libs);
  gidLink(cast(void**)&adw_window_title_get_subtitle, "adw_window_title_get_subtitle", libs);
  gidLink(cast(void**)&adw_window_title_get_title, "adw_window_title_get_title", libs);
  gidLink(cast(void**)&adw_window_title_set_subtitle, "adw_window_title_set_subtitle", libs);
  gidLink(cast(void**)&adw_window_title_set_title, "adw_window_title_set_title", libs);

  // global
  gidLink(cast(void**)&adw_get_enable_animations, "adw_get_enable_animations", libs);
  gidLink(cast(void**)&adw_get_major_version, "adw_get_major_version", libs);
  gidLink(cast(void**)&adw_get_micro_version, "adw_get_micro_version", libs);
  gidLink(cast(void**)&adw_get_minor_version, "adw_get_minor_version", libs);
  gidLink(cast(void**)&adw_init, "adw_init", libs);
  gidLink(cast(void**)&adw_is_initialized, "adw_is_initialized", libs);
  gidLink(cast(void**)&adw_lerp, "adw_lerp", libs);
  gidLink(cast(void**)&adw_show_about_dialog, "adw_show_about_dialog", libs);
  gidLink(cast(void**)&adw_show_about_dialog_from_appdata, "adw_show_about_dialog_from_appdata", libs);
  gidLink(cast(void**)&adw_show_about_window, "adw_show_about_window", libs);
  gidLink(cast(void**)&adw_show_about_window_from_appdata, "adw_show_about_window_from_appdata", libs);

  // Easing
  gidLink(cast(void**)&adw_easing_ease, "adw_easing_ease", libs);

  // LengthUnit
  gidLink(cast(void**)&adw_length_unit_from_px, "adw_length_unit_from_px", libs);
  gidLink(cast(void**)&adw_length_unit_to_px, "adw_length_unit_to_px", libs);
}
