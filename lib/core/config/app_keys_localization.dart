/// Centralized keys for EDUTOON App Localization
class AppKeys {
  static const String appName = 'app_name'; // Reserved if needed
}

/// Splash Screen Keys
abstract class SplashKeys {
  static const String tagline = 'splash.tagline';
}

/// Onboarding Screen Keys
abstract class OnboardingKeys {
  static const String page1Title = 'onboarding.page1.title';
  static const String page1Desc = 'onboarding.page1.desc';
  static const String page2Title = 'onboarding.page2.title';
  static const String page2Desc = 'onboarding.page2.desc';
  static const String page3Title = 'onboarding.page3.title';
  static const String page3Desc = 'onboarding.page3.desc';

  // Buttons
  static const String btnSkip = 'onboarding.buttons.skip';
  static const String btnNext = 'onboarding.buttons.next';
  static const String btnGetStarted = 'onboarding.buttons.get_started';
  static const String btnDone = 'onboarding.buttons.done';
}

/// Authentication Screen Keys
abstract class AuthKeys {
  static const String welcome = 'auth.welcome';
  static const String tagline = 'auth.tagline';

  // User Type
  static const String userTypeStudent = 'auth.user_type.student';
  static const String userTypeParent = 'auth.user_type.parent';

  // Tabs
  static const String tabSignIn = 'auth.tabs.sign_in';
  static const String tabSignUp = 'auth.tabs.sign_up';

  // Social Auth
  static const String google = "auth.social_signin.google";
  static const String facebook = "auth.social_signin.facebook";
  static const String title = "auth.social_signin.title";

  // Error

  // Errors
  static const String errorWrongEmailOrPassword = 'auth.error.wrong_email_or_password';
  static const String errorUserNotFound = 'auth.error.user_not_found';
  static const String errorEmailAlreadyExists = 'auth.error.email_already_in_use';
  static const String errorInvalidEmail = 'auth.error.invalid_email';
  static const String errorWeakPassword = 'auth.error.weak_password';
  static const String errorTooManyRequests = 'auth.error.too_many_requests';
  static const String errorOperationNotAllowed = 'auth.error.operation_not_allowed';
  static const String errorInvalidVerificationCode = 'auth.error.invalid_verification_code';
  static const String errorUserDisabled = 'auth.error.user_disabled';
  static const String errorNetworkRequestFailed = 'auth.error.network_request_failed';

  // Validation
  static const String validationFullName = 'auth.validation.full_name';
  static const String validationFirstName = 'auth.validation.first_name';
  static const String validationLastName = 'auth.validation.last_name';
  static const String validationEmail = 'auth.validation.email';
  static const String validationPhone = 'auth.validation.phone';
  static const String validationPassword = 'auth.validation.password';

  // Fields
  static const String fieldFullName = 'auth.fields.full_name';
  static const String firstName = 'auth.fields.first_name';
  static const String lastName = 'auth.fields.last_name';
  static const String fieldEmail = 'auth.fields.email';
  static const String fieldPhone = 'auth.fields.phone';
  static const String fieldPassword = 'auth.fields.password';

  // Actions
  static const String actionForgotPass = 'auth.actions.forgot_pass';
  static const String actionCreateAcc = 'auth.actions.create_acc';
  static const String actionOr = 'auth.actions.or';
  static const String actionOrContinue = 'auth.actions.or_continue';
  static const String joinFooter = 'auth.actions.join_footer';


}

/// Forgot Password Keys
abstract class ForgotPassKeys {
  static const String title = 'forgot_pass.title';

  // Step 1
  static const String step1Heading = 'forgot_pass.step1.heading';
  static const String step1Desc = 'forgot_pass.step1.desc';
  static const String step1Placeholder = 'forgot_pass.step1.placeholder';
  static const String step1Btn = 'forgot_pass.step1.btn';
  static const String step1Sending = 'forgot_pass.step1.sending';

  // Step 2
  static const String step2Heading = 'forgot_pass.step2.heading';
  static const String step2Desc = 'forgot_pass.step2.desc';
  static const String step2Resend = 'forgot_pass.step2.resend';
  static const String step2VerifyBtn = 'forgot_pass.step2.verify_btn';
  static const String step2Verifying = 'forgot_pass.step2.verifying';

  // Step 3
  static const String step3Heading = 'forgot_pass.step3.heading';
  static const String step3Desc = 'forgot_pass.step3.desc';
  static const String step3Btn = 'forgot_pass.step3.btn';

  // Footer
  static const String footerRemember = 'forgot_pass.footer.remember';
  static const String footerSignIn = 'forgot_pass.footer.sign_in';
}

/// Home Screen Keys
abstract class HomeKeys {
  static const String welcome = 'home.welcome';
  static const String search = 'home.search';

  // Daily Goal
  static const String goalTitle = 'home.daily_goal.title';
  static const String goalProgress = 'home.daily_goal.progress';
  static const String goalXpEarned = 'home.daily_goal.xp_earned';

  // Continue Learning
  static const String continueTitle = 'home.continue_learning.title';
  static const String continueSeeAll = 'home.continue_learning.see_all';
  static const String continueComplete = 'home.continue_learning.complete';

  // Subjects
  static const String subjectsTitle = 'home.subjects.title';
  static const String subjectArabic = 'home.subjects.arabic';
  static const String subjectEnglish = 'home.subjects.english';
  static const String subjectMath = 'home.subjects.math';
  static const String subjectScience = 'home.subjects.science';
  static const String subjectSocial = 'home.subjects.social';

  static const String achievements = 'home.achievements';
}

/// Subject Details Keys
abstract class SubjectDetailsKeys {
  static const String statsLessons = 'subject_details.stats.lessons';
  static const String statsTotalTime = 'subject_details.stats.total_time';
  static const String statsXp = 'subject_details.stats.xp';

  static const String ctaReady = 'subject_details.cta.ready';
  static const String ctaNext = 'subject_details.cta.next';
}

/// Lesson Player Keys
abstract class LessonKeys {
  static const String videoLabel = 'lesson.video_label';
  static const String durationUnit = 'lesson.duration_unit';
  static const String overview = 'lesson.overview';
  static const String objectives = 'lesson.objectives';

  // Resources
  static const String resTitle = 'lesson.resources.title';
  static const String resNotes = 'lesson.resources.notes';
  static const String resWorksheet = 'lesson.resources.worksheet';

  static const String startQuiz = 'lesson.start_quiz';
}

/// Quiz Keys
abstract class QuizKeys {
  static const String questionHeader = 'quiz.question_header';
  static const String feedbackExcellent = 'quiz.feedback.excellent';
  static const String feedbackGoodTry = 'quiz.feedback.good_try';
  static const String tip = 'quiz.tip';
}

/// Gamification & Rewards Keys
abstract class GamificationKeys {
  static const String headerTitle = 'gamification.header_title';
  static const String xpEarned = 'gamification.xp_earned';
  static const String level = 'gamification.level';
  static const String progressMsg = 'gamification.progress_msg';

  // Stats
  static const String statsTitle = 'gamification.stats.title';
  static const String statsTotalXp = 'gamification.stats.total_xp';
  static const String statsStreak = 'gamification.stats.streak';
  static const String statsCompleted = 'gamification.stats.completed';

  // Achievements
  static const String achievementsTitle = 'gamification.achievements.title';
  static const String achievementsEarnedStatus = 'gamification.achievements.earned_status';

  // Badges
  static const String badgeQuizMaster = 'gamification.badges.quiz_master';
  static const String badgePerfectScore = 'gamification.badges.perfect_score';
  static const String badgeSharpShooter = 'gamification.badges.sharp_shooter';
  static const String badgeStreak7 = 'gamification.badges.streak_7';
  static const String badgeDiamondMind = 'gamification.badges.diamond_mind';
  static const String badgeFastLearner = 'gamification.badges.fast_learner';

  // Weekly Goals
  static const String goalsTitle = 'gamification.weekly_goals.title';
  static const String goal1 = 'gamification.weekly_goals.goal1';
  static const String goal2 = 'gamification.weekly_goals.goal2';
  static const String goal3 = 'gamification.weekly_goals.goal3';

  static const String continueBtn = 'gamification.continue_btn';
}

/// Parent Dashboard Keys
abstract class ParentKeys {
  static const String title = 'parent.title';

  // Stats
  static const String statsAvgScore = 'parent.stats.avg_score';
  static const String statsThisWeek = 'parent.stats.this_week';
  static const String statsCompleted = 'parent.stats.completed';

  // Performance
  static const String perfTitle = 'parent.performance.title';
  static const String perfCurrentGrade = 'parent.performance.current_grade';

  // Headers
  static const String perfVideos = 'parent.performance.videos';
  static const String perfQuizzes = 'parent.performance.quizzes';
  static const String perfBadges = 'parent.performance.badges';
  static const String perfPoints = 'parent.performance.points';

  // Report
  static const String reportTitle = 'parent.report.title';
  static const String reportLessons = 'parent.report.lessons';
  static const String reportStudyTime = 'parent.report.study_time';
  static const String reportFromLastWeek = 'parent.report.from_last_week';
  static const String reportEngagement = 'parent.report.engagement';

  // Recent Activity
  static const String recentTitle = 'parent.recent.title';
  static const String recentViewAll = 'parent.recent.view_all';
  static const String timeHoursAgo = 'parent.recent.time.hours_ago';
  static const String timeYesterday = 'parent.recent.time.yesterday';
  static const String timeDaysAgo = 'parent.recent.time.days_ago';

  static const String recommendationsTitle = 'parent.recommendations.title';
}

/// Profile & Settings Keys
abstract class ProfileKeys {
  static const String title = 'profile.title';
  static const String edit = 'profile.edit';
  static const String editName = 'profile.edit_name';
  static const String editEmail = 'profile.edit_email';
  static const String editPhone = 'profile.edit_phone';
  static const String editSuccess = 'profile.edit_success';
  static const String editError = 'profile.edit_failure';
  static const String save = 'profile.save';
  static const String avatar = 'profile.avatar';

  // Settings
  static const String settingsTitle = 'profile.settings.title';
  static const String settingsLanguage = 'profile.settings.language';
  static const String settingsNotifications = 'profile.settings.notifications';
  static const String settingsOn = 'profile.settings.on';
  static const String settingsOff = 'profile.settings.off';
  static const String settingsDownloads = 'profile.settings.downloads';

  // Preferences
  static const String prefTitle = 'profile.preferences.title';
  static const String prefDarkMode = 'profile.preferences.dark_mode';

  // Support
  static const String supportTitle = 'profile.support.title';
  static const String supportHelp = 'profile.support.help';

  static const String logout = 'profile.logout';
  static const String footerMade = 'profile.footer_made';
}

/// Navigation Bar Keys
abstract class NavKeys {
  static const String home = 'nav.home';
  static const String rewards = 'nav.rewards';
  static const String reports = 'nav.reports';
  static const String profile = 'nav.profile';
}