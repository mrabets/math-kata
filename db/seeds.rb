# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!({
                      name: 'Admin',
                      email: 'admin@gmail.com',
                      password: 'password',
                      password_confirmation: 'password',
                      superadmin_role: true
                    })

Subject.create!([{
                  name: 'Geometry'
                },
                 {
                   name: 'Algebra'
                 },
                 {
                   name: 'Arithmetic'
                 },
                 {
                   name: 'Trigonometry'
                 },
                 {
                   name: 'Calculus'
                 },
                 {
                   name: 'Logic'
                 },
                 {
                   name: 'Number theory'
                 },
                 {
                   name: 'Computer Science'
                 },
                 {
                   name: 'Cryptography'
                 },
                 {
                   name: 'Probability theory'
                 }])

task = Task.new(
  title: 'The perimeter of triangle',
  answers: '20;20.0',
  user_id: user.id,
  subject: 'Geometry',
  condition: '<div class="trix-content"> <div>A triangle has a <em>perimeter</em> of 50. If 2 of its sides are <strong>equal</strong> and the third side is 5 more than the equal sides.<br><br> </div><div><action-text-attachment content-type="image" url="https://www.onlinemathlearning.com/image-files/geometry-problem-triangle-1.gif" width="168" height="111" caption="Perimeter of triangle"><figure class="attachment attachment--preview"> <img width="168" height="111" src="https://www.onlinemathlearning.com/image-files/geometry-problem-triangle-1.gif"> <figcaption class="attachment__caption"> Perimeter of triangle </figcaption> </figure></action-text-attachment></div><div> <br>What is the length of the third <strong><em>side</em></strong>?</div> </div>'
)
task.tag_list.add(%w[basic figures])
task.save

task = Task.new(
  title: 'Solve the equation',
  answers: '0=0;0.0=0.0',
  user_id: user.id,
  subject: 'Algebra',
  condition: '<div class="trix-content"> <div>Given the equation:<br><br> </div><blockquote><em>5 (- 3 x - 2) - (x - 3) = - 4 (4 x + 5) + 13</em></blockquote> </div>'
)
task.tag_list.add(%w[code basic])
task.save

task = Task.new(
  title: 'The Birch and Swinnerton-Dyer Conjecture',
  answers: '1',
  user_id: user.id,
  subject: 'Calculus',
  condition: '<div class="trix-content"> <div> <action-text-attachment content-type="image" url="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/436px-bsd-data-plot-for-elliptic-curve-800h1-svg-1569527124.png?crop=1xw:1xh;center,top&amp;resize=480:*" width="436" height="296"><figure class="attachment attachment--preview"> <img width="436" height="296" src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/436px-bsd-data-plot-for-elliptic-curve-800h1-svg-1569527124.png?crop=1xw:1xh;center,top&amp;resize=480:*"> </figure></action-text-attachment><br>The <a href="https://www.claymath.org/millennium-problems/birch-and-swinnerton-dyer-conjecture">Birch and Swinnerton-Dyer Conjecture</a> is another of the six unsolved Millennium Prize Problems, and it\'s the only other one we can remotely describe in plain English. This Conjecture involves the math topic known as Elliptic Curves.<br><br> </div><div>When we recently <a href="https://www.popularmechanics.com/science/math/g29008356/hard-math-problems/">wrote about the toughest math problems that have been solved</a>, we mentioned one of the greatest achievements in 20th-century math: the solution to Fermat\'s Last Theorem. Sir Andrew Wiles solved it using Elliptic Curves. So, you could call this a very powerful new branch of math.<br><br> </div><div>In a nutshell, an elliptic curve is a special kind of function. They take the unthreatening-looking form y²=x³+ax+b. It turns out functions like this have certain properties that cast insight into math topics like Algebra and Number Theory.</div><div> <br>British mathematicians Bryan Birch and Peter Swinnerton-Dyer developed their conjecture in the 1960s. Its exact statement is very technical, and has evolved over the years. One of the main stewards of this evolution has been none other than Wiles. To see its current status and complexity, check out <a href="http://www.claymath.org/sites/default/files/birchswin.pdf">this famous update</a> by Wells in 2006.<br><br><br> </div> </div>'
)
task.tag_list.add(['high level', 'hard', 'code'])
task.save

tags = %w[code basic figures hard easy long]

5.times do
  task = Task.new(
    title: Faker::Lorem.sentence(word_count: 5, random_words_to_add: 4),
    answers: '5;5.1;4.9',
    user_id: user.id,
    subject: Subject.all.sample.name,
    condition: " <div class='trix-content'> #{Faker::Lorem.paragraph(sentence_count: rand(7..20))} </div>"
  )
  task.tag_list.add(tags.sample(2))
  task.save
end
