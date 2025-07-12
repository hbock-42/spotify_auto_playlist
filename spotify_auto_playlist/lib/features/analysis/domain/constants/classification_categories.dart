/// Predefined classification categories for song analysis
class ClassificationCategories {
  static const List<String> moods = [
    // Positive emotions
    'happy',
    'joyful',
    'upbeat',
    'euphoric',
    'cheerful',
    
    // Negative emotions
    'sad',
    'melancholic',
    'depressive',
    'sorrowful',
    'nostalgic',
    
    // High energy emotions
    'energetic',
    'intense',
    'aggressive',
    'powerful',
    'fierce',
    
    // Low energy emotions
    'calm',
    'peaceful',
    'serene',
    'relaxed',
    'tranquil',
    
    // Romantic emotions
    'romantic',
    'sensual',
    'intimate',
    'passionate',
    
    // Dark emotions
    'dark',
    'mysterious',
    'haunting',
    'eerie',
    
    // Rebellious emotions
    'angry',
    'rebellious',
    'defiant',
    
    // Ethereal emotions
    'dreamy',
    'ethereal',
    'atmospheric',
  ];

  static const List<String> contexts = [
    // Physical activities
    'workout',
    'gym',
    'running',
    'exercise',
    
    // Social activities
    'party',
    'dancing',
    'clubbing',
    'celebration',
    'social',
    'gathering',
    'hangout',
    
    // Relaxation activities
    'relaxing',
    'chillout',
    'meditation',
    'sleep',
    
    // Travel activities
    'driving',
    'road trip',
    'commuting',
    
    // Work/Study activities
    'studying',
    'focus',
    'concentration',
    'background',
    
    // Romantic activities
    'romantic',
    'date night',
    'intimate moments',
    
    // Time-based contexts
    'morning',
    'wake-up',
    'energizing',
    'evening',
    'wind-down',
    'nighttime',
  ];

  static const List<String> styles = [
    // Energy-based styles
    'upbeat',
    'fast-paced',
    'high-energy',
    'mellow',
    'slow',
    'laid-back',
    'gentle',
    
    // Intensity-based styles
    'heavy',
    'intense',
    'powerful',
    'loud',
    
    // Production styles
    'electronic',
    'synthetic',
    'digital',
    'techno',
    'acoustic',
    'organic',
    'natural',
    'live',
    
    // Artistic styles
    'experimental',
    'avant-garde',
    'unconventional',
    'mainstream',
    'commercial',
    'radio-friendly',
    
    // Compositional styles
    'instrumental',
    'vocal-driven',
    'lyric-focused',
  ];

  /// Validates if a classification category exists in the predefined lists
  static bool isValidMood(String mood) => moods.contains(mood.toLowerCase());
  static bool isValidContext(String context) => contexts.contains(context.toLowerCase());
  static bool isValidStyle(String style) => styles.contains(style.toLowerCase());

  /// Returns all available categories as a map
  static Map<String, List<String>> getAllCategories() => {
    'moods': moods,
    'contexts': contexts,
    'styles': styles,
  };

  /// Returns categories grouped by their primary characteristics
  static Map<String, Map<String, List<String>>> getCategorizedMoods() => {
    'positive': {
      'high_energy': ['happy', 'joyful', 'upbeat', 'euphoric', 'cheerful'],
      'low_energy': ['calm', 'peaceful', 'serene', 'relaxed', 'tranquil'],
    },
    'negative': {
      'high_energy': ['angry', 'rebellious', 'defiant', 'aggressive', 'fierce'],
      'low_energy': ['sad', 'melancholic', 'depressive', 'sorrowful', 'nostalgic'],
    },
    'neutral': {
      'romantic': ['romantic', 'sensual', 'intimate', 'passionate'],
      'atmospheric': ['dreamy', 'ethereal', 'atmospheric', 'mysterious'],
      'dark': ['dark', 'haunting', 'eerie'],
    },
  };
}