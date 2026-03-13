/**
 * Application-wide constants.
 * Centralises all magic values that were previously scattered across components.
 */

/* ─────────────────────────────────────────
   API – default base path (used as fallback in AuthContext)
───────────────────────────────────────── */
export const DEFAULT_API_BASE = '/backend/api';

/* ─────────────────────────────────────────
   API ENDPOINTS
   All paths are relative to the API base URL configured in AuthContext.
───────────────────────────────────────── */
export const API = {
  // Auth
  LOGIN:              '/login.php',
  ADMIN_LOGIN:        '/admin_login.php',
  ADMIN_REGISTER:     '/admin_register.php',
  STAFF_LOGIN:        '/staff_login.php',
  STAFF_REGISTER:     '/staff_register.php',
  REGISTER:           '/register.php',
  LOGOUT:             '/logout.php',
  STAFF_LOGIN_LOGS:   '/staff_login_logs.php',

  // Bookings
  BOOKINGS:           '/bookings.php',
  BOOKING_EDIT:       '/booking_edit.php',
  BOOKING_COUNTS:     '/booking_counts.php',
  ADVANCE_BOOKING:    '/advance_booking.php',
  ADVANCE_BOOKINGS:   '/advance_bookings.php',
  CANCEL:             '/cancel.php',

  // Trips
  ONTRIP:             '/ontrip.php',
  LOCAL_TRIP:         '/localtrip.php',
  LOCAL_TRIP_CLOSING: '/local_trip_closing.php',
  CLOSING:            '/closing.php',
  EDIT_CLOSED_TRIP:   '/edit_closed_trip.php',
  TRIP_EDIT:          '/trip_edit.php',
  TRIP_REFUSAL:       '/trip_refusal.php',

  // Vehicles & Tariff
  VEHICLES:           '/vehicles.php',
  AVAILABLE_VEHICLES: '/available_vehicles.php',
  VEHICLE_ATTENDANCE: '/vehicle_attendance.php',
  VEHICLE_IN_OUT:     '/vehicle_in_out.php',
  VEHICLE_PRICING:    '/vehicle_pricing.php',
  ATTACHED_VEHICLES:  '/attached_vehicles.php',
  TARIFF:             '/tariff.php',
  TARIFF_UPLOAD:      '/tariff_upload.php',
  ENQUERY_TARIFF:     '/enquery_tariff.php',

  // Staff & Attendance
  STAFF:              '/staff.php',
  ATTENDANCE:         '/attendance.php',

  // Customers
  CUSTOMERS:          '/customers.php',
  CUSTOMER_SEARCH:    '/customer_search.php',
  CUSTOMER_UPLOAD:    '/customer_upload.php',

  // Finance & Settings
  FINANCE:            '/finance.php',
  SETTINGS:           '/settings.php',
  USER_RIGHTS:        '/user_rights.php',
  DASHBOARD:          '/dashboard.php',

  // Assignments
  ASSIGN:             '/assign.php',
  ASSIGN_LATER:       '/assign_later.php',

  // Reports
  REPORTS:            '/reports.php',
  COMPANY_REPORT:     '/company_report.php',
  CUSTOMER_REPORT:    '/customer_report.php',
  VEHICLE_REPORT:     '/vehicle_separate_report.php',
  SHORTAGE_KM:        '/shortage_km_report.php',
  STAFF_REPORT:       '/staff_report.php',
  USER_ACTIVITY:      '/user_activity_report.php',
  CANCEL_REPORT:      '/cancel_report.php',
  ENQUIRY_REPORT:     '/enquiry_report.php',
  RUNNING_KM:         '/running_km_report.php',
  DAY_WISE:           '/day_wise_report.php',
  REFUSAL_REPORT:     '/refusal_report.php',

  // Utilities
  DISTANCE_SUGGESTIONS: '/get_distance_suggestions.php',
};

/* ─────────────────────────────────────────
   DATE RANGE – "all records" sentinel values
   Used when an API requires date filters but the intent is to fetch
   all historical and future records without restriction.
───────────────────────────────────────── */
export const DATE_RANGE_ALL = {
  FROM: '2000-01-01',
  TO:   '2099-12-31',
};

/* ─────────────────────────────────────────
   COLOUR PALETTE
   Single source of truth for the brand colours used across pages.
───────────────────────────────────────── */
export const COLORS = {
  NAVY:  '#023149',
  RED:   '#c5111a',
  CREAM: '#fdf6e8',
  BLUE:  '#689abb',
  GREEN: '#15803d',
};

/* ─────────────────────────────────────────
   USER ROLES
───────────────────────────────────────── */
export const ROLES = {
  ADMIN: 'Admin',
  STAFF: 'Staff',
  USER:  'User',
};

/* ─────────────────────────────────────────
   BOOKING TYPES  (b_type field)
───────────────────────────────────────── */
export const BOOKING_TYPE = {
  CURRENT: 'Current Booking',
  ADVANCE: 'Advance Booking',
};

/* ─────────────────────────────────────────
   TARIFF / RATE TYPES  (r_status field)
───────────────────────────────────────── */
export const RATE_TYPE = {
  LOCAL:       'Local Tariff',
  OUTSTATION:  'Out Station Tariff',
};

/* ─────────────────────────────────────────
   TRIP TYPES  (t_type field)
───────────────────────────────────────── */
export const TRIP_TYPE = {
  ONE_WAY:    '0',
  ROUND_TRIP: '1',
};

/* ─────────────────────────────────────────
   AC PREFERENCE  (ac_type field)
───────────────────────────────────────── */
export const AC_TYPE = {
  AC:     'AC',
  NON_AC: 'Non AC',
};

/* ─────────────────────────────────────────
   LOCAL STORAGE KEYS
───────────────────────────────────────── */
export const STORAGE_KEYS = {
  USER: 'user',
};
