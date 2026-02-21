import 'dart:math';

class BhagwatGitaAPI {
  static final List<Map<String, dynamic>> _verses = [
    {
      'chapter': 2,
      'verse': 47,
      'slok': 'कर्मण्येवाधिकारस्ते मा फलेषु कदाचन। मा कर्मफलहेतुर्भूर्मा ते सङ्गोऽस्त्वकर्मणि॥',
      'transliteration': 'karmaṇy-evādhikāras te mā phaleṣhu kadāchana mā karma-phala-hetur bhūr mā te saṅgo \'stv akarmaṇi',
      'tej': {
        'author': 'Swami Tejomayananda',
        'ht': 'आपका कर्म करने में अधिकार है, लेकिन कर्म के फल में कभी नहीं। आप कर्मफल के हेतु न बनें और आपकी अकर्म में भी आसक्ति न हो।'
      },
      'siva': {
        'author': 'Swami Sivananda',
        'et': 'You have a right to perform your prescribed duty, but do not expect the fruits of action. Never consider yourself the cause of the results of your activities, and never be attached to not doing your duty.'
      }
    },
    {
      'chapter': 18,
      'verse': 66,
      'slok': 'सर्वधर्मान्परित्यज्य मामेकं शरणं व्रज। अहं त्वां सर्वपापेभ्यो मोक्षयिष्यामि मा शुचः॥',
      'transliteration': 'sarva-dharmān parityajya mām ekaṁ śharaṇaṁ vraja ahaṁ tvāṁ sarva-pāpebhyo mokṣhayiṣhyāmi mā śhuchaḥ',
      'tej': {
        'author': 'Swami Tejomayananda',
        'ht': 'सभी धर्मों को त्यागकर केवल मेरी शरण में आओ। मैं तुम्हें सभी पापों से मुक्त कर दूँगा, शोक न करो।'
      },
      'siva': {
        'author': 'Swami Sivananda',
        'et': 'Abandon all varieties of religion and just surrender unto Me. I shall deliver you from all sinful reactions. Do not fear.'
      }
    }
    ,
    {
      "chapter": 1,
      "verse": 2,
      "slok": "सञ्जय उवाच | दृष्ट्वा तु पाण्डवानीकं व्यूढं दुर्योधनस्तदा | आचार्यमुपसङ्गम्य राजा वचनमब्रवीत् ||",
      "transliteration": "sañjaya uvāca dṛṣṭvā tu pāṇḍavānīkaṁ vyūḍhaṁ duryodhanas tadā ācāryam upasaṅgamya rājā vacanam abravīt",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "संजय ने कहा - उस समय राजा दुर्योधन ने व्यूहरचना में खड़ी पाण्डवों की सेना को देखकर, आचार्य द्रोण के पास जाकर यह वचन कहा।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Sanjaya said: Having seen the army of the Pandavas drawn up in battle array, King Duryodhana then approached his teacher (Drona) and spoke these words."
      }
    },
    {
      "chapter": 1,
      "verse": 3,
      "slok": "पश्यैतां पाण्डुपुत्राणामाचार्य महतीं चमूम् | व्यूढां द्रुपदपुत्रेण तव शिष्येण धीमता ||",
      "transliteration": "paśyaitāṁ pāṇḍu-putrāṇām ācārya mahatīṁ camūm vyūḍhāṁ drupada-putreṇa tava śiṣyeṇa dhīmatā",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे आचार्य! आपके बुद्धिमान शिष्य द्रुपदपुत्र द्वारा व्यूहरचना की गई पाण्डुपुत्रों की इस विशाल सेना को देखिए।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Behold, O Teacher, this mighty army of the sons of Pandu, arrayed by the son of Drupada, thy wise disciple."
      }
    },
    {
      "chapter": 1,
      "verse": 4,
      "slok": "अत्र शूरा महेष्वासा भीमार्जुनसमा युधि | युयुधानो विराटश्च द्रुपदश्च महारथः ||",
      "transliteration": "atra śūrā maheṣv-āsā bhīmārjuna-samā yudhi yuyudhāno virāṭaś ca drupadaś ca mahā-rathaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "इस सेना में भीम और अर्जुन के समान युद्ध करने वाले महाधनुर्धर शूरवीर, सात्यकि, विराट तथा महारथी द्रुपद हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Here are heroes, mighty archers, equal in battle to Bhima and Arjuna: Yuyudhana, Virata and Drupada, of the great car."
      }
    },
    {
      "chapter": 1,
      "verse": 5,
      "slok": "धृष्टकेतुश्चेकितानः काशिराजश्च वीर्यवान् | पुरुजित्कुन्तिभोजश्च शैब्यश्च नरपुङ्गवः ||",
      "transliteration": "dhṛṣṭaketuś cekitānaḥ kāśirājaś ca vīryavān purujit kunti-bhojaś ca śaibyaś ca nara-puṅgavaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "धृष्टकेतु, चेकितान और पराक्रमी काशिराज तथा पुरुजित, कुन्तिभोज और मनुष्यों में श्रेष्ठ शैब्य भी हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Dhrishtaketu, Chekitana and the valiant king of Kasi, Purujit and Kuntibhoja and Saibya, the best of men."
      }
    },
    {
      "chapter": 2,
      "verse": 1,
      "slok": "सञ्जय उवाच | तं तथा कृपयाविष्टमश्रुपूर्णाकुलेक्षणम् | विषीदन्तमिदं वाक्यमुवाच मधुसूदनः ||",
      "transliteration": "sañjaya uvāca taṁ tathā kṛpayāviṣṭam aśru-pūrṇākulekṣaṇam viṣīdantam idaṁ vākyam uvāca madhusūdanaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "संजय ने कहा - इस प्रकार करुणा से व्याकुल, आँसुओं से पूर्ण नेत्रों वाले तथा शोकयुक्त अर्जुन से भगवान् श्रीकृष्ण ने यह वचन कहा।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Sanjaya said: To him who was thus overcome with pity and dejection, whose eyes were filled with tears and agitated, Madhusudana (Krishna) spoke these words."
      }
    },
    {
      "chapter": 2,
      "verse": 2,
      "slok": "श्रीभगवानुवाच | कुतस्त्वा कश्मलमिदं विषमे समुपस्थितम् | अनार्यजुष्टमस्वर्ग्यमकीर्तिकरमर्जुन ||",
      "transliteration": "śrī-bhagavān uvāca kutas tvā kaśmalam idaṁ viṣame samupasthitam anārya-juṣṭam asvargyam akīrti-karam arjuna",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "श्री भगवान् ने कहा - हे अर्जुन! इस विषम स्थिति में तुम्हें यह मोह कहाँ से प्राप्त हुआ? यह न तो आर्यों द्वारा आचरित है, न स्वर्ग प्राप्ति का साधन है और न कीर्तिदायक ही है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The Blessed Lord said: Whence has this dejection come to you at this perilous hour? It is unknown to Aryas (noble souls), gives no power to heaven and causes disgrace, O Arjuna."
      }
    },
    {
      "chapter": 2,
      "verse": 3,
      "slok": "क्लैब्यं मा स्म गमः पार्थ नैतत्त्वय्युपपद्यते | क्षुद्रं हृदयदौर्बल्यं त्यक्त्वोत्तिष्ठ परन्तप ||",
      "transliteration": "klaibyaṁ mā sma gamaḥ pārtha naitat tvayy upapadyate kṣudraṁ hṛdaya-daurbalyaṁ tyaktvottiṣṭha paran-tapa",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे पार्थ! कायरता को मत प्राप्त हो। यह तुम्हें शोभा नहीं देता। हे परंतप! हृदय की इस तुच्छ दुर्बलता को त्यागकर युद्ध के लिए खड़े हो जाओ।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Yield not to impotence, O Partha! It does not befit you. Cast off this mean weakness of heart! Stand up, O scorcher of enemies!"
      }
    },
    {
      "chapter": 2,
      "verse": 4,
      "slok": "अर्जुन उवाच | कथं भीष्ममहं सङ्ख्ये द्रोणं च मधुसूदन | इषुभिः प्रतियोत्स्यामि पूजार्हावरिसूदन ||",
      "transliteration": "arjuna uvāca kathaṁ bhīṣmam ahaṁ saṅkhye droṇaṁ ca madhusūdana iṣubhiḥ pratiyotsyāmi pūjārhāv ari-sūdana",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "अर्जुन ने कहा - हे मधुसूदन! मैं रणभूमि में किस प्रकार बाणों से भीष्म और द्रोण के विरुद्ध युद्ध करूँगा? हे अरिसूदन! वे दोनों तो पूजनीय हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Arjuna said: How shall I fight Bhishma and Drona in battle with arrows, O Madhusudana (Krishna), for they are worthy of worship, O destroyer of enemies?"
      }
    },
    {
      "chapter": 2,
      "verse": 20,
      "slok": "न जायते म्रियते वा कदाचिन्नायं भूत्वा भविता वा न भूयः। अजो नित्यः शाश्वतोऽयं पुराणो न हन्यते हन्यमाने शरीरे॥",
      "transliteration": "na jāyate mriyate vā kadācin nāyaṁ bhūtvā bhavitā vā na bhūyaḥ ajo nityaḥ śāśvato 'yaṁ purāṇo na hanyate hanyamāne śarīre",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "आत्मा का न जन्म होता है और न मृत्यु। यह न तो कभी जन्म लेकर फिर मरने वाला है और न मरकर फिर जन्म लेने वाला है। यह अजन्मा, नित्य, शाश्वत और पुरातन है। शरीर के नाश होने पर भी यह नष्ट नहीं होता।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The soul is never born nor does it die; nor having once existed, does it ever cease to be. The soul is unborn, eternal, ever-existing, undying and primeval. It is not slain when the body is slain."
      }
    },
    {
      "chapter": 2,
      "verse": 47,
      "slok": "कर्मण्येवाधिकारस्ते मा फलेषु कदाचन। मा कर्मफलहेतुर्भूर्मा ते सङ्गोऽस्त्वकर्मणि॥",
      "transliteration": "karmaṇy-evādhikāras te mā phaleṣhu kadāchana mā karma-phala-hetur bhūr mā te saṅgo 'stv akarmaṇi",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "आपका कर्म करने में अधिकार है, लेकिन कर्म के फल में कभी नहीं। आप कर्मफल के हेतु न बनें और आपकी अकर्म में भी आसक्ति न हो।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "You have a right to perform your prescribed duty, but do not expect the fruits of action. Never consider yourself the cause of the results of your activities, and never be attached to not doing your duty."
      }
    },
    {
      "chapter": 2,
      "verse": 48,
      "slok": "योगस्थः कुरु कर्माणि सङ्गं त्यक्त्वा धनञ्जय। सिद्ध्यसिद्ध्योः समो भूत्वा समत्वं योग उच्यते॥",
      "transliteration": "yoga-sthaḥ kuru karmāṇi saṅgaṁ tyaktvā dhanañjaya siddhy-asiddhyoḥ samo bhūtvā samatvaṁ yoga ucyate",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे धनंजय! आसक्ति को त्यागकर तथा सिद्धि और असिद्धि में समान बुद्धि रखकर योग में स्थित होकर कर्म कर। समत्व को ही योग कहते हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Perform your duty equipoised, O Arjuna, abandoning all attachment to success or failure. Such equanimity is called yoga."
      }
    },
    {
      "chapter": 3,
      "verse": 19,
      "slok": "तस्मादसक्तः सततं कार्यं कर्म समाचर। असक्तो ह्याचरन्कर्म परमाप्नोति पूरुषः॥",
      "transliteration": "tasmād asaktaḥ satataṁ kāryaṁ karma samācara asakto hy ācaran karma param āpnoti pūruṣaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "इसलिए तू आसक्ति रहित होकर निरन्तर किये जाने योग्य कर्म को करता रह क्योंकि आसक्ति रहित होकर कर्म करता हुआ मनुष्य परमात्मा को प्राप्त होता है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Therefore, without being attached to the fruits of activities, one should act as a matter of duty, for by working without attachment one attains the Supreme."
      }
    },
    {
      "chapter": 3,
      "verse": 37,
      "slok": "श्रीभगवानुवाच | काम एष क्रोध एष रजोगुणसमुद्भवः। महाशनो महापाप्मा विद्ध्येनमिह वैरिणम्॥",
      "transliteration": "śrī-bhagavān uvāca kāma eṣa krodha eṣa rajo-guṇa-samudbhavaḥ mahāśano mahā-pāpmā viddhyenam iha vairiṇam",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "श्रीभगवान् ने कहा - यह काम है, यह क्रोध है, रजोगुण से उत्पन्न होने वाला है। यह बहुत खाने वाला और महापापी है। इसको तू इस विषय में वैरी जान।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The Blessed Lord said: It is desire, it is anger born of the active, all-devouring, all-sinful; know this as the foe here (in this world)."
      }
    },
    {
      "chapter": 4,
      "verse": 7,
      "slok": "यदा यदा हि धर्मस्य ग्लानिर्भवति भारत। अभ्युत्थानमधर्मस्य तदात्मानं सृजाम्यहम्॥",
      "transliteration": "yadā yadā hi dharmasya glānir bhavati bhārata abhyutthānam adharmasya tadātmānaṁ sṛjāmy aham",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे भारत! जब-जब धर्म की हानि और अधर्म की वृद्धि होती है, तब-तब मैं अपने रूप को रचता हूँ अर्थात् प्रकट होता हूँ।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Whenever there is a decline in righteousness, O Bharata, and a rise of unrighteousness, then I manifest Myself."
      }
    },
    {
      "chapter": 4,
      "verse": 8,
      "slok": "परित्राणाय साधूनां विनाशाय च दुष्कृताम्। धर्मसंस्थापनार्थाय सम्भवामि युगे युगे॥",
      "transliteration": "paritrāṇāya sādhūnāṁ vināśāya ca duṣkṛtām dharma-saṁsthāpanārthāya sambhavāmi yuge yuge",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "साधु पुरुषों का उद्धार करने के लिए, पाप कर्म करने वालों का विनाश करने के लिए और धर्म की अच्छी तरह से स्थापना करने के लिए मैं युग-युग में प्रकट होता हूँ।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "For the protection of the good, for the destruction of the wicked and for the establishment of righteousness, I am born in every age."
      }
    },
    {
      "chapter": 4,
      "verse": 11,
      "slok": "ये यथा मां प्रपद्यन्ते तांस्तथैव भजाम्यहम्। मम वर्त्मानुवर्तन्ते मनुष्याः पार्थ सर्वशः॥",
      "transliteration": "ye yathā māṁ prapadyante tāṁs tathaiva bhajāmy aham mama vartmānuvartante manuṣyāḥ pārtha sarvaśaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जो भक्त मुझे जिस प्रकार भजते हैं, मैं भी उनको उसी प्रकार भजता हूँ अर्थात् फल देता हूँ। हे पार्थ! सब मनुष्य सब प्रकार से मेरे ही मार्ग का अनुसरण करते हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "In whatever way men approach Me, even so do I accept them; for, on all sides, whatever path they may choose is Mine, O Partha."
      }
    },
    {
      "chapter": 5,
      "verse": 22,
      "slok": "ये हि संस्पर्शजा भोगा दुःखयोनय एव ते | आद्यन्तवन्तः कौन्तेय न तेषु रमते बुधः ||",
      "transliteration": "ye hi saṁsparśa-jā bhogā duḥkha-yonaya eva te ādy-antavantaḥ kaunteya na teṣu ramate budhaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे कौन्तेय! इन्द्रियों और विषयों के संयोग से उत्पन्न जो भोग हैं, वे दुःख के ही कारण हैं और आदि-अन्त वाले हैं। बुद्धिमान पुरुष उनमें नहीं रमता।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The enjoyments that are born of contacts are only sources of pain, they have a beginning and an end. O son of Kunti, the wise do not rejoice in them."
      }
    },
    {
      "chapter": 6,
      "verse": 5,
      "slok": "उद्धरेदात्मनात्मानं नात्मानमवसादयेत् | आत्मैव ह्यात्मनो बन्धुरात्मैव रिपुरात्मनः ||",
      "transliteration": "uddhared ātmanātmānaṁ nātmānam avasādayet ātmaiva hy ātmano bandhur ātmaiva ripur ātmanaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "अपने द्वारा अपना उद्धार करे और अपने को अधोगति में न डाले क्योंकि यह मन ही अपना मित्र है और यही मन अपना शत्रु भी है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Let a man lift himself by his own Self alone, let him not lower himself; for this Self alone is the friend of oneself and this Self alone is the enemy of oneself."
      }
    },
    {
      "chapter": 6,
      "verse": 17,
      "slok": "युक्ताहारविहारस्य युक्तचेष्टस्य कर्मसु | युक्तस्वप्नावबोधस्य योगो भवति दुःखहा ||",
      "transliteration": "yuktāhāra-vihārasya yukta-ceṣṭasya karmasu yukta-svapnāvabodhasya yogo bhavati duḥkha-hā",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जिसका आहार-विहार नियमित है, कर्मों में चेष्टा नियमित है तथा सोने-जागने का समय नियमित है, उसका योग दुःखों का नाशक होता है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Yoga becomes the destroyer of pain for him who is moderate in eating and recreation, who is moderate in his exertion in actions, who is moderate in sleep and wakefulness."
      }
    },
    {
      "chapter": 7,
      "verse": 14,
      "slok": "दैवी ह्येषा गुणमयी मम माया दुरत्यया | मामेव ये प्रपद्यन्ते मायामेतां तरन्ति ते ||",
      "transliteration": "daivī hy eṣā guṇa-mayī mama māyā duratyayā mām eva ye prapadyante māyām etāṁ taranti te",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "मेरी यह दैवी, तीनों गुणों से युक्त माया बड़ी दुस्तर है। जो मेरी शरण में आते हैं, वे इस माया को पार कर जाते हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "This divine illusion of Mine, made up of the three qualities, is difficult to cross over; those who take refuge in Me alone cross over this illusion."
      }
    },
    {
      "chapter": 8,
      "verse": 5,
      "slok": "अन्तकाले च मामेव स्मरन्मुक्त्वा कलेवरम् | यः प्रयाति स मद्भावं याति नास्त्यत्र संशयः ||",
      "transliteration": "anta-kāle ca mām eva smaran muktvā kalevaram yaḥ prayāti sa mad-bhāvaṁ yāti nāsty atra saṁśayaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जो मनुष्य अन्तकाल में भी मुझे ही स्मरण करता हुआ शरीर को त्यागकर जाता है, वह मेरे स्वरूप को प्राप्त होता है - इसमें कोई संशय नहीं है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "And he who, at the end of his time, leaving the body, departs remembering Me alone, he attains My Being; there is no doubt about this."
      }
    },
    {
      "chapter": 9,
      "verse": 22,
      "slok": "अनन्याश्चिन्तयन्तो मां ये जनाः पर्युपासते | तेषां नित्याभियुक्तानां योगक्षेमं वहाम्यहम् ||",
      "transliteration": "ananyāś cintayanto māṁ ye janāḥ paryupāsate teṣāṁ nityābhiyuktānāṁ yoga-kṣemaṁ vahāmy aham",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जो अनन्य भाव से मेरा चिन्तन करते हुए मेरी उपासना करते हैं, उन नित्य-युक्त पुरुषों का योगक्षेम मैं स्वयं वहन करता हूँ।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "To those who worship Me alone, thinking of no other, to those ever-united, I secure what they have not, and preserve what they have."
      }
    },
    {
      "chapter": 10,
      "verse": 20,
      "slok": "अहमात्मा गुडाकेश सर्वभूताशयस्थितः | अहमादिश्च मध्यं च भूतानामन्त एव च ||",
      "transliteration": "aham ātmā guḍākeśa sarva-bhūtāśaya-sthitaḥ aham ādiś ca madhyaṁ ca bhūtānām anta eva ca",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे अर्जुन! मैं सब भूतों के हृदय में स्थित आत्मा हूँ तथा सम्पूर्ण भूतों का आदि, मध्य और अन्त भी मैं ही हूँ।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "I am the Self, O Gudakesha, seated in the hearts of all beings; I am the beginning, the middle and also the end of all beings."
      }
    },
    {
      "chapter": 11,
      "verse": 32,
      "slok": "श्रीभगवानुवाच | कालोऽस्मि लोकक्षयकृत्प्रवृद्धो लोकान्समाहर्तुमिह प्रवृत्तः | ऋतेऽपि त्वां न भविष्यन्ति सर्वे येऽवस्थिताः प्रत्यनीकेषु योधाः ||",
      "transliteration": "śrī-bhagavān uvāca kālo 'smi loka-kṣaya-kṛt pravṛddho lokān samāhartum iha pravṛttaḥ ṛte 'pi tvāṁ na bhaviṣyanti sarve ye 'vasthitāḥ pratyanīkeṣu yodhāḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "श्रीभगवान् ने कहा - मैं लोकों का नाश करने वाला बढ़ा हुआ काल हूँ और इस समय लोकों का संहार करने के लिए प्रवृत्त हुआ हूँ। तेरे बिना भी प्रतिपक्षी सेना में स्थित ये सब योद्धा नहीं रहेंगे।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The Blessed Lord said: I am the mighty world-destroying Time, now engaged in destroying the worlds. Even without you, none of the warriors arrayed in hostile armies shall live."
      }
    },
    {
      "chapter": 12,
      "verse": 13,
      "slok": "अद्वेष्टा सर्वभूतानां मैत्रः करुण एव च | निर्ममो निरहङ्कारः समदुःखसुखः क्षमी ||",
      "transliteration": "adveṣṭā sarva-bhūtānāṁ maitraḥ karuṇa eva ca nirmamo nirahaṅkāraḥ sama-duḥkha-sukhaḥ kṣamī",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जो किसी से द्वेष नहीं करता, सब प्राणियों का मित्र और दयालु है, ममता-रहित, अहंकार-रहित, सुख-दुःख में समान और क्षमावान् है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "He who hates no creature, who is friendly and compassionate to all, who is free from attachment and egoism, balanced in pleasure and pain, and forgiving."
      }
    },
    {
      "chapter": 12,
      "verse": 15,
      "slok": "यस्मान्नोद्विजते लोको लोकान्नोद्विजते च यः | हर्षामर्षभयोद्वेगैर्मुक्तो यः स च मे प्रियः ||",
      "transliteration": "yasmān nodvijate loko lokān nodvijate ca yaḥ harṣāmarṣa-bhayodvegair mukto yaḥ sa ca me priyaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जिससे कोई जीव उद्विग्न नहीं होता और जो स्वयं किसी जीव से उद्विग्न नहीं होता तथा जो हर्ष, क्रोध, भय और उद्वेग से मुक्त है, वह मुझे प्रिय है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "He from whom the world does not shrink and who does not shrink from the world, who is free from joy, envy, fear and anxiety – he is dear to Me."
      }
    },
    {
      "chapter": 13,
      "verse": 7,
      "slok": "इच्छा द्वेषः सुखं दुःखं सङ्घातश्चेतना धृतिः | एतत्क्षेत्रं समासेन सविकारमुदाहृतम् ||",
      "transliteration": "icchā dveṣaḥ sukhaṁ duḥkhaṁ saṅghātaś cetanā dhṛtiḥ etat kṣetraṁ samāsena sa-vikāram udāhṛtam",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "इच्छा, द्वेष, सुख, दुःख, स्थूल देह, चेतना और धैर्य - इस प्रकार विकारों सहित यह क्षेत्र संक्षेप में कहा गया है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Desire, hatred, pleasure, pain, the aggregate (the body), intelligence, fortitude - this Kshetra has been thus briefly described with its modifications."
      }
    },
    {
      "chapter": 14,
      "verse": 11,
      "slok": "सर्वद्वारेषु देहेऽस्मिन्प्रकाश उपजायते | ज्ञानं यदा तदा विद्याद्विवृद्धं सत्त्वमित्युत ||",
      "transliteration": "sarva-dvāreṣu dehe 'smin prakāśa upajāyate jñānaṁ yadā tadā vidyād vivṛddhaṁ sattvam ity uta",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जब इस देह के सब द्वारों में ज्ञान का प्रकाश उत्पन्न होता है, तब सत्त्वगुण को बढ़ा हुआ जानना चाहिए।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "When, through every gate (sense) in this body, the light of knowledge shines, then it should be known that Sattva is predominant."
      }
    },
    {
      "chapter": 15,
      "verse": 7,
      "slok": "ममैवांशो जीवलोके जीवभूतः सनातनः | मनःषष्ठानीन्द्रियाणि प्रकृतिस्थानि कर्षति ||",
      "transliteration": "mamaivāṁśo jīva-loke jīva-bhūtaḥ sanātanaḥ manaḥ-ṣaṣṭhānīndriyāṇi prakṛti-sthāni karṣati",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "इस जीवलोक में जीवभूत हुआ सनातन जीवात्मा मेरा ही अंश है, जो प्रकृति में स्थित मन सहित छः इन्द्रियों को आकर्षित करता है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "An eternal portion of Myself having become a living soul in the world of life, draws to itself the five senses with the mind for the sixth, abiding in Nature."
      }
    },
    {
      "chapter": 16,
      "verse": 1,
      "slok": "श्रीभगवानुवाच | अभयं सत्त्वसंशुद्धिर्ज्ञानयोगव्यवस्थितिः | दानं दमश्च यज्ञश्च स्वाध्यायस्तप आर्जवम् ||",
      "transliteration": "śrī-bhagavān uvāca abhayaṁ sattva-saṁśuddhir jñāna-yoga-vyavasthitiḥ dānaṁ damaś ca yajñāś ca svādhyāyas tapa ārjavam",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "श्रीभगवान् ने कहा - अभय, अन्तःकरण की पूर्ण शुद्धि, तत्वज्ञान के लिए ध्यानयोग में दृढ़ स्थिति, दान, इन्द्रियों का दमन, यज्ञ, स्वाध्याय, तप और सरलता।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The Blessed Lord said: Fearlessness, purity of heart, steadfastness in knowledge and yoga, charity, self-control, sacrifice, study of scriptures, austerity and straightforwardness."
      }
    },
    {
      "chapter": 16,
      "verse": 2,
      "slok": "अहिंसा सत्यमक्रोधस्त्यागः शान्तिरपैशुनम् | दया भूतेष्वलोलुप्त्वं मार्दवं ह्रीरचापलम् ||",
      "transliteration": "ahiṁsā satyam akrodhas tyāgaḥ śāntir apaiśunam dayā bhūteṣv aloluptvaṁ mārdavaṁ hrīr acāpalam",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "अहिंसा, सत्य, क्रोध का अभाव, त्याग, शान्ति, किसी की निन्दा न करना, प्राणियों पर दया, लोलुपता का अभाव, कोमलता, लज्जा और चंचलता का अभाव।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Non-violence, truth, absence of anger, renunciation, tranquility, absence of calumny, compassion for beings, non-covetousness, gentleness, modesty, absence of fickleness."
      }
    },
    {
      "chapter": 16,
      "verse": 21,
      "slok": "त्रिविधं नरकस्येदं द्वारं नाशनमात्मनः | कामः क्रोधस्तथा लोभस्तस्मादेतत्त्रयं त्यजेत् ||",
      "transliteration": "tri-vidhaṁ narakasyedaṁ dvāraṁ nāśanam ātmanaḥ kāmaḥ krodhas tathā lobhas tasmād etat trayaṁ tyajet",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "काम, क्रोध तथा लोभ - ये तीन प्रकार के नरक के द्वार आत्मा का नाश करने वाले हैं, इसलिए इन तीनों को त्याग देना चाहिए।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Triple is the gate of this hell, destructive of the self—lust, anger and greed; therefore, one should abandon these three."
      }
    },
    {
      "chapter": 17,
      "verse": 23,
      "slok": "ॐ तत्सदिति निर्देशो ब्रह्मणस्त्रिविधः स्मृतः | ब्राह्मणास्तेन वेदाश्च यज्ञाश्च विहिताः पुरा ||",
      "transliteration": "oṁ tat sad iti nirdeśo brahmaṇas tri-vidhaḥ smṛtaḥ brāhmaṇās tena vedāś ca yajñāś ca vihitāḥ purā",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "ॐ, तत्, सत् - यह तीन प्रकार का ब्रह्म का नाम कहा गया है। इसी से प्राचीन काल में ब्राह्मण, वेद और यज्ञ बनाए गए।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "OM TAT SAT: this has been declared to be the triple designation of Brahman. By that were created formerly the Brahmanas, the Vedas and sacrifices."
      }
    },
    {
      "chapter": 18,
      "verse": 37,
      "slok": "यत्तदग्रे विषमिव परिणामेऽमृतोपमम् | तत्सुखं सात्त्विकं प्रोक्तमात्मबुद्धिप्रसादजम् ||",
      "transliteration": "yat tad agre viṣam iva pariṇāme 'mṛtopamam tat sukhaṁ sāttvikaṁ proktam ātma-buddhi-prasāda-jam",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जो आरम्भ में विष के समान प्रतीत होता है, परन्तु परिणाम में अमृत के समान होता है, वह सुख सात्त्विक कहा गया है, जो आत्मबुद्धि की प्रसन्नता से उत्पन्न होता है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "That which is like poison at first but in the end like nectar—that pleasure is declared to be Sattvic, born of the purity of one's own mind."
      }
    },
    {
      "chapter": 18,
      "verse": 61,
      "slok": "ईश्वरः सर्वभूतानां हृद्देशेऽर्जुन तिष्ठति | भ्रामयन्सर्वभूतानि यन्त्रारूढानि मायया ||",
      "transliteration": "īśvaraḥ sarva-bhūtānāṁ hṛd-deśe 'rjuna tiṣṭhati bhrāmayan sarva-bhūtāni yantrārūḍhāni māyayā",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे अर्जुन! ईश्वर सब प्राणियों के हृदय में निवास करता है और अपनी माया से सबको यन्त्र पर आरूढ़ प्राणियों की तरह घुमाता रहता है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The Lord dwells in the hearts of all beings, O Arjuna, causing all beings to revolve, by His illusive power, as if mounted on a machine."
      }
    },
    {
      "chapter": 18,
      "verse": 65,
      "slok": "मन्मना भव मद्भक्तो मद्याजी मां नमस्कुरु | मामेवैष्यसि सत्यं ते प्रतिजाने प्रियोऽसि मे ||",
      "transliteration": "man-manā bhava mad-bhakto mad-yājī māṁ namaskuru mām evaiṣyasi satyaṁ te pratijāne priyo 'si me",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "मुझमें मन वाला हो, मेरा भक्त बन, मेरा पूजन करने वाला हो, मुझे नमस्कार कर। इस प्रकार तू मुझे ही प्राप्त होगा, यह मैं तुझसे सत्य प्रतिज्ञा करता हूँ, क्योंकि तू मेरा प्रिय है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Fix your mind on Me, be devoted to Me, sacrifice to Me, bow down to Me. Thus having made your heart steadfast in Me, taking Me as the Supreme Goal, you shall come to Me."
      }
    },
    {
      "chapter": 18,
      "verse": 66,
      "slok": "सर्वधर्मान्परित्यज्य मामेकं शरणं व्रज। अहं त्वां सर्वपापेभ्यो मोक्षयिष्यामि मा शुचः॥",
      "transliteration": "sarva-dharmān parityajya mām ekaṁ śharaṇaṁ vraja ahaṁ tvāṁ sarva-pāpebhyo mokṣhayiṣhyāmi mā śhuchaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "सभी धर्मों को त्यागकर केवल मेरी शरण में आओ। मैं तुम्हें सभी पापों से मुक्त कर दूँगा, शोक न करो।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Abandon all varieties of religion and just surrender unto Me. I shall deliver you from all sinful reactions. Do not fear."
      }
    },
    {
      "chapter": 18,
      "verse": 78,
      "slok": "यत्र योगेश्वरः कृष्णो यत्र पार्थो धनुर्धरः | तत्र श्रीर्विजयो भूतिर्ध्रुवा नीतिर्मतिर्मम ||",
      "transliteration": "yatra yogeśvaraḥ kṛṣṇo yatra pārtho dhanur-dharaḥ tatra śrīr vijayo bhūtir dhruvā nītir matir mama",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "जहाँ योगेश्वर श्रीकृष्ण हैं और जहाँ धनुर्धारी अर्जुन है, वहीं श्री, विजय, विभूति और अचल नीति है - ऐसा मेरा मत है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Wherever is Krishna, the Lord of Yoga, wherever is Partha, the archer, there are prosperity, victory, happiness and firm policy; this is my conviction."
      }
    },
    {
      "chapter": 18,
      "verse": 42,
      "slok": "शमो दमस्तपः शौचं क्षान्तिरार्जवमेव च | ज्ञानं विज्ञानमास्तिक्यं ब्रह्मकर्म स्वभावजम् ||",
      "transliteration": "śamo damas tapaḥ śaucaṁ kṣāntir ārjavam eva ca jñānaṁ vijñānam āstikyaṁ brahma-karma svabhāva-jam",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "मन का संयम, इन्द्रियों का दमन, तप, पवित्रता, क्षमा, सरलता, ज्ञान, विज्ञान और आस्तिकता - ये सब ब्राह्मण के स्वाभाविक कर्म हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Serenity, self-restraint, austerity, purity, forgiveness, and also uprightness, knowledge, realization and belief in God are the duties of the Brahmanas, born of (their own) nature."
      }
    },
    
        
      
          {
            "chapter": 5,
            "verse": 18,
            "slok": "विद्याविनयसम्पन्ने ब्राह्मणे गवि हस्तिनि | शुनि चैव श्वपाके च पण्डिताः समदर्शिनः ||",
            "transliteration": "vidyā-vinaya-sampanne brāhmaṇe gavi hastini śuni caiva śva-pāke ca paṇḍitāḥ sama-darśinaḥ",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "विद्या और विनय से सम्पन्न ब्राह्मण में, गाय में, हाथी में, कुत्ते में तथा चाण्डाल में भी पण्डितजन समदर्शी होते हैं।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "The wise see the same in all — whether it be a Brahmin endowed with learning and humility, a cow, an elephant, a dog or an outcaste."
            }
          },
          {
            "chapter": 6,
            "verse": 26,
            "slok": "यतो यतो निश्चरति मनश्चञ्चलमस्थिरम् | ततस्ततो नियम्यैतदात्मन्येव वशं नयेत् ||",
            "transliteration": "yato yato niścarati manaś cañcalam asthiram tatas tato niyamyaitad ātmany eva vaśaṁ nayet",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "यह चंचल और अस्थिर मन जिस-जिस विषय में जाए, उस-उस से रोककर इसे बार-बार आत्मा में ही वश में करे।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "From wherever the mind wanders due to its flickering and unsteady nature, one should certainly withdraw it and bring it back under the control of the Self."
            }
          },
          {
            "chapter": 8,
            "verse": 14,
            "slok": "अनन्यचेताः सततं यो मां स्मरति नित्यशः | तस्याहं सुलभः पार्थ नित्ययुक्तस्य योगिनः ||",
            "transliteration": "ananya-cetāḥ satataṁ yo māṁ smarati nityaśaḥ tasyāhaṁ sulabhaḥ pārtha nitya-yuktasya yoginaḥ",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "हे पार्थ! जो अनन्य चित्त वाला पुरुष मुझे निरन्तर स्मरण करता है, उस नित्ययुक्त योगी के लिए मैं सुलभ हूँ।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "I am easily attainable by that ever-steadfast Yogi who remembers Me constantly and daily, with a single-minded devotion, O Partha."
            }
          },
          {
            "chapter": 10,
            "verse": 4,
            "slok": "बुद्धिर्ज्ञानमसम्मोहः क्षमा सत्यं दमः शमः | सुखं दुःखं भवोऽभावो भयं चाभयमेव च ||",
            "transliteration": "buddhir jñānam asammohaḥ kṣamā satyaṁ damaḥ śamaḥ sukhaṁ duḥkhaṁ bhavo 'bhāvo bhayaṁ cābhayam eva ca",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "बुद्धि, ज्ञान, असम्मोह, क्षमा, सत्य, इन्द्रिय-संयम, मन का संयम, सुख, दुःख, उत्पत्ति, विनाश, भय और अभय भी।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "Intelligence, knowledge, freedom from doubt and delusion, forgiveness, truthfulness, control of the senses, control of the mind, happiness and distress, birth, death, fear, fearlessness."
            }
          },
          {
            "chapter": 11,
            "verse": 55,
            "slok": "मत्कर्मकृन्मत्परमो मद्भक्तः सङ्गवर्जितः | निर्वैरः सर्वभूतेषु यः स मामेति पाण्डव ||",
            "transliteration": "mat-karma-kṛn mat-paramo mad-bhaktaḥ saṅga-varjitaḥ nirvairaḥ sarva-bhūteṣu yaḥ sa mām eti pāṇḍava",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "हे पाण्डव! जो मेरे लिए कर्म करने वाला, मत्परायण, मेरा भक्त, आसक्ति रहित और सब प्राणियों में वैर भाव से रहित है, वह मुझे प्राप्त होता है।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "He who does work for Me, who holds Me as the Supreme, who is devoted to Me, who is free from attachment, who bears enmity towards no creature, he comes to Me, O Pandava."
            }
          },
          {
            "chapter": 13,
            "verse": 8,
            "slok": "अमानित्वमदम्भित्वमहिंसा क्षान्तिरार्जवम् | आचार्योपासनं शौचं स्थैर्यमात्मविनिग्रहः ||",
            "transliteration": "amānitvam adambhitvam ahiṁsā kṣāntir ārjavam ācāryopāsanaṁ śaucaṁ sthairyam ātma-vinigrahaḥ",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "अभिमान का अभाव, दम्भ का अभाव, अहिंसा, क्षमा, सरलता, आचार्य की सेवा, पवित्रता, स्थिरता और आत्म-संयम।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "Humility, unpretentiousness, non-violence, forgiveness, uprightness, service of the teacher, purity, steadfastness, self-control."
            }
          },
          {
            "chapter": 14,
            "verse": 11,
            "slok": "सर्वद्वारेषु देहेऽस्मिन्प्रकाश उपजायते | ज्ञानं यदा तदा विद्याद्विवृद्धं सत्त्वमित्युत ||",
            "transliteration": "sarva-dvāreṣu dehe 'smin prakāśa upajāyate jñānaṁ yadā tadā vidyād vivṛddhaṁ sattvam ity uta",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "जब इस देह के सब द्वारों में ज्ञान का प्रकाश उत्पन्न होता है, तब सत्त्वगुण को बढ़ा हुआ जानना चाहिए।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "When, through every gate (sense) in this body, the light of knowledge shines, then it should be known that Sattva is predominant."
            }
          },
          {
            "chapter": 15,
            "verse": 7,
            "slok": "ममैवांशो जीवलोके जीवभूतः सनातनः | मनःषष्ठानीन्द्रियाणि प्रकृतिस्थानि कर्षति ||",
            "transliteration": "mamaivāṁśo jīva-loke jīva-bhūtaḥ sanātanaḥ manaḥ-ṣaṣṭhānīndriyāṇi prakṛti-sthāni karṣati",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "इस जीवलोक में जीवभूत हुआ सनातन जीवात्मा मेरा ही अंश है, जो प्रकृति में स्थित मन सहित छः इन्द्रियों को आकर्षित करता है।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "An eternal portion of Myself having become a living soul in the world of life, draws to itself the five senses with the mind for the sixth, abiding in Nature."
            }
          },
          {
            "chapter": 17,
            "verse": 15,
            "slok": "अनुद्वेगकरं वाक्यं सत्यं प्रियहितं च यत् | स्वाध्यायाभ्यसनं चैव वाङ्मयं तप उच्यते ||",
            "transliteration": "anudvega-karaṁ vākyaṁ satyaṁ priya-hitaṁ ca yat svādhyāyābhyasanaṁ caiva vāṅ-mayaṁ tapa ucyate",
            "tej": {
              "author": "Swami Tejomayananda",
              "ht": "जो वाणी उद्वेग न करने वाली, सत्य, प्रिय और हितकारक हो तथा वेदों का स्वाध्याय - यह वाणी सम्बन्धी तप कहा जाता है।"
            },
            "siva": {
              "author": "Swami Sivananda",
              "et": "Speech which causes no excitement, truthful, pleasant and beneficial, and regular study of the scriptures - this is called austerity of speech."
            }
          }
        
      ,

    {
      "chapter": 5,
      "verse": 18,
      "slok": "विद्याविनयसम्पन्ने ब्राह्मणे गवि हस्तिनि | शुनि चैव श्वपाके च पण्डिताः समदर्शिनः ||",
      "transliteration": "vidyā-vinaya-sampanne brāhmaṇe gavi hastini śuni caiva śva-pāke ca paṇḍitāḥ sama-darśinaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "विद्या और विनय से सम्पन्न ब्राह्मण में, गाय में, हाथी में, कुत्ते में तथा चाण्डाल में भी पण्डितजन समदर्शी होते हैं।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "The wise see the same in all — whether it be a Brahmin endowed with learning and humility, a cow, an elephant, a dog or an outcaste."
      }
    },
    {
      "chapter": 6,
      "verse": 26,
      "slok": "यतो यतो निश्चरति मनश्चञ्चलमस्थिरम् | ततस्ततो नियम्यैतदात्मन्येव वशं नयेत् ||",
      "transliteration": "yato yato niścarati manaś cañcalam asthiram tatas tato niyamyaitad ātmany eva vaśaṁ nayet",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "यह चंचल और अस्थिर मन जिस-जिस विषय में जाए, उस-उस से रोककर इसे बार-बार आत्मा में ही वश में करे।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "From wherever the mind wanders due to its flickering and unsteady nature, one should certainly withdraw it and bring it back under the control of the Self."
      }
    },
    {
      "chapter": 8,
      "verse": 14,
      "slok": "अनन्यचेताः सततं यो मां स्मरति नित्यशः | तस्याहं सुलभः पार्थ नित्ययुक्तस्य योगिनः ||",
      "transliteration": "ananya-cetāḥ satataṁ yo māṁ smarati nityaśaḥ tasyāhaṁ sulabhaḥ pārtha nitya-yuktasya yoginaḥ",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे पार्थ! जो अनन्य चित्त वाला पुरुष मुझे निरन्तर स्मरण करता है, उस नित्ययुक्त योगी के लिए मैं सुलभ हूँ।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "I am easily attainable by that ever-steadfast Yogi who remembers Me constantly and daily, with a single-minded devotion, O Partha."
      }
    },
    {
      "chapter": 10,
      "verse": 4,
      "slok": "बुद्धिर्ज्ञानमसम्मोहः क्षमा सत्यं दमः शमः | सुखं दुःखं भवोऽभावो भयं चाभयमेव च ||",
      "transliteration": "buddhir jñānam asammohaḥ kṣamā satyaṁ damaḥ śamaḥ sukhaṁ duḥkhaṁ bhavo 'bhāvo bhayaṁ cābhayam eva ca",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "बुद्धि, ज्ञान, असम्मोह, क्षमा, सत्य, इन्द्रिय-संयम, मन का संयम, सुख, दुःख, उत्पत्ति, विनाश, भय और अभय भी।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "Intelligence, knowledge, freedom from doubt and delusion, forgiveness, truthfulness, control of the senses, control of the mind, happiness and distress, birth, death, fear, fearlessness."
      }
    },
    {
      "chapter": 11,
      "verse": 55,
      "slok": "मत्कर्मकृन्मत्परमो मद्भक्तः सङ्गवर्जितः | निर्वैरः सर्वभूतेषु यः स मामेति पाण्डव ||",
      "transliteration": "mat-karma-kṛn mat-paramo mad-bhaktaḥ saṅga-varjitaḥ nirvairaḥ sarva-bhūteṣu yaḥ sa mām eti pāṇḍava",
      "tej": {
        "author": "Swami Tejomayananda",
        "ht": "हे पाण्डव! जो मेरे लिए कर्म करने वाला, मत्परायण, मेरा भक्त, आसक्ति रहित और सब प्राणियों में वैर भाव से रहित है, वह मुझे प्राप्त होता है।"
      },
      "siva": {
        "author": "Swami Sivananda",
        "et": "He who does work for Me, who holds Me as the Supreme, who is devoted to Me, who is free from attachment, who bears enmity towards no creature, he comes to Me, O Pandava."
      }
    },
  ];

  
  static Future<void> initialize() async {
    
  }

  // Get random verse
  static Future<Map<String, dynamic>> getRandomVerse() async {
    return _verses[Random().nextInt(_verses.length)];
  }

  // Get verse by chapter and verse number
  static Future<Map<String, dynamic>> getVerse(int chapter, int verse) async {
    return _verses.firstWhere(
      (v) => v['chapter'] == chapter && v['verse'] == verse,
      orElse: () => _verses[0],
    );
  }

  // Search verses
  static Future<List<Map<String, dynamic>>> searchVerses(String searchTerm) async {
    final searchTermLower = searchTerm.toLowerCase();
    return _verses.where((verse) {
      final translationEn = verse['siva']?['et']?.toLowerCase() ?? '';
      final translationHi = verse['tej']?['ht']?.toLowerCase() ?? '';
      final transliteration = verse['transliteration']?.toLowerCase() ?? '';
      
      return translationEn.contains(searchTermLower) ||
             translationHi.contains(searchTermLower) ||
             transliteration.contains(searchTermLower);
    }).toList();
  }
} 