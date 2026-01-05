echo "=== RESET DATABASE ==="
python manage.py flush --no-input

echo "=== MIGRATE ==="
python manage.py migrate

echo "=== INSERT SAMPLE DATA ==="
python manage.py shell <<EOF
from courses.models import Category, Course, Tag, Lesson

c1 = Category.objects.create(name='Software Engineering')
c2 = Category.objects.create(name='Artificial Intelligence')
c3 = Category.objects.create(name='Data Sciences')

co1 = Course.objects.create(subject='Introduction to SE', description='demo', image='https://res.cloudinary.com/dxxwcby8l/image/upload/v1709565062/rohn1l6xtpxedyqgyncs.png', category=c1)
co2 = Course.objects.create(subject='Software Testing', description='demo', image='https://res.cloudinary.com/dxxwcby8l/image/upload/v1709565062/rohn1l6xtpxedyqgyncs.png', category=c1)

t1 = Tag.objects.create(name='techniques')
t2 = Tag.objects.create(name='software')

l1 = Lesson.objects.create(subject='SE Overview', content='Demo', image='https://res.cloudinary.com/dxxwcby8l/image/upload/v1709565062/rohn1l6xtpxedyqgyncs.png', course=co1)
l1.tags.set([t1, t2])

print("✅ Done")
EOF