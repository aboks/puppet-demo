Dit is de Puppet-demo zoals gebruikt bij de presentatie voor Moxio op
de _Derde Dinsdag_ in maart 2014.

# Gebruik

Deze demo bestaat uit een VM waarin een serie Puppet-manifests kan worden
toegepast. Deze VM wordt dynamisch opgebouwd uit een Vagrantfile en de
Puppet-configuratie in `/bootstrap`.

## Vereisten

Het draaien van de demo-VM vereist de volgende software op de host-computer:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/downloads)
* Een SSH-client

Een 32-bits host heeft mogelijk problemen met een 64-bits guest; een 64-bits
computer is daarom aan te raden.

## Starten

Draai in de root van deze repository:

    $ vagrant up

Dit kan de eerste keer vrij lang duren omdat de image van de _basebox_ nog moet
worden gedownload. Vervolgens SSH je naar de demo-VM met

	$ vagrant ssh

Als dat niet werkt onder Windows kun je eventueel de instructies onder _"Using
Microsoft Windows?"_ op de
[Vagrant-documentatie](http://docs-v1.vagrantup.com/v1/docs/getting-started/ssh.html)
volgen.

## Demo-time!

Om de demo nog een keer te draaien switch je eerst naar de `root`-user

	$ sudo -s

en ga je vervolgens naar de directory waarin de manifests staan:

	$ cd ~/demo

Elk van de manifests in de `demo`-directory kun je draaien met:

	$ puppet apply <manifest>

Enkele hiervan hangen van elkaar af, dus het is aanbevolen ze in de gegeven
volgorde te draaien. Het toepassen van de manifest `10_server.pp` vereist
een `modulepath`:

	$ puppet apply --modulepath=modules 10_server.pp

## Uitproberen

Probeer zelf eens wat uit. De `~/demo`-directory is een symlink naar de
`demo`-directory in deze repository, dus je kunt gewoon op je host-PC
manifests wijzigen of toevoegen. Denk eraan: het is een VM, dus er kan
niets fout gaan.

## Klaar?

Gebruik tweemaal

	$ exit

om je `root`- en SSH-sessie te beeindigen. Vervolgens kun je je VM verwijderen
met:

	$ vagrant destroy
