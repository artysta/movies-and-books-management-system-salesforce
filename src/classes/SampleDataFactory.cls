public class SampleDataFactory {
    public static void createAndInsertSampleRecords() {
        List<MBMS_Artist__c> artists = new List<MBMS_Artist__c>();
        List<MBMS_Movie__c> movies = new List<MBMS_Movie__c>();
        List<MBMS_Book__c> books = new List<MBMS_Book__c>();
        List<MBMS_Movie_Photo__c> moviePhotos = new List<MBMS_Movie_Photo__c>();
        List<MBMS_Movie_Actor__c> movieActors = new List<MBMS_Movie_Actor__c>();
        
        ArtistBuilder artistBuilder = new ArtistBuilder();
        MovieBuilder movieBuilder = new MovieBuilder();
        BookBuilder bookBuilder = new BookBuilder();
        MoviePhotoBuilder moviePhotoBuilder = new MoviePhotoBuilder();
        MovieActorBuilder movieActorBuilder = new MovieActorBuilder();
        
        // Artists.
        
        MBMS_Artist__c quentinTarantino = artistBuilder.create()
            .withFirstName('Quentin')
            .withLastName('Tarantino')
            .withBirthplace('Knoxville, Tennessee, U.S.')
            .withDateOfBirth(Date.newInstance(1963, 3, 27))
            .withDescription('Quentin Jerome Tarantino is an American filmmaker, film director, screenwriter, producer, film critic, and actor. His films are characterized by nonlinear storylines, dark humor, stylized violence, foot fetishism, extended dialogue, ensemble casts, references to popular culture, alternate history, and neo-noir.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_DIRECTOR, MBMS_Constants.MBMS_ROLE_ACTOR, MBMS_Constants.MBMS_ROLE_WRITER })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(quentinTarantino);
        
        MBMS_Artist__c jkRowling = artistBuilder.create()
            .withFirstName('Joanne')
            .withLastName('Rowling')
            .withBirthplace('Yate, Gloucestershire, England')
            .withDateOfBirth(Date.newInstance(1965, 7, 31))
            .withDescription('Joanne Rowling known by her pen name J. K. Rowling, is a British author, philanthropist, film producer, and screenwriter. She is the author of the Harry Potter series, which has won multiple awards and sold more than 500 million copies as of 2018, and became the best-selling book children\'s series in history in 2008.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_AUTHOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(jkRowling);
                
        MBMS_Artist__c umaThurman = artistBuilder.create()
            .withFirstName('Uma')
            .withLastName('Thurman')
            .withBirthplace('Boston, Massachusetts, U.S.')
            .withDateOfBirth(Date.newInstance(1970, 4, 29))
            .withDescription('Uma Karuna Thurman (born April 29, 1970) is an American actress, writer, producer and model. She has acted in a variety of films, from romantic comedies and dramas to science fiction and action films. Following her appearances on the December 1985 and May 1986 covers of British Vogue, Thurman\'s breakthrough role was Dangerous Liaisons (1988) in which she starred.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_ACTOR, MBMS_Constants.MBMS_ROLE_WRITER })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(umaThurman);
        
        MBMS_Artist__c jamesMangold = artistBuilder.create()
            .withFirstName('James')
            .withLastName('Mangold')
            .withBirthplace('New York City, U.S.')
            .withDateOfBirth(Date.newInstance(1963, 16, 12))
            .withDescription('James Mangold (born December 16, 1963) is an American film and television director, screenwriter and producer. He is best known for the films Cop Land (1997), Girl, Interrupted (1999), Walk the Line (2005), The Wolverine (2013) and Logan (2017), the last of which earned him a nomination for the Academy Award for Best Adapted Screenplay. He then directed and produced the sports drama film Ford v Ferrari (2019), which earned him a nomination for the Academy Award for Best Picture.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_WRITER, MBMS_Constants.MBMS_ROLE_DIRECTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(jamesMangold);
        
        MBMS_Artist__c winonaRyder = artistBuilder.create()
            .withFirstName('Winona')
            .withLastName('Ryder')
            .withBirthplace('Winona, Minnesota, U.S.')
            .withDateOfBirth(Date.newInstance(1971, 10, 29))
            .withDescription('Winona Laura Horowitz[1] (born October 29, 1971), known professionally as Winona Ryder, is an American actress. She is the recipient of several awards, including a Golden Globe Award, and has been nominated for two Academy Awards. She is known for taking on quirky roles in her earlier films, later playing more prominent roles in the 1990s.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_ACTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(winonaRyder);
        
        MBMS_Artist__c angelinaJolie = artistBuilder.create()
            .withFirstName('Angelina')
            .withLastName('Jolie')
            .withBirthplace('Los Angeles, California, U.S.')
            .withDateOfBirth(Date.newInstance(1975, 6, 4))
            .withDescription('Angelina Jolie (born June 4, 1975) is an American actress and filmmaker. The recipient of numerous accolades, including an Academy Award and three Golden Globe Awards, she has been named Hollywood\'s highest-paid actress multiple times.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_ACTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(angelinaJolie);
        
        MBMS_Artist__c leonardoDiCaprio = artistBuilder.create()
            .withFirstName('Leonardo ')
            .withLastName('DiCaprio')
            .withBirthplace('Los Angeles, U.S.')
            .withDateOfBirth(Date.newInstance(1974, 11, 11))
            .withDescription('Leonardo Wilhelm DiCaprio is an American actor and film producer. Known for his work in biopics and period films, DiCaprio is the recipient of numerous accolades, including an Academy Award, a British Academy Film Award, and three Golden Globe Awards. As of 2019, his films have grossed over $7.2 billion worldwide, and he has been placed eight times in annual rankings of the world\'s highest-paid actors. ')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_ACTOR, MBMS_Constants.MBMS_ROLE_WRITER })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(leonardoDiCaprio);
        
        MBMS_Artist__c christophWaltz = artistBuilder.create()
            .withFirstName('Christoph ')
            .withLastName('Waltz')
            .withBirthplace('Vienna, Austria')
            .withDateOfBirth(Date.newInstance(1956, 10, 4))
            .withDescription('Christoph Waltz (born 4 October 1956) is an Austrian and German actor. He is the recipient of numerous accolades, including two Academy Awards, two British Academy Film Awards, two Screen Actors Guild Awards, and two Golden Globe Awards. Since 2009, he has mainly been active in the United States.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_ACTOR, MBMS_Constants.MBMS_ROLE_DIRECTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(christophWaltz);
        
        MBMS_Artist__c bradPitt = artistBuilder.create()
            .withFirstName('Brad ')
            .withLastName('Pitt')
            .withBirthplace('Shawnee, Oklahoma, U.S.')
            .withDateOfBirth(Date.newInstance(1963 , 12, 8))
            .withDescription('William Bradley Pitt (born December 18, 1963) is an American actor and film producer. He is the recipient of numerous accolades, including an Academy Award, a British Academy Film Award, and two Golden Globe Awards for his acting, in addition to a second Academy Award, a second British Academy Film Award, a third Golden Globe Award, and a Primetime Emmy Award as a producer under his production company, Plan B Entertainment.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_ACTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(bradPitt);
        
        MBMS_Artist__c margotRobbie = artistBuilder.create()
            .withFirstName('Margot ')
            .withLastName('Robbie')
            .withBirthplace('Dalby, Queensland, Australia')
            .withDateOfBirth(Date.newInstance(1990 , 7, 2))
            .withDescription('Margot Elise Robbie (born 2 July 1990) is an Australian actress and producer. Known for her roles in blockbusters and independent films, she has received several accolades, in addition to nominations for two Academy Awards, three Golden Globe Awards, five Screen Actors Guild Awards and five British Academy Film Awards.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_ACTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(margotRobbie);
        
        MBMS_Artist__c martinScorsese = artistBuilder.create()
            .withFirstName('Martin ')
            .withLastName('Scorsese')
            .withBirthplace('New York City, U.S.')
            .withDateOfBirth(Date.newInstance(1942 , 11, 17))
            .withDescription('Martin Charles Scorsese (born November 17, 1942) is an American film director, producer, and screenwriter. Scorsese emerged as one of the major figures of the New Hollywood era, and he is widely regarded as one of the greatest and most influential directors in film history.')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_DIRECTOR, MBMS_Constants.MBMS_ROLE_WRITER, MBMS_Constants.MBMS_ROLE_ACTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(martinScorsese);
        
        MBMS_Artist__c terenceWinter = artistBuilder.create()
            .withFirstName('Terence')
            .withLastName('Winter')
            .withBirthplace('New York City, New York, U.S.')
            .withDateOfBirth(Date.newInstance(1960 , 10, 2))
            .withDescription('Terence Patrick Winter (born October 2, 1960) is an American writer and producer of television and film. He is the creator, writer, and executive producer of the HBO television series Boardwalk Empire (2010–14). Before creating Boardwalk Empire, Winter was a writer and executive producer for the HBO television series The Sopranos, from the show\'s second to sixth and final season (2000–2007).')
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_DIRECTOR, MBMS_Constants.MBMS_ROLE_WRITER })
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        artists.add(terenceWinter);
        
        insert artists;
        
        // Movies.
        
        MBMS_Movie__c killBillVolume1 = movieBuilder.create()
            .withTitle('Kill Bill: Volume 1')
            .withDescription('Kill Bill: Volume 1 is a 2003 American martial arts film written and directed by Quentin Tarantino. It stars Uma Thurman as the Bride, who swears revenge on a team of assassins (Lucy Liu, Michael Madsen, Daryl Hannah, and Vivica A. Fox) and their leader, Bill (David Carradine), after they try to kill her and her unborn child. Her journey takes her to Tokyo, where she battles the yakuza.')
            .withDirector(quentinTarantino)
            .withWriter(quentinTarantino)
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        movies.add(killBillVolume1);
        
        MBMS_Movie__c killBillVolume2 = movieBuilder.create()
            .withTitle('Kill Bill: Volume 2')
            .withDescription('Kill Bill: Volume 2 is a 2004 American neo Western martial arts film written and directed by Quentin Tarantino. It stars Uma Thurman as the Bride, who continues her campaign of revenge against the Deadly Viper Assassination Squad (Lucy Liu, Michael Madsen, Daryl Hannah, and Vivica A. Fox) and their leader Bill (David Carradine), who tried to kill her and her unborn child.')
            .withDirector(quentinTarantino)
            .withWriter(quentinTarantino)
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        movies.add(killBillVolume2);
        
        MBMS_Movie__c inglouriousBasterds = movieBuilder.create()
            .withTitle('Inglourious Basterds')
            .withDescription('Inglourious Basterds is a 2009 war film written and directed by Quentin Tarantino and starring Brad Pitt, Christoph Waltz, Michael Fassbender, Eli Roth, Diane Kruger, Daniel Brühl, Til Schweiger and Mélanie Laurent.')
            .withDirector(quentinTarantino)
            .withWriter(quentinTarantino)
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        movies.add(inglouriousBasterds);
        
        MBMS_Movie__c django = movieBuilder.create()
            .withTitle('Django Unchained')
            .withDescription('Django Unchained is a 2012 American western movie directed by Quentin Tarantino. It is set in 1858. It stars Jamie Foxx as Django, Christoph Waltz as Dr. King Schultz, and Leonardo DiCaprio as Calvin. This comedy-drama is about the Deep South. There has been controversy related to its subject matter. Django Unchained was released on Christmas 2012 in the United States.')
            .withDirector(quentinTarantino)
            .withWriter(quentinTarantino)
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        movies.add(django);
        
        MBMS_Movie__c girlInterrupted = movieBuilder.create()
            .withTitle('Girl, Interrupted')
            .withDescription('Girl, Interrupted is a 1999 American drama movie. The cast of the movie are Winona Ryder, Angelina Jolie, Brittany Murphy and Whoopi Goldberg. The story of the movie is about a young woman\'s 18 month stay on a mental ward in Pennsylvania in the late 1960s after taking a drug overdose.')
            .withDirector(jamesMangold)
            .withWriter(jamesMangold)
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        movies.add(girlInterrupted);
        
        MBMS_Movie__c onceUponATimeInHollywood = movieBuilder.create()
            .withTitle('Once Upon a Time in Hollywood')
            .withDescription('Once Upon a Time in Hollywood[a] is a 2019 comedy-drama film written and directed by Quentin Tarantino. Produced by Columbia Pictures, Bona Film Group, Heyday Films, and Visiona Romantica and distributed by Sony Pictures Releasing, it is a co-production between the United States, United Kingdom, and China. It features a large ensemble cast led by Leonardo DiCaprio, Brad Pitt, and Margot Robbie.')
            .withDirector(quentinTarantino)
            .withWriter(quentinTarantino)
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        movies.add(onceUponATimeInHollywood);
        
        MBMS_Movie__c theWolfOfWallStreet = movieBuilder.create()
            .withTitle('The Wolf of Wall Street')
            .withDescription('The Wolf of Wall Street is a 2013 American biographical crime black comedy film directed by Martin Scorsese and written by Terence Winter, based on the 2007 memoir by Jordan Belfort. It recounts Belfort\'s perspective on his career as a stockbroker in New York City and how his firm, Stratton Oakmont, engaged in rampant corruption and fraud on Wall Street, which ultimately led to his downfall.')
            .withDirector(martinScorsese)
            .withWriter(terenceWinter)
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        movies.add(theWolfOfWallStreet);
        
        insert movies;
        
        // Books.
        
        MBMS_Book__c harryPotter = bookBuilder.create()
            .withTitle('Harry Potter and the Philosopher\'s Stone')
            .withDescription('Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry.')
            .withArtist(jkRowling)
            .withCoverImageURL('https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        books.add(harryPotter);
        
        MBMS_Book__c harryPotter2 = bookBuilder.create()
            .withTitle('Harry Potter and the Chamber of Secrets')
            .withDescription('Harry Potter and the Chamber of Secrets is a fantasy novel written by British author J. K. Rowling and the second novel in the Harry Potter series. The plot follows Harry\'s second year at Hogwarts School of Witchcraft and Wizardry, during which a series of messages on the walls of the school\'s corridors warn that the "Chamber of Secrets" has been opened and that the "heir of Slytherin" would kill all pupils who do not come from all-magical families.')
            .withArtist(jkRowling)
            .withCoverImageURL('https://upload.wikimedia.org/wikipedia/en/5/5c/Harry_Potter_and_the_Chamber_of_Secrets.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        books.add(harryPotter2);
        
        MBMS_Book__c harryPotter3 = bookBuilder.create()
            .withTitle('Harry Potter and the Prisoner of Azkaban')
            .withDescription('Harry Potter and the Prisoner of Azkaban is a fantasy novel written by British author J. K. Rowling and is the third in the Harry Potter series. The book follows Harry Potter, a young wizard, in his third year at Hogwarts School of Witchcraft and Wizardry. Along with friends Ronald Weasley and Hermione Granger, Harry investigates Sirius Black, an escaped prisoner from Azkaban, the wizard prison, believed to be one of Lord Voldemort\'s old allies.')
            .withArtist(jkRowling)
            .withCoverImageURL('https://upload.wikimedia.org/wikipedia/en/a/a0/Harry_Potter_and_the_Prisoner_of_Azkaban.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        books.add(harryPotter3);
        
        insert books;
        
        // Movie Photos.

        MBMS_Movie_Photo__c moviePhoto1 = moviePhotoBuilder.create()
            .withName('Sample Photo 1')
            .withMovie(killBillVolume1)
            .withPhotoURL('https://cdn.pixabay.com/photo/2022/01/23/13/04/sparrow-6960807_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto1);
        
        MBMS_Movie_Photo__c moviePhoto2 = moviePhotoBuilder.create()
            .withName('Sample Photo 2')
            .withMovie(killBillVolume1)
            .withPhotoURL('https://cdn.pixabay.com/photo/2022/01/21/07/21/ring-tailed-lemur-6954076_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto2);
        
        MBMS_Movie_Photo__c moviePhoto3 = moviePhotoBuilder.create()
            .withName('Sample Photo 3')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2022/01/13/10/39/animal-6934928_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto3);
        
        MBMS_Movie_Photo__c moviePhoto4 = moviePhotoBuilder.create()
            .withName('Sample Photo 4')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2022/01/19/15/58/street-6950344_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto4);
        
        MBMS_Movie_Photo__c moviePhoto5 = moviePhotoBuilder.create()
            .withName('Sample Photo 5')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2021/04/26/20/53/nature-6209977_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto5);
        
        MBMS_Movie_Photo__c moviePhoto6 = moviePhotoBuilder.create()
            .withName('Sample Photo 6')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2021/09/13/08/18/blue-flower-6620619_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto6);
        
        MBMS_Movie_Photo__c moviePhoto7 = moviePhotoBuilder.create()
            .withName('Sample Photo 7')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2021/12/18/06/01/sunset-6878021_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto7);
        
        MBMS_Movie_Photo__c moviePhoto8 = moviePhotoBuilder.create()
            .withName('Sample Photo 8')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2022/01/17/06/38/altai-6943982_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto8);
        
        MBMS_Movie_Photo__c moviePhoto9 = moviePhotoBuilder.create()
            .withName('Sample Photo 9')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2022/01/21/17/04/bird-6955201_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto9);
        
        MBMS_Movie_Photo__c moviePhoto10 = moviePhotoBuilder.create()
            .withName('Sample Photo 10')
            .withMovie(killBillVolume2)
            .withPhotoURL('https://cdn.pixabay.com/photo/2021/12/23/13/25/flower-6889331_960_720.jpg')
            .withStatus(MBMS_Constants.MBMS_STATUS_INITIAL)
            .build();
        moviePhotos.add(moviePhoto10);
        
        insert moviePhotos;
        
        // Movie Actors.
        
        MBMS_Movie_Actor__c theBride = movieActorBuilder.create()
            .withActor(umaThurman)
            .withMovie(killBillVolume1)
            .withCharacterName('Beatrix Kiddo;The Bride;Black Mamba')
            .build();
        movieActors.add(theBride);
        
        MBMS_Movie_Actor__c theBride2 = movieActorBuilder.create()
            .withActor(umaThurman)
            .withMovie(killBillVolume2)
            .withCharacterName('Beatrix Kiddo;The Bride;Black Mamba')
            .build();
        movieActors.add(theBride2);
        
        MBMS_Movie_Actor__c susannaKaysen = movieActorBuilder.create()
            .withActor(winonaRyder)
            .withMovie(girlInterrupted)
            .withCharacterName('Susanna Kaysen')
            .build();
        movieActors.add(susannaKaysen);
        
        MBMS_Movie_Actor__c lisaRowe = movieActorBuilder.create()
            .withActor(angelinaJolie)
            .withMovie(girlInterrupted)
            .withCharacterName('Lisa Rowe')
            .build();
        movieActors.add(lisaRowe);
        
        MBMS_Movie_Actor__c calvinCandie = movieActorBuilder.create()
            .withActor(leonardoDiCaprio)
            .withMovie(django)
            .withCharacterName('Calvin Candie')
            .build();
        movieActors.add(calvinCandie);
        
        MBMS_Movie_Actor__c drKingSchultz = movieActorBuilder.create()
            .withActor(christophWaltz)
            .withMovie(django)
            .withCharacterName('Dr King Schultz')
            .build();
        movieActors.add(drKingSchultz);
        
        MBMS_Movie_Actor__c hansLanda = movieActorBuilder.create()
            .withActor(christophWaltz)
            .withMovie(inglouriousBasterds)
            .withCharacterName('Hans Landa')
            .build();
        movieActors.add(hansLanda);
        
        MBMS_Movie_Actor__c aldoRaine = movieActorBuilder.create()
            .withActor(bradPitt)
            .withMovie(inglouriousBasterds)
            .withCharacterName('Aldo Raine')
            .build();
        movieActors.add(aldoRaine);
        
        MBMS_Movie_Actor__c rickDalton = movieActorBuilder.create()
            .withActor(leonardoDiCaprio)
            .withMovie(onceUponATimeInHollywood)
            .withCharacterName('Rick Dalton')
            .build();
        movieActors.add(rickDalton);
        
        MBMS_Movie_Actor__c cliffBooth = movieActorBuilder.create()
            .withActor(bradPitt)
            .withMovie(onceUponATimeInHollywood)
            .withCharacterName('Cliff Booth')
            .build();
        movieActors.add(cliffBooth);
        
        MBMS_Movie_Actor__c sharonTate = movieActorBuilder.create()
            .withActor(margotRobbie)
            .withMovie(onceUponATimeInHollywood)
            .withCharacterName('Sharon Tate')
            .build();
        movieActors.add(sharonTate);
        
        MBMS_Movie_Actor__c jordanBelfort = movieActorBuilder.create()
            .withActor(leonardoDiCaprio)
            .withMovie(theWolfOfWallStreet)
            .withCharacterName('Jordan Belfort')
            .build();
        movieActors.add(jordanBelfort);
        
        MBMS_Movie_Actor__c naomiLapaglia = movieActorBuilder.create()
            .withActor(margotRobbie)
            .withMovie(theWolfOfWallStreet)
            .withCharacterName('Naomi Lapaglia')
            .build();
        movieActors.add(naomiLapaglia);

        insert movieActors;
    }
    
    public static void removeAllRecords() {
        delete [SELECT Id FROM MBMS_Artist__c];
        delete [SELECT Id FROM MBMS_Movie__c];
        delete [SELECT Id FROM MBMS_Book__c];
        delete [SELECT Id FROM MBMS_Movie_Photo__c];
        delete [SELECT Id FROM MBMS_Movie_Actor__c];
    }
}