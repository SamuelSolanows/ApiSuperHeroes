using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ApiSuperHeroes.Models;

namespace ApiSuperHeroes.Controllers
{
    public class GrupoesController : ApiController
    {
        private SuperHeroesEntities db = new SuperHeroesEntities();

        // GET: api/Grupoes
        public IQueryable<Grupo> GetGrupo()
        {
            return db.Grupo;
        }

        // GET: api/Grupoes/5
        [ResponseType(typeof(Grupo))]
        public IHttpActionResult GetGrupo(int id)
        {
            Grupo grupo = db.Grupo.Find(id);
            if (grupo == null)
            {
                return NotFound();
            }

            return Ok(grupo);
        }

        // PUT: api/Grupoes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutGrupo(int id, Grupo grupo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != grupo.ID)
            {
                return BadRequest();
            }

            db.Entry(grupo).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GrupoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Grupoes
        [ResponseType(typeof(Grupo))]
        public IHttpActionResult PostGrupo(Grupo grupo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Grupo.Add(grupo);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = grupo.ID }, grupo);
        }

        // DELETE: api/Grupoes/5
        [ResponseType(typeof(Grupo))]
        public IHttpActionResult DeleteGrupo(int id)
        {
            Grupo grupo = db.Grupo.Find(id);
            if (grupo == null)
            {
                return NotFound();
            }

            db.Grupo.Remove(grupo);
            db.SaveChanges();

            return Ok(grupo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GrupoExists(int id)
        {
            return db.Grupo.Count(e => e.ID == id) > 0;
        }
    }
}