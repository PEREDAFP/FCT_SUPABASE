-- Create the "Usuarios" table
CREATE TABLE Usuarios (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nombre TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  contrasena TEXT NOT NULL
);

-- Create the "Roles" table
CREATE TABLE Roles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nombre TEXT NOT NULL
);


-- Create the "CentrosEducativos" table
CREATE TABLE CentrosEducativos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nombre TEXT NOT NULL,
  direccion TEXT NOT NULL,
  telefono TEXT NOT NULL,
  responsable_id UUID REFERENCES Usuarios(id)
);

-- Create the "Empresas" table
CREATE TABLE Empresas (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nombre TEXT NOT NULL,
  direccion TEXT NOT NULL,
  telefono TEXT NOT NULL,
  persona_contacto TEXT NOT NULL,
  responsable_id UUID REFERENCES Usuarios(id),
  tutores TEXT NOT NULL
);

-- Create the "Convenios" table
CREATE TABLE Convenios (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  empresa_id UUID REFERENCES Empresas(id),
  centro_educativo_id UUID REFERENCES CentrosEducativos(id),
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  detalles TEXT
);
-- Create the "UsuariosRoles" table to establish a many-to-many relationship between users and roles
CREATE TABLE UsuariosRoles (
  usuario_id UUID REFERENCES Usuarios(id),
  rol_id UUID REFERENCES Roles(id),
  centro_educativo_id UUID REFERENCES CentrosEducativos(id),
  empresa_id UUID REFERENCES Empresas(id),
  PRIMARY KEY (usuario_id, rol_id, centro_educativo_id, empresa_id)
);
