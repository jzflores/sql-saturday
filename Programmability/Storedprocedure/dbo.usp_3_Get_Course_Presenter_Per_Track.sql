��U S E   [ s 1 5 g u e s t 0 4 ]  
 G O  
  S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p _ 3 _ P r e s e n t e r _ C l a s s _ P e r _ T r a c k ]    
  
 A S  
 B E G I N   T R Y  
 B E G I N   T R A N  
S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 S E L E C T   t r a c k . n a m e ,   c o u r s e . t i t l e ,   p e r s o n . f i r s t _ n a m e ,   p e r s o n . l a s t _ n a m e  
  
 F R O M   d b o . C o u r s e   c o u r s e  
 I N N E R   J O I N   d b o . S c h e d u l e   s c h e d u l e  
 O N   s c h e d u l e . f k _ c o u r s e _ i d   =   c o u r s e . p k _ c o u r s e _ i d  
  
 I N N E R   J O I N   d b o . P r e s e n t e r   p r e s e n t e r  
 O N   p r e s e n t e r . p k _ p r e s e n t e r _ i d   =   s c h e d u l e . f k _ p r e s e n t e r _ i d  
  
 I N N E R   J O I N   d b o . P e r s o n   p e r s o n  
 O N   p e r s o n . p k _ p e r s o n _ i d   =   p r e s e n t e r . f k _ p e r s o n _ i d  
  
 I N N E R   J O I N   d b o . T r a c k   t r a c k  
 O N   t r a c k . p k _ t r a c k _ i d   =   c o u r s e . f k _ t r a c k _ i d  
  
 O R D E R   B Y   t r a c k . n a m e  
 	  
 C O M M I T   T R A N  
 E N D   T R Y  
 B E G I N   C A T C H  
 R O L L B A C K   T R A N  
 P R I N T   ' C u s t o m   P r o c e d u r e 3     f a i l e d '  
 P R I N T   E R R O R _ M E S S A G E ( )  
 E N D   C A T C H  
 
