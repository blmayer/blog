<!DOCTYPE html>
<html lang="en">
<head>
	<style>
		{{posts.css}}
	</style>
</head>

<body>
	<h2><a name="choosing linux">my story choosing a linux distro</a></h2>
	<p>
		I started using linux when I was 13/14 yo, can't remember exactly,
		and my HP notebook, with Windows XP, had a BSOD. I was tired of having
		to install drivers, and many programs by going in their website and
		downloading then, also, anti-virus was boring, and time to time I had
		to wipe the HD and start clean because the system was very slow.
	</p>
	<p>
		So I remember I googled "free operating system", and that's how I heard
		about linux for the first time. So I started installing distros in my
		machine. The problem at the time was the internet connection, it was
		slow, and I had to connect using PPPOE because that was the internet
		service I had in my house. And this alone made many distros to not
		work for me, since I could not connect to the internet, I had to find
		another distro.
	</p>
	<p>
		I tried debian, knoppix, fedora, mandriva, sabayon (had a beautifull
		interface), big linux, open suse, gentoo; but I used then only a
		little. I could only explore what they installed from the live CD,
		and if I could'nt find the pppoe setting I had to uninstall it and
		go to the next distro. I had very limited knowledge on how a linux
		system worked, and which programs came in the live CD, at that time
		the website I accessed the most was problably
		<a href="//distrowatch.com/">distro watch</a>.
	</p>
	<h3>First usable distro</h3>
	<p>
		Things changed when I installed Mepis linux, it had an easy way to
		setup the internet. So I could connect using cable and browse
		the internet.
	</p>
	<figure>
		<img src="//upload.wikimedia.org/wikipedia/commons/6/68/Mepis11.png">
		<figcaption>
			Mepis Linux desktop. By Treize1101 - Own work, CC BY-SA
			3.0
		</figcaption>
	</figure>
	<p>
		So I explored it, first thing I did was learn to install
		packages, if you're new to linux, one of the best things
		about it is package management, and Mepis was debian based.
		So I learned how to do a <tt>sudo apt-get install [pack]</tt>
		and installed <a href="//en.wikipedia.org/wiki/Compiz">
		compiz</a>. But then I wanted my wifi chip to work, I was
		using cable and that's inconvenient, thus, I starred at another
		problem: wifi support and proprietary drivers.
	</p>
	<p>
		So my piece of advice so far for choosing a linux distro is:
		<ul>
			<li>
				Check if it already comes with the minimum to
				get you started, that means, a way to connect
				to the internet, and ease to install/setup new
				things.
			</li>
			<li>
				Take a look at the distro's repositories to
				see if it contains the majority of the
				software you need. Sometimes is hard to get
				software installed outside the conventional
				way.
			</li>
		</ul>

		Nowadays things seem better, at least for wifi card support,
		but buying a laptop 100% linux compatible was something
		almost impossible 15 years ago.
	</p>
	<h3>Hardware support</h3>
	<p>
		At that time wifi chips, like my Broadcom BCM4312, were new
		and drivers were hard to find, my option was to use the
		windows driver with <tt>ndiswrapper</tt>, and that was
		complicated for me. There was a website dedicated to gathering
		info on wireless cards support on linux, it has changed a
		little sinc: <a href="//wireless.wiki.kernel.org">
		linux wireless</a>. And that helped me a lot setting up my
		Broadcom card.
	</p>
	<p>
		Another issue was my nvidia card, it was a GeForce 6200,
		really good card, but the only decent driver was the
		proprietary nvidia driver, which I had to head over to
		the website, download some weird file and execute it. It
		sometimes failed to install, and I had to use the distro
		without 3d acceleration support, at that time the <em>
		nouveau</em> driver was giving its first steps, so no 3d
		support, and poor 2d performance. I think it really evolved
		from that time but I'm not sure if it is good for gaming today.
		I remember accessing <a href="//www.phoronix.com"> phoronix</a>
		very oftenly, anxious for benchmarks on the newest driver,
		Michael Larabel deserves my kudos for all the incredible work he
		has been doing, and still does, for the linux, open-source
		and benchmarking comunities.
	</p>
	<h3>Ubuntu</h3>
	<p>
		Fortunately <a href="//ubuntu.com">Ubuntu</a> came next and
		solved both problems for me, it had the network manager applet
		that worked like a charm, and the proprietary drivers menu was
		easy to configure and add the nvidia driver, but after
		installing I had some issues with the splash screen, no big
		deal. I could even play gnome games which came pre-installed
		and Counter Strike using Wine!
	</p>
	<p>
		That distro also had some quirks, it was unstable, sometimes
		I broke my system by installing/updating packages, I was doing
		all sorts of things with it, and had to reinstall it using the
		CD I bought on a newspaper post. My real problem with ubuntu
		was upgrading it, it was easy to break by doing a version
		upgrade, it still is. I was enjoying using ubuntu, but
		sometimes it pissed me off with outdated software, I needed
		some new software, like wine, drivers, and ubuntu didn't have
		the newest versions. So take this into account when choosing
		your distro, debian packages are much more stable and updated
		less frequently, hence, debian and debian based distros often
		contain packages that are slightly outdated. If you need
		bleeding edge software without having to upgrade the whole
		system, like me, you may want to use a rolling release distro.
	</p>
	<p>
		So I went to google again, and searched: rolling release distro,
		guess what I found...
	</p>
	<h3>Arch linux</h3>
	<p>
		<a href="//archlinux.org">Arch</a> has a difficult installer,
		it is text based, and it makes you choose the software. I had
		to start over a couple of times because I missed some important
		packages. It uses the <tt>pacman</tt> package manager (great
		name), which I think is simply incredible. The good part is
		that I learned a lot about how a linux system works, how to
		configure it and what it needed to run. I really miss the BSD
		style init, now it uses systemd, sadly. The best part about it
		are the <a href="//wiki.archlinux.org">wiki pages</a>, which
		are really great and complete, also arch has the AUR, archlinux
		user repository, which contains packages submitted by users.
		I always find the packages I need there.
	</p>
	<p>
		The only bad thing is that it not user friendly, so most
		users do not use it, it comes with the bare minimum (I like
		it), and lets you choose what to install next. Almost all
		configuration must be done by hand, and that includes you
		learning it, so it becomes tedious to use. There are some
		archlinux based distros which may help on this, so you may
		want to check them out, I'll stick with arch, for now.
	</p>
	<h3>Final remarks</h3>
	<p>
		To sum it up, my two cents on what take into account when
		choosing a linux distro is, the previous points, plus:

		<ul>
			<li>Sane defaults (not really necessary, but good)</li>
			<li>Easy to configure and custom</li>
			<li>
				Has the software that you need, and is easy
				to install software that is not on the repos
			</li>
			<li>
				Also consider that not all software you use
				has a version for linux, check if there is
				a good alternative even before switching from
				other OS, like Windows or MacOS.
			</li>
		</ul>

		I think that having those will make it easier for a user to
		use its system and build upon it, customize and have a great
		experience, what makes it different from this on is a matter
		of choice of software.
	</p>
	<p>
		And if nothing really pleases you, consider rolling your own
		distro, or building <a href="//www.linuxfromscratch.org">
		lfs</a>. I already tried it and it was a great trip, this is,
		IMHO, the ultimate way to learn how a linux system works. And
		it does not end here, you can try something totally different
		too, like a 
		<a href="//en.wikipedia.org/wiki/Berkeley_Software_Distribution">
		BSD</a>.
	</p>
</body>

</html>
