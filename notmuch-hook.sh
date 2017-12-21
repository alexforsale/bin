#!/bin/sh
notmuch new

# retag all "new" messages "inbox" and "unread"
notmuch tag +inbox -new -- tag:new

# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -new -inbox +sent -- from:alexforsale@yahoo.com or from:christian.alexander@windowslive.com or from:alexarians@gmail.com or from:christian.alexander@ymail.com or from:christian.alexander@rocketmail.com or from:elasrofxela.alexander@yahoo.co.id or from:elasrofxela.alexander@gmail.com

# tag newsletters, but dont show them in inbox
notmuch tag +newsletter -inbox -unread -new -- from:*@*.kaskusnetworks.com
notmuch tag +newsletter -inbox -unread -new -- from:noreply*@plus.google.com
notmuch tag +newsletter -inbox -unread -new -- from:notification*@facebookmail.com
notmuch tag +newsletter -inbox -unread -new -- from:notification@newsletters.ello.co
notmuch tag +newsletter -inbox -unread -new -- from:no-reply@twitch.tv
notmuch tag +newsletter -inbox -unread -new -- from:info@mapmyfitness*
notmuch tag +newsletter -inbox -unread -new -- from:*@geocaching.com
notmuch tag +newsletter -inbox -unread -new -- from:*@umanoapp.com
notmuch tag +newsletter -inbox -unread -new -- from:*@*vimeo.com
notmuch tag +newsletter -inbox -unread -new -- from:*@mentor.com
notmuch tag +newsletter -inbox -unread -new -- from:info@*runkeeper.com
notmuch tag +newsletter -inbox -unread -new -- from:*@*qualcomm.com
notmuch tag +newsletter -inbox -unread -new -- from:news@sonymobileemail.com
notmuch tag +newsletter -inbox -unread -new -- from:*@*themonroeinstitute.org
notmuch tag +newsletter -inbox -unread -new -- from:*@*quoramail.com
notmuch tag +newsletter -inbox -unread -new -- from:*@*quora.com
notmuch tag +newsletter -inbox -unread -new -- from:*@flipboard.com
notmuch tag +newsletter -inbox -unread -new -- from:*@*underarmour.com
notmuch tag +newsletter -inbox -unread -new -- from:newsletters@androidcentral.com
notmuch tag +newsletter -inbox -unread -new -- from:*@yahoogroups.com
notmuch tag +newsletter -inbox -unread -new -- from:newsletter@twitter.com
notmuch tag +newsletter -inbox -unread -new -- from:connections@twitter.com
notmuch tag +newsletter -inbox -unread -new -- from:*@spotify.com
notmuch tag +newsletter -inbox -unread -new -- from:*@uber.com
notmuch tag +newsletter -inbox -unread -new -- from:*@*.headspace.com
notmuch tag +newsletter -inbox -unread -new -- from:*@meetup.com
notmuch tag +newsletter -inbox -unread -new -- from:*@grab.com
notmuch tag +newsletter -inbox -unread -new -- from:info@news.runtastic.com

# mailing lists
notmuch tag +id_android -unread -new -- from:id-android@googlegroups.com
notmuch tag +arch-general -unread -new -- subject:[arch-general]*
notmuch tag +gnupg-users -unread -new -- to:gnupg-users@gnupg.org

# tag important
notmuch tag +important -- from:no-reply@accounts.google.com
notmuch tag +important -- from:no-reply@cc.yahoo-inc.com
notmuch tag +important -- from:no-reply@facebookmail.com
notmuch tag +important -- from:no-reply@github.com
notmuch tag +important -- from:notify@keybase.io

# logs
notmuch tag +logs -unread -new -- subject:Cron" "*

# jobs
notmuch tag +jobs -unread -new -- from:*@jobs*.*
notmuch tag +jobs -unread -new -- from:*@karir.com

# spam
notmuch tag +spam +delete -unread -new -- from:*@linkrefferal.com
notmuch tag +spam +delete -unread -new -- from:*@fancy.com
notmuch tag +spam +delete -unread -new -- from:*@*webhost.com
notmuch tag +spam +delete -unread -new -- from:*@meetic.com

# mystuffs
notmuch tag +github -unread -- from:notification@github.com
notmuch tag +wordpress -unread -- from:comment-reply@wordpress.com
notmuch tag +edx +newsletter-unread -- from:news@edx.org

# family
notmuch tag +family -unread -- from:lyndhalexander*
