<h1>Overview:<h1>
<p>TweetTracker enables users to detect tweets by keywords in any city they want to. TweetTracker records all tweets by city and compares and allows users to compare tweet data. The city and keywords to detect can be specified in the db/seed.rb file.</p>

<h2>Mechanics</h2>
<p>TweetTracker uses the Twitter API to listen to tweets from whatever cities
are specified in the seeds.rb file. TweetTracker does this by creating a new
thread for every city included and dedicating that thread to listening for
tweets from that respective city using Twitter API. All tweets detected are then
filtered for the keywords specified in the seeds.rb file. For every time a
keyword is present in a tweet the count of that keyword is incremented in Redis.</p>

<h2>How to run</h2>
<ol>
  <li>redis-serve</li>
  <li>rake db:create db:migrate db:seed</li>
  <li>rails s</li>
  <li>rake twitter:stream</li>
</ol>
