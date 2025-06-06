/// D types for gdk4 library
module gdk.types;

import gdk.c.functions;
import gdk.c.types;
import gdk.content_deserializer;
import gdk.content_serializer;
import gid.gid;


// Enums

/** */
alias AnchorHints = GdkAnchorHints;

/** */
alias AxisFlags = GdkAxisFlags;

/** */
alias AxisUse = GdkAxisUse;

/** */
alias CrossingMode = GdkCrossingMode;

/** */
alias DevicePadFeature = GdkDevicePadFeature;

/** */
alias DeviceToolType = GdkDeviceToolType;

/** */
alias DmabufError = GdkDmabufError;

/** */
alias DragAction = GdkDragAction;

/** */
alias DragCancelReason = GdkDragCancelReason;

/** */
alias EventType = GdkEventType;

/** */
alias FrameClockPhase = GdkFrameClockPhase;

/** */
alias FullscreenMode = GdkFullscreenMode;

/** */
alias GLAPI = GdkGLAPI;

/** */
alias GLError = GdkGLError;

/** */
alias Gravity = GdkGravity;

/** */
alias InputSource = GdkInputSource;

/** */
alias KeyMatch = GdkKeyMatch;

/** */
alias MemoryFormat = GdkMemoryFormat;

/** */
alias ModifierType = GdkModifierType;

/** */
alias NotifyType = GdkNotifyType;

/** */
alias PaintableFlags = GdkPaintableFlags;

/** */
alias ScrollDirection = GdkScrollDirection;

/** */
alias ScrollUnit = GdkScrollUnit;

/** */
alias SeatCapabilities = GdkSeatCapabilities;

/** */
alias SubpixelLayout = GdkSubpixelLayout;

/** */
alias SurfaceEdge = GdkSurfaceEdge;

/** */
alias TextureError = GdkTextureError;

/** */
alias TitlebarGesture = GdkTitlebarGesture;

/** */
alias ToplevelState = GdkToplevelState;

/** */
alias TouchpadGesturePhase = GdkTouchpadGesturePhase;

/** */
alias VulkanError = GdkVulkanError;

// Structs

/** */
alias KeymapKey = GdkKeymapKey;

/** */
alias TimeCoord = GdkTimeCoord;

// Callbacks

/**
    The type of a function that can be registered with [gdk.global.contentRegisterDeserializer].
    
    When the function gets called to operate on content, it can call functions on the
    deserializer object to obtain the mime type, input stream, user data, etc. for its
    operation.

    Params:
      deserializer = a [gdk.content_deserializer.ContentDeserializer]
*/
alias ContentDeserializeFunc = void delegate(gdk.content_deserializer.ContentDeserializer deserializer);

/**
    The type of a function that can be registered with [gdk.global.contentRegisterSerializer].
    
    When the function gets called to operate on content, it can call functions on the
    serializer object to obtain the mime type, output stream, user data, etc. for its
    operation.

    Params:
      serializer = a [gdk.content_serializer.ContentSerializer]
*/
alias ContentSerializeFunc = void delegate(gdk.content_serializer.ContentSerializer serializer);

/**
    Defines all possible DND actions.
    
    This can be used in [gdk.drop.Drop.status] messages when any drop
    can be accepted or a more specific drop method is not yet known.
*/
enum ACTION_ALL = 7;

/**
    The middle button.
*/
enum BUTTON_MIDDLE = 2;

/**
    The primary button. This is typically the left mouse button, or the
    right button in a left-handed setup.
*/
enum BUTTON_PRIMARY = 1;

/**
    The secondary button. This is typically the right mouse button, or the
    left button in a left-handed setup.
*/
enum BUTTON_SECONDARY = 3;

/**
    Represents the current time, and can be used anywhere a time is expected.
*/
enum CURRENT_TIME = 0;

/**
    Use this macro as the return value for continuing the propagation of
    an event handler.
*/
enum EVENT_PROPAGATE = false;

/**
    Use this macro as the return value for stopping the propagation of
    an event handler.
*/
enum EVENT_STOP = true;

/** */
enum KEY_0 = 48;

/** */
enum KEY_1 = 49;

/** */
enum KEY_2 = 50;

/** */
enum KEY_3 = 51;

/** */
enum KEY_3270_AltCursor = 64784;

/** */
enum KEY_3270_Attn = 64782;

/** */
enum KEY_3270_BackTab = 64773;

/** */
enum KEY_3270_ChangeScreen = 64793;

/** */
enum KEY_3270_Copy = 64789;

/** */
enum KEY_3270_CursorBlink = 64783;

/** */
enum KEY_3270_CursorSelect = 64796;

/** */
enum KEY_3270_DeleteWord = 64794;

/** */
enum KEY_3270_Duplicate = 64769;

/** */
enum KEY_3270_Enter = 64798;

/** */
enum KEY_3270_EraseEOF = 64774;

/** */
enum KEY_3270_EraseInput = 64775;

/** */
enum KEY_3270_ExSelect = 64795;

/** */
enum KEY_3270_FieldMark = 64770;

/** */
enum KEY_3270_Ident = 64787;

/** */
enum KEY_3270_Jump = 64786;

/** */
enum KEY_3270_KeyClick = 64785;

/** */
enum KEY_3270_Left2 = 64772;

/** */
enum KEY_3270_PA1 = 64778;

/** */
enum KEY_3270_PA2 = 64779;

/** */
enum KEY_3270_PA3 = 64780;

/** */
enum KEY_3270_Play = 64790;

/** */
enum KEY_3270_PrintScreen = 64797;

/** */
enum KEY_3270_Quit = 64777;

/** */
enum KEY_3270_Record = 64792;

/** */
enum KEY_3270_Reset = 64776;

/** */
enum KEY_3270_Right2 = 64771;

/** */
enum KEY_3270_Rule = 64788;

/** */
enum KEY_3270_Setup = 64791;

/** */
enum KEY_3270_Test = 64781;

/** */
enum KEY_4 = 52;

/** */
enum KEY_5 = 53;

/** */
enum KEY_6 = 54;

/** */
enum KEY_7 = 55;

/** */
enum KEY_8 = 56;

/** */
enum KEY_9 = 57;

/** */
enum KEY_A = 65;

/** */
enum KEY_AE = 198;

/** */
enum KEY_Aacute = 193;

/** */
enum KEY_Abelowdot = 16785056;

/** */
enum KEY_Abreve = 451;

/** */
enum KEY_Abreveacute = 16785070;

/** */
enum KEY_Abrevebelowdot = 16785078;

/** */
enum KEY_Abrevegrave = 16785072;

/** */
enum KEY_Abrevehook = 16785074;

/** */
enum KEY_Abrevetilde = 16785076;

/** */
enum KEY_AccessX_Enable = 65136;

/** */
enum KEY_AccessX_Feedback_Enable = 65137;

/** */
enum KEY_Acircumflex = 194;

/** */
enum KEY_Acircumflexacute = 16785060;

/** */
enum KEY_Acircumflexbelowdot = 16785068;

/** */
enum KEY_Acircumflexgrave = 16785062;

/** */
enum KEY_Acircumflexhook = 16785064;

/** */
enum KEY_Acircumflextilde = 16785066;

/** */
enum KEY_AddFavorite = 269025081;

/** */
enum KEY_Adiaeresis = 196;

/** */
enum KEY_Agrave = 192;

/** */
enum KEY_Ahook = 16785058;

/** */
enum KEY_Alt_L = 65513;

/** */
enum KEY_Alt_R = 65514;

/** */
enum KEY_Amacron = 960;

/** */
enum KEY_Aogonek = 417;

/** */
enum KEY_ApplicationLeft = 269025104;

/** */
enum KEY_ApplicationRight = 269025105;

/** */
enum KEY_Arabic_0 = 16778848;

/** */
enum KEY_Arabic_1 = 16778849;

/** */
enum KEY_Arabic_2 = 16778850;

/** */
enum KEY_Arabic_3 = 16778851;

/** */
enum KEY_Arabic_4 = 16778852;

/** */
enum KEY_Arabic_5 = 16778853;

/** */
enum KEY_Arabic_6 = 16778854;

/** */
enum KEY_Arabic_7 = 16778855;

/** */
enum KEY_Arabic_8 = 16778856;

/** */
enum KEY_Arabic_9 = 16778857;

/** */
enum KEY_Arabic_ain = 1497;

/** */
enum KEY_Arabic_alef = 1479;

/** */
enum KEY_Arabic_alefmaksura = 1513;

/** */
enum KEY_Arabic_beh = 1480;

/** */
enum KEY_Arabic_comma = 1452;

/** */
enum KEY_Arabic_dad = 1494;

/** */
enum KEY_Arabic_dal = 1487;

/** */
enum KEY_Arabic_damma = 1519;

/** */
enum KEY_Arabic_dammatan = 1516;

/** */
enum KEY_Arabic_ddal = 16778888;

/** */
enum KEY_Arabic_farsi_yeh = 16778956;

/** */
enum KEY_Arabic_fatha = 1518;

/** */
enum KEY_Arabic_fathatan = 1515;

/** */
enum KEY_Arabic_feh = 1505;

/** */
enum KEY_Arabic_fullstop = 16778964;

/** */
enum KEY_Arabic_gaf = 16778927;

/** */
enum KEY_Arabic_ghain = 1498;

/** */
enum KEY_Arabic_ha = 1511;

/** */
enum KEY_Arabic_hah = 1485;

/** */
enum KEY_Arabic_hamza = 1473;

/** */
enum KEY_Arabic_hamza_above = 16778836;

/** */
enum KEY_Arabic_hamza_below = 16778837;

/** */
enum KEY_Arabic_hamzaonalef = 1475;

/** */
enum KEY_Arabic_hamzaonwaw = 1476;

/** */
enum KEY_Arabic_hamzaonyeh = 1478;

/** */
enum KEY_Arabic_hamzaunderalef = 1477;

/** */
enum KEY_Arabic_heh = 1511;

/** */
enum KEY_Arabic_heh_doachashmee = 16778942;

/** */
enum KEY_Arabic_heh_goal = 16778945;

/** */
enum KEY_Arabic_jeem = 1484;

/** */
enum KEY_Arabic_jeh = 16778904;

/** */
enum KEY_Arabic_kaf = 1507;

/** */
enum KEY_Arabic_kasra = 1520;

/** */
enum KEY_Arabic_kasratan = 1517;

/** */
enum KEY_Arabic_keheh = 16778921;

/** */
enum KEY_Arabic_khah = 1486;

/** */
enum KEY_Arabic_lam = 1508;

/** */
enum KEY_Arabic_madda_above = 16778835;

/** */
enum KEY_Arabic_maddaonalef = 1474;

/** */
enum KEY_Arabic_meem = 1509;

/** */
enum KEY_Arabic_noon = 1510;

/** */
enum KEY_Arabic_noon_ghunna = 16778938;

/** */
enum KEY_Arabic_peh = 16778878;

/** */
enum KEY_Arabic_percent = 16778858;

/** */
enum KEY_Arabic_qaf = 1506;

/** */
enum KEY_Arabic_question_mark = 1471;

/** */
enum KEY_Arabic_ra = 1489;

/** */
enum KEY_Arabic_rreh = 16778897;

/** */
enum KEY_Arabic_sad = 1493;

/** */
enum KEY_Arabic_seen = 1491;

/** */
enum KEY_Arabic_semicolon = 1467;

/** */
enum KEY_Arabic_shadda = 1521;

/** */
enum KEY_Arabic_sheen = 1492;

/** */
enum KEY_Arabic_sukun = 1522;

/** */
enum KEY_Arabic_superscript_alef = 16778864;

/** */
enum KEY_Arabic_switch = 65406;

/** */
enum KEY_Arabic_tah = 1495;

/** */
enum KEY_Arabic_tatweel = 1504;

/** */
enum KEY_Arabic_tcheh = 16778886;

/** */
enum KEY_Arabic_teh = 1482;

/** */
enum KEY_Arabic_tehmarbuta = 1481;

/** */
enum KEY_Arabic_thal = 1488;

/** */
enum KEY_Arabic_theh = 1483;

/** */
enum KEY_Arabic_tteh = 16778873;

/** */
enum KEY_Arabic_veh = 16778916;

/** */
enum KEY_Arabic_waw = 1512;

/** */
enum KEY_Arabic_yeh = 1514;

/** */
enum KEY_Arabic_yeh_baree = 16778962;

/** */
enum KEY_Arabic_zah = 1496;

/** */
enum KEY_Arabic_zain = 1490;

/** */
enum KEY_Aring = 197;

/** */
enum KEY_Armenian_AT = 16778552;

/** */
enum KEY_Armenian_AYB = 16778545;

/** */
enum KEY_Armenian_BEN = 16778546;

/** */
enum KEY_Armenian_CHA = 16778569;

/** */
enum KEY_Armenian_DA = 16778548;

/** */
enum KEY_Armenian_DZA = 16778561;

/** */
enum KEY_Armenian_E = 16778551;

/** */
enum KEY_Armenian_FE = 16778582;

/** */
enum KEY_Armenian_GHAT = 16778562;

/** */
enum KEY_Armenian_GIM = 16778547;

/** */
enum KEY_Armenian_HI = 16778565;

/** */
enum KEY_Armenian_HO = 16778560;

/** */
enum KEY_Armenian_INI = 16778555;

/** */
enum KEY_Armenian_JE = 16778571;

/** */
enum KEY_Armenian_KE = 16778580;

/** */
enum KEY_Armenian_KEN = 16778559;

/** */
enum KEY_Armenian_KHE = 16778557;

/** */
enum KEY_Armenian_LYUN = 16778556;

/** */
enum KEY_Armenian_MEN = 16778564;

/** */
enum KEY_Armenian_NU = 16778566;

/** */
enum KEY_Armenian_O = 16778581;

/** */
enum KEY_Armenian_PE = 16778570;

/** */
enum KEY_Armenian_PYUR = 16778579;

/** */
enum KEY_Armenian_RA = 16778572;

/** */
enum KEY_Armenian_RE = 16778576;

/** */
enum KEY_Armenian_SE = 16778573;

/** */
enum KEY_Armenian_SHA = 16778567;

/** */
enum KEY_Armenian_TCHE = 16778563;

/** */
enum KEY_Armenian_TO = 16778553;

/** */
enum KEY_Armenian_TSA = 16778558;

/** */
enum KEY_Armenian_TSO = 16778577;

/** */
enum KEY_Armenian_TYUN = 16778575;

/** */
enum KEY_Armenian_VEV = 16778574;

/** */
enum KEY_Armenian_VO = 16778568;

/** */
enum KEY_Armenian_VYUN = 16778578;

/** */
enum KEY_Armenian_YECH = 16778549;

/** */
enum KEY_Armenian_ZA = 16778550;

/** */
enum KEY_Armenian_ZHE = 16778554;

/** */
enum KEY_Armenian_accent = 16778587;

/** */
enum KEY_Armenian_amanak = 16778588;

/** */
enum KEY_Armenian_apostrophe = 16778586;

/** */
enum KEY_Armenian_at = 16778600;

/** */
enum KEY_Armenian_ayb = 16778593;

/** */
enum KEY_Armenian_ben = 16778594;

/** */
enum KEY_Armenian_but = 16778589;

/** */
enum KEY_Armenian_cha = 16778617;

/** */
enum KEY_Armenian_da = 16778596;

/** */
enum KEY_Armenian_dza = 16778609;

/** */
enum KEY_Armenian_e = 16778599;

/** */
enum KEY_Armenian_exclam = 16778588;

/** */
enum KEY_Armenian_fe = 16778630;

/** */
enum KEY_Armenian_full_stop = 16778633;

/** */
enum KEY_Armenian_ghat = 16778610;

/** */
enum KEY_Armenian_gim = 16778595;

/** */
enum KEY_Armenian_hi = 16778613;

/** */
enum KEY_Armenian_ho = 16778608;

/** */
enum KEY_Armenian_hyphen = 16778634;

/** */
enum KEY_Armenian_ini = 16778603;

/** */
enum KEY_Armenian_je = 16778619;

/** */
enum KEY_Armenian_ke = 16778628;

/** */
enum KEY_Armenian_ken = 16778607;

/** */
enum KEY_Armenian_khe = 16778605;

/** */
enum KEY_Armenian_ligature_ew = 16778631;

/** */
enum KEY_Armenian_lyun = 16778604;

/** */
enum KEY_Armenian_men = 16778612;

/** */
enum KEY_Armenian_nu = 16778614;

/** */
enum KEY_Armenian_o = 16778629;

/** */
enum KEY_Armenian_paruyk = 16778590;

/** */
enum KEY_Armenian_pe = 16778618;

/** */
enum KEY_Armenian_pyur = 16778627;

/** */
enum KEY_Armenian_question = 16778590;

/** */
enum KEY_Armenian_ra = 16778620;

/** */
enum KEY_Armenian_re = 16778624;

/** */
enum KEY_Armenian_se = 16778621;

/** */
enum KEY_Armenian_separation_mark = 16778589;

/** */
enum KEY_Armenian_sha = 16778615;

/** */
enum KEY_Armenian_shesht = 16778587;

/** */
enum KEY_Armenian_tche = 16778611;

/** */
enum KEY_Armenian_to = 16778601;

/** */
enum KEY_Armenian_tsa = 16778606;

/** */
enum KEY_Armenian_tso = 16778625;

/** */
enum KEY_Armenian_tyun = 16778623;

/** */
enum KEY_Armenian_verjaket = 16778633;

/** */
enum KEY_Armenian_vev = 16778622;

/** */
enum KEY_Armenian_vo = 16778616;

/** */
enum KEY_Armenian_vyun = 16778626;

/** */
enum KEY_Armenian_yech = 16778597;

/** */
enum KEY_Armenian_yentamna = 16778634;

/** */
enum KEY_Armenian_za = 16778598;

/** */
enum KEY_Armenian_zhe = 16778602;

/** */
enum KEY_Atilde = 195;

/** */
enum KEY_AudibleBell_Enable = 65146;

/** */
enum KEY_AudioCycleTrack = 269025179;

/** */
enum KEY_AudioForward = 269025175;

/** */
enum KEY_AudioLowerVolume = 269025041;

/** */
enum KEY_AudioMedia = 269025074;

/** */
enum KEY_AudioMicMute = 269025202;

/** */
enum KEY_AudioMute = 269025042;

/** */
enum KEY_AudioNext = 269025047;

/** */
enum KEY_AudioPause = 269025073;

/** */
enum KEY_AudioPlay = 269025044;

/** */
enum KEY_AudioPreset = 269025206;

/** */
enum KEY_AudioPrev = 269025046;

/** */
enum KEY_AudioRaiseVolume = 269025043;

/** */
enum KEY_AudioRandomPlay = 269025177;

/** */
enum KEY_AudioRecord = 269025052;

/** */
enum KEY_AudioRepeat = 269025176;

/** */
enum KEY_AudioRewind = 269025086;

/** */
enum KEY_AudioStop = 269025045;

/** */
enum KEY_Away = 269025165;

/** */
enum KEY_B = 66;

/** */
enum KEY_Babovedot = 16784898;

/** */
enum KEY_Back = 269025062;

/** */
enum KEY_BackForward = 269025087;

/** */
enum KEY_BackSpace = 65288;

/** */
enum KEY_Battery = 269025171;

/** */
enum KEY_Begin = 65368;

/** */
enum KEY_Blue = 269025190;

/** */
enum KEY_Bluetooth = 269025172;

/** */
enum KEY_Book = 269025106;

/** */
enum KEY_BounceKeys_Enable = 65140;

/** */
enum KEY_Break = 65387;

/** */
enum KEY_BrightnessAdjust = 269025083;

/** */
enum KEY_Byelorussian_SHORTU = 1726;

/** */
enum KEY_Byelorussian_shortu = 1710;

/** */
enum KEY_C = 67;

/** */
enum KEY_CD = 269025107;

/** */
enum KEY_CH = 65186;

/** */
enum KEY_C_H = 65189;

/** */
enum KEY_C_h = 65188;

/** */
enum KEY_Cabovedot = 709;

/** */
enum KEY_Cacute = 454;

/** */
enum KEY_Calculator = 269025053;

/** */
enum KEY_Calendar = 269025056;

/** */
enum KEY_Cancel = 65385;

/** */
enum KEY_Caps_Lock = 65509;

/** */
enum KEY_Ccaron = 456;

/** */
enum KEY_Ccedilla = 199;

/** */
enum KEY_Ccircumflex = 710;

/** */
enum KEY_Ch = 65185;

/** */
enum KEY_Clear = 65291;

/** */
enum KEY_ClearGrab = 269024801;

/** */
enum KEY_Close = 269025110;

/** */
enum KEY_Codeinput = 65335;

/** */
enum KEY_ColonSign = 16785569;

/** */
enum KEY_Community = 269025085;

/** */
enum KEY_ContrastAdjust = 269025058;

/** */
enum KEY_Control_L = 65507;

/** */
enum KEY_Control_R = 65508;

/** */
enum KEY_Copy = 269025111;

/** */
enum KEY_CruzeiroSign = 16785570;

/** */
enum KEY_Cut = 269025112;

/** */
enum KEY_CycleAngle = 269025180;

/** */
enum KEY_Cyrillic_A = 1761;

/** */
enum KEY_Cyrillic_BE = 1762;

/** */
enum KEY_Cyrillic_CHE = 1790;

/** */
enum KEY_Cyrillic_CHE_descender = 16778422;

/** */
enum KEY_Cyrillic_CHE_vertstroke = 16778424;

/** */
enum KEY_Cyrillic_DE = 1764;

/** */
enum KEY_Cyrillic_DZHE = 1727;

/** */
enum KEY_Cyrillic_E = 1788;

/** */
enum KEY_Cyrillic_EF = 1766;

/** */
enum KEY_Cyrillic_EL = 1772;

/** */
enum KEY_Cyrillic_EM = 1773;

/** */
enum KEY_Cyrillic_EN = 1774;

/** */
enum KEY_Cyrillic_EN_descender = 16778402;

/** */
enum KEY_Cyrillic_ER = 1778;

/** */
enum KEY_Cyrillic_ES = 1779;

/** */
enum KEY_Cyrillic_GHE = 1767;

/** */
enum KEY_Cyrillic_GHE_bar = 16778386;

/** */
enum KEY_Cyrillic_HA = 1768;

/** */
enum KEY_Cyrillic_HARDSIGN = 1791;

/** */
enum KEY_Cyrillic_HA_descender = 16778418;

/** */
enum KEY_Cyrillic_I = 1769;

/** */
enum KEY_Cyrillic_IE = 1765;

/** */
enum KEY_Cyrillic_IO = 1715;

/** */
enum KEY_Cyrillic_I_macron = 16778466;

/** */
enum KEY_Cyrillic_JE = 1720;

/** */
enum KEY_Cyrillic_KA = 1771;

/** */
enum KEY_Cyrillic_KA_descender = 16778394;

/** */
enum KEY_Cyrillic_KA_vertstroke = 16778396;

/** */
enum KEY_Cyrillic_LJE = 1721;

/** */
enum KEY_Cyrillic_NJE = 1722;

/** */
enum KEY_Cyrillic_O = 1775;

/** */
enum KEY_Cyrillic_O_bar = 16778472;

/** */
enum KEY_Cyrillic_PE = 1776;

/** */
enum KEY_Cyrillic_SCHWA = 16778456;

/** */
enum KEY_Cyrillic_SHA = 1787;

/** */
enum KEY_Cyrillic_SHCHA = 1789;

/** */
enum KEY_Cyrillic_SHHA = 16778426;

/** */
enum KEY_Cyrillic_SHORTI = 1770;

/** */
enum KEY_Cyrillic_SOFTSIGN = 1784;

/** */
enum KEY_Cyrillic_TE = 1780;

/** */
enum KEY_Cyrillic_TSE = 1763;

/** */
enum KEY_Cyrillic_U = 1781;

/** */
enum KEY_Cyrillic_U_macron = 16778478;

/** */
enum KEY_Cyrillic_U_straight = 16778414;

/** */
enum KEY_Cyrillic_U_straight_bar = 16778416;

/** */
enum KEY_Cyrillic_VE = 1783;

/** */
enum KEY_Cyrillic_YA = 1777;

/** */
enum KEY_Cyrillic_YERU = 1785;

/** */
enum KEY_Cyrillic_YU = 1760;

/** */
enum KEY_Cyrillic_ZE = 1786;

/** */
enum KEY_Cyrillic_ZHE = 1782;

/** */
enum KEY_Cyrillic_ZHE_descender = 16778390;

/** */
enum KEY_Cyrillic_a = 1729;

/** */
enum KEY_Cyrillic_be = 1730;

/** */
enum KEY_Cyrillic_che = 1758;

/** */
enum KEY_Cyrillic_che_descender = 16778423;

/** */
enum KEY_Cyrillic_che_vertstroke = 16778425;

/** */
enum KEY_Cyrillic_de = 1732;

/** */
enum KEY_Cyrillic_dzhe = 1711;

/** */
enum KEY_Cyrillic_e = 1756;

/** */
enum KEY_Cyrillic_ef = 1734;

/** */
enum KEY_Cyrillic_el = 1740;

/** */
enum KEY_Cyrillic_em = 1741;

/** */
enum KEY_Cyrillic_en = 1742;

/** */
enum KEY_Cyrillic_en_descender = 16778403;

/** */
enum KEY_Cyrillic_er = 1746;

/** */
enum KEY_Cyrillic_es = 1747;

/** */
enum KEY_Cyrillic_ghe = 1735;

/** */
enum KEY_Cyrillic_ghe_bar = 16778387;

/** */
enum KEY_Cyrillic_ha = 1736;

/** */
enum KEY_Cyrillic_ha_descender = 16778419;

/** */
enum KEY_Cyrillic_hardsign = 1759;

/** */
enum KEY_Cyrillic_i = 1737;

/** */
enum KEY_Cyrillic_i_macron = 16778467;

/** */
enum KEY_Cyrillic_ie = 1733;

/** */
enum KEY_Cyrillic_io = 1699;

/** */
enum KEY_Cyrillic_je = 1704;

/** */
enum KEY_Cyrillic_ka = 1739;

/** */
enum KEY_Cyrillic_ka_descender = 16778395;

/** */
enum KEY_Cyrillic_ka_vertstroke = 16778397;

/** */
enum KEY_Cyrillic_lje = 1705;

/** */
enum KEY_Cyrillic_nje = 1706;

/** */
enum KEY_Cyrillic_o = 1743;

/** */
enum KEY_Cyrillic_o_bar = 16778473;

/** */
enum KEY_Cyrillic_pe = 1744;

/** */
enum KEY_Cyrillic_schwa = 16778457;

/** */
enum KEY_Cyrillic_sha = 1755;

/** */
enum KEY_Cyrillic_shcha = 1757;

/** */
enum KEY_Cyrillic_shha = 16778427;

/** */
enum KEY_Cyrillic_shorti = 1738;

/** */
enum KEY_Cyrillic_softsign = 1752;

/** */
enum KEY_Cyrillic_te = 1748;

/** */
enum KEY_Cyrillic_tse = 1731;

/** */
enum KEY_Cyrillic_u = 1749;

/** */
enum KEY_Cyrillic_u_macron = 16778479;

/** */
enum KEY_Cyrillic_u_straight = 16778415;

/** */
enum KEY_Cyrillic_u_straight_bar = 16778417;

/** */
enum KEY_Cyrillic_ve = 1751;

/** */
enum KEY_Cyrillic_ya = 1745;

/** */
enum KEY_Cyrillic_yeru = 1753;

/** */
enum KEY_Cyrillic_yu = 1728;

/** */
enum KEY_Cyrillic_ze = 1754;

/** */
enum KEY_Cyrillic_zhe = 1750;

/** */
enum KEY_Cyrillic_zhe_descender = 16778391;

/** */
enum KEY_D = 68;

/** */
enum KEY_DOS = 269025114;

/** */
enum KEY_Dabovedot = 16784906;

/** */
enum KEY_Dcaron = 463;

/** */
enum KEY_Delete = 65535;

/** */
enum KEY_Display = 269025113;

/** */
enum KEY_Documents = 269025115;

/** */
enum KEY_DongSign = 16785579;

/** */
enum KEY_Down = 65364;

/** */
enum KEY_Dstroke = 464;

/** */
enum KEY_E = 69;

/** */
enum KEY_ENG = 957;

/** */
enum KEY_ETH = 208;

/** */
enum KEY_EZH = 16777655;

/** */
enum KEY_Eabovedot = 972;

/** */
enum KEY_Eacute = 201;

/** */
enum KEY_Ebelowdot = 16785080;

/** */
enum KEY_Ecaron = 460;

/** */
enum KEY_Ecircumflex = 202;

/** */
enum KEY_Ecircumflexacute = 16785086;

/** */
enum KEY_Ecircumflexbelowdot = 16785094;

/** */
enum KEY_Ecircumflexgrave = 16785088;

/** */
enum KEY_Ecircumflexhook = 16785090;

/** */
enum KEY_Ecircumflextilde = 16785092;

/** */
enum KEY_EcuSign = 16785568;

/** */
enum KEY_Ediaeresis = 203;

/** */
enum KEY_Egrave = 200;

/** */
enum KEY_Ehook = 16785082;

/** */
enum KEY_Eisu_Shift = 65327;

/** */
enum KEY_Eisu_toggle = 65328;

/** */
enum KEY_Eject = 269025068;

/** */
enum KEY_Emacron = 938;

/** */
enum KEY_End = 65367;

/** */
enum KEY_Eogonek = 458;

/** */
enum KEY_Escape = 65307;

/** */
enum KEY_Eth = 208;

/** */
enum KEY_Etilde = 16785084;

/** */
enum KEY_EuroSign = 8364;

/** */
enum KEY_Excel = 269025116;

/** */
enum KEY_Execute = 65378;

/** */
enum KEY_Explorer = 269025117;

/** */
enum KEY_F = 70;

/** */
enum KEY_F1 = 65470;

/** */
enum KEY_F10 = 65479;

/** */
enum KEY_F11 = 65480;

/** */
enum KEY_F12 = 65481;

/** */
enum KEY_F13 = 65482;

/** */
enum KEY_F14 = 65483;

/** */
enum KEY_F15 = 65484;

/** */
enum KEY_F16 = 65485;

/** */
enum KEY_F17 = 65486;

/** */
enum KEY_F18 = 65487;

/** */
enum KEY_F19 = 65488;

/** */
enum KEY_F2 = 65471;

/** */
enum KEY_F20 = 65489;

/** */
enum KEY_F21 = 65490;

/** */
enum KEY_F22 = 65491;

/** */
enum KEY_F23 = 65492;

/** */
enum KEY_F24 = 65493;

/** */
enum KEY_F25 = 65494;

/** */
enum KEY_F26 = 65495;

/** */
enum KEY_F27 = 65496;

/** */
enum KEY_F28 = 65497;

/** */
enum KEY_F29 = 65498;

/** */
enum KEY_F3 = 65472;

/** */
enum KEY_F30 = 65499;

/** */
enum KEY_F31 = 65500;

/** */
enum KEY_F32 = 65501;

/** */
enum KEY_F33 = 65502;

/** */
enum KEY_F34 = 65503;

/** */
enum KEY_F35 = 65504;

/** */
enum KEY_F4 = 65473;

/** */
enum KEY_F5 = 65474;

/** */
enum KEY_F6 = 65475;

/** */
enum KEY_F7 = 65476;

/** */
enum KEY_F8 = 65477;

/** */
enum KEY_F9 = 65478;

/** */
enum KEY_FFrancSign = 16785571;

/** */
enum KEY_Fabovedot = 16784926;

/** */
enum KEY_Farsi_0 = 16778992;

/** */
enum KEY_Farsi_1 = 16778993;

/** */
enum KEY_Farsi_2 = 16778994;

/** */
enum KEY_Farsi_3 = 16778995;

/** */
enum KEY_Farsi_4 = 16778996;

/** */
enum KEY_Farsi_5 = 16778997;

/** */
enum KEY_Farsi_6 = 16778998;

/** */
enum KEY_Farsi_7 = 16778999;

/** */
enum KEY_Farsi_8 = 16779000;

/** */
enum KEY_Farsi_9 = 16779001;

/** */
enum KEY_Farsi_yeh = 16778956;

/** */
enum KEY_Favorites = 269025072;

/** */
enum KEY_Finance = 269025084;

/** */
enum KEY_Find = 65384;

/** */
enum KEY_First_Virtual_Screen = 65232;

/** */
enum KEY_Forward = 269025063;

/** */
enum KEY_FrameBack = 269025181;

/** */
enum KEY_FrameForward = 269025182;

/** */
enum KEY_G = 71;

/** */
enum KEY_Gabovedot = 725;

/** */
enum KEY_Game = 269025118;

/** */
enum KEY_Gbreve = 683;

/** */
enum KEY_Gcaron = 16777702;

/** */
enum KEY_Gcedilla = 939;

/** */
enum KEY_Gcircumflex = 728;

/** */
enum KEY_Georgian_an = 16781520;

/** */
enum KEY_Georgian_ban = 16781521;

/** */
enum KEY_Georgian_can = 16781546;

/** */
enum KEY_Georgian_char = 16781549;

/** */
enum KEY_Georgian_chin = 16781545;

/** */
enum KEY_Georgian_cil = 16781548;

/** */
enum KEY_Georgian_don = 16781523;

/** */
enum KEY_Georgian_en = 16781524;

/** */
enum KEY_Georgian_fi = 16781558;

/** */
enum KEY_Georgian_gan = 16781522;

/** */
enum KEY_Georgian_ghan = 16781542;

/** */
enum KEY_Georgian_hae = 16781552;

/** */
enum KEY_Georgian_har = 16781556;

/** */
enum KEY_Georgian_he = 16781553;

/** */
enum KEY_Georgian_hie = 16781554;

/** */
enum KEY_Georgian_hoe = 16781557;

/** */
enum KEY_Georgian_in = 16781528;

/** */
enum KEY_Georgian_jhan = 16781551;

/** */
enum KEY_Georgian_jil = 16781547;

/** */
enum KEY_Georgian_kan = 16781529;

/** */
enum KEY_Georgian_khar = 16781541;

/** */
enum KEY_Georgian_las = 16781530;

/** */
enum KEY_Georgian_man = 16781531;

/** */
enum KEY_Georgian_nar = 16781532;

/** */
enum KEY_Georgian_on = 16781533;

/** */
enum KEY_Georgian_par = 16781534;

/** */
enum KEY_Georgian_phar = 16781540;

/** */
enum KEY_Georgian_qar = 16781543;

/** */
enum KEY_Georgian_rae = 16781536;

/** */
enum KEY_Georgian_san = 16781537;

/** */
enum KEY_Georgian_shin = 16781544;

/** */
enum KEY_Georgian_tan = 16781527;

/** */
enum KEY_Georgian_tar = 16781538;

/** */
enum KEY_Georgian_un = 16781539;

/** */
enum KEY_Georgian_vin = 16781525;

/** */
enum KEY_Georgian_we = 16781555;

/** */
enum KEY_Georgian_xan = 16781550;

/** */
enum KEY_Georgian_zen = 16781526;

/** */
enum KEY_Georgian_zhar = 16781535;

/** */
enum KEY_Go = 269025119;

/** */
enum KEY_Greek_ALPHA = 1985;

/** */
enum KEY_Greek_ALPHAaccent = 1953;

/** */
enum KEY_Greek_BETA = 1986;

/** */
enum KEY_Greek_CHI = 2007;

/** */
enum KEY_Greek_DELTA = 1988;

/** */
enum KEY_Greek_EPSILON = 1989;

/** */
enum KEY_Greek_EPSILONaccent = 1954;

/** */
enum KEY_Greek_ETA = 1991;

/** */
enum KEY_Greek_ETAaccent = 1955;

/** */
enum KEY_Greek_GAMMA = 1987;

/** */
enum KEY_Greek_IOTA = 1993;

/** */
enum KEY_Greek_IOTAaccent = 1956;

/** */
enum KEY_Greek_IOTAdiaeresis = 1957;

/** */
enum KEY_Greek_IOTAdieresis = 1957;

/** */
enum KEY_Greek_KAPPA = 1994;

/** */
enum KEY_Greek_LAMBDA = 1995;

/** */
enum KEY_Greek_LAMDA = 1995;

/** */
enum KEY_Greek_MU = 1996;

/** */
enum KEY_Greek_NU = 1997;

/** */
enum KEY_Greek_OMEGA = 2009;

/** */
enum KEY_Greek_OMEGAaccent = 1963;

/** */
enum KEY_Greek_OMICRON = 1999;

/** */
enum KEY_Greek_OMICRONaccent = 1959;

/** */
enum KEY_Greek_PHI = 2006;

/** */
enum KEY_Greek_PI = 2000;

/** */
enum KEY_Greek_PSI = 2008;

/** */
enum KEY_Greek_RHO = 2001;

/** */
enum KEY_Greek_SIGMA = 2002;

/** */
enum KEY_Greek_TAU = 2004;

/** */
enum KEY_Greek_THETA = 1992;

/** */
enum KEY_Greek_UPSILON = 2005;

/** */
enum KEY_Greek_UPSILONaccent = 1960;

/** */
enum KEY_Greek_UPSILONdieresis = 1961;

/** */
enum KEY_Greek_XI = 1998;

/** */
enum KEY_Greek_ZETA = 1990;

/** */
enum KEY_Greek_accentdieresis = 1966;

/** */
enum KEY_Greek_alpha = 2017;

/** */
enum KEY_Greek_alphaaccent = 1969;

/** */
enum KEY_Greek_beta = 2018;

/** */
enum KEY_Greek_chi = 2039;

/** */
enum KEY_Greek_delta = 2020;

/** */
enum KEY_Greek_epsilon = 2021;

/** */
enum KEY_Greek_epsilonaccent = 1970;

/** */
enum KEY_Greek_eta = 2023;

/** */
enum KEY_Greek_etaaccent = 1971;

/** */
enum KEY_Greek_finalsmallsigma = 2035;

/** */
enum KEY_Greek_gamma = 2019;

/** */
enum KEY_Greek_horizbar = 1967;

/** */
enum KEY_Greek_iota = 2025;

/** */
enum KEY_Greek_iotaaccent = 1972;

/** */
enum KEY_Greek_iotaaccentdieresis = 1974;

/** */
enum KEY_Greek_iotadieresis = 1973;

/** */
enum KEY_Greek_kappa = 2026;

/** */
enum KEY_Greek_lambda = 2027;

/** */
enum KEY_Greek_lamda = 2027;

/** */
enum KEY_Greek_mu = 2028;

/** */
enum KEY_Greek_nu = 2029;

/** */
enum KEY_Greek_omega = 2041;

/** */
enum KEY_Greek_omegaaccent = 1979;

/** */
enum KEY_Greek_omicron = 2031;

/** */
enum KEY_Greek_omicronaccent = 1975;

/** */
enum KEY_Greek_phi = 2038;

/** */
enum KEY_Greek_pi = 2032;

/** */
enum KEY_Greek_psi = 2040;

/** */
enum KEY_Greek_rho = 2033;

/** */
enum KEY_Greek_sigma = 2034;

/** */
enum KEY_Greek_switch = 65406;

/** */
enum KEY_Greek_tau = 2036;

/** */
enum KEY_Greek_theta = 2024;

/** */
enum KEY_Greek_upsilon = 2037;

/** */
enum KEY_Greek_upsilonaccent = 1976;

/** */
enum KEY_Greek_upsilonaccentdieresis = 1978;

/** */
enum KEY_Greek_upsilondieresis = 1977;

/** */
enum KEY_Greek_xi = 2030;

/** */
enum KEY_Greek_zeta = 2022;

/** */
enum KEY_Green = 269025188;

/** */
enum KEY_H = 72;

/** */
enum KEY_Hangul = 65329;

/** */
enum KEY_Hangul_A = 3775;

/** */
enum KEY_Hangul_AE = 3776;

/** */
enum KEY_Hangul_AraeA = 3830;

/** */
enum KEY_Hangul_AraeAE = 3831;

/** */
enum KEY_Hangul_Banja = 65337;

/** */
enum KEY_Hangul_Cieuc = 3770;

/** */
enum KEY_Hangul_Codeinput = 65335;

/** */
enum KEY_Hangul_Dikeud = 3751;

/** */
enum KEY_Hangul_E = 3780;

/** */
enum KEY_Hangul_EO = 3779;

/** */
enum KEY_Hangul_EU = 3793;

/** */
enum KEY_Hangul_End = 65331;

/** */
enum KEY_Hangul_Hanja = 65332;

/** */
enum KEY_Hangul_Hieuh = 3774;

/** */
enum KEY_Hangul_I = 3795;

/** */
enum KEY_Hangul_Ieung = 3767;

/** */
enum KEY_Hangul_J_Cieuc = 3818;

/** */
enum KEY_Hangul_J_Dikeud = 3802;

/** */
enum KEY_Hangul_J_Hieuh = 3822;

/** */
enum KEY_Hangul_J_Ieung = 3816;

/** */
enum KEY_Hangul_J_Jieuj = 3817;

/** */
enum KEY_Hangul_J_Khieuq = 3819;

/** */
enum KEY_Hangul_J_Kiyeog = 3796;

/** */
enum KEY_Hangul_J_KiyeogSios = 3798;

/** */
enum KEY_Hangul_J_KkogjiDalrinIeung = 3833;

/** */
enum KEY_Hangul_J_Mieum = 3811;

/** */
enum KEY_Hangul_J_Nieun = 3799;

/** */
enum KEY_Hangul_J_NieunHieuh = 3801;

/** */
enum KEY_Hangul_J_NieunJieuj = 3800;

/** */
enum KEY_Hangul_J_PanSios = 3832;

/** */
enum KEY_Hangul_J_Phieuf = 3821;

/** */
enum KEY_Hangul_J_Pieub = 3812;

/** */
enum KEY_Hangul_J_PieubSios = 3813;

/** */
enum KEY_Hangul_J_Rieul = 3803;

/** */
enum KEY_Hangul_J_RieulHieuh = 3810;

/** */
enum KEY_Hangul_J_RieulKiyeog = 3804;

/** */
enum KEY_Hangul_J_RieulMieum = 3805;

/** */
enum KEY_Hangul_J_RieulPhieuf = 3809;

/** */
enum KEY_Hangul_J_RieulPieub = 3806;

/** */
enum KEY_Hangul_J_RieulSios = 3807;

/** */
enum KEY_Hangul_J_RieulTieut = 3808;

/** */
enum KEY_Hangul_J_Sios = 3814;

/** */
enum KEY_Hangul_J_SsangKiyeog = 3797;

/** */
enum KEY_Hangul_J_SsangSios = 3815;

/** */
enum KEY_Hangul_J_Tieut = 3820;

/** */
enum KEY_Hangul_J_YeorinHieuh = 3834;

/** */
enum KEY_Hangul_Jamo = 65333;

/** */
enum KEY_Hangul_Jeonja = 65336;

/** */
enum KEY_Hangul_Jieuj = 3768;

/** */
enum KEY_Hangul_Khieuq = 3771;

/** */
enum KEY_Hangul_Kiyeog = 3745;

/** */
enum KEY_Hangul_KiyeogSios = 3747;

/** */
enum KEY_Hangul_KkogjiDalrinIeung = 3827;

/** */
enum KEY_Hangul_Mieum = 3761;

/** */
enum KEY_Hangul_MultipleCandidate = 65341;

/** */
enum KEY_Hangul_Nieun = 3748;

/** */
enum KEY_Hangul_NieunHieuh = 3750;

/** */
enum KEY_Hangul_NieunJieuj = 3749;

/** */
enum KEY_Hangul_O = 3783;

/** */
enum KEY_Hangul_OE = 3786;

/** */
enum KEY_Hangul_PanSios = 3826;

/** */
enum KEY_Hangul_Phieuf = 3773;

/** */
enum KEY_Hangul_Pieub = 3762;

/** */
enum KEY_Hangul_PieubSios = 3764;

/** */
enum KEY_Hangul_PostHanja = 65339;

/** */
enum KEY_Hangul_PreHanja = 65338;

/** */
enum KEY_Hangul_PreviousCandidate = 65342;

/** */
enum KEY_Hangul_Rieul = 3753;

/** */
enum KEY_Hangul_RieulHieuh = 3760;

/** */
enum KEY_Hangul_RieulKiyeog = 3754;

/** */
enum KEY_Hangul_RieulMieum = 3755;

/** */
enum KEY_Hangul_RieulPhieuf = 3759;

/** */
enum KEY_Hangul_RieulPieub = 3756;

/** */
enum KEY_Hangul_RieulSios = 3757;

/** */
enum KEY_Hangul_RieulTieut = 3758;

/** */
enum KEY_Hangul_RieulYeorinHieuh = 3823;

/** */
enum KEY_Hangul_Romaja = 65334;

/** */
enum KEY_Hangul_SingleCandidate = 65340;

/** */
enum KEY_Hangul_Sios = 3765;

/** */
enum KEY_Hangul_Special = 65343;

/** */
enum KEY_Hangul_SsangDikeud = 3752;

/** */
enum KEY_Hangul_SsangJieuj = 3769;

/** */
enum KEY_Hangul_SsangKiyeog = 3746;

/** */
enum KEY_Hangul_SsangPieub = 3763;

/** */
enum KEY_Hangul_SsangSios = 3766;

/** */
enum KEY_Hangul_Start = 65330;

/** */
enum KEY_Hangul_SunkyeongeumMieum = 3824;

/** */
enum KEY_Hangul_SunkyeongeumPhieuf = 3828;

/** */
enum KEY_Hangul_SunkyeongeumPieub = 3825;

/** */
enum KEY_Hangul_Tieut = 3772;

/** */
enum KEY_Hangul_U = 3788;

/** */
enum KEY_Hangul_WA = 3784;

/** */
enum KEY_Hangul_WAE = 3785;

/** */
enum KEY_Hangul_WE = 3790;

/** */
enum KEY_Hangul_WEO = 3789;

/** */
enum KEY_Hangul_WI = 3791;

/** */
enum KEY_Hangul_YA = 3777;

/** */
enum KEY_Hangul_YAE = 3778;

/** */
enum KEY_Hangul_YE = 3782;

/** */
enum KEY_Hangul_YEO = 3781;

/** */
enum KEY_Hangul_YI = 3794;

/** */
enum KEY_Hangul_YO = 3787;

/** */
enum KEY_Hangul_YU = 3792;

/** */
enum KEY_Hangul_YeorinHieuh = 3829;

/** */
enum KEY_Hangul_switch = 65406;

/** */
enum KEY_Hankaku = 65321;

/** */
enum KEY_Hcircumflex = 678;

/** */
enum KEY_Hebrew_switch = 65406;

/** */
enum KEY_Help = 65386;

/** */
enum KEY_Henkan = 65315;

/** */
enum KEY_Henkan_Mode = 65315;

/** */
enum KEY_Hibernate = 269025192;

/** */
enum KEY_Hiragana = 65317;

/** */
enum KEY_Hiragana_Katakana = 65319;

/** */
enum KEY_History = 269025079;

/** */
enum KEY_Home = 65360;

/** */
enum KEY_HomePage = 269025048;

/** */
enum KEY_HotLinks = 269025082;

/** */
enum KEY_Hstroke = 673;

/** */
enum KEY_Hyper_L = 65517;

/** */
enum KEY_Hyper_R = 65518;

/** */
enum KEY_I = 73;

/** */
enum KEY_ISO_Center_Object = 65075;

/** */
enum KEY_ISO_Continuous_Underline = 65072;

/** */
enum KEY_ISO_Discontinuous_Underline = 65073;

/** */
enum KEY_ISO_Emphasize = 65074;

/** */
enum KEY_ISO_Enter = 65076;

/** */
enum KEY_ISO_Fast_Cursor_Down = 65071;

/** */
enum KEY_ISO_Fast_Cursor_Left = 65068;

/** */
enum KEY_ISO_Fast_Cursor_Right = 65069;

/** */
enum KEY_ISO_Fast_Cursor_Up = 65070;

/** */
enum KEY_ISO_First_Group = 65036;

/** */
enum KEY_ISO_First_Group_Lock = 65037;

/** */
enum KEY_ISO_Group_Latch = 65030;

/** */
enum KEY_ISO_Group_Lock = 65031;

/** */
enum KEY_ISO_Group_Shift = 65406;

/** */
enum KEY_ISO_Last_Group = 65038;

/** */
enum KEY_ISO_Last_Group_Lock = 65039;

/** */
enum KEY_ISO_Left_Tab = 65056;

/** */
enum KEY_ISO_Level2_Latch = 65026;

/** */
enum KEY_ISO_Level3_Latch = 65028;

/** */
enum KEY_ISO_Level3_Lock = 65029;

/** */
enum KEY_ISO_Level3_Shift = 65027;

/** */
enum KEY_ISO_Level5_Latch = 65042;

/** */
enum KEY_ISO_Level5_Lock = 65043;

/** */
enum KEY_ISO_Level5_Shift = 65041;

/** */
enum KEY_ISO_Lock = 65025;

/** */
enum KEY_ISO_Move_Line_Down = 65058;

/** */
enum KEY_ISO_Move_Line_Up = 65057;

/** */
enum KEY_ISO_Next_Group = 65032;

/** */
enum KEY_ISO_Next_Group_Lock = 65033;

/** */
enum KEY_ISO_Partial_Line_Down = 65060;

/** */
enum KEY_ISO_Partial_Line_Up = 65059;

/** */
enum KEY_ISO_Partial_Space_Left = 65061;

/** */
enum KEY_ISO_Partial_Space_Right = 65062;

/** */
enum KEY_ISO_Prev_Group = 65034;

/** */
enum KEY_ISO_Prev_Group_Lock = 65035;

/** */
enum KEY_ISO_Release_Both_Margins = 65067;

/** */
enum KEY_ISO_Release_Margin_Left = 65065;

/** */
enum KEY_ISO_Release_Margin_Right = 65066;

/** */
enum KEY_ISO_Set_Margin_Left = 65063;

/** */
enum KEY_ISO_Set_Margin_Right = 65064;

/** */
enum KEY_Iabovedot = 681;

/** */
enum KEY_Iacute = 205;

/** */
enum KEY_Ibelowdot = 16785098;

/** */
enum KEY_Ibreve = 16777516;

/** */
enum KEY_Icircumflex = 206;

/** */
enum KEY_Idiaeresis = 207;

/** */
enum KEY_Igrave = 204;

/** */
enum KEY_Ihook = 16785096;

/** */
enum KEY_Imacron = 975;

/** */
enum KEY_Insert = 65379;

/** */
enum KEY_Iogonek = 967;

/** */
enum KEY_Itilde = 933;

/** */
enum KEY_J = 74;

/** */
enum KEY_Jcircumflex = 684;

/** */
enum KEY_K = 75;

/** */
enum KEY_KP_0 = 65456;

/** */
enum KEY_KP_1 = 65457;

/** */
enum KEY_KP_2 = 65458;

/** */
enum KEY_KP_3 = 65459;

/** */
enum KEY_KP_4 = 65460;

/** */
enum KEY_KP_5 = 65461;

/** */
enum KEY_KP_6 = 65462;

/** */
enum KEY_KP_7 = 65463;

/** */
enum KEY_KP_8 = 65464;

/** */
enum KEY_KP_9 = 65465;

/** */
enum KEY_KP_Add = 65451;

/** */
enum KEY_KP_Begin = 65437;

/** */
enum KEY_KP_Decimal = 65454;

/** */
enum KEY_KP_Delete = 65439;

/** */
enum KEY_KP_Divide = 65455;

/** */
enum KEY_KP_Down = 65433;

/** */
enum KEY_KP_End = 65436;

/** */
enum KEY_KP_Enter = 65421;

/** */
enum KEY_KP_Equal = 65469;

/** */
enum KEY_KP_F1 = 65425;

/** */
enum KEY_KP_F2 = 65426;

/** */
enum KEY_KP_F3 = 65427;

/** */
enum KEY_KP_F4 = 65428;

/** */
enum KEY_KP_Home = 65429;

/** */
enum KEY_KP_Insert = 65438;

/** */
enum KEY_KP_Left = 65430;

/** */
enum KEY_KP_Multiply = 65450;

/** */
enum KEY_KP_Next = 65435;

/** */
enum KEY_KP_Page_Down = 65435;

/** */
enum KEY_KP_Page_Up = 65434;

/** */
enum KEY_KP_Prior = 65434;

/** */
enum KEY_KP_Right = 65432;

/** */
enum KEY_KP_Separator = 65452;

/** */
enum KEY_KP_Space = 65408;

/** */
enum KEY_KP_Subtract = 65453;

/** */
enum KEY_KP_Tab = 65417;

/** */
enum KEY_KP_Up = 65431;

/** */
enum KEY_Kana_Lock = 65325;

/** */
enum KEY_Kana_Shift = 65326;

/** */
enum KEY_Kanji = 65313;

/** */
enum KEY_Kanji_Bangou = 65335;

/** */
enum KEY_Katakana = 65318;

/** */
enum KEY_KbdBrightnessDown = 269025030;

/** */
enum KEY_KbdBrightnessUp = 269025029;

/** */
enum KEY_KbdLightOnOff = 269025028;

/** */
enum KEY_Kcedilla = 979;

/** */
enum KEY_Keyboard = 269025203;

/** */
enum KEY_Korean_Won = 3839;

/** */
enum KEY_L = 76;

/** */
enum KEY_L1 = 65480;

/** */
enum KEY_L10 = 65489;

/** */
enum KEY_L2 = 65481;

/** */
enum KEY_L3 = 65482;

/** */
enum KEY_L4 = 65483;

/** */
enum KEY_L5 = 65484;

/** */
enum KEY_L6 = 65485;

/** */
enum KEY_L7 = 65486;

/** */
enum KEY_L8 = 65487;

/** */
enum KEY_L9 = 65488;

/** */
enum KEY_Lacute = 453;

/** */
enum KEY_Last_Virtual_Screen = 65236;

/** */
enum KEY_Launch0 = 269025088;

/** */
enum KEY_Launch1 = 269025089;

/** */
enum KEY_Launch2 = 269025090;

/** */
enum KEY_Launch3 = 269025091;

/** */
enum KEY_Launch4 = 269025092;

/** */
enum KEY_Launch5 = 269025093;

/** */
enum KEY_Launch6 = 269025094;

/** */
enum KEY_Launch7 = 269025095;

/** */
enum KEY_Launch8 = 269025096;

/** */
enum KEY_Launch9 = 269025097;

/** */
enum KEY_LaunchA = 269025098;

/** */
enum KEY_LaunchB = 269025099;

/** */
enum KEY_LaunchC = 269025100;

/** */
enum KEY_LaunchD = 269025101;

/** */
enum KEY_LaunchE = 269025102;

/** */
enum KEY_LaunchF = 269025103;

/** */
enum KEY_Lbelowdot = 16784950;

/** */
enum KEY_Lcaron = 421;

/** */
enum KEY_Lcedilla = 934;

/** */
enum KEY_Left = 65361;

/** */
enum KEY_LightBulb = 269025077;

/** */
enum KEY_Linefeed = 65290;

/** */
enum KEY_LiraSign = 16785572;

/** */
enum KEY_LogGrabInfo = 269024805;

/** */
enum KEY_LogOff = 269025121;

/** */
enum KEY_LogWindowTree = 269024804;

/** */
enum KEY_Lstroke = 419;

/** */
enum KEY_M = 77;

/** */
enum KEY_Mabovedot = 16784960;

/** */
enum KEY_Macedonia_DSE = 1717;

/** */
enum KEY_Macedonia_GJE = 1714;

/** */
enum KEY_Macedonia_KJE = 1724;

/** */
enum KEY_Macedonia_dse = 1701;

/** */
enum KEY_Macedonia_gje = 1698;

/** */
enum KEY_Macedonia_kje = 1708;

/** */
enum KEY_Mae_Koho = 65342;

/** */
enum KEY_Mail = 269025049;

/** */
enum KEY_MailForward = 269025168;

/** */
enum KEY_Market = 269025122;

/** */
enum KEY_Massyo = 65324;

/** */
enum KEY_Meeting = 269025123;

/** */
enum KEY_Memo = 269025054;

/** */
enum KEY_Menu = 65383;

/** */
enum KEY_MenuKB = 269025125;

/** */
enum KEY_MenuPB = 269025126;

/** */
enum KEY_Messenger = 269025166;

/** */
enum KEY_Meta_L = 65511;

/** */
enum KEY_Meta_R = 65512;

/** */
enum KEY_MillSign = 16785573;

/** */
enum KEY_ModeLock = 269025025;

/** */
enum KEY_Mode_switch = 65406;

/** */
enum KEY_MonBrightnessDown = 269025027;

/** */
enum KEY_MonBrightnessUp = 269025026;

/** */
enum KEY_MouseKeys_Accel_Enable = 65143;

/** */
enum KEY_MouseKeys_Enable = 65142;

/** */
enum KEY_Muhenkan = 65314;

/** */
enum KEY_Multi_key = 65312;

/** */
enum KEY_MultipleCandidate = 65341;

/** */
enum KEY_Music = 269025170;

/** */
enum KEY_MyComputer = 269025075;

/** */
enum KEY_MySites = 269025127;

/** */
enum KEY_N = 78;

/** */
enum KEY_Nacute = 465;

/** */
enum KEY_NairaSign = 16785574;

/** */
enum KEY_Ncaron = 466;

/** */
enum KEY_Ncedilla = 977;

/** */
enum KEY_New = 269025128;

/** */
enum KEY_NewSheqelSign = 16785578;

/** */
enum KEY_News = 269025129;

/** */
enum KEY_Next = 65366;

/** */
enum KEY_Next_VMode = 269024802;

/** */
enum KEY_Next_Virtual_Screen = 65234;

/** */
enum KEY_Ntilde = 209;

/** */
enum KEY_Num_Lock = 65407;

/** */
enum KEY_O = 79;

/** */
enum KEY_OE = 5052;

/** */
enum KEY_Oacute = 211;

/** */
enum KEY_Obarred = 16777631;

/** */
enum KEY_Obelowdot = 16785100;

/** */
enum KEY_Ocaron = 16777681;

/** */
enum KEY_Ocircumflex = 212;

/** */
enum KEY_Ocircumflexacute = 16785104;

/** */
enum KEY_Ocircumflexbelowdot = 16785112;

/** */
enum KEY_Ocircumflexgrave = 16785106;

/** */
enum KEY_Ocircumflexhook = 16785108;

/** */
enum KEY_Ocircumflextilde = 16785110;

/** */
enum KEY_Odiaeresis = 214;

/** */
enum KEY_Odoubleacute = 469;

/** */
enum KEY_OfficeHome = 269025130;

/** */
enum KEY_Ograve = 210;

/** */
enum KEY_Ohook = 16785102;

/** */
enum KEY_Ohorn = 16777632;

/** */
enum KEY_Ohornacute = 16785114;

/** */
enum KEY_Ohornbelowdot = 16785122;

/** */
enum KEY_Ohorngrave = 16785116;

/** */
enum KEY_Ohornhook = 16785118;

/** */
enum KEY_Ohorntilde = 16785120;

/** */
enum KEY_Omacron = 978;

/** */
enum KEY_Ooblique = 216;

/** */
enum KEY_Open = 269025131;

/** */
enum KEY_OpenURL = 269025080;

/** */
enum KEY_Option = 269025132;

/** */
enum KEY_Oslash = 216;

/** */
enum KEY_Otilde = 213;

/** */
enum KEY_Overlay1_Enable = 65144;

/** */
enum KEY_Overlay2_Enable = 65145;

/** */
enum KEY_P = 80;

/** */
enum KEY_Pabovedot = 16784982;

/** */
enum KEY_Page_Down = 65366;

/** */
enum KEY_Page_Up = 65365;

/** */
enum KEY_Paste = 269025133;

/** */
enum KEY_Pause = 65299;

/** */
enum KEY_PesetaSign = 16785575;

/** */
enum KEY_Phone = 269025134;

/** */
enum KEY_Pictures = 269025169;

/** */
enum KEY_Pointer_Accelerate = 65274;

/** */
enum KEY_Pointer_Button1 = 65257;

/** */
enum KEY_Pointer_Button2 = 65258;

/** */
enum KEY_Pointer_Button3 = 65259;

/** */
enum KEY_Pointer_Button4 = 65260;

/** */
enum KEY_Pointer_Button5 = 65261;

/** */
enum KEY_Pointer_Button_Dflt = 65256;

/** */
enum KEY_Pointer_DblClick1 = 65263;

/** */
enum KEY_Pointer_DblClick2 = 65264;

/** */
enum KEY_Pointer_DblClick3 = 65265;

/** */
enum KEY_Pointer_DblClick4 = 65266;

/** */
enum KEY_Pointer_DblClick5 = 65267;

/** */
enum KEY_Pointer_DblClick_Dflt = 65262;

/** */
enum KEY_Pointer_DfltBtnNext = 65275;

/** */
enum KEY_Pointer_DfltBtnPrev = 65276;

/** */
enum KEY_Pointer_Down = 65251;

/** */
enum KEY_Pointer_DownLeft = 65254;

/** */
enum KEY_Pointer_DownRight = 65255;

/** */
enum KEY_Pointer_Drag1 = 65269;

/** */
enum KEY_Pointer_Drag2 = 65270;

/** */
enum KEY_Pointer_Drag3 = 65271;

/** */
enum KEY_Pointer_Drag4 = 65272;

/** */
enum KEY_Pointer_Drag5 = 65277;

/** */
enum KEY_Pointer_Drag_Dflt = 65268;

/** */
enum KEY_Pointer_EnableKeys = 65273;

/** */
enum KEY_Pointer_Left = 65248;

/** */
enum KEY_Pointer_Right = 65249;

/** */
enum KEY_Pointer_Up = 65250;

/** */
enum KEY_Pointer_UpLeft = 65252;

/** */
enum KEY_Pointer_UpRight = 65253;

/** */
enum KEY_PowerDown = 269025057;

/** */
enum KEY_PowerOff = 269025066;

/** */
enum KEY_Prev_VMode = 269024803;

/** */
enum KEY_Prev_Virtual_Screen = 65233;

/** */
enum KEY_PreviousCandidate = 65342;

/** */
enum KEY_Print = 65377;

/** */
enum KEY_Prior = 65365;

/** */
enum KEY_Q = 81;

/** */
enum KEY_R = 82;

/** */
enum KEY_R1 = 65490;

/** */
enum KEY_R10 = 65499;

/** */
enum KEY_R11 = 65500;

/** */
enum KEY_R12 = 65501;

/** */
enum KEY_R13 = 65502;

/** */
enum KEY_R14 = 65503;

/** */
enum KEY_R15 = 65504;

/** */
enum KEY_R2 = 65491;

/** */
enum KEY_R3 = 65492;

/** */
enum KEY_R4 = 65493;

/** */
enum KEY_R5 = 65494;

/** */
enum KEY_R6 = 65495;

/** */
enum KEY_R7 = 65496;

/** */
enum KEY_R8 = 65497;

/** */
enum KEY_R9 = 65498;

/** */
enum KEY_RFKill = 269025205;

/** */
enum KEY_Racute = 448;

/** */
enum KEY_Rcaron = 472;

/** */
enum KEY_Rcedilla = 931;

/** */
enum KEY_Red = 269025187;

/** */
enum KEY_Redo = 65382;

/** */
enum KEY_Refresh = 269025065;

/** */
enum KEY_Reload = 269025139;

/** */
enum KEY_RepeatKeys_Enable = 65138;

/** */
enum KEY_Reply = 269025138;

/** */
enum KEY_Return = 65293;

/** */
enum KEY_Right = 65363;

/** */
enum KEY_RockerDown = 269025060;

/** */
enum KEY_RockerEnter = 269025061;

/** */
enum KEY_RockerUp = 269025059;

/** */
enum KEY_Romaji = 65316;

/** */
enum KEY_RotateWindows = 269025140;

/** */
enum KEY_RotationKB = 269025142;

/** */
enum KEY_RotationPB = 269025141;

/** */
enum KEY_RupeeSign = 16785576;

/** */
enum KEY_S = 83;

/** */
enum KEY_SCHWA = 16777615;

/** */
enum KEY_Sabovedot = 16784992;

/** */
enum KEY_Sacute = 422;

/** */
enum KEY_Save = 269025143;

/** */
enum KEY_Scaron = 425;

/** */
enum KEY_Scedilla = 426;

/** */
enum KEY_Scircumflex = 734;

/** */
enum KEY_ScreenSaver = 269025069;

/** */
enum KEY_ScrollClick = 269025146;

/** */
enum KEY_ScrollDown = 269025145;

/** */
enum KEY_ScrollUp = 269025144;

/** */
enum KEY_Scroll_Lock = 65300;

/** */
enum KEY_Search = 269025051;

/** */
enum KEY_Select = 65376;

/** */
enum KEY_SelectButton = 269025184;

/** */
enum KEY_Send = 269025147;

/** */
enum KEY_Serbian_DJE = 1713;

/** */
enum KEY_Serbian_DZE = 1727;

/** */
enum KEY_Serbian_JE = 1720;

/** */
enum KEY_Serbian_LJE = 1721;

/** */
enum KEY_Serbian_NJE = 1722;

/** */
enum KEY_Serbian_TSHE = 1723;

/** */
enum KEY_Serbian_dje = 1697;

/** */
enum KEY_Serbian_dze = 1711;

/** */
enum KEY_Serbian_je = 1704;

/** */
enum KEY_Serbian_lje = 1705;

/** */
enum KEY_Serbian_nje = 1706;

/** */
enum KEY_Serbian_tshe = 1707;

/** */
enum KEY_Shift_L = 65505;

/** */
enum KEY_Shift_Lock = 65510;

/** */
enum KEY_Shift_R = 65506;

/** */
enum KEY_Shop = 269025078;

/** */
enum KEY_SingleCandidate = 65340;

/** */
enum KEY_Sinh_a = 16780677;

/** */
enum KEY_Sinh_aa = 16780678;

/** */
enum KEY_Sinh_aa2 = 16780751;

/** */
enum KEY_Sinh_ae = 16780679;

/** */
enum KEY_Sinh_ae2 = 16780752;

/** */
enum KEY_Sinh_aee = 16780680;

/** */
enum KEY_Sinh_aee2 = 16780753;

/** */
enum KEY_Sinh_ai = 16780691;

/** */
enum KEY_Sinh_ai2 = 16780763;

/** */
enum KEY_Sinh_al = 16780746;

/** */
enum KEY_Sinh_au = 16780694;

/** */
enum KEY_Sinh_au2 = 16780766;

/** */
enum KEY_Sinh_ba = 16780726;

/** */
enum KEY_Sinh_bha = 16780727;

/** */
enum KEY_Sinh_ca = 16780704;

/** */
enum KEY_Sinh_cha = 16780705;

/** */
enum KEY_Sinh_dda = 16780713;

/** */
enum KEY_Sinh_ddha = 16780714;

/** */
enum KEY_Sinh_dha = 16780719;

/** */
enum KEY_Sinh_dhha = 16780720;

/** */
enum KEY_Sinh_e = 16780689;

/** */
enum KEY_Sinh_e2 = 16780761;

/** */
enum KEY_Sinh_ee = 16780690;

/** */
enum KEY_Sinh_ee2 = 16780762;

/** */
enum KEY_Sinh_fa = 16780742;

/** */
enum KEY_Sinh_ga = 16780700;

/** */
enum KEY_Sinh_gha = 16780701;

/** */
enum KEY_Sinh_h2 = 16780675;

/** */
enum KEY_Sinh_ha = 16780740;

/** */
enum KEY_Sinh_i = 16780681;

/** */
enum KEY_Sinh_i2 = 16780754;

/** */
enum KEY_Sinh_ii = 16780682;

/** */
enum KEY_Sinh_ii2 = 16780755;

/** */
enum KEY_Sinh_ja = 16780706;

/** */
enum KEY_Sinh_jha = 16780707;

/** */
enum KEY_Sinh_jnya = 16780709;

/** */
enum KEY_Sinh_ka = 16780698;

/** */
enum KEY_Sinh_kha = 16780699;

/** */
enum KEY_Sinh_kunddaliya = 16780788;

/** */
enum KEY_Sinh_la = 16780733;

/** */
enum KEY_Sinh_lla = 16780741;

/** */
enum KEY_Sinh_lu = 16780687;

/** */
enum KEY_Sinh_lu2 = 16780767;

/** */
enum KEY_Sinh_luu = 16780688;

/** */
enum KEY_Sinh_luu2 = 16780787;

/** */
enum KEY_Sinh_ma = 16780728;

/** */
enum KEY_Sinh_mba = 16780729;

/** */
enum KEY_Sinh_na = 16780721;

/** */
enum KEY_Sinh_ndda = 16780716;

/** */
enum KEY_Sinh_ndha = 16780723;

/** */
enum KEY_Sinh_ng = 16780674;

/** */
enum KEY_Sinh_ng2 = 16780702;

/** */
enum KEY_Sinh_nga = 16780703;

/** */
enum KEY_Sinh_nja = 16780710;

/** */
enum KEY_Sinh_nna = 16780715;

/** */
enum KEY_Sinh_nya = 16780708;

/** */
enum KEY_Sinh_o = 16780692;

/** */
enum KEY_Sinh_o2 = 16780764;

/** */
enum KEY_Sinh_oo = 16780693;

/** */
enum KEY_Sinh_oo2 = 16780765;

/** */
enum KEY_Sinh_pa = 16780724;

/** */
enum KEY_Sinh_pha = 16780725;

/** */
enum KEY_Sinh_ra = 16780731;

/** */
enum KEY_Sinh_ri = 16780685;

/** */
enum KEY_Sinh_rii = 16780686;

/** */
enum KEY_Sinh_ru2 = 16780760;

/** */
enum KEY_Sinh_ruu2 = 16780786;

/** */
enum KEY_Sinh_sa = 16780739;

/** */
enum KEY_Sinh_sha = 16780737;

/** */
enum KEY_Sinh_ssha = 16780738;

/** */
enum KEY_Sinh_tha = 16780717;

/** */
enum KEY_Sinh_thha = 16780718;

/** */
enum KEY_Sinh_tta = 16780711;

/** */
enum KEY_Sinh_ttha = 16780712;

/** */
enum KEY_Sinh_u = 16780683;

/** */
enum KEY_Sinh_u2 = 16780756;

/** */
enum KEY_Sinh_uu = 16780684;

/** */
enum KEY_Sinh_uu2 = 16780758;

/** */
enum KEY_Sinh_va = 16780736;

/** */
enum KEY_Sinh_ya = 16780730;

/** */
enum KEY_Sleep = 269025071;

/** */
enum KEY_SlowKeys_Enable = 65139;

/** */
enum KEY_Spell = 269025148;

/** */
enum KEY_SplitScreen = 269025149;

/** */
enum KEY_Standby = 269025040;

/** */
enum KEY_Start = 269025050;

/** */
enum KEY_StickyKeys_Enable = 65141;

/** */
enum KEY_Stop = 269025064;

/** */
enum KEY_Subtitle = 269025178;

/** */
enum KEY_Super_L = 65515;

/** */
enum KEY_Super_R = 65516;

/** */
enum KEY_Support = 269025150;

/** */
enum KEY_Suspend = 269025191;

/** */
enum KEY_Switch_VT_1 = 269024769;

/** */
enum KEY_Switch_VT_10 = 269024778;

/** */
enum KEY_Switch_VT_11 = 269024779;

/** */
enum KEY_Switch_VT_12 = 269024780;

/** */
enum KEY_Switch_VT_2 = 269024770;

/** */
enum KEY_Switch_VT_3 = 269024771;

/** */
enum KEY_Switch_VT_4 = 269024772;

/** */
enum KEY_Switch_VT_5 = 269024773;

/** */
enum KEY_Switch_VT_6 = 269024774;

/** */
enum KEY_Switch_VT_7 = 269024775;

/** */
enum KEY_Switch_VT_8 = 269024776;

/** */
enum KEY_Switch_VT_9 = 269024777;

/** */
enum KEY_Sys_Req = 65301;

/** */
enum KEY_T = 84;

/** */
enum KEY_THORN = 222;

/** */
enum KEY_Tab = 65289;

/** */
enum KEY_Tabovedot = 16785002;

/** */
enum KEY_TaskPane = 269025151;

/** */
enum KEY_Tcaron = 427;

/** */
enum KEY_Tcedilla = 478;

/** */
enum KEY_Terminal = 269025152;

/** */
enum KEY_Terminate_Server = 65237;

/** */
enum KEY_Thai_baht = 3551;

/** */
enum KEY_Thai_bobaimai = 3514;

/** */
enum KEY_Thai_chochan = 3496;

/** */
enum KEY_Thai_chochang = 3498;

/** */
enum KEY_Thai_choching = 3497;

/** */
enum KEY_Thai_chochoe = 3500;

/** */
enum KEY_Thai_dochada = 3502;

/** */
enum KEY_Thai_dodek = 3508;

/** */
enum KEY_Thai_fofa = 3517;

/** */
enum KEY_Thai_fofan = 3519;

/** */
enum KEY_Thai_hohip = 3531;

/** */
enum KEY_Thai_honokhuk = 3534;

/** */
enum KEY_Thai_khokhai = 3490;

/** */
enum KEY_Thai_khokhon = 3493;

/** */
enum KEY_Thai_khokhuat = 3491;

/** */
enum KEY_Thai_khokhwai = 3492;

/** */
enum KEY_Thai_khorakhang = 3494;

/** */
enum KEY_Thai_kokai = 3489;

/** */
enum KEY_Thai_lakkhangyao = 3557;

/** */
enum KEY_Thai_lekchet = 3575;

/** */
enum KEY_Thai_lekha = 3573;

/** */
enum KEY_Thai_lekhok = 3574;

/** */
enum KEY_Thai_lekkao = 3577;

/** */
enum KEY_Thai_leknung = 3569;

/** */
enum KEY_Thai_lekpaet = 3576;

/** */
enum KEY_Thai_leksam = 3571;

/** */
enum KEY_Thai_leksi = 3572;

/** */
enum KEY_Thai_leksong = 3570;

/** */
enum KEY_Thai_leksun = 3568;

/** */
enum KEY_Thai_lochula = 3532;

/** */
enum KEY_Thai_loling = 3525;

/** */
enum KEY_Thai_lu = 3526;

/** */
enum KEY_Thai_maichattawa = 3563;

/** */
enum KEY_Thai_maiek = 3560;

/** */
enum KEY_Thai_maihanakat = 3537;

/** */
enum KEY_Thai_maihanakat_maitho = 3550;

/** */
enum KEY_Thai_maitaikhu = 3559;

/** */
enum KEY_Thai_maitho = 3561;

/** */
enum KEY_Thai_maitri = 3562;

/** */
enum KEY_Thai_maiyamok = 3558;

/** */
enum KEY_Thai_moma = 3521;

/** */
enum KEY_Thai_ngongu = 3495;

/** */
enum KEY_Thai_nikhahit = 3565;

/** */
enum KEY_Thai_nonen = 3507;

/** */
enum KEY_Thai_nonu = 3513;

/** */
enum KEY_Thai_oang = 3533;

/** */
enum KEY_Thai_paiyannoi = 3535;

/** */
enum KEY_Thai_phinthu = 3546;

/** */
enum KEY_Thai_phophan = 3518;

/** */
enum KEY_Thai_phophung = 3516;

/** */
enum KEY_Thai_phosamphao = 3520;

/** */
enum KEY_Thai_popla = 3515;

/** */
enum KEY_Thai_rorua = 3523;

/** */
enum KEY_Thai_ru = 3524;

/** */
enum KEY_Thai_saraa = 3536;

/** */
enum KEY_Thai_saraaa = 3538;

/** */
enum KEY_Thai_saraae = 3553;

/** */
enum KEY_Thai_saraaimaimalai = 3556;

/** */
enum KEY_Thai_saraaimaimuan = 3555;

/** */
enum KEY_Thai_saraam = 3539;

/** */
enum KEY_Thai_sarae = 3552;

/** */
enum KEY_Thai_sarai = 3540;

/** */
enum KEY_Thai_saraii = 3541;

/** */
enum KEY_Thai_sarao = 3554;

/** */
enum KEY_Thai_sarau = 3544;

/** */
enum KEY_Thai_saraue = 3542;

/** */
enum KEY_Thai_sarauee = 3543;

/** */
enum KEY_Thai_sarauu = 3545;

/** */
enum KEY_Thai_sorusi = 3529;

/** */
enum KEY_Thai_sosala = 3528;

/** */
enum KEY_Thai_soso = 3499;

/** */
enum KEY_Thai_sosua = 3530;

/** */
enum KEY_Thai_thanthakhat = 3564;

/** */
enum KEY_Thai_thonangmontho = 3505;

/** */
enum KEY_Thai_thophuthao = 3506;

/** */
enum KEY_Thai_thothahan = 3511;

/** */
enum KEY_Thai_thothan = 3504;

/** */
enum KEY_Thai_thothong = 3512;

/** */
enum KEY_Thai_thothung = 3510;

/** */
enum KEY_Thai_topatak = 3503;

/** */
enum KEY_Thai_totao = 3509;

/** */
enum KEY_Thai_wowaen = 3527;

/** */
enum KEY_Thai_yoyak = 3522;

/** */
enum KEY_Thai_yoying = 3501;

/** */
enum KEY_Thorn = 222;

/** */
enum KEY_Time = 269025183;

/** */
enum KEY_ToDoList = 269025055;

/** */
enum KEY_Tools = 269025153;

/** */
enum KEY_TopMenu = 269025186;

/** */
enum KEY_TouchpadOff = 269025201;

/** */
enum KEY_TouchpadOn = 269025200;

/** */
enum KEY_TouchpadToggle = 269025193;

/** */
enum KEY_Touroku = 65323;

/** */
enum KEY_Travel = 269025154;

/** */
enum KEY_Tslash = 940;

/** */
enum KEY_U = 85;

/** */
enum KEY_UWB = 269025174;

/** */
enum KEY_Uacute = 218;

/** */
enum KEY_Ubelowdot = 16785124;

/** */
enum KEY_Ubreve = 733;

/** */
enum KEY_Ucircumflex = 219;

/** */
enum KEY_Udiaeresis = 220;

/** */
enum KEY_Udoubleacute = 475;

/** */
enum KEY_Ugrave = 217;

/** */
enum KEY_Uhook = 16785126;

/** */
enum KEY_Uhorn = 16777647;

/** */
enum KEY_Uhornacute = 16785128;

/** */
enum KEY_Uhornbelowdot = 16785136;

/** */
enum KEY_Uhorngrave = 16785130;

/** */
enum KEY_Uhornhook = 16785132;

/** */
enum KEY_Uhorntilde = 16785134;

/** */
enum KEY_Ukrainian_GHE_WITH_UPTURN = 1725;

/** */
enum KEY_Ukrainian_I = 1718;

/** */
enum KEY_Ukrainian_IE = 1716;

/** */
enum KEY_Ukrainian_YI = 1719;

/** */
enum KEY_Ukrainian_ghe_with_upturn = 1709;

/** */
enum KEY_Ukrainian_i = 1702;

/** */
enum KEY_Ukrainian_ie = 1700;

/** */
enum KEY_Ukrainian_yi = 1703;

/** */
enum KEY_Ukranian_I = 1718;

/** */
enum KEY_Ukranian_JE = 1716;

/** */
enum KEY_Ukranian_YI = 1719;

/** */
enum KEY_Ukranian_i = 1702;

/** */
enum KEY_Ukranian_je = 1700;

/** */
enum KEY_Ukranian_yi = 1703;

/** */
enum KEY_Umacron = 990;

/** */
enum KEY_Undo = 65381;

/** */
enum KEY_Ungrab = 269024800;

/** */
enum KEY_Uogonek = 985;

/** */
enum KEY_Up = 65362;

/** */
enum KEY_Uring = 473;

/** */
enum KEY_User1KB = 269025157;

/** */
enum KEY_User2KB = 269025158;

/** */
enum KEY_UserPB = 269025156;

/** */
enum KEY_Utilde = 989;

/** */
enum KEY_V = 86;

/** */
enum KEY_VendorHome = 269025076;

/** */
enum KEY_Video = 269025159;

/** */
enum KEY_View = 269025185;

/** */
enum KEY_VoidSymbol = 16777215;

/** */
enum KEY_W = 87;

/** */
enum KEY_WLAN = 269025173;

/** */
enum KEY_WWAN = 269025204;

/** */
enum KEY_WWW = 269025070;

/** */
enum KEY_Wacute = 16785026;

/** */
enum KEY_WakeUp = 269025067;

/** */
enum KEY_Wcircumflex = 16777588;

/** */
enum KEY_Wdiaeresis = 16785028;

/** */
enum KEY_WebCam = 269025167;

/** */
enum KEY_Wgrave = 16785024;

/** */
enum KEY_WheelButton = 269025160;

/** */
enum KEY_WindowClear = 269025109;

/** */
enum KEY_WonSign = 16785577;

/** */
enum KEY_Word = 269025161;

/** */
enum KEY_X = 88;

/** */
enum KEY_Xabovedot = 16785034;

/** */
enum KEY_Xfer = 269025162;

/** */
enum KEY_Y = 89;

/** */
enum KEY_Yacute = 221;

/** */
enum KEY_Ybelowdot = 16785140;

/** */
enum KEY_Ycircumflex = 16777590;

/** */
enum KEY_Ydiaeresis = 5054;

/** */
enum KEY_Yellow = 269025189;

/** */
enum KEY_Ygrave = 16785138;

/** */
enum KEY_Yhook = 16785142;

/** */
enum KEY_Ytilde = 16785144;

/** */
enum KEY_Z = 90;

/** */
enum KEY_Zabovedot = 431;

/** */
enum KEY_Zacute = 428;

/** */
enum KEY_Zcaron = 430;

/** */
enum KEY_Zen_Koho = 65341;

/** */
enum KEY_Zenkaku = 65320;

/** */
enum KEY_Zenkaku_Hankaku = 65322;

/** */
enum KEY_ZoomIn = 269025163;

/** */
enum KEY_ZoomOut = 269025164;

/** */
enum KEY_Zstroke = 16777653;

/** */
enum KEY_a = 97;

/** */
enum KEY_aacute = 225;

/** */
enum KEY_abelowdot = 16785057;

/** */
enum KEY_abovedot = 511;

/** */
enum KEY_abreve = 483;

/** */
enum KEY_abreveacute = 16785071;

/** */
enum KEY_abrevebelowdot = 16785079;

/** */
enum KEY_abrevegrave = 16785073;

/** */
enum KEY_abrevehook = 16785075;

/** */
enum KEY_abrevetilde = 16785077;

/** */
enum KEY_acircumflex = 226;

/** */
enum KEY_acircumflexacute = 16785061;

/** */
enum KEY_acircumflexbelowdot = 16785069;

/** */
enum KEY_acircumflexgrave = 16785063;

/** */
enum KEY_acircumflexhook = 16785065;

/** */
enum KEY_acircumflextilde = 16785067;

/** */
enum KEY_acute = 180;

/** */
enum KEY_adiaeresis = 228;

/** */
enum KEY_ae = 230;

/** */
enum KEY_agrave = 224;

/** */
enum KEY_ahook = 16785059;

/** */
enum KEY_amacron = 992;

/** */
enum KEY_ampersand = 38;

/** */
enum KEY_aogonek = 433;

/** */
enum KEY_apostrophe = 39;

/** */
enum KEY_approxeq = 16785992;

/** */
enum KEY_approximate = 2248;

/** */
enum KEY_aring = 229;

/** */
enum KEY_asciicircum = 94;

/** */
enum KEY_asciitilde = 126;

/** */
enum KEY_asterisk = 42;

/** */
enum KEY_at = 64;

/** */
enum KEY_atilde = 227;

/** */
enum KEY_b = 98;

/** */
enum KEY_babovedot = 16784899;

/** */
enum KEY_backslash = 92;

/** */
enum KEY_ballotcross = 2804;

/** */
enum KEY_bar = 124;

/** */
enum KEY_because = 16785973;

/** */
enum KEY_blank = 2527;

/** */
enum KEY_botintegral = 2213;

/** */
enum KEY_botleftparens = 2220;

/** */
enum KEY_botleftsqbracket = 2216;

/** */
enum KEY_botleftsummation = 2226;

/** */
enum KEY_botrightparens = 2222;

/** */
enum KEY_botrightsqbracket = 2218;

/** */
enum KEY_botrightsummation = 2230;

/** */
enum KEY_bott = 2550;

/** */
enum KEY_botvertsummationconnector = 2228;

/** */
enum KEY_braceleft = 123;

/** */
enum KEY_braceright = 125;

/** */
enum KEY_bracketleft = 91;

/** */
enum KEY_bracketright = 93;

/** */
enum KEY_braille_blank = 16787456;

/** */
enum KEY_braille_dot_1 = 65521;

/** */
enum KEY_braille_dot_10 = 65530;

/** */
enum KEY_braille_dot_2 = 65522;

/** */
enum KEY_braille_dot_3 = 65523;

/** */
enum KEY_braille_dot_4 = 65524;

/** */
enum KEY_braille_dot_5 = 65525;

/** */
enum KEY_braille_dot_6 = 65526;

/** */
enum KEY_braille_dot_7 = 65527;

/** */
enum KEY_braille_dot_8 = 65528;

/** */
enum KEY_braille_dot_9 = 65529;

/** */
enum KEY_braille_dots_1 = 16787457;

/** */
enum KEY_braille_dots_12 = 16787459;

/** */
enum KEY_braille_dots_123 = 16787463;

/** */
enum KEY_braille_dots_1234 = 16787471;

/** */
enum KEY_braille_dots_12345 = 16787487;

/** */
enum KEY_braille_dots_123456 = 16787519;

/** */
enum KEY_braille_dots_1234567 = 16787583;

/** */
enum KEY_braille_dots_12345678 = 16787711;

/** */
enum KEY_braille_dots_1234568 = 16787647;

/** */
enum KEY_braille_dots_123457 = 16787551;

/** */
enum KEY_braille_dots_1234578 = 16787679;

/** */
enum KEY_braille_dots_123458 = 16787615;

/** */
enum KEY_braille_dots_12346 = 16787503;

/** */
enum KEY_braille_dots_123467 = 16787567;

/** */
enum KEY_braille_dots_1234678 = 16787695;

/** */
enum KEY_braille_dots_123468 = 16787631;

/** */
enum KEY_braille_dots_12347 = 16787535;

/** */
enum KEY_braille_dots_123478 = 16787663;

/** */
enum KEY_braille_dots_12348 = 16787599;

/** */
enum KEY_braille_dots_1235 = 16787479;

/** */
enum KEY_braille_dots_12356 = 16787511;

/** */
enum KEY_braille_dots_123567 = 16787575;

/** */
enum KEY_braille_dots_1235678 = 16787703;

/** */
enum KEY_braille_dots_123568 = 16787639;

/** */
enum KEY_braille_dots_12357 = 16787543;

/** */
enum KEY_braille_dots_123578 = 16787671;

/** */
enum KEY_braille_dots_12358 = 16787607;

/** */
enum KEY_braille_dots_1236 = 16787495;

/** */
enum KEY_braille_dots_12367 = 16787559;

/** */
enum KEY_braille_dots_123678 = 16787687;

/** */
enum KEY_braille_dots_12368 = 16787623;

/** */
enum KEY_braille_dots_1237 = 16787527;

/** */
enum KEY_braille_dots_12378 = 16787655;

/** */
enum KEY_braille_dots_1238 = 16787591;

/** */
enum KEY_braille_dots_124 = 16787467;

/** */
enum KEY_braille_dots_1245 = 16787483;

/** */
enum KEY_braille_dots_12456 = 16787515;

/** */
enum KEY_braille_dots_124567 = 16787579;

/** */
enum KEY_braille_dots_1245678 = 16787707;

/** */
enum KEY_braille_dots_124568 = 16787643;

/** */
enum KEY_braille_dots_12457 = 16787547;

/** */
enum KEY_braille_dots_124578 = 16787675;

/** */
enum KEY_braille_dots_12458 = 16787611;

/** */
enum KEY_braille_dots_1246 = 16787499;

/** */
enum KEY_braille_dots_12467 = 16787563;

/** */
enum KEY_braille_dots_124678 = 16787691;

/** */
enum KEY_braille_dots_12468 = 16787627;

/** */
enum KEY_braille_dots_1247 = 16787531;

/** */
enum KEY_braille_dots_12478 = 16787659;

/** */
enum KEY_braille_dots_1248 = 16787595;

/** */
enum KEY_braille_dots_125 = 16787475;

/** */
enum KEY_braille_dots_1256 = 16787507;

/** */
enum KEY_braille_dots_12567 = 16787571;

/** */
enum KEY_braille_dots_125678 = 16787699;

/** */
enum KEY_braille_dots_12568 = 16787635;

/** */
enum KEY_braille_dots_1257 = 16787539;

/** */
enum KEY_braille_dots_12578 = 16787667;

/** */
enum KEY_braille_dots_1258 = 16787603;

/** */
enum KEY_braille_dots_126 = 16787491;

/** */
enum KEY_braille_dots_1267 = 16787555;

/** */
enum KEY_braille_dots_12678 = 16787683;

/** */
enum KEY_braille_dots_1268 = 16787619;

/** */
enum KEY_braille_dots_127 = 16787523;

/** */
enum KEY_braille_dots_1278 = 16787651;

/** */
enum KEY_braille_dots_128 = 16787587;

/** */
enum KEY_braille_dots_13 = 16787461;

/** */
enum KEY_braille_dots_134 = 16787469;

/** */
enum KEY_braille_dots_1345 = 16787485;

/** */
enum KEY_braille_dots_13456 = 16787517;

/** */
enum KEY_braille_dots_134567 = 16787581;

/** */
enum KEY_braille_dots_1345678 = 16787709;

/** */
enum KEY_braille_dots_134568 = 16787645;

/** */
enum KEY_braille_dots_13457 = 16787549;

/** */
enum KEY_braille_dots_134578 = 16787677;

/** */
enum KEY_braille_dots_13458 = 16787613;

/** */
enum KEY_braille_dots_1346 = 16787501;

/** */
enum KEY_braille_dots_13467 = 16787565;

/** */
enum KEY_braille_dots_134678 = 16787693;

/** */
enum KEY_braille_dots_13468 = 16787629;

/** */
enum KEY_braille_dots_1347 = 16787533;

/** */
enum KEY_braille_dots_13478 = 16787661;

/** */
enum KEY_braille_dots_1348 = 16787597;

/** */
enum KEY_braille_dots_135 = 16787477;

/** */
enum KEY_braille_dots_1356 = 16787509;

/** */
enum KEY_braille_dots_13567 = 16787573;

/** */
enum KEY_braille_dots_135678 = 16787701;

/** */
enum KEY_braille_dots_13568 = 16787637;

/** */
enum KEY_braille_dots_1357 = 16787541;

/** */
enum KEY_braille_dots_13578 = 16787669;

/** */
enum KEY_braille_dots_1358 = 16787605;

/** */
enum KEY_braille_dots_136 = 16787493;

/** */
enum KEY_braille_dots_1367 = 16787557;

/** */
enum KEY_braille_dots_13678 = 16787685;

/** */
enum KEY_braille_dots_1368 = 16787621;

/** */
enum KEY_braille_dots_137 = 16787525;

/** */
enum KEY_braille_dots_1378 = 16787653;

/** */
enum KEY_braille_dots_138 = 16787589;

/** */
enum KEY_braille_dots_14 = 16787465;

/** */
enum KEY_braille_dots_145 = 16787481;

/** */
enum KEY_braille_dots_1456 = 16787513;

/** */
enum KEY_braille_dots_14567 = 16787577;

/** */
enum KEY_braille_dots_145678 = 16787705;

/** */
enum KEY_braille_dots_14568 = 16787641;

/** */
enum KEY_braille_dots_1457 = 16787545;

/** */
enum KEY_braille_dots_14578 = 16787673;

/** */
enum KEY_braille_dots_1458 = 16787609;

/** */
enum KEY_braille_dots_146 = 16787497;

/** */
enum KEY_braille_dots_1467 = 16787561;

/** */
enum KEY_braille_dots_14678 = 16787689;

/** */
enum KEY_braille_dots_1468 = 16787625;

/** */
enum KEY_braille_dots_147 = 16787529;

/** */
enum KEY_braille_dots_1478 = 16787657;

/** */
enum KEY_braille_dots_148 = 16787593;

/** */
enum KEY_braille_dots_15 = 16787473;

/** */
enum KEY_braille_dots_156 = 16787505;

/** */
enum KEY_braille_dots_1567 = 16787569;

/** */
enum KEY_braille_dots_15678 = 16787697;

/** */
enum KEY_braille_dots_1568 = 16787633;

/** */
enum KEY_braille_dots_157 = 16787537;

/** */
enum KEY_braille_dots_1578 = 16787665;

/** */
enum KEY_braille_dots_158 = 16787601;

/** */
enum KEY_braille_dots_16 = 16787489;

/** */
enum KEY_braille_dots_167 = 16787553;

/** */
enum KEY_braille_dots_1678 = 16787681;

/** */
enum KEY_braille_dots_168 = 16787617;

/** */
enum KEY_braille_dots_17 = 16787521;

/** */
enum KEY_braille_dots_178 = 16787649;

/** */
enum KEY_braille_dots_18 = 16787585;

/** */
enum KEY_braille_dots_2 = 16787458;

/** */
enum KEY_braille_dots_23 = 16787462;

/** */
enum KEY_braille_dots_234 = 16787470;

/** */
enum KEY_braille_dots_2345 = 16787486;

/** */
enum KEY_braille_dots_23456 = 16787518;

/** */
enum KEY_braille_dots_234567 = 16787582;

/** */
enum KEY_braille_dots_2345678 = 16787710;

/** */
enum KEY_braille_dots_234568 = 16787646;

/** */
enum KEY_braille_dots_23457 = 16787550;

/** */
enum KEY_braille_dots_234578 = 16787678;

/** */
enum KEY_braille_dots_23458 = 16787614;

/** */
enum KEY_braille_dots_2346 = 16787502;

/** */
enum KEY_braille_dots_23467 = 16787566;

/** */
enum KEY_braille_dots_234678 = 16787694;

/** */
enum KEY_braille_dots_23468 = 16787630;

/** */
enum KEY_braille_dots_2347 = 16787534;

/** */
enum KEY_braille_dots_23478 = 16787662;

/** */
enum KEY_braille_dots_2348 = 16787598;

/** */
enum KEY_braille_dots_235 = 16787478;

/** */
enum KEY_braille_dots_2356 = 16787510;

/** */
enum KEY_braille_dots_23567 = 16787574;

/** */
enum KEY_braille_dots_235678 = 16787702;

/** */
enum KEY_braille_dots_23568 = 16787638;

/** */
enum KEY_braille_dots_2357 = 16787542;

/** */
enum KEY_braille_dots_23578 = 16787670;

/** */
enum KEY_braille_dots_2358 = 16787606;

/** */
enum KEY_braille_dots_236 = 16787494;

/** */
enum KEY_braille_dots_2367 = 16787558;

/** */
enum KEY_braille_dots_23678 = 16787686;

/** */
enum KEY_braille_dots_2368 = 16787622;

/** */
enum KEY_braille_dots_237 = 16787526;

/** */
enum KEY_braille_dots_2378 = 16787654;

/** */
enum KEY_braille_dots_238 = 16787590;

/** */
enum KEY_braille_dots_24 = 16787466;

/** */
enum KEY_braille_dots_245 = 16787482;

/** */
enum KEY_braille_dots_2456 = 16787514;

/** */
enum KEY_braille_dots_24567 = 16787578;

/** */
enum KEY_braille_dots_245678 = 16787706;

/** */
enum KEY_braille_dots_24568 = 16787642;

/** */
enum KEY_braille_dots_2457 = 16787546;

/** */
enum KEY_braille_dots_24578 = 16787674;

/** */
enum KEY_braille_dots_2458 = 16787610;

/** */
enum KEY_braille_dots_246 = 16787498;

/** */
enum KEY_braille_dots_2467 = 16787562;

/** */
enum KEY_braille_dots_24678 = 16787690;

/** */
enum KEY_braille_dots_2468 = 16787626;

/** */
enum KEY_braille_dots_247 = 16787530;

/** */
enum KEY_braille_dots_2478 = 16787658;

/** */
enum KEY_braille_dots_248 = 16787594;

/** */
enum KEY_braille_dots_25 = 16787474;

/** */
enum KEY_braille_dots_256 = 16787506;

/** */
enum KEY_braille_dots_2567 = 16787570;

/** */
enum KEY_braille_dots_25678 = 16787698;

/** */
enum KEY_braille_dots_2568 = 16787634;

/** */
enum KEY_braille_dots_257 = 16787538;

/** */
enum KEY_braille_dots_2578 = 16787666;

/** */
enum KEY_braille_dots_258 = 16787602;

/** */
enum KEY_braille_dots_26 = 16787490;

/** */
enum KEY_braille_dots_267 = 16787554;

/** */
enum KEY_braille_dots_2678 = 16787682;

/** */
enum KEY_braille_dots_268 = 16787618;

/** */
enum KEY_braille_dots_27 = 16787522;

/** */
enum KEY_braille_dots_278 = 16787650;

/** */
enum KEY_braille_dots_28 = 16787586;

/** */
enum KEY_braille_dots_3 = 16787460;

/** */
enum KEY_braille_dots_34 = 16787468;

/** */
enum KEY_braille_dots_345 = 16787484;

/** */
enum KEY_braille_dots_3456 = 16787516;

/** */
enum KEY_braille_dots_34567 = 16787580;

/** */
enum KEY_braille_dots_345678 = 16787708;

/** */
enum KEY_braille_dots_34568 = 16787644;

/** */
enum KEY_braille_dots_3457 = 16787548;

/** */
enum KEY_braille_dots_34578 = 16787676;

/** */
enum KEY_braille_dots_3458 = 16787612;

/** */
enum KEY_braille_dots_346 = 16787500;

/** */
enum KEY_braille_dots_3467 = 16787564;

/** */
enum KEY_braille_dots_34678 = 16787692;

/** */
enum KEY_braille_dots_3468 = 16787628;

/** */
enum KEY_braille_dots_347 = 16787532;

/** */
enum KEY_braille_dots_3478 = 16787660;

/** */
enum KEY_braille_dots_348 = 16787596;

/** */
enum KEY_braille_dots_35 = 16787476;

/** */
enum KEY_braille_dots_356 = 16787508;

/** */
enum KEY_braille_dots_3567 = 16787572;

/** */
enum KEY_braille_dots_35678 = 16787700;

/** */
enum KEY_braille_dots_3568 = 16787636;

/** */
enum KEY_braille_dots_357 = 16787540;

/** */
enum KEY_braille_dots_3578 = 16787668;

/** */
enum KEY_braille_dots_358 = 16787604;

/** */
enum KEY_braille_dots_36 = 16787492;

/** */
enum KEY_braille_dots_367 = 16787556;

/** */
enum KEY_braille_dots_3678 = 16787684;

/** */
enum KEY_braille_dots_368 = 16787620;

/** */
enum KEY_braille_dots_37 = 16787524;

/** */
enum KEY_braille_dots_378 = 16787652;

/** */
enum KEY_braille_dots_38 = 16787588;

/** */
enum KEY_braille_dots_4 = 16787464;

/** */
enum KEY_braille_dots_45 = 16787480;

/** */
enum KEY_braille_dots_456 = 16787512;

/** */
enum KEY_braille_dots_4567 = 16787576;

/** */
enum KEY_braille_dots_45678 = 16787704;

/** */
enum KEY_braille_dots_4568 = 16787640;

/** */
enum KEY_braille_dots_457 = 16787544;

/** */
enum KEY_braille_dots_4578 = 16787672;

/** */
enum KEY_braille_dots_458 = 16787608;

/** */
enum KEY_braille_dots_46 = 16787496;

/** */
enum KEY_braille_dots_467 = 16787560;

/** */
enum KEY_braille_dots_4678 = 16787688;

/** */
enum KEY_braille_dots_468 = 16787624;

/** */
enum KEY_braille_dots_47 = 16787528;

/** */
enum KEY_braille_dots_478 = 16787656;

/** */
enum KEY_braille_dots_48 = 16787592;

/** */
enum KEY_braille_dots_5 = 16787472;

/** */
enum KEY_braille_dots_56 = 16787504;

/** */
enum KEY_braille_dots_567 = 16787568;

/** */
enum KEY_braille_dots_5678 = 16787696;

/** */
enum KEY_braille_dots_568 = 16787632;

/** */
enum KEY_braille_dots_57 = 16787536;

/** */
enum KEY_braille_dots_578 = 16787664;

/** */
enum KEY_braille_dots_58 = 16787600;

/** */
enum KEY_braille_dots_6 = 16787488;

/** */
enum KEY_braille_dots_67 = 16787552;

/** */
enum KEY_braille_dots_678 = 16787680;

/** */
enum KEY_braille_dots_68 = 16787616;

/** */
enum KEY_braille_dots_7 = 16787520;

/** */
enum KEY_braille_dots_78 = 16787648;

/** */
enum KEY_braille_dots_8 = 16787584;

/** */
enum KEY_breve = 418;

/** */
enum KEY_brokenbar = 166;

/** */
enum KEY_c = 99;

/** */
enum KEY_c_h = 65187;

/** */
enum KEY_cabovedot = 741;

/** */
enum KEY_cacute = 486;

/** */
enum KEY_careof = 2744;

/** */
enum KEY_caret = 2812;

/** */
enum KEY_caron = 439;

/** */
enum KEY_ccaron = 488;

/** */
enum KEY_ccedilla = 231;

/** */
enum KEY_ccircumflex = 742;

/** */
enum KEY_cedilla = 184;

/** */
enum KEY_cent = 162;

/** */
enum KEY_ch = 65184;

/** */
enum KEY_checkerboard = 2529;

/** */
enum KEY_checkmark = 2803;

/** */
enum KEY_circle = 3023;

/** */
enum KEY_club = 2796;

/** */
enum KEY_colon = 58;

/** */
enum KEY_comma = 44;

/** */
enum KEY_containsas = 16785931;

/** */
enum KEY_copyright = 169;

/** */
enum KEY_cr = 2532;

/** */
enum KEY_crossinglines = 2542;

/** */
enum KEY_cuberoot = 16785947;

/** */
enum KEY_currency = 164;

/** */
enum KEY_cursor = 2815;

/** */
enum KEY_d = 100;

/** */
enum KEY_dabovedot = 16784907;

/** */
enum KEY_dagger = 2801;

/** */
enum KEY_dcaron = 495;

/** */
enum KEY_dead_A = 65153;

/** */
enum KEY_dead_E = 65155;

/** */
enum KEY_dead_I = 65157;

/** */
enum KEY_dead_O = 65159;

/** */
enum KEY_dead_U = 65161;

/** */
enum KEY_dead_a = 65152;

/** */
enum KEY_dead_abovecomma = 65124;

/** */
enum KEY_dead_abovedot = 65110;

/** */
enum KEY_dead_abovereversedcomma = 65125;

/** */
enum KEY_dead_abovering = 65112;

/** */
enum KEY_dead_aboveverticalline = 65169;

/** */
enum KEY_dead_acute = 65105;

/** */
enum KEY_dead_belowbreve = 65131;

/** */
enum KEY_dead_belowcircumflex = 65129;

/** */
enum KEY_dead_belowcomma = 65134;

/** */
enum KEY_dead_belowdiaeresis = 65132;

/** */
enum KEY_dead_belowdot = 65120;

/** */
enum KEY_dead_belowmacron = 65128;

/** */
enum KEY_dead_belowring = 65127;

/** */
enum KEY_dead_belowtilde = 65130;

/** */
enum KEY_dead_belowverticalline = 65170;

/** */
enum KEY_dead_breve = 65109;

/** */
enum KEY_dead_capital_schwa = 65163;

/** */
enum KEY_dead_caron = 65114;

/** */
enum KEY_dead_cedilla = 65115;

/** */
enum KEY_dead_circumflex = 65106;

/** */
enum KEY_dead_currency = 65135;

/** */
enum KEY_dead_dasia = 65125;

/** */
enum KEY_dead_diaeresis = 65111;

/** */
enum KEY_dead_doubleacute = 65113;

/** */
enum KEY_dead_doublegrave = 65126;

/** */
enum KEY_dead_e = 65154;

/** */
enum KEY_dead_grave = 65104;

/** */
enum KEY_dead_greek = 65164;

/** */
enum KEY_dead_hook = 65121;

/** */
enum KEY_dead_horn = 65122;

/** */
enum KEY_dead_i = 65156;

/** */
enum KEY_dead_invertedbreve = 65133;

/** */
enum KEY_dead_iota = 65117;

/** */
enum KEY_dead_longsolidusoverlay = 65171;

/** */
enum KEY_dead_lowline = 65168;

/** */
enum KEY_dead_macron = 65108;

/** */
enum KEY_dead_o = 65158;

/** */
enum KEY_dead_ogonek = 65116;

/** */
enum KEY_dead_perispomeni = 65107;

/** */
enum KEY_dead_psili = 65124;

/** */
enum KEY_dead_semivoiced_sound = 65119;

/** */
enum KEY_dead_small_schwa = 65162;

/** */
enum KEY_dead_stroke = 65123;

/** */
enum KEY_dead_tilde = 65107;

/** */
enum KEY_dead_u = 65160;

/** */
enum KEY_dead_voiced_sound = 65118;

/** */
enum KEY_decimalpoint = 2749;

/** */
enum KEY_degree = 176;

/** */
enum KEY_diaeresis = 168;

/** */
enum KEY_diamond = 2797;

/** */
enum KEY_digitspace = 2725;

/** */
enum KEY_dintegral = 16785964;

/** */
enum KEY_division = 247;

/** */
enum KEY_dollar = 36;

/** */
enum KEY_doubbaselinedot = 2735;

/** */
enum KEY_doubleacute = 445;

/** */
enum KEY_doubledagger = 2802;

/** */
enum KEY_doublelowquotemark = 2814;

/** */
enum KEY_downarrow = 2302;

/** */
enum KEY_downcaret = 2984;

/** */
enum KEY_downshoe = 3030;

/** */
enum KEY_downstile = 3012;

/** */
enum KEY_downtack = 3010;

/** */
enum KEY_dstroke = 496;

/** */
enum KEY_e = 101;

/** */
enum KEY_eabovedot = 1004;

/** */
enum KEY_eacute = 233;

/** */
enum KEY_ebelowdot = 16785081;

/** */
enum KEY_ecaron = 492;

/** */
enum KEY_ecircumflex = 234;

/** */
enum KEY_ecircumflexacute = 16785087;

/** */
enum KEY_ecircumflexbelowdot = 16785095;

/** */
enum KEY_ecircumflexgrave = 16785089;

/** */
enum KEY_ecircumflexhook = 16785091;

/** */
enum KEY_ecircumflextilde = 16785093;

/** */
enum KEY_ediaeresis = 235;

/** */
enum KEY_egrave = 232;

/** */
enum KEY_ehook = 16785083;

/** */
enum KEY_eightsubscript = 16785544;

/** */
enum KEY_eightsuperior = 16785528;

/** */
enum KEY_elementof = 16785928;

/** */
enum KEY_ellipsis = 2734;

/** */
enum KEY_em3space = 2723;

/** */
enum KEY_em4space = 2724;

/** */
enum KEY_emacron = 954;

/** */
enum KEY_emdash = 2729;

/** */
enum KEY_emfilledcircle = 2782;

/** */
enum KEY_emfilledrect = 2783;

/** */
enum KEY_emopencircle = 2766;

/** */
enum KEY_emopenrectangle = 2767;

/** */
enum KEY_emptyset = 16785925;

/** */
enum KEY_emspace = 2721;

/** */
enum KEY_endash = 2730;

/** */
enum KEY_enfilledcircbullet = 2790;

/** */
enum KEY_enfilledsqbullet = 2791;

/** */
enum KEY_eng = 959;

/** */
enum KEY_enopencircbullet = 2784;

/** */
enum KEY_enopensquarebullet = 2785;

/** */
enum KEY_enspace = 2722;

/** */
enum KEY_eogonek = 490;

/** */
enum KEY_equal = 61;

/** */
enum KEY_eth = 240;

/** */
enum KEY_etilde = 16785085;

/** */
enum KEY_exclam = 33;

/** */
enum KEY_exclamdown = 161;

/** */
enum KEY_ezh = 16777874;

/** */
enum KEY_f = 102;

/** */
enum KEY_fabovedot = 16784927;

/** */
enum KEY_femalesymbol = 2808;

/** */
enum KEY_ff = 2531;

/** */
enum KEY_figdash = 2747;

/** */
enum KEY_filledlefttribullet = 2780;

/** */
enum KEY_filledrectbullet = 2779;

/** */
enum KEY_filledrighttribullet = 2781;

/** */
enum KEY_filledtribulletdown = 2793;

/** */
enum KEY_filledtribulletup = 2792;

/** */
enum KEY_fiveeighths = 2757;

/** */
enum KEY_fivesixths = 2743;

/** */
enum KEY_fivesubscript = 16785541;

/** */
enum KEY_fivesuperior = 16785525;

/** */
enum KEY_fourfifths = 2741;

/** */
enum KEY_foursubscript = 16785540;

/** */
enum KEY_foursuperior = 16785524;

/** */
enum KEY_fourthroot = 16785948;

/** */
enum KEY_function = 2294;

/** */
enum KEY_g = 103;

/** */
enum KEY_gabovedot = 757;

/** */
enum KEY_gbreve = 699;

/** */
enum KEY_gcaron = 16777703;

/** */
enum KEY_gcedilla = 955;

/** */
enum KEY_gcircumflex = 760;

/** */
enum KEY_grave = 96;

/** */
enum KEY_greater = 62;

/** */
enum KEY_greaterthanequal = 2238;

/** */
enum KEY_guillemotleft = 171;

/** */
enum KEY_guillemotright = 187;

/** */
enum KEY_h = 104;

/** */
enum KEY_hairspace = 2728;

/** */
enum KEY_hcircumflex = 694;

/** */
enum KEY_heart = 2798;

/** */
enum KEY_hebrew_aleph = 3296;

/** */
enum KEY_hebrew_ayin = 3314;

/** */
enum KEY_hebrew_bet = 3297;

/** */
enum KEY_hebrew_beth = 3297;

/** */
enum KEY_hebrew_chet = 3303;

/** */
enum KEY_hebrew_dalet = 3299;

/** */
enum KEY_hebrew_daleth = 3299;

/** */
enum KEY_hebrew_doublelowline = 3295;

/** */
enum KEY_hebrew_finalkaph = 3306;

/** */
enum KEY_hebrew_finalmem = 3309;

/** */
enum KEY_hebrew_finalnun = 3311;

/** */
enum KEY_hebrew_finalpe = 3315;

/** */
enum KEY_hebrew_finalzade = 3317;

/** */
enum KEY_hebrew_finalzadi = 3317;

/** */
enum KEY_hebrew_gimel = 3298;

/** */
enum KEY_hebrew_gimmel = 3298;

/** */
enum KEY_hebrew_he = 3300;

/** */
enum KEY_hebrew_het = 3303;

/** */
enum KEY_hebrew_kaph = 3307;

/** */
enum KEY_hebrew_kuf = 3319;

/** */
enum KEY_hebrew_lamed = 3308;

/** */
enum KEY_hebrew_mem = 3310;

/** */
enum KEY_hebrew_nun = 3312;

/** */
enum KEY_hebrew_pe = 3316;

/** */
enum KEY_hebrew_qoph = 3319;

/** */
enum KEY_hebrew_resh = 3320;

/** */
enum KEY_hebrew_samech = 3313;

/** */
enum KEY_hebrew_samekh = 3313;

/** */
enum KEY_hebrew_shin = 3321;

/** */
enum KEY_hebrew_taf = 3322;

/** */
enum KEY_hebrew_taw = 3322;

/** */
enum KEY_hebrew_tet = 3304;

/** */
enum KEY_hebrew_teth = 3304;

/** */
enum KEY_hebrew_waw = 3301;

/** */
enum KEY_hebrew_yod = 3305;

/** */
enum KEY_hebrew_zade = 3318;

/** */
enum KEY_hebrew_zadi = 3318;

/** */
enum KEY_hebrew_zain = 3302;

/** */
enum KEY_hebrew_zayin = 3302;

/** */
enum KEY_hexagram = 2778;

/** */
enum KEY_horizconnector = 2211;

/** */
enum KEY_horizlinescan1 = 2543;

/** */
enum KEY_horizlinescan3 = 2544;

/** */
enum KEY_horizlinescan5 = 2545;

/** */
enum KEY_horizlinescan7 = 2546;

/** */
enum KEY_horizlinescan9 = 2547;

/** */
enum KEY_hstroke = 689;

/** */
enum KEY_ht = 2530;

/** */
enum KEY_hyphen = 173;

/** */
enum KEY_i = 105;

/** */
enum KEY_iTouch = 269025120;

/** */
enum KEY_iacute = 237;

/** */
enum KEY_ibelowdot = 16785099;

/** */
enum KEY_ibreve = 16777517;

/** */
enum KEY_icircumflex = 238;

/** */
enum KEY_identical = 2255;

/** */
enum KEY_idiaeresis = 239;

/** */
enum KEY_idotless = 697;

/** */
enum KEY_ifonlyif = 2253;

/** */
enum KEY_igrave = 236;

/** */
enum KEY_ihook = 16785097;

/** */
enum KEY_imacron = 1007;

/** */
enum KEY_implies = 2254;

/** */
enum KEY_includedin = 2266;

/** */
enum KEY_includes = 2267;

/** */
enum KEY_infinity = 2242;

/** */
enum KEY_integral = 2239;

/** */
enum KEY_intersection = 2268;

/** */
enum KEY_iogonek = 999;

/** */
enum KEY_itilde = 949;

/** */
enum KEY_j = 106;

/** */
enum KEY_jcircumflex = 700;

/** */
enum KEY_jot = 3018;

/** */
enum KEY_k = 107;

/** */
enum KEY_kana_A = 1201;

/** */
enum KEY_kana_CHI = 1217;

/** */
enum KEY_kana_E = 1204;

/** */
enum KEY_kana_FU = 1228;

/** */
enum KEY_kana_HA = 1226;

/** */
enum KEY_kana_HE = 1229;

/** */
enum KEY_kana_HI = 1227;

/** */
enum KEY_kana_HO = 1230;

/** */
enum KEY_kana_HU = 1228;

/** */
enum KEY_kana_I = 1202;

/** */
enum KEY_kana_KA = 1206;

/** */
enum KEY_kana_KE = 1209;

/** */
enum KEY_kana_KI = 1207;

/** */
enum KEY_kana_KO = 1210;

/** */
enum KEY_kana_KU = 1208;

/** */
enum KEY_kana_MA = 1231;

/** */
enum KEY_kana_ME = 1234;

/** */
enum KEY_kana_MI = 1232;

/** */
enum KEY_kana_MO = 1235;

/** */
enum KEY_kana_MU = 1233;

/** */
enum KEY_kana_N = 1245;

/** */
enum KEY_kana_NA = 1221;

/** */
enum KEY_kana_NE = 1224;

/** */
enum KEY_kana_NI = 1222;

/** */
enum KEY_kana_NO = 1225;

/** */
enum KEY_kana_NU = 1223;

/** */
enum KEY_kana_O = 1205;

/** */
enum KEY_kana_RA = 1239;

/** */
enum KEY_kana_RE = 1242;

/** */
enum KEY_kana_RI = 1240;

/** */
enum KEY_kana_RO = 1243;

/** */
enum KEY_kana_RU = 1241;

/** */
enum KEY_kana_SA = 1211;

/** */
enum KEY_kana_SE = 1214;

/** */
enum KEY_kana_SHI = 1212;

/** */
enum KEY_kana_SO = 1215;

/** */
enum KEY_kana_SU = 1213;

/** */
enum KEY_kana_TA = 1216;

/** */
enum KEY_kana_TE = 1219;

/** */
enum KEY_kana_TI = 1217;

/** */
enum KEY_kana_TO = 1220;

/** */
enum KEY_kana_TSU = 1218;

/** */
enum KEY_kana_TU = 1218;

/** */
enum KEY_kana_U = 1203;

/** */
enum KEY_kana_WA = 1244;

/** */
enum KEY_kana_WO = 1190;

/** */
enum KEY_kana_YA = 1236;

/** */
enum KEY_kana_YO = 1238;

/** */
enum KEY_kana_YU = 1237;

/** */
enum KEY_kana_a = 1191;

/** */
enum KEY_kana_closingbracket = 1187;

/** */
enum KEY_kana_comma = 1188;

/** */
enum KEY_kana_conjunctive = 1189;

/** */
enum KEY_kana_e = 1194;

/** */
enum KEY_kana_fullstop = 1185;

/** */
enum KEY_kana_i = 1192;

/** */
enum KEY_kana_middledot = 1189;

/** */
enum KEY_kana_o = 1195;

/** */
enum KEY_kana_openingbracket = 1186;

/** */
enum KEY_kana_switch = 65406;

/** */
enum KEY_kana_tsu = 1199;

/** */
enum KEY_kana_tu = 1199;

/** */
enum KEY_kana_u = 1193;

/** */
enum KEY_kana_ya = 1196;

/** */
enum KEY_kana_yo = 1198;

/** */
enum KEY_kana_yu = 1197;

/** */
enum KEY_kappa = 930;

/** */
enum KEY_kcedilla = 1011;

/** */
enum KEY_kra = 930;

/** */
enum KEY_l = 108;

/** */
enum KEY_lacute = 485;

/** */
enum KEY_latincross = 2777;

/** */
enum KEY_lbelowdot = 16784951;

/** */
enum KEY_lcaron = 437;

/** */
enum KEY_lcedilla = 950;

/** */
enum KEY_leftanglebracket = 2748;

/** */
enum KEY_leftarrow = 2299;

/** */
enum KEY_leftcaret = 2979;

/** */
enum KEY_leftdoublequotemark = 2770;

/** */
enum KEY_leftmiddlecurlybrace = 2223;

/** */
enum KEY_leftopentriangle = 2764;

/** */
enum KEY_leftpointer = 2794;

/** */
enum KEY_leftradical = 2209;

/** */
enum KEY_leftshoe = 3034;

/** */
enum KEY_leftsinglequotemark = 2768;

/** */
enum KEY_leftt = 2548;

/** */
enum KEY_lefttack = 3036;

/** */
enum KEY_less = 60;

/** */
enum KEY_lessthanequal = 2236;

/** */
enum KEY_lf = 2533;

/** */
enum KEY_logicaland = 2270;

/** */
enum KEY_logicalor = 2271;

/** */
enum KEY_lowleftcorner = 2541;

/** */
enum KEY_lowrightcorner = 2538;

/** */
enum KEY_lstroke = 435;

/** */
enum KEY_m = 109;

/** */
enum KEY_mabovedot = 16784961;

/** */
enum KEY_macron = 175;

/** */
enum KEY_malesymbol = 2807;

/** */
enum KEY_maltesecross = 2800;

/** */
enum KEY_marker = 2751;

/** */
enum KEY_masculine = 186;

/** */
enum KEY_minus = 45;

/** */
enum KEY_minutes = 2774;

/** */
enum KEY_mu = 181;

/** */
enum KEY_multiply = 215;

/** */
enum KEY_musicalflat = 2806;

/** */
enum KEY_musicalsharp = 2805;

/** */
enum KEY_n = 110;

/** */
enum KEY_nabla = 2245;

/** */
enum KEY_nacute = 497;

/** */
enum KEY_ncaron = 498;

/** */
enum KEY_ncedilla = 1009;

/** */
enum KEY_ninesubscript = 16785545;

/** */
enum KEY_ninesuperior = 16785529;

/** */
enum KEY_nl = 2536;

/** */
enum KEY_nobreakspace = 160;

/** */
enum KEY_notapproxeq = 16785991;

/** */
enum KEY_notelementof = 16785929;

/** */
enum KEY_notequal = 2237;

/** */
enum KEY_notidentical = 16786018;

/** */
enum KEY_notsign = 172;

/** */
enum KEY_ntilde = 241;

/** */
enum KEY_numbersign = 35;

/** */
enum KEY_numerosign = 1712;

/** */
enum KEY_o = 111;

/** */
enum KEY_oacute = 243;

/** */
enum KEY_obarred = 16777845;

/** */
enum KEY_obelowdot = 16785101;

/** */
enum KEY_ocaron = 16777682;

/** */
enum KEY_ocircumflex = 244;

/** */
enum KEY_ocircumflexacute = 16785105;

/** */
enum KEY_ocircumflexbelowdot = 16785113;

/** */
enum KEY_ocircumflexgrave = 16785107;

/** */
enum KEY_ocircumflexhook = 16785109;

/** */
enum KEY_ocircumflextilde = 16785111;

/** */
enum KEY_odiaeresis = 246;

/** */
enum KEY_odoubleacute = 501;

/** */
enum KEY_oe = 5053;

/** */
enum KEY_ogonek = 434;

/** */
enum KEY_ograve = 242;

/** */
enum KEY_ohook = 16785103;

/** */
enum KEY_ohorn = 16777633;

/** */
enum KEY_ohornacute = 16785115;

/** */
enum KEY_ohornbelowdot = 16785123;

/** */
enum KEY_ohorngrave = 16785117;

/** */
enum KEY_ohornhook = 16785119;

/** */
enum KEY_ohorntilde = 16785121;

/** */
enum KEY_omacron = 1010;

/** */
enum KEY_oneeighth = 2755;

/** */
enum KEY_onefifth = 2738;

/** */
enum KEY_onehalf = 189;

/** */
enum KEY_onequarter = 188;

/** */
enum KEY_onesixth = 2742;

/** */
enum KEY_onesubscript = 16785537;

/** */
enum KEY_onesuperior = 185;

/** */
enum KEY_onethird = 2736;

/** */
enum KEY_ooblique = 248;

/** */
enum KEY_openrectbullet = 2786;

/** */
enum KEY_openstar = 2789;

/** */
enum KEY_opentribulletdown = 2788;

/** */
enum KEY_opentribulletup = 2787;

/** */
enum KEY_ordfeminine = 170;

/** */
enum KEY_oslash = 248;

/** */
enum KEY_otilde = 245;

/** */
enum KEY_overbar = 3008;

/** */
enum KEY_overline = 1150;

/** */
enum KEY_p = 112;

/** */
enum KEY_pabovedot = 16784983;

/** */
enum KEY_paragraph = 182;

/** */
enum KEY_parenleft = 40;

/** */
enum KEY_parenright = 41;

/** */
enum KEY_partdifferential = 16785922;

/** */
enum KEY_partialderivative = 2287;

/** */
enum KEY_percent = 37;

/** */
enum KEY_period = 46;

/** */
enum KEY_periodcentered = 183;

/** */
enum KEY_permille = 2773;

/** */
enum KEY_phonographcopyright = 2811;

/** */
enum KEY_plus = 43;

/** */
enum KEY_plusminus = 177;

/** */
enum KEY_prescription = 2772;

/** */
enum KEY_prolongedsound = 1200;

/** */
enum KEY_punctspace = 2726;

/** */
enum KEY_q = 113;

/** */
enum KEY_quad = 3020;

/** */
enum KEY_question = 63;

/** */
enum KEY_questiondown = 191;

/** */
enum KEY_quotedbl = 34;

/** */
enum KEY_quoteleft = 96;

/** */
enum KEY_quoteright = 39;

/** */
enum KEY_r = 114;

/** */
enum KEY_racute = 480;

/** */
enum KEY_radical = 2262;

/** */
enum KEY_rcaron = 504;

/** */
enum KEY_rcedilla = 947;

/** */
enum KEY_registered = 174;

/** */
enum KEY_rightanglebracket = 2750;

/** */
enum KEY_rightarrow = 2301;

/** */
enum KEY_rightcaret = 2982;

/** */
enum KEY_rightdoublequotemark = 2771;

/** */
enum KEY_rightmiddlecurlybrace = 2224;

/** */
enum KEY_rightmiddlesummation = 2231;

/** */
enum KEY_rightopentriangle = 2765;

/** */
enum KEY_rightpointer = 2795;

/** */
enum KEY_rightshoe = 3032;

/** */
enum KEY_rightsinglequotemark = 2769;

/** */
enum KEY_rightt = 2549;

/** */
enum KEY_righttack = 3068;

/** */
enum KEY_s = 115;

/** */
enum KEY_sabovedot = 16784993;

/** */
enum KEY_sacute = 438;

/** */
enum KEY_scaron = 441;

/** */
enum KEY_scedilla = 442;

/** */
enum KEY_schwa = 16777817;

/** */
enum KEY_scircumflex = 766;

/** */
enum KEY_script_switch = 65406;

/** */
enum KEY_seconds = 2775;

/** */
enum KEY_section = 167;

/** */
enum KEY_semicolon = 59;

/** */
enum KEY_semivoicedsound = 1247;

/** */
enum KEY_seveneighths = 2758;

/** */
enum KEY_sevensubscript = 16785543;

/** */
enum KEY_sevensuperior = 16785527;

/** */
enum KEY_signaturemark = 2762;

/** */
enum KEY_signifblank = 2732;

/** */
enum KEY_similarequal = 2249;

/** */
enum KEY_singlelowquotemark = 2813;

/** */
enum KEY_sixsubscript = 16785542;

/** */
enum KEY_sixsuperior = 16785526;

/** */
enum KEY_slash = 47;

/** */
enum KEY_soliddiamond = 2528;

/** */
enum KEY_space = 32;

/** */
enum KEY_squareroot = 16785946;

/** */
enum KEY_ssharp = 223;

/** */
enum KEY_sterling = 163;

/** */
enum KEY_stricteq = 16786019;

/** */
enum KEY_t = 116;

/** */
enum KEY_tabovedot = 16785003;

/** */
enum KEY_tcaron = 443;

/** */
enum KEY_tcedilla = 510;

/** */
enum KEY_telephone = 2809;

/** */
enum KEY_telephonerecorder = 2810;

/** */
enum KEY_therefore = 2240;

/** */
enum KEY_thinspace = 2727;

/** */
enum KEY_thorn = 254;

/** */
enum KEY_threeeighths = 2756;

/** */
enum KEY_threefifths = 2740;

/** */
enum KEY_threequarters = 190;

/** */
enum KEY_threesubscript = 16785539;

/** */
enum KEY_threesuperior = 179;

/** */
enum KEY_tintegral = 16785965;

/** */
enum KEY_topintegral = 2212;

/** */
enum KEY_topleftparens = 2219;

/** */
enum KEY_topleftradical = 2210;

/** */
enum KEY_topleftsqbracket = 2215;

/** */
enum KEY_topleftsummation = 2225;

/** */
enum KEY_toprightparens = 2221;

/** */
enum KEY_toprightsqbracket = 2217;

/** */
enum KEY_toprightsummation = 2229;

/** */
enum KEY_topt = 2551;

/** */
enum KEY_topvertsummationconnector = 2227;

/** */
enum KEY_trademark = 2761;

/** */
enum KEY_trademarkincircle = 2763;

/** */
enum KEY_tslash = 956;

/** */
enum KEY_twofifths = 2739;

/** */
enum KEY_twosubscript = 16785538;

/** */
enum KEY_twosuperior = 178;

/** */
enum KEY_twothirds = 2737;

/** */
enum KEY_u = 117;

/** */
enum KEY_uacute = 250;

/** */
enum KEY_ubelowdot = 16785125;

/** */
enum KEY_ubreve = 765;

/** */
enum KEY_ucircumflex = 251;

/** */
enum KEY_udiaeresis = 252;

/** */
enum KEY_udoubleacute = 507;

/** */
enum KEY_ugrave = 249;

/** */
enum KEY_uhook = 16785127;

/** */
enum KEY_uhorn = 16777648;

/** */
enum KEY_uhornacute = 16785129;

/** */
enum KEY_uhornbelowdot = 16785137;

/** */
enum KEY_uhorngrave = 16785131;

/** */
enum KEY_uhornhook = 16785133;

/** */
enum KEY_uhorntilde = 16785135;

/** */
enum KEY_umacron = 1022;

/** */
enum KEY_underbar = 3014;

/** */
enum KEY_underscore = 95;

/** */
enum KEY_union = 2269;

/** */
enum KEY_uogonek = 1017;

/** */
enum KEY_uparrow = 2300;

/** */
enum KEY_upcaret = 2985;

/** */
enum KEY_upleftcorner = 2540;

/** */
enum KEY_uprightcorner = 2539;

/** */
enum KEY_upshoe = 3011;

/** */
enum KEY_upstile = 3027;

/** */
enum KEY_uptack = 3022;

/** */
enum KEY_uring = 505;

/** */
enum KEY_utilde = 1021;

/** */
enum KEY_v = 118;

/** */
enum KEY_variation = 2241;

/** */
enum KEY_vertbar = 2552;

/** */
enum KEY_vertconnector = 2214;

/** */
enum KEY_voicedsound = 1246;

/** */
enum KEY_vt = 2537;

/** */
enum KEY_w = 119;

/** */
enum KEY_wacute = 16785027;

/** */
enum KEY_wcircumflex = 16777589;

/** */
enum KEY_wdiaeresis = 16785029;

/** */
enum KEY_wgrave = 16785025;

/** */
enum KEY_x = 120;

/** */
enum KEY_xabovedot = 16785035;

/** */
enum KEY_y = 121;

/** */
enum KEY_yacute = 253;

/** */
enum KEY_ybelowdot = 16785141;

/** */
enum KEY_ycircumflex = 16777591;

/** */
enum KEY_ydiaeresis = 255;

/** */
enum KEY_yen = 165;

/** */
enum KEY_ygrave = 16785139;

/** */
enum KEY_yhook = 16785143;

/** */
enum KEY_ytilde = 16785145;

/** */
enum KEY_z = 122;

/** */
enum KEY_zabovedot = 447;

/** */
enum KEY_zacute = 444;

/** */
enum KEY_zcaron = 446;

/** */
enum KEY_zerosubscript = 16785536;

/** */
enum KEY_zerosuperior = 16785520;

/** */
enum KEY_zstroke = 16777654;

/**
    A mask covering all entries in [gdk.types.ModifierType].
*/
enum MODIFIER_MASK = 469769999;

/**
    This is the priority that the idle handler processing surface updates
    is given in the main loop.
*/
enum PRIORITY_REDRAW = 120;
