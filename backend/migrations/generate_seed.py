import random
import uuid

types = ['truth', 'dare']
categories = ['lite', 'medium', 'spicy', 'creative']

truths = [
    "What's your biggest fear?", "Who was your first crush?", "What's the most embarrassing thing you've done?",
    "Have you ever lied to get out of trouble?", "What's a secret you've never told anyone?",
    "What is your silliest pet peeve?", "If you could change one thing about yourself, what would it be?",
    "When was the last time you cried?", "What's your biggest regret?", "What is your guilty pleasure?"
]

dares = [
    "Send a message to your crush.", "Do 20 pushups.", "Send a funny selfie.",
    "Sing a song and send a voice note.", "Let the other person choose a dare for you.",
    "Describe what you are wearing right now.", "Tell a joke.", "Act like a monkey for 30 seconds.",
    "Show the last photo you took.", "Draw something blindfolded and share the result."
]

with open('004_seed_questions.sql', 'w') as f:
    f.write('INSERT INTO questions (id, type, category, body, is_approved, usage_count) VALUES\n')
    values = []
    for _ in range(200):
        t = random.choice(types)
        c = random.choice(categories)
        if t == 'truth':
            body = random.choice(truths) + f" (Var {random.randint(1, 1000)})"
        else:
            body = random.choice(dares) + f" (Var {random.randint(1, 1000)})"
        values.append(f"('{uuid.uuid4()}', '{t}', '{c}', '{body.replace(\"'\", \"''\")}', true, 0)")
    f.write(',\n'.join(values) + ';\n')
